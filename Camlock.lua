local trace = setmetatable({}, {
    __index = function(self: Instance, ...)
        local Arguments = {...}
        rawget(self, Arguments, Arguments[1])
        
        return game.GetService(game, Arguments[1]);
    end
})

local workspace, runService, players, userInput, starterGui = trace.Workspace, trace.RunService, trace.Players, trace.UserInputService, trace.StarterGui;
local round, min = math.round, math.min;
local ray, cframe, vector3 = clonefunction(Ray.new), clonefunction(CFrame.new), clonefunction(Vector3.new);
local insert, clear, find = clonefunction(table.insert), clonefunction(table.clear), clonefunction(table.find);
local heartbeat, stepped, renderstepped = runService.Heartbeat, runService.Stepped, runService.RenderStepped;
local inputbegan, inputended = userInput.InputBegan, userInput.InputEnded
local host = players.LocalPlayer
local camera, mouse = workspace.CurrentCamera, host:GetMouse();

local camlock = false;

local camlockTarget;

local camlockPart = 'Head';
local camlockKeybind = 'C';
local camlockTargetKeybind = 'V';

function AddNoitifcations(Title: string, Text: string, Duration: number)
    starterGui:SetCore('SendNotification', {
        Title = Title;
        Text = Text;
        Duration = Duration;
    })
end

function IsRenderStepped()
    debug.profilebegin('[Souljias] :: RS')

    if camlock and camlockTarget then
        local setCamlockTarget = players[camlockTarget.Name]

        if setCamlockTarget and setCamlockTarget.Character and setCamlockTarget.Character:FindFirstChild(camlockPart) then
            camera.CFrame = cframe(camera.CFrame.p, setCamlockTarget.Character:FindFirstChild(camlockPart).CFrame.p)
        end
    end
    debug.profileend()
end

function GetClosestPlayer() -- Just a better verison of that public getclosestplayer function
    local FirstRoute = {}
    local PlayerTable = {}
    local PlayerDistance = {}

    for _,index in pairs(players:GetPlayers()) do
        if index ~= host then insert(FirstRoute, index) end
    end
    
    for i,index in pairs(FirstRoute) do
        if index.Character then
            local HitPart = index.Character:FindFirstChild'HumanoidRootPart'
            if HitPart then
                local Distance = (HitPart.Position - camera.CFrame.p).Magnitude
                local RayCast = ray(camera.CFrame.p, (mouse.Hit.p - camera.CFrame.p).Unit * Distance)
                local Hit,Pos = workspace:FindPartOnRay(RayCast, workspace)
                local Round = round((Pos - HitPart.Position).Magnitude)

                PlayerTable[index.Name..i] = {}
                PlayerTable[index.Name..i]['Distance'] = Distance
                PlayerTable[index.Name..i]['Player'] = index
                PlayerTable[index.Name..i]['Round'] = Round
                insert(PlayerDistance, Round)
            end
        end 
    end

    if not unpack(PlayerDistance) then return end
    local Min = round(min(unpack(PlayerDistance)));
    if Min > 20 then return end

    for _,index in pairs(PlayerTable) do
        if index.Round == Min then return index.Player end
    end
    return
end

function indexKeybinds(Arguments: EnumItem, FindChat: string)
    if FindChat then
        return
    end

    if Arguments.KeyCode == Enum.KeyCode[camlockKeybind] then
        camlock = not camlock
        AddNoitifcations('Camlock', 'Camlock is now '..tostring(camlock))
    end

    if Arguments.KeyCode == Enum.KeyCode[camlockTargetKeybind] then
        local setPlayer = GetClosestPlayer()
        
        if setPlayer then
        camlockTarget = setPlayer
           AddNoitifcations('Camlock Target', 'Camlock Target is now '..camlockTarget.Name)
        end
    end
end

renderstepped:Connect(IsRenderStepped)
inputbegan:Connect(indexKeybinds)
