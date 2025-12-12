if not game:IsLoaded() then
    game.Loaded:Wait()
end

local OsTime = (tick or os and os.time)()

local Trace = setmetatable({}, {
    __index = function(self: Instance, ...)
        local Arguments = {...}
        rawset(self, Arguments, Arguments[1])
        
        return game:GetService(Arguments[1]);
    end
})

local CoreGui = Trace.CoreGui;
local Players = Trace.Players;
local UserInputService = Trace.UserInputService;

local Window = {};

local UI = {
    ScriptColor = Color3.fromRGB(14, 14, 14),
    AccentColor = Color3.fromRGB(12, 12, 12),
    BorderColor = Color3.fromRGB(255, 255, 255),

    Font = 'Code',
    Keybind = 'RightControl',
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

local Mawborn = Instance.new('ScreenGui')
Mawborn.Name = 'Mawborn';
if syn and syn.product_gui then
    syn.protect_gui(Mawborn)
end
Mawborn.ZIndexBehavior = Enum.ZIndexBehavior.Global;
Mawborn.ResetOnSpawn = true;
Mawborn.IgnoreGuiInset = true;

if gethui() then
    Mawborn.Parent = gethui();
else
    Mawborn.Parent = CoreGui;
end

function Window:CreateWindow(WindowTitle: string)
    WindowTitle = WindowTitle or 'Unknown';

    local Library = {};

    local Outer = NewInstance('Instance', 'Frame', {
        Parent = Mawborn,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 252, 0, 302),
    })

    local Inner = NewInstance('Instance', 'Frame', {
        Parent = Outer,
        BackgroundColor3 = UI.ScriptColor,
        BorderColor3 = UI.BorderColor,
        Position = UDim2.new(0, 1, 0, 1),
        Size = UDim2.new(0, 250, 0, 300),
    })

    local Title = NewInstance('Instance', 'TextLabel', {
        Parent = Inner,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.019, 0, 0.003, 0),
        Size = UDim2.new(0, 240, 0, 20),
        Font = Enum.Font[UI.Font],
        Text = WindowTitle,
        TextColor3 = Color3.fromRGB(225, 225, 225),
        TextSize = 13,
        TextStrokeTransparency = 0,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local InnerSquare = NewInstance('Instance', 'Frame', {
        Parent = Inner,
        BackgroundColor3 = UI.AccentColor,
        BorderColor3 = Color3.fromRGB(27, 27, 27),
        Position = UDim2.new(0.015, 0, 0.068, 0),
        Size = UDim2.new(0, 240, 0, 273),
    })

    local UIStrokeOuter = NewInstance('Instance', 'UIStroke', {
        Parent = InnerSquare,
        BorderStrokePosition = Enum.BorderStrokePosition.Inner,
        Color = Color3.fromRGB(0, 0, 0),
        LineJoinMode = Enum.LineJoinMode.Round,
        Thickness = 1,
        ZIndex = 1,
    })

    local ScrollFrame = NewInstance('Instance', 'ScrollingFrame', {
        Parent = InnerSquare,
        Active = true,
        BackgroundColor3 = UI.ScriptColor,
        BorderColor3 = Color3.fromRGB(27, 27, 27),
        Position = UDim2.new(0.021, 0, 0.02, 0),
        Size = UDim2.new(0, 230, 0, 262),
        BottomImage = 'rbxassetid://86927157225558',
        CanvasSize = UDim2.new(0, 0, 3, 0),
        MidImage = 'rbxassetid://95591733073455',
        ScrollBarThickness = 2,
        TopImage = 'rbxassetid://115122166951013',
    })

    local UIStrokeOuter2 = NewInstance('Instance', 'UIStroke', {
        Parent = ScrollFrame,
        BorderStrokePosition = Enum.BorderStrokePosition.Outer,
        Color = Color3.fromRGB(0, 0, 0),
        LineJoinMode = Enum.LineJoinMode.Round,
        Thickness = 1,
        ZIndex = 1,
    })

    local Container = NewInstance('Instance', 'Frame', {
        Parent = ScrollFrame,
        BackgroundColor3 = Color3.fromRGB(255, 170, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.028, 0, 0.008, 0),
        Size = UDim2.new(0, 216, 0, 600),
    })

    local UIListLayout = NewInstance('Instance', 'UIListLayout', {
        Parent = Container,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0.01, 0),
    })

    function Library:AddBox(BoxTitle: string)
        BoxTitle = BoxTitle or 'Unknown';

        local Addons = {};

        local Box = NewInstance('Instance', 'Frame', {
            Parent = Container,
            BackgroundColor3 = UI.AccentColor,
            BorderColor3 = Color3.fromRGB(27, 27, 27),
            Size = UDim2.new(0, 216, 0, 70),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        local UIStrokeOuter3 = NewInstance('Instance', 'UIStroke', {
            Parent = Box,
            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
            Color = Color3.fromRGB(0, 0, 0),
            LineJoinMode = Enum.LineJoinMode.Round,
            Thickness = 1,
            ZIndex = 1,
        })

        local BoxTitle = NewInstance('Instance', 'TextLabel', {
            Parent = Box,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0.005, 0, 0.04, 0),
            Size = UDim2.new(0, 216, 0, 13),
            Font = Enum.Font[UI.Font],
            Text = BoxTitle,
            TextColor3 = Color3.fromRGB(225, 225, 225),
            TextSize = 12,
            TextStrokeTransparency = 0,
        })

        local LineFrame = NewInstance('Instance', 'Frame', {
            Parent = Box,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0.006, 0, 0.02, 0),
            Size = UDim2.new(0, 212, 0, 2),
        })

        local BoxContainer = NewInstance('Instance', 'Frame', {
            Parent = Box,
            BackgroundColor3 = UI.AccentColor,
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.025, 0, 0.28, 0),
            Size = UDim2.new(0, 204, 0, 30),
        })

        local UIListLayout2 = NewInstance('Instance', 'UIListLayout', {
            Parent = BoxContainer,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.25, 0),
        })

        function Addons:AddDivider()
            local Divider = NewInstance('Instance', 'Frame', {
                Parent = BoxContainer,
                BackgroundColor3 = UI.AccentColor,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(1.52587887e-07, 0, 0, 0),
                Size = UDim2.new(0, 204, 0, 5),
            })

            local UIStrokeOuter5 = NewInstance('Instance', 'UIStroke', {
                Parent = Divider,
                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                Color = Color3.fromRGB(27, 27, 27),
                LineJoinMode = Enum.LineJoinMode.Round,
                Thickness = 1,
                ZIndex = 1,
            })
        end

        function Addons:AddToggle(ToggleTitle: string)
            ToggleTitle = ToggleTitle or 'Unknown';

            local ToggleButton = NewInstance('Instance', 'TextButton', {
                Parent = BoxContainer,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0, 0, 0.4, 0),
                Size = UDim2.new(0, 10, 0, 10),
                Font = Enum.Font.SourceSans,
                Text = '',
                TextColor3 = Color3.fromRGB(0, 0, 0),
                TextSize = 14,
            })

            local UIStrokeOuter4 = NewInstance('Instance', 'UIStroke', {
                Parent = ToggleButton,
                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                Color = Color3.fromRGB(27, 27, 27),
                LineJoinMode = Enum.LineJoinMode.Round,
                Thickness = 1,
                ZIndex = 1,
            })

            local ToggleTitle = NewInstance('Instance', 'TextLabel', {
                Parent = ToggleButton,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(1.7, 0, 0, 0),
                Size = UDim2.new(0, 160, 0, 10),
                Font = Enum.Font[UI.Font],
                Text = ToggleTitle,
                TextColor3 = Color3.fromRGB(225, 225, 225),
                TextSize = 12,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Bottom,
            })
        end

        return Addons
    end

    function OnInput(Arguments: InputObject, NilInput: boolean)
        if NilInput then return end

        if Arguments.KeyCode == Enum.KeyCode[UI.Keybind] then
            Outer.Visible = not Outer.Visible
        end
    end

    UserInputService.InputBegan:Connect(OnInput)

    return Library
end

return Window
