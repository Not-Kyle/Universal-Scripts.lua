local CoreGui = game:GetService('CoreGui');
local TweenService = game:GetService('TweenService');

local Window = {};

local UI = {
    BorderColor = Color3.fromRGB(35, 35, 35),
    TextColor = Color3.fromRGB(225, 225, 225),

    Font = 'Code',
    TextSize = 13,
}

function NewInstance(Type: string, Class: string, Properties: any)
    if Type == 'Draw' and Drawing then
        Class = Drawing.new(Class);
    end

    if Type == 'Instance' then
        Class = Instance.new(Class);

        if protectinstance then
            protectinstance(Class)
        end
    end

    for Index, Values in next, Properties do
        Class[Index] = Values;
    end

    return Class;
end

local Mawborne = Instance.new('ScreenGui')
Mawborne.Name = 'Mawborne';
if syn and syn.product_gui then
    syn.protect_gui(Mawborne)
end
Mawborne.ZIndexBehavior = Enum.ZIndexBehavior.Global;
Mawborne.ResetOnSpawn = false;
Mawborne.IgnoreGuiInset = true;
Mawborne.Parent = gethui() or CoreGui;

function Window:Panel(ScreenGui: Instance)
    local Library = {};

    local Holder = NewInstance('Instance', 'Frame', {
        Parent = ScreenGui or Mawborne,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(-0.0004, 0, 0.38, 0),
        Size = UDim2.new(0, 200, 0, 300),
    })

    local UIListLayoutNotify = NewInstance('Instance', 'UIListLayout', {
        Parent = Holder,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })

    function Library:Notify(Text: string, Delay: number)
        local Frame = NewInstance('Instance', 'Frame', {
            Parent = Holder,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(0, 0, 0, 20),
            ClipsDescendants = true
        })

        local UIStroke = NewInstance('Instance', 'UIStroke', {
            Parent = Frame,
            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
            Color = UI.BorderColor,
            LineJoinMode = Enum.LineJoinMode.Round,
            Thickness = 1,
            ZIndex = 1,
        })

        local UIGradient = NewInstance('Instance', 'UIGradient', {
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 10, 10)), 
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(14, 14, 14))
            },

            Rotation = 90,
            Parent = Frame,
        })

        local Label = NewInstance('Instance', 'TextLabel', {
            Parent = Frame,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0, 10, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            Text = Text or 'Label',
            Font = Enum.Font[UI.Font],
            TextColor3 = UI.TextColor,
            TextSize = UI.TextSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            AutomaticSize = Enum.AutomaticSize.None,
            TextWrapped = false,
        })

        local Frame2 = NewInstance('Instance', 'Frame', {
            Parent = Frame,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 3, 1, 0),
        })

        task.wait()

        local TargetWidth = math.clamp(Label.TextBounds.X + 20, 120, 600)
        Label.Size = UDim2.new(0, TargetWidth, 1, 0)

        local Info = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
        local TweenIn = TweenService:Create(Frame, Info, {Size = UDim2.new(0, TargetWidth, 0, 20)}):Play()

        task.delay(Delay or 5, function()
            local TweenOut = TweenService:Create(Frame, Info, {Size = UDim2.new(0, 0, 0, 20)})
            TweenOut:Play() -- Must seperate to destroy the frame???

            TweenOut.Completed:Once(function()
                Frame:Destroy()
            end)
        end)
    end

    return Library
end

return Window;
