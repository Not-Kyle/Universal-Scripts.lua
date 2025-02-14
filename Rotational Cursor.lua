local Core = game:GetService'CoreGui';
local RunService = game:GetService'RunService';
local UserInputService = game:GetService'UserInputService';
local TweenService = game:GetService'TweenService';

local Sizeable = UDim2.new(0.07,0,0.07,0)
local Color = Color3.fromRGB(132, 3, 252)-- Change color here!

local IsCircleOn = false -- Turn the circle on or off (True or false)
UserInputService.MouseIconEnabled = true -- Toggle on or off cursor

function IsSyn(Children: string)
    if syn then
        return (syn.protectgui or syn.protect_gui)(Children)
    end
end

local mawborn = Instance.new("ScreenGui")
mawborn.Name = "mawborn"
IsSyn(mawborn);
mawborn.Parent = Core
mawborn.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
mawborn.ResetOnSpawn = false
mawborn.IgnoreGuiInset = true

local CursorImage = Instance.new("ImageLabel", mawborn)
CursorImage.Name = "CursorImage"
CursorImage.AnchorPoint = Vector2.new(0.5, 0.5)
CursorImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CursorImage.BackgroundTransparency = 1.000
CursorImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
CursorImage.BorderSizePixel = 0
CursorImage.Size = UDim2.new(0,40,0,40)
CursorImage.Visible = true
CursorImage.Image = "rbxassetid://316279304"
CursorImage.ImageColor3 = Color
CursorImage.ImageTransparency = 0.020
CursorImage.ZIndex = 9e9

if Drawing then
    shared.Circle = Drawing.new('Circle')
    shared.Circle.Visible = IsCircleOn
    shared.Circle.Radius = 40
    shared.Circle.Color = Color
    shared.Circle.Thickness = 1 
    shared.Circle.Filled = false
    shared.Circle.Transparency = 1
end

local Ratio = Instance.new("UIAspectRatioConstraint", CursorImage)

RunService.Stepped:Connect(function()
    if Drawing then
        shared.Circle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    end

    CursorImage.Position = UDim2.new(0,UserInputService:GetMouseLocation().X,0, UserInputService:GetMouseLocation().Y)
end)

local Info = TweenInfo.new(2.5,Enum.EasingStyle.Linear,Enum.EasingDirection.In,-1,false,0)
local Tween = TweenService:Create(CursorImage,Info, {Rotation = 360}):Play()

local InfoSize = TweenInfo.new(0.85,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,-1,true,0.8)
local TweenSize = TweenService:Create(CursorImage,InfoSize, {Size = Sizeable}):Play()
