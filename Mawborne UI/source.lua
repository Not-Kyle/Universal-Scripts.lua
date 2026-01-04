local Import = setmetatable({}, {
    __index = function(self: Instance, ...)
        local Arguments = {...}
        rawset(self, Arguments, Arguments[1])
        
        return game:GetService(Arguments[1]);
    end
})

local CoreGui = Import.CoreGui;
local Players = Import.Players;
local TweenService = Import.TweenService;
local UserInputService = Import.UserInputService;

local Host = Players.LocalPlayer;
local Mouse = Host:GetMouse();

local Bools = {};
local Selection = {};
local Window = {};

getgenv().Boolean = Bools;
getgenv().Select = Selection;

local UI = {
    AccentColor = Color3.fromRGB(14, 14, 14),
    AccentDarkColor = Color3.fromRGB(12, 12, 12),
    ScriptColor = Color3.fromRGB(255, 255, 255),
    BorderColor = Color3.fromRGB(35, 35, 35),
    TextColor = Color3.fromRGB(225, 225, 225),

    Font = 'Code',
    Keybind = 'RightControl',
    
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

getgenv().Mawborn = Instance.new('ScreenGui')
Mawborn.Name = 'Mawborn';
if syn and syn.product_gui then
    syn.protect_gui(Mawborn)
end
Mawborn.ZIndexBehavior = Enum.ZIndexBehavior.Global;
Mawborn.ResetOnSpawn = false;
Mawborn.IgnoreGuiInset = true;

if gethui() then
    Mawborn.Parent = gethui();
else
    Mawborn.Parent = CoreGui;
end

function Resize(Sizer: Instance, Index: Instance, SizeX: number, SizeY: number)
    return Index:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
        Sizer.Size = UDim2.new(0, SizeX, 0, SizeY + Index.AbsoluteContentSize.Y + 2)
    end)
end

function Window:CreateWindow(WindowTitle: string)
    WindowTitle = WindowTitle or 'Unknown';

    local Library = {};

    local Holder = NewInstance('Instance', 'Frame', {
        Parent = Mawborn,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(-0.0004, 0, 0.35, 0),
        Size = UDim2.new(0, 200, 0, 300),
    })

    local UIListLayoutNotify = NewInstance('Instance', 'UIListLayout', {
        Parent = Holder,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    })

    local Outer = NewInstance('Instance', 'Frame', {
        Parent = Mawborn,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 488, 0, 302),
    })

    local Inner = NewInstance('Instance', 'Frame', {
        Parent = Outer,
        BackgroundColor3 = UI.AccentColor,
        BorderColor3 = UI.ScriptColor,
        Position = UDim2.new(0, 1, 0, 1),
        Size = UDim2.new(0, 486, 0, 300),
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
        TextColor3 = UI.TextColor,
        TextSize = UI.TextSize,
        TextStrokeTransparency = 0,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local InnerSquare = NewInstance('Instance', 'Frame', {
        Parent = Inner,
        BackgroundColor3 = UI.AccentDarkColor,
        BorderColor3 = UI.BorderColor,
        Position = UDim2.new(0.015, 0, 0.068, 0),
        Size = UDim2.new(0, 472, 0, 272),
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
        BackgroundColor3 = UI.AccentColor,
        BorderColor3 = UI.BorderColor,
        Position = UDim2.new(0.014, 0, 0.02, 0),
        Size = UDim2.new(0, 458, 0, 262),
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

        local TargetWidth = math.clamp(Label.TextBounds.X + 20, 120, 400)
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

    function Library:AddBox(Side: string, BoxTitle: string)
        Side = Side or 'Left';
        BoxTitle = BoxTitle or 'Unknown';

        local SidePosition = (Side == 'Left') and 0.014 or 0.51

        local Addons = {};

        if not UI[Side] then
            local Container = NewInstance('Instance', 'Frame', {
                Parent = ScrollFrame,
                BackgroundColor3 = Color3.fromRGB(255, 170, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(SidePosition, 0, 0.008, 0),
                Size = UDim2.new(0, 216, 0, 600),
            })

            local UIListLayout = NewInstance('Instance', 'UIListLayout', {
                Parent = Container,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.01, 0),
            })

            UI[Side] = Container
        end

        local Container = UI[Side]

        local Box = NewInstance('Instance', 'Frame', {
            Parent = Container,
            BackgroundColor3 = UI.AccentDarkColor,
            BorderColor3 = UI.BorderColor,
            Size = UDim2.new(0, 216, 0, 70),
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
            Position = UDim2.new(0, 3, 0, 10),
            Size = UDim2.new(0, 216, 0, 13),
            Font = Enum.Font[UI.Font],
            Text = BoxTitle,
            TextColor3 = UI.TextColor,
            TextSize = 12,
            TextStrokeTransparency = 0,
        })

        local LineFrame = NewInstance('Instance', 'Frame', {
            Parent = Box,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0, 2, 0, 3),
            Size = UDim2.new(0, 212, 0, 2),
        })

        local BoxContainer = NewInstance('Instance', 'Frame', {
            Parent = Box,
            BackgroundColor3 = UI.AccentDarkColor,
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 5, 0, 20),
            Size = UDim2.new(0, 204, 0, 30),
        })

        local UIListLayout2 = NewInstance('Instance', 'UIListLayout', {
            Parent = BoxContainer,
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
        })

        Resize(Box, UIListLayout2, 216, 26)

        local ChildCount = #BoxContainer:GetChildren()
        local AddPixels = 5 + (ChildCount * 1)

        function Addons:AddBlank(Size: number)
            local Blank = NewInstance('Instance', 'Frame', {
                Parent = BoxContainer,
                BackgroundColor3 = UI.AccentDarkColor,
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.new(0, 1, 0, Size or 1),
            })
        end

        function Addons:AddDivider()
            Addons:AddBlank(AddPixels + 3);

            local Divider = NewInstance('Instance', 'Frame', {
                Parent = BoxContainer,
                BackgroundColor3 = UI.AccentDarkColor,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.new(0, 204, 0, 5),
            })

            local UIStrokeOuter5 = NewInstance('Instance', 'UIStroke', {
                Parent = Divider,
                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                Color = UI.BorderColor,
                LineJoinMode = Enum.LineJoinMode.Round,
                Thickness = 1,
                ZIndex = 1,
            })
        end

        function Addons:AddLabel(Info: table)
            Addons:AddBlank(AddPixels + 2);

            local Index = {
                Title = Info.Title or 'Unknown',
                TextSize = Info.Size or 13
            }

            local Label = NewInstance('Instance', 'TextLabel', {
                Parent = BoxContainer,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.new(0, 200, 0, 18),
                Font = Enum.Font[UI.Font],
                Text = Index.Title,
                TextColor3 = UI.TextColor,
                TextSize = Index.TextSize,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
            })

            return Index
        end

        function Addons:AddToggle(Info: table)
            local Toggle = {
                Index = Info.Index,
                Title = Info.Title or Info.Index or 'Unknown',
            }

            local ToggleSwitch = {
                Value = false
            }

            Addons:AddBlank(AddPixels + 1.5);

            local Outerline = NewInstance('Instance', 'Frame', {
                Parent = BoxContainer,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = UI.BorderColor,
                BorderMode = Enum.BorderMode.Outline,
                Size = UDim2.new(0, 10, 0, 10),
            })

            local ToggleButton = NewInstance('Instance', 'TextButton', {
                Parent = Outerline,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderMode = Enum.BorderMode.Inset,
                BorderSizePixel = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.SourceSans,
                Text = '',
                TextColor3 = Color3.fromRGB(0, 0, 0),
                TextSize = 14,
            })

            local UIGradient = NewInstance('Instance', 'UIGradient', {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(150, 150, 150))
                },

                Rotation = -140,
                Parent = ToggleButton,
            })

            local UIStrokeOuter4 = NewInstance('Instance', 'UIStroke', {
                Parent = ToggleButton,
                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                Color = UI.BorderColor,
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
                Text = Toggle.Title,
                TextColor3 = UI.TextColor,
                TextSize = 12,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Bottom,
            })

            function Toggle:AddKeybind(Input: table)
                local InfoIndex = {
                    Index = Input.Index,
                    Keybind = Input.Keybind or '...',
                    State = Input.State or 'Toggle',
                    Name = Input.Name or Input.Index or 'Unknown',

                    Sync = Input.Sync or false,
                }

                local KeybindBox = NewInstance('Instance', 'TextBox', {
                    Parent = ToggleButton,
                    BackgroundColor3 = UI.AccentColor,
                    BorderColor3 = UI.BorderColor,
                    Position = UDim2.new(22.7, 0, -0.1, 0),
                    Size = UDim2.new(0, 20, 0, 12),
                    Font = Enum.Font[UI.Font],
                    Text = Input.Keybind,
                    TextColor3 = UI.TextColor,
                    TextSize = UI.TextSize - 1,
                    TextStrokeTransparency = 0,
                })

                local UIStrokeOuter4 = NewInstance('Instance', 'UIStroke', {
                    Parent = KeybindBox,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                    Color = Color3.fromRGB(0, 0, 0),
                    LineJoinMode = Enum.LineJoinMode.Round,
                    Thickness = 1,
                    ZIndex = 1,
                })

                function InfoIndex:OnClick(Callback)
                    if typeof(Callback) ~= 'function' then
                        Callback = function() end
                    end
                    
                    self.Changed = Callback
                end

                local KeybindOnInput = function(Input: InputObject, NilInput: boolean) -- Creds to Wallys UI
                    if NilInput then return end

                    KeybindBox.ClearTextOnFocus = false
                    KeybindBox.TextEditable = false

                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        KeybindBox:CaptureFocus()
                        KeybindBox.Text = '';

                        local Break = false;
                        local SetText = '';

                        task.spawn(function()
                            while not Break do
                                SetText = (SetText == '...') and '' or SetText

                                SetText ..= '.';
                                KeybindBox.Text = SetText;

                                task.wait(0.4)
                            end
                        end)

                        task.wait(0.2)

                        local OnEvent; OnEvent = UserInputService.InputBegan:Connect(function(Input: InputObject)
                            local Keybind;

                            if Input.UserInputType == Enum.UserInputType.Keyboard then
                                Keybind = Input.KeyCode.Name;
                            elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                Keybind = 'MB1';
                            elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
                                Keybind = 'MB2';
                            end;

                            Break = true;

                            KeybindBox.Text = tostring(Keybind)
                            InfoIndex.Keybind = tostring(Keybind)

                            KeybindBox:ReleaseFocus()
                            OnEvent:Disconnect()
                        end)
                    end
                end

                local CheckState = function(Input: InputObject, State: string)
                    local IsKey = Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode.Name == InfoIndex.Keybind
                    local IsMouse = (InfoIndex.Keybind == 'MB1' and Input.UserInputType == Enum.UserInputType.MouseButton1)
                                or (InfoIndex.Keybind == 'MB2' and Input.UserInputType == Enum.UserInputType.MouseButton2)

                    if IsKey or IsMouse then
                        if InfoIndex.Sync then
                            Toggle:SetValue(State)
                        end

                        if InfoIndex.Changed then
                            InfoIndex.Changed()
                        end
                    end
                end

                local OnInput = function(Input: InputObject, NilProcessing: boolean)
                    if NilProcessing then return end

                    if InfoIndex.State == 'Toggle' then
                        CheckState(Input, not ToggleSwitch.Value)
                    end

                    if InfoIndex.State == 'Hold' or InfoIndex.State == 'Always' then
                        CheckState(Input, true)
                    end
                end

                local OnEnded = function(Input: InputObject)
                    if InfoIndex.State == 'Hold' then
                        CheckState(Input, false)
                    end
                end

                KeybindBox.InputBegan:Connect(KeybindOnInput)
                UserInputService.InputBegan:Connect(OnInput)
                UserInputService.InputEnded:Connect(OnEnded)

                Select[InfoIndex.Index] = InfoIndex

                return InfoIndex
            end

            function Toggle:Display()
                ToggleButton.BackgroundColor3 = ToggleSwitch.Value and UI.ScriptColor or UI.AccentDarkColor;
            end

            function Toggle:OnChanged(Callback)
                if typeof(Callback) ~= 'function' then
                    Callback = function() end
                end
                
                self.Changed = Callback
            end

            function Toggle:SetValue(Boolean: boolean)
                Boolean = not not Boolean -- Forces the variable/argument to be a boolean

                ToggleSwitch.Value = Boolean
                self:Display()

                if self.Changed then
                    self.Changed()
                end
            end

            ToggleButton.MouseButton1Click:Connect(function()
                Toggle:SetValue(not ToggleSwitch.Value)
            end)

            Toggle:SetValue(Info.Default ~= nil and Info.Default or ToggleSwitch.Value)

            setmetatable(Toggle, {  -- I did not make this, creds to whoever did
                __index = function(_, Key)
                    if Key == 'Value' then return ToggleSwitch.Value end
                    return ToggleSwitch[Key]
                end,

                __newindex = function(self, Key, Value)
                    if Key == 'Value' then self:SetValue(Value) else rawset(self, Key, Value) end
                end
            })

            Boolean[Toggle.Index] = Toggle

            return Toggle
        end

        function Addons:AddSlider(Info: table)
            local Sliding = false

            local Index = {
                Index = Info.Index,
                Title = Info.Title or Info.Index or 'Unknown',
                Default = Info.Default or 0,
                Min = Info.Min or 0,
                Max = Info.Max or 500,
                Rounding = Info.Rounding or 0,
                
                Value = 0
            }

            Addons:AddBlank(AddPixels - 1);

            local TextTitle = NewInstance('Instance', 'TextLabel', {
                Parent = BoxContainer,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.new(0, 204, 0, 30),
                Font = Enum.Font[UI.Font],
                Text = Index.Title,
                TextColor3 = UI.TextColor,
                TextSize = UI.TextSize,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
            })

            local Slider = NewInstance('Instance', 'Frame', {
                Parent = TextTitle,
                BackgroundColor3 = UI.AccentColor,
                BorderColor3 = UI.BorderColor,
                Position = UDim2.new(0, 0, 0.6, 0),
                Size = UDim2.new(0, 204, 0, 12),
            })

            local UIStroke = NewInstance('Instance', 'UIStroke', {
                Parent = Slider,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                Color = Color3.fromRGB(0, 0, 0),
                LineJoinMode = Enum.LineJoinMode.Round,
                Thickness = 1,
                ZIndex = 1,
            })

            local Frame = NewInstance('Instance', 'Frame', {
                Parent = Slider,
                BackgroundColor3 = UI.ScriptColor,
                BorderColor3 = UI.BorderColor,
                Position = UDim2.new(0, 0, 0, 0),
                Size = UDim2.new(math.clamp((Index.Default - Index.Min) / (Index.Max - Index.Min) + 0.02, 0, 1), 0, 1, 0),
            })

            local UIStroke2 = NewInstance('Instance', 'UIStroke', {
                Parent = Frame,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                Color = Color3.fromRGB(0, 0, 0),
                LineJoinMode = Enum.LineJoinMode.Round,
                Thickness = 1,
                ZIndex = 1,
            })

            local Label = NewInstance('Instance', 'TextLabel', {
                Parent = Slider,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.Code,
                Text = string.format('%.'.. Index.Rounding ..'f', Index.Default) .. ' / ' .. Index.Max,
                TextColor3 = UI.TextColor,
                TextSize = 13,
                TextStrokeTransparency = 0,
            })

            function Index:OnClick(Callback)
                if typeof(Callback) ~= 'function' then
                    Callback = function() end
                end
                
                self.Changed = Callback
            end

            function Index:SetValue(Value: number)
                if typeof(Value) ~= 'number' then
                    Value = self.Default
                end

                self.Value = Value

                local Scale = math.clamp((Mouse.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1)
                local FillPixels = math.max(Scale * Slider.AbsoluteSize.X, 3)
                Frame.Size = UDim2.new(0, FillPixels, 1, 0)

                self.Value = self.Min + (self.Max - self.Min) * Scale
                self.Value = math.floor(self.Value * (10 ^ self.Rounding)) / (10 ^ self.Rounding)

                Label.Text = string.format('%.'.. self.Rounding ..'f', self.Value) .. ' / ' .. self.Max
            end

            function OnInput(Input: InputObject)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding = true;

                    while Sliding and task.wait() do -- Yup, I don't care anymore. I want this done
                        Index:SetValue(Index.Value)
                    end

                    if Index.Changed then
                        Index.Changed()
                    end
                end
            end

            function OnEnded(Input: InputObject)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding = false;
                end
            end

            Slider.InputBegan:Connect(OnInput)
            Slider.InputEnded:Connect(OnEnded)

            Index.Value = Index.Default;
            Select[Index.Index] = Index

            return Index
        end

        function Addons:AddDropdown(Info: table)
            local Index = {
                Index = Info.Index,
                Title = Info.Title or Info.Index or 'Unknown',
                Values = typeof(Info.Values) == 'table' and Info.Values or {},
                Default = Info.Default or '...',
                Value = Info.Default
            }

            Addons:AddBlank(AddPixels + 2.5);

            local DropdownTitle = NewInstance('Instance', 'TextLabel', {
                Parent = BoxContainer,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.new(0, 204, 0, 40),
                Font = Enum.Font[UI.Font],
                Text = Index.Title,
                TextColor3 = UI.TextColor,
                TextSize = 14,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
            })

            local Dropdown = NewInstance('Instance', 'Frame', {
                Parent = DropdownTitle,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderMode = Enum.BorderMode.Inset,
                Position = UDim2.new(0, 0, 0.5, 0),
                Size = UDim2.new(0, 204, 0, 18),
            })

            local UIStrokeDropdown = NewInstance('Instance', 'UIStroke', {
                Parent = Dropdown,
                BorderStrokePosition = Enum.BorderStrokePosition.Outer,
                Color = UI.BorderColor,
                LineJoinMode = Enum.LineJoinMode.Round,
                Thickness = 1,
                ZIndex = 1,
            })

            local InnerDropdown = NewInstance('Instance', 'Frame', {
                Parent = Dropdown,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.new(0, 202, 0, 16),
            })

            local UIGradient = NewInstance('Instance', 'UIGradient', {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0.00, UI.AccentColor), 
                    ColorSequenceKeypoint.new(1.00, UI.AccentDarkColor)
                },

                Rotation = 90,
                Parent = InnerDropdown,
            })

            local InnerDefaultTitle = NewInstance('Instance', 'TextLabel', {
                Parent = InnerDropdown,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0.03, 0, -0.05, 0),
                Size = UDim2.new(0, 165, 0, 18),
                Font = Enum.Font[UI.Font],
                Text = Index.Default,
                TextColor3 = UI.TextColor,
                TextSize = UI.TextSize,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
            })

            local OptionHolder = NewInstance('Instance', 'Frame', {
                Parent = InnerDropdown,
                BackgroundColor3 = UI.AccentDarkColor,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0.98, 0),
                Size = UDim2.new(0, 204, 0, 150),
                Visible = false,
            })

            local UIListLayout = NewInstance('Instance', 'UIListLayout', {
                Parent = OptionHolder,
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
            })

            local ImageLabel = NewInstance('Instance', 'ImageLabel', {
                Parent = Dropdown,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0.899999976, 0, 0.0655551478, 0),
                Size = UDim2.new(0, 16, 0, 16),
                Image = 'rbxassetid://6282522798',
            })

            function Index:AddButton(Title: string)
                local OuterFrame = NewInstance('Instance', 'Frame', {
                    Parent = OptionHolder,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = UI.BorderColor,
                    BorderMode = Enum.BorderMode.Outline,
                    Size = UDim2.new(0, 204, 0, 18),
                })

                local OptionButton = NewInstance('Instance', 'Frame', {
                    Parent = OuterFrame,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderMode = Enum.BorderMode.Inset,
                    Size = UDim2.new(1, 0, 1, 0),
                })

                local UIGradient_2 = NewInstance('Instance', 'UIGradient', {
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0.00, UI.AccentColor), 
                        ColorSequenceKeypoint.new(1.00, UI.AccentDarkColor)
                    },

                    Rotation = 90,
                    Parent = OptionButton,
                })

                local OptionTitle = NewInstance('Instance', 'TextLabel', {
                    Parent = OptionButton,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    Font = Enum.Font[UI.Font],
                    Text = Title or 'Label',
                    TextColor3 = UI.TextColor,
                    TextSize = UI.TextSize,
                    TextStrokeTransparency = 0,
                })

                OptionButton.InputBegan:Connect(function(Input: InputObject)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Index:SetValue(OptionTitle.Text)
                        OptionHolder.Visible = false
                    end
                end)
            end

            function Index:OnChanged(Callback)
                if typeof(Callback) ~= 'function' then
                    Callback = function() end
                end
                
                self.Changed = Callback
            end

            function Index:SetValue(Value: string)
                if typeof(Value) ~= 'string' then
                    Value = Index.Default
                end

                self.Value = Value
                InnerDefaultTitle.Text = Value

                if self.Changed then
                    self.Changed()
                end
            end

            for _, Value in ipairs(Index.Values) do
                Index:AddButton(Value)
            end

            Dropdown.InputBegan:Connect(function(Input: InputObject)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    OptionHolder.Visible = not OptionHolder.Visible;
                end
            end)

            Resize(OptionHolder, UIListLayout, 204, 0)

            Select[Index.Index] = Index

            return Index
        end

        function Addons:AddButton(Info: table)
            local Index = {
                Text = Info.Title or 'Label',
            }

            Addons:AddBlank(AddPixels + 2.5);

            local OuterButton = NewInstance('Instance', 'Frame', {
                Parent = BoxContainer,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = UI.BorderColor,
                BorderMode = Enum.BorderMode.Outline,
                Size = UDim2.new(0, 204, 0, 18),
            })

            local Button = NewInstance('Instance', 'TextButton', {
                Parent = OuterButton,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderMode = Enum.BorderMode.Inset,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font[UI.Font],
                Text = '',
                TextColor3 = UI.TextColor,
                TextSize = 14,
                TextStrokeTransparency = 0,
            })

            local UIGradient = NewInstance('Instance', 'UIGradient', {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0.00, UI.AccentColor), 
                    ColorSequenceKeypoint.new(1.00, UI.AccentDarkColor)
                },

                Parent = Button,
                Rotation = 90,
            })

            local Title = NewInstance('Instance', 'TextLabel', {
                Parent = Button,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font[UI.Font],
                Text = Index.Text,
                TextColor3 = UI.TextColor,
                TextSize = UI.TextSize,
                TextStrokeTransparency = 0,
            })

            function Index:OnClick(Callback)
                if typeof(Callback) ~= 'function' then
                    Callback = function() end
                end
                
                self.Changed = Callback
            end

            Button.MouseButton1Click:Connect(function()
                if Index.Changed then Index.Changed() end
            end)

            return Index
        end

        return Addons
    end

    function Library:AddLeftBox(Title: string)
        return Library:AddBox('Left', Title)
    end

    function Library:AddRightBox(Title: string)
        return Library:AddBox('Right', Title)
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
