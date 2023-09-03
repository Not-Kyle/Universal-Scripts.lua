getgenv().Players = game:GetService'Players'
getgenv().LocalPlayer = Players.LocalPlayer
getgenv().Mouse = LocalPlayer:GetMouse()
getgenv().Hum = LocalPlayer.Character:FindFirstChildOfClass'Humanoid'

Mouse.KeyDown:Connect(function(Action)
    if Action == 'f' then
        Hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
