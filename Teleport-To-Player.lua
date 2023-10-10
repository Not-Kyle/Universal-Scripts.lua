getgenv().Players = game:GetService'Players'
getgenv().User = Players.LocalPlayer

Target = '' -- type the users name between the ''

local TargetPlayers = Players:FindFirstChild(Target)
if User and User.Character and User.Character:FindFirstChild'Humanoid' then
	User.Character.HumanoidRootPart.CFrame = TargetPlayers.Character.HumanoidRootPart.CFrame
end

