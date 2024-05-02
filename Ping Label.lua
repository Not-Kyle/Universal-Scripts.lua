getgenv().Core            = game:GetService'CoreGui'
getgenv().WorkSpace       = game:GetService'Workspace'
getgenv().Stats           = game:GetService'Stats'
getgenv().RunService      = game:GetService'RunService'

local hellokittysouljia   = Instance.new("ScreenGui")
hellokittysouljia.Name    = "hellokittysouljia"
hellokittysouljia.Parent  = Core
hellokittysouljia.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
hellokittysouljia.ResetOnSpawn = false

local Backframe           = Instance.new("Frame")
Backframe.Name            = "Backframe"
Backframe.Parent          = hellokittysouljia
Backframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Backframe.BorderColor3    = Color3.fromRGB(0, 0, 0)
Backframe.BorderSizePixel = 0
Backframe.Position        = UDim2.new(0.895250499, 0, 0.90446651, 0)
Backframe.Size            = UDim2.new(0, 149, 0, 66)

local Frame               = Instance.new("Frame")
Frame.Parent              = Backframe
Frame.BackgroundColor3    = Color3.fromRGB(20, 20, 20)
Frame.BorderColor3        = Color3.fromRGB(85, 0, 255)
Frame.BorderSizePixel     = 2
Frame.Position            = UDim2.new(0.0299918614, 0, 0.0737448037, 0)
Frame.Size                = UDim2.new(0, 140, 0, 56)

local PingLabel           = Instance.new("TextLabel")
PingLabel.Name            = "PingLabel"
PingLabel.Parent          = Frame
PingLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PingLabel.BackgroundTransparency = 1.000
PingLabel.BorderColor3    = Color3.fromRGB(0, 0, 0)
PingLabel.BorderSizePixel = 0
PingLabel.Position        = UDim2.new(0.021428572, 0, 0.107142858, 0)
PingLabel.Size            = UDim2.new(0, 133, 0, 23)
PingLabel.Font            = Enum.Font.Highway
PingLabel.TextColor3      = Color3.fromRGB(255, 255, 255)
PingLabel.TextSize        = 14.000
PingLabel.TextXAlignment  = Enum.TextXAlignment.Left

local FpsLabel            = Instance.new("TextLabel")
FpsLabel.Name             = "FpsLabel"
FpsLabel.Parent           = Frame
FpsLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FpsLabel.BackgroundTransparency = 1.000
FpsLabel.BorderColor3     = Color3.fromRGB(0, 0, 0)
FpsLabel.BorderSizePixel  = 0
FpsLabel.Position         = UDim2.new(0.021428572, 0, 0.517857134, 0)
FpsLabel.Size             = UDim2.new(0, 133, 0, 23)
FpsLabel.Font             = Enum.Font.Highway
FpsLabel.TextColor3       = Color3.fromRGB(255, 255, 255)
FpsLabel.TextSize         = 14.000
FpsLabel.TextXAlignment   = Enum.TextXAlignment.Left

RunService.Stepped:Connect(function()
    local FramesPerSecond = WorkSpace:GetRealPhysicsFPS()
    local PingInt         = Stats:FindFirstChild'PerformanceStats'.Ping:GetValue()

    PingLabel.Text        = " Ping: "..math.round(PingInt)
    FpsLabel.Text         = " Fps: "..math.floor(FramesPerSecond)

    if Stats:FindFirstChild'PerformanceStats'.Ping:GetValue() > 100 then
        PingLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    elseif Stats:FindFirstChild'PerformanceStats'.Ping:GetValue() > 165 then
        PingLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
