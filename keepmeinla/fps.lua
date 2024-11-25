local runService = game:GetService'RunService';

local renderStepped = runService.RenderStepped;
local round = math.round;

local hellokittysouljia = loadstring(game:HttpGet(''))();

local fpsCounter = Instance.new("TextLabel", hellokittysouljia)
fpsCounter.Name = "fpsCounter"
fpsCounter.AnchorPoint = Vector2.new(0, 1)
fpsCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fpsCounter.BackgroundTransparency = 1.000
fpsCounter.BorderColor3 = Color3.fromRGB(0, 0, 0)
fpsCounter.BorderSizePixel = 0
fpsCounter.Position = UDim2.new(0.975, 0, 1, 0)
fpsCounter.Size = UDim2.new(0, 50, 0, 15)
fpsCounter.Font = Enum.Font.SourceSansBold
renderStepped:Connect(function(delta:number) fpsCounter.Text = "fps: "..tonumber(round(1/delta)) end)
fpsCounter.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsCounter.TextSize = 14.000
fpsCounter.TextStrokeTransparency = 0.500
fpsCounter.TextTransparency = 0.300
fpsCounter.TextXAlignment = Enum.TextXAlignment.Left
