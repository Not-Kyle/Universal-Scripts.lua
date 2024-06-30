local Core = game:GetService'CoreGui'
local RunService = game:GetService'RunService'
local UserInputService = game:GetService'UserInputService'
local TweenService = game:GetService'TweenService'

local Sizeable = UDim2.new(0.05,0,0.05,0)
local Color = Color3.fromRGB(132, 3, 252) -- Change color here!

local CoryuCustomMouse = Instance.new("ScreenGui", Core)
CoryuCustomMouse.Name = "CoryuCustomMouse"
CoryuCustomMouse.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CoryuCustomMouse.ResetOnSpawn = false
CoryuCustomMouse.IgnoreGuiInset = true

local CursorImage = Instance.new("ImageLabel", CoryuCustomMouse)
CursorImage.Name = "CursorImage"
CursorImage.AnchorPoint = Vector2.new(0.5, 0.5)
CursorImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CursorImage.BackgroundTransparency = 1.000
CursorImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
CursorImage.BorderSizePixel = 0
CursorImage.Size = UDim2.new(0,35,0,35)
CursorImage.Visible = true
CursorImage.Image = "rbxassetid://316279304"
CursorImage.ImageColor3 = Color
CursorImage.ImageTransparency = 0.020
CursorImage.ZIndex = 9e9

local Circle = Drawing.new('Circle')
Circle.Visible = true
Circle.Radius = 40
Circle.Color = Color
Circle.Thickness = 1 
Circle.Filled = false
Circle.Transparency = 1

local Ratio = Instance.new("UIAspectRatioConstraint", CursorImage)

RunService.Stepped:Connect(function()
    Circle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    CursorImage.Position = UDim2.new(0,UserInputService:GetMouseLocation().X,0, UserInputService:GetMouseLocation().Y-35)
end)

local Info = TweenInfo.new(2.5,Enum.EasingStyle.Linear,Enum.EasingDirection.In,-1,false,0)
local Tween = TweenService:Create(CursorImage,Info, {Rotation = 360})

local InfoSize = TweenInfo.new(0.85,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,-1,true,0.8)
local TweenSize = TweenService:Create(CursorImage,InfoSize, {Size = Sizeable})

Tween:Play()
TweenSize:Play()

UserInputService.MouseIconEnabled = false
