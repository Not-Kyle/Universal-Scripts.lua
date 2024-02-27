getgenv().Players = game:GetService'Players'
getgenv().Host = Players.LocalPlayer
getgenv().Mouse = Host:GetMouse()
getgenv().Hum = Host.Character:FindFirstChildOfClass'Humanoid'

Mouse.KeyDown:Connect(function(Action)
    if Action == 'f' then
       if Host and Host.Character and Host.Character:FindFirstChildOfClass'Humanoid' then
           Hum:ChangeState(Enum.HumanoidStateType.Jumping)
       end
    end
end)
