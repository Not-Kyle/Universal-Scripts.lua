local Command = {}
local Hotkeys = {Noclip = 'X', NoNoclip = 'C'}

getgenv().Players = game:GetService'Players'
getgenv().Local = Players.LocalPlayer
getgenv().UserInputService = game:GetService'UserInputService'
getgenv().UserNotifications = function(title, text) game:GetService'StarterGui':SetCore("SendNotification", {Title = title; Text = text;}) end

function Command:Noclip()
    if Local and Local.Character and Local.Character:FindFirstChild'Torso' then
        Local.Character:FindFirstChild'Head'.CanCollide = false
        Local.Character:FindFirstChild'Torso'.CanCollide = false
    elseif Local and Local.Character and Local.Character:FindFirstChild'UpperTorso' then
        Local.Character:FindFirstChild'Head'.CanCollide = false
        Local.Character:FindFirstChild'LowerTorso'.CanCollide = false
        Local.Character:FindFirstChild'UpperTorso'.CanCollide = false
        Local.Character:FindFirstChild'HumanoidRootPart'.CanCollide = false
    end
    UserNotifications('Noclip', 'Noclip is now true')
end

function Command:KillNoclip()
    if Local and Local.Character and Local.Character:FindFirstChild'Torso' then
        Local.Character:FindFirstChild'Head'.CanCollide = true
        Local.Character:FindFirstChild'Torso'.CanCollide = true
    elseif Local and Local.Character and Local.Character:FindFirstChild'UpperTorso' then
        Local.Character:FindFirstChild'Head'.CanCollide = true
        Local.Character:FindFirstChild'LowerTorso'.CanCollide = true
        Local.Character:FindFirstChild'UpperTorso'.CanCollide = true
        Local.Character:FindFirstChild'HumanoidRootPart'.CanCollide = true
    end
    UserNotifications('Noclip', 'Noclip is now false')
end

UserInputService.InputBegan:Connect(function(Array, Kill)
    if Kill then
        retrun nil
    end
    if Array.KeyCode == Enum.KeyCode[Noclip] then
        Command:Noclip()
    end
    if Array.KeyCode == Enum.KeyCode[NoNoclip] then
        Command:KillNoclip()
    end
end)

UserNotifications('Noclip', 'Noclip executed - By Coryu')

return Command
