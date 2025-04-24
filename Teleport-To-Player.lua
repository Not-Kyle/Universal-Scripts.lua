--[[
Put your mouse cursor onto someones body and then click the left mouse button
It may take a few tries but eventually it will say you targetted them

Then just press X
]]--


local Trace = setmetatable({}, {
    __index = function(self: Instance, ...)
        local Arguments = {...}
        
        return game.GetService(game, Arguments[1]);
    end
})

local Players = Trace.Players;
local StarterGui = Trace.StarterGui;
local UserInputService = Trace.UserInputService;

local Target;
local TargetKeybind = 'X'; -- Change keybind here

local Host, Body, Humanoid, Root, Mouse; do
    Host = Players and Players.LocalPlayer;
    Body = Host and Host.Character or Host.CharacterAdded:Wait();
    Humanoid = Body and Body.WaitForChild(Body, 'Humanoid') or Body.FindFirstChildOfClass(Body, 'Humanoid');
    Root = Body and Body.WaitForChild(Body, 'HumanoidRootPart') or Humanoid.RootPart;

    Mouse = Host and Host:GetMouse();

    --Made by mawborn or hellokittysouljia (github.com/Not-Kyle)
end

function Notify(Title: string, Text: string, Icon: string, Duration: number)
    StarterGui:SetCore('SendNotification', {
        Title = Title;
        Text = Text;
        Icon = Icon;
        Duration = Duration;
    })
end

function OnCharacterAdded(Character: Model)
    Body = Character or Host.Character;
    Humanoid = Body and Body.WaitForChild(Body, 'Humanoid') or Body.FindFirstChildOfClass(Body, 'Humanoid');
    Root = Body and Body.WaitForChild(Body, 'HumanoidRootPart') or Humanoid.RootPart
end

function OnInput(Arguments: EnumItem, KillChat: string) -- Would of used ContextActionService but change it up a bit
    if KillChat then
        return;
    end

    if Arguments.UserInputType == Enum.UserInputType.MouseButton1 then
        if Mouse and Mouse.Target and Mouse.Target.Parent.FindFirstChildWhichIsA(Mouse.Target.Parent, 'BasePart') then
            Target = Players.FindFirstChild(tostring(Mouse.Target.Parent.Name));
            Notify('Teleport Target', 'Target is now '..Target..' \nTime Stamp: '..os.date('%c'));
        end
    end

    if Arguments.KeyCode == Enum.KeyCode[TargetKeybind] and Target and not (utf8.len(tostring(Target)) > 0) then
        Root.CFrame = Target.Character.FindFirstChildOfClass(Target.Character, 'Huamnoid').RootPart.CFrame
    end
end

Host.CharacterAdded:Connect(OnCharacterAdded);
UserInputService.InputBegan:Connect(OnInput);
