getgenv().RunService = game:GetService'RunService'
getgenv().UserInputService = game:GetService'UserInputService'

local Image = 'rbxassetid://11600065256' --Replace the numbers with your image ID

RunService.Stepped:Connect(function()
    UserInputService.MouseIcon = Image
end)
