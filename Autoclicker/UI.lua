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

    local SetInnerBox = Instance.new("Frame")
    SetInnerBox.Name = "SetInnerBox"
    SetInnerBox.Parent = Inner
    SetInnerBox.BackgroundColor3 = Color3.fromRGB(19, 15, 21)
    SetInnerBox.BorderColor3 = Color3.fromRGB(39, 36, 40)
    SetInnerBox.Position = UDim2.new(0.023, 0, 0.116499998, 0)
    SetInnerBox.Size = UDim2.new(0, 286, 0, 170)

    local Bounds = Instance.new("Frame")
    Bounds.Name = "Bounds"
    Bounds.Parent = SetInnerBox
    Bounds.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Bounds.BackgroundTransparency = 1.000
    Bounds.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Bounds.BorderSizePixel = 0
    Bounds.Position = UDim2.new(0.0279720277, 0, 0.0647058859, 0)
    Bounds.Size = UDim2.new(0, 270, 0, 150)

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = Bounds
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0,14)

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Inner
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.023, 0, 0.005, 0)
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
    ExitButton.Position = UDim2.new(0.94, 0, 0.005, 0)
    ExitButton.Size = UDim2.new(0, 20, 0, 20)
    ExitButton.Font = Enum.Font.Code
    ExitButton.Text = "X"
    ExitButton.TextColor3 = Color3.fromRGB(225, 225, 225)
    ExitButton.TextSize = 15.000
    ExitButton.TextStrokeTransparency = 0.500

    function Structure:SetToggle(ToggleTitle: any, IsSet: boolean, Func: any)
        local SubNetwork = {}
        Func = Func or function() end

        if not ToggleTitle or not type(ToggleTitle) == 'string' then ToggleTitle = 'Toggle' end

        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Name = "ToggleButton"
        ToggleButton.Parent = Bounds
        ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleButton.Position = UDim2.new(0.047, 0, 0.175, 0)
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
        TitleOfToggle.Position = UDim2.new(1, 0, -0.4, 0)
        TitleOfToggle.Size = UDim2.new(0, 70, 0, 18)
        TitleOfToggle.Font = Enum.Font.Code
        TitleOfToggle.Text = ' - '..tostring(ToggleTitle)
        TitleOfToggle.TextColor3 = Color3.fromRGB(225, 225, 225)
        TitleOfToggle.TextSize = 14.000
        TitleOfToggle.TextStrokeTransparency = 0.500
        TitleOfToggle.TextXAlignment = Enum.TextXAlignment.Left

        if IsSet then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        elseif not IsSet then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end

        local Callback = false
        ToggleButton.MouseButton1Click:Connect(function()
            Callback = not Callback

            if not Callback and ToggleButton.BackgroundColor3 == Color3.fromRGB(225, 225, 225) then
                ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

                Func()
            elseif Callback and ToggleButton.BackgroundColor3 == Color3.fromRGB(40, 40, 40) then
                ToggleButton.BackgroundColor3 = Color3.fromRGB(225, 225, 225)

                Func()
            end
        end)

        function SubNetwork:SetCounter(Start: number)
            shared.SetCounter = Start or 1
    
            local Box = Instance.new("TextLabel")
            Box.Name = "Box"
            Box.Parent = ToggleButton
            Box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Box.Position = UDim2.new(8.6, 0, -0.1, 0)
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
            DownButton.Position = UDim2.new(1.125, 0, 0.58, 0)
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

    ExitButton.MouseButton1Down:Connect(function()
        Outer.Visible = false
    end)

    return Structure
end

return Window
