getgenv().User = game:GetService'Players'.LocalPlayer
getgenv().WorkSpace = game:GetService'Workspace'
getgenv().UserInputService = game:GetService'UserInputService'

local CoryuMadeThis = true
local Speed = 100

while CoryuMadeThis do
    WorkSpace[User.Name].Character:FindFirstChild'Humanoid'.WalkSpeed = Speed
end

UserInputService.InputBegan:Connect(function(Args,Kill)
    if Kill then
        return nil
    elseif Args.KeyCode == Enum.KeyCode.L then
        Speed = Speed - 10
    elseif Args.KeyCode == Enum.KeyCode.K then
        Speed = Speed + 10
    end
end)
