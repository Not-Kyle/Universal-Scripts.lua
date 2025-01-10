local CoreGui = game:GetService('CoreGui')
local UserInput = game:GetService('UserInputService')

local Window = {};
local Structure = {};

local hellokittysouljia = Instance.new("ScreenGui")
if syn then
    syn.protect_gui(hellokittysouljia)
end
hellokittysouljia.Name = "hellokittysouljia"
hellokittysouljia.Parent = CoreGui
hellokittysouljia.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
hellokittysouljia.IgnoreGuiInset = true

function Window:SetWindow(Scriptname: string)
    if not Scriptname or not type(Scriptname) == 'string' then Scriptname = 'hellokittysouljia' end

    getgenv().Outer = Instance.new("Frame")
    Outer.Name = "Outer"
    Outer.Parent = hellokittysouljia
    Outer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Outer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Outer.BorderSizePixel = 0
    Outer.Position = UDim2.new(0.705054402, 0, 0.46482411, 0)
    Outer.Size = UDim2.new(0, 304, 0, 204)
    Outer.Active = true
    Outer.Draggable = true
    Outer.Selectable = true;

    local Inner = Instance.new("Frame")
    Inner.Name = "Inner"
    Inner.Parent = Outer
    Inner.BackgroundColor3 = Color3.fromRGB(17, 13, 18)
    Inner.BorderColor3 = Color3.fromRGB(39, 36, 40)
    Inner.Position = UDim2.new(0.00657894742, 0, 0.00980392192, 0)
    Inner.Size = UDim2.new(0, 300, 0, 200)

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Inner
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.0233333334, 0, 0.00499999989, 0)
    Title.Size = UDim2.new(0, 273, 0, 20)
    Title.Font = Enum.Font.Code
    Title.Text = Scriptname or ''
    Title.TextColor3 = Color3.fromRGB(225, 225, 225)
    Title.TextSize = 14.000
    Title.TextStrokeTransparency = 0.500
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local ExitButton = Instance.new("TextButton")
    ExitButton.Name = "ExitButton"
    ExitButton.Parent = Inner
    ExitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ExitButton.BackgroundTransparency = 1.000
    ExitButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ExitButton.BorderSizePixel = 0
    ExitButton.Position = UDim2.new(0.933333337, 0, 0.00499999989, 0)
    ExitButton.Size = UDim2.new(0, 20, 0, 20)
    ExitButton.Font = Enum.Font.Code
    ExitButton.Text = "X"
    ExitButton.TextColor3 = Color3.fromRGB(225, 225, 225)
    ExitButton.TextSize = 15.000
    ExitButton.TextStrokeTransparency = 0.500

    function Structure:SetToggle(...)
        local Arguments = { ... }
        local Network = {};
        local SubNetwork = {}

        if type(...) == 'table' then
            Network = ...
        else
            Network.PosX = Arguments[1]
            Network.PosY = Arguments[2]
            Network.Title = Arguments[3]
            Network.IsSet = Arguments[4]
            Network.Func = Arguments[5]
        end

        if not type(Network.PosX) == 'number' or not type(Network.PosY) == 'number' then
            error('Axis X and Y must be numbers', 0)
        end

        if not Network.Title then Network.Title = 'Toggle' end

        Network.Func = Network.Func or function() end

        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Name = "ToggleButton"
        ToggleButton.Parent = Inner
        ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleButton.Position = UDim2.new(0.0466666669, 0, 0.174999997, 0)
        ToggleButton.Size = UDim2.new(0, 10, 0, 10)
        ToggleButton.Font = Enum.Font.SourceSans
        ToggleButton.Text = ""
        ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        ToggleButton.TextSize = 14.000
        ToggleButton.TextStrokeTransparency = 0.500

        local UIGradient = Instance.new("UIGradient")
        UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(150, 150, 150))}
        UIGradient.Rotation = 90
        UIGradient.Parent = ToggleButton

        local TitleOfToggle = Instance.new("TextLabel")
        TitleOfToggle.Name = "TitleOfToggle"
        TitleOfToggle.Parent = ToggleButton
        TitleOfToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TitleOfToggle.BackgroundTransparency = 1.000
        TitleOfToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TitleOfToggle.BorderSizePixel = 0
        TitleOfToggle.Position = UDim2.new(1, 0, -0.40000000, 0)
        TitleOfToggle.Size = UDim2.new(0, 70, 0, 18)
        TitleOfToggle.Font = Enum.Font.Code
        TitleOfToggle.Text = Network.Title
        TitleOfToggle.TextColor3 = Color3.fromRGB(225, 225, 225)
        TitleOfToggle.TextSize = 14.000
        TitleOfToggle.TextStrokeTransparency = 0.500
        TitleOfToggle.TextXAlignment = Enum.TextXAlignment.Left

        if Network.IsSet then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        elseif not Network.IsSet then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end

        local Callback = false
        ToggleButton.MouseButton1Click:Connect(function()
            Callback = not Callback

            if not Callback and ToggleButton.BackgroundColor3 == Color3.fromRGB(225, 225, 225) then
                ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                Network.Func()
            elseif Callback and ToggleButton.BackgroundColor3 == Color3.fromRGB(40, 40, 40) then
                ToggleButton.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
                Network.Func()
            end
        end)

        function SubNetwork:SetCounter(Start: number)
            local StarterNumber = Start
            shared.SetCounter = StarterNumber or 1
    
            local Box = Instance.new("TextLabel")
            Box.Name = "Box"
            Box.Parent = ToggleButton
            Box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Box.Position = UDim2.new(8.60000038, 0, -0.100000001, 0)
            Box.Size = UDim2.new(0, 40, 0, 12)
            Box.Font = Enum.Font.Code
            while task.wait() do Box.Text = shared.SetCounter end
            Box.TextColor3 = Color3.fromRGB(225, 225, 225)
            Box.TextSize = 14.000
            Box.TextStrokeTransparency = 0.500
    
            local UIGradient_2 = Instance.new("UIGradient")
            UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(150, 150, 150))}
            UIGradient_2.Rotation = 90
            UIGradient_2.Parent = Box
    
            local UpButton = Instance.new("ImageButton")
            UpButton.Name = "UpButton"
            UpButton.Parent = Box
            UpButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            UpButton.BackgroundTransparency = 1.000
            UpButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            UpButton.BorderSizePixel = 0
            UpButton.Position = UDim2.new(1.10500002, 0, -0.25, 0)
            UpButton.Rotation = 180.000
            UpButton.Size = UDim2.new(0, 10, 0, 10)
            UpButton.Image = "http://www.roblox.com/asset/?id=14596383084"
            UpButton.ImageColor3 = Color3.fromRGB(50, 50, 50)
    
            local DownButton = Instance.new("ImageButton")
            DownButton.Name = "DownButton"
            DownButton.Parent = Box
            DownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DownButton.BackgroundTransparency = 1.000
            DownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            DownButton.BorderSizePixel = 0
            DownButton.Position = UDim2.new(1.125, 0, 0.583333313, 0)
            DownButton.Size = UDim2.new(0, 10, 0, 10)
            DownButton.Image = "http://www.roblox.com/asset/?id=14596383084"
            DownButton.ImageColor3 = Color3.fromRGB(50, 50, 50)
    
            UpButton.MouseButton1Down:Connect(function()
                shared.SetCounter += 1
            end)
    
            DownButton.MouseButton1Down:Connect(function()
                shared.SetCounter -= 1
            end)
        end

        return SubNetwork
    end

    function SetInputs(Arguments: EnumItem)
        if Arguments.KeyCode == Enum.KeyCode.RightControl then
            Outer.Visible = not Outer.Visible
        end
    end

    UserInput.InputBegan:Connect(SetInputs)

    return Structure
end

return Window
