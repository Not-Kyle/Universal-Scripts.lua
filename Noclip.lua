--[[
How to use

Press X on your keyboard
]]--

local Import = setmetatable({}, {
    __index = function(self: Instance, ...)
        local Arguments = {...}
        rawset(self, Arguments, Arguments[1])
        
        return game:GetService(Arguments[1]);
    end
})

local Players = Import.Players;
local RunService = Import.RunService;
local ContextActionService = Import.ContextActionService;

local Host = Players and Players.LocalPlayer;
local Body = Host and (Host.Character or Host.CharacterAdded:Wait())

local Noclip = true;
local Keybind = 'X';

local IndexedParts = {};

local Menu = loadstring(game:HttpGet('https://raw.githubusercontent.com/Not-Kyle/Universal-Scripts.lua/refs/heads/main/Notifications/Source.lua'))();
local Window = Menu:Panel();

function Notify(Text: string, Delay: number)
    return Window:Notify(Text, Delay);
end

function GrabPart()
    for _, Index in next, Body:GetDescendants() do
        if Index:IsA('BasePart') then
            table.insert(IndexedParts, Index);
        end
    end
end

function OnHeartbeat(Delta: number)
    for _, Index in ipairs(IndexedParts) do
        Index.CanCollide = not Noclip
    end
end

function OnCharacterAdded(Character: Model)
    Body = Character or Host.Character;
end

function ActionKey(ActionName:string, Properties:EnumItem)
    if ActionName == 'Noclip' then
        if not Properties or Properties == Enum.UserInputState.Begin then
            Noclip = not Noclip

            GrabPart();
            Notify(string.format('Noclip is now: %s', tostring(Noclip) or 'null'))
        end
    end
end

function CheatData()
    Host.CharacterAdded:Connect(OnCharacterAdded);
    RunService.Heartbeat:Connect(OnHeartbeat);

    ContextActionService:BindAction('Noclip', ActionKey, true, Enum.KeyCode[Keybind])

    Notify(string.format('Mawborn Noclip V2 %s', 'loaded'))
end
CheatData();
