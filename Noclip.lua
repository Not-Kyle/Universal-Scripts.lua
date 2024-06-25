getgenv().Players = game:GetService'Players'
getgenv().Host = Players.LocalPlayer
getgenv().AddNotification = function(title, text) game:GetService'StarterGui':SetCore("SendNotification", {Title = title; Text = text;}) end
getgenv().RunService = game:GetService'RunService';
getgenv().ContextActionService = game:GetService'ContextActionService';

local Noclip = true;
local NoclipKey = 'X'; -- Change your key here

function Noclip()
    if Noclip then
        for _,v in pairs(Host.Character:GetDescendants()) do
            if v:IsA'BasePart' and v.CanCollide then
                v.CanCollide = false
            end
        end
    else
        for _,v in pairs(Host.Character:GetDescendants()) do
            if v:IsA'BasePart' and not v.CanCollide then
                v.CanCollide = true
            end
        end
    end
end

function Noclipping(ActionName:string, Properties:EnumItem)
    if ActionName == 'Noclip' then
        if not Properties or Properties == Enum.UserInputState.Begin then
            Noclip = not Noclip
            AddNotification('Noclip','Noclip is now - '..tostring(Noclip))
        end
    end
end

ContextActionService:BindAction('Noclip', Noclipping, true, Enum.KeyCode[NoclipKey])
RunService.RenderStepped:Connect(Noclip())
