local Command = {}
local Hotkeys = {Noclip = 'X'}

getgenv().Players = game:GetService'Players'
getgenv().Local = Players.LocalPlayer
getgenv().UserInputService = game:GetService'UserInputService'
getgenv().UserNotifications = function(title, text) game:GetService'StarterGui':SetCore("SendNotification", {Title = title; Text = text;}) end
getgenv().Noclip = true

function Command:Noclip()
	if Noclip then
	    if Local and Local.Character and Local.Character:FindFirstChild'UpperTorso' or Local.Character:FindFirstChild'Humanoid'.RigType == Enum.HumanoidRigType.R15 then
	        Local.Character:FindFirstChild'Head'.CanCollide = false
	        Local.Character:FindFirstChild'LowerTorso'.CanCollide = false
	        Local.Character:FindFirstChild'UpperTorso'.CanCollide = false
	        Local.Character:FindFirstChild'HumanoidRootPart'.CanCollide = false
	    elseif Local and Local.Character and Local.Character:FindFirstChild'Torso' then
	        Local.Character:FindFirstChild'Head'.CanCollide = false
	        Local.Character:FindFirstChild'Torso'.CanCollide = false
	    end
	elseif not Noclip then
		if Local and Local.Character and Local.Character:FindFirstChild'UpperTorso' or Local.Character:FindFirstChild'Humanoid'.RigType == Enum.HumanoidRigType.R15 then
	        Local.Character:FindFirstChild'Head'.CanCollide = true
	        Local.Character:FindFirstChild'LowerTorso'.CanCollide = true
	        Local.Character:FindFirstChild'UpperTorso'.CanCollide = true
	        Local.Character:FindFirstChild'HumanoidRootPart'.CanCollide = true
		elseif Local and Local.Character and Local.Character:FindFirstChild'Torso' then
	        Local.Character:FindFirstChild'Head'.CanCollide = true
	        Local.Character:FindFirstChild'Torso'.CanCollide = true
	    end
	end
end

UserInputService.InputBegan:Connect(function(Array, Kill)
    if Kill then
        return nil
    end
    if Array.KeyCode == Enum.KeyCode[Hotkeys.Noclip] then
        Noclip = not Noclip
        Command:Noclip()
        UserNotifications('Noclip', 'Noclip is now '..tostring(Noclip))
    end
end)

UserNotifications('Coryu Noclip', 'Coryus Universial noclip has been executed')
