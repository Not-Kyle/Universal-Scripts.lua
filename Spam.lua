if not getgenv()['hellokittysouljia'] then
    getgenv()['hellokittysouljia'] = true
    getgenv().players = game:GetService'Players'
    getgenv().Host = players.LocalPlayer
    getgenv().Core = game:GetService'CoreGui'
    getgenv().Mouse = Host:GetMouse()
    getgenv().Version = '4.3b'
    getgenv().Input = game:GetService'UserInputService'
    getgenv().getHttp = game:GetService'HttpService'
    getgenv().ReplicatedStorage = game:GetService'ReplicatedStorage'
    getgenv().RunService = game:GetService'RunService'
    getgenv().Stats = game:GetService'Stats'
    getgenv().Workspace = game:GetService'Workspace'
    getgenv().AddNotification = function(title, text, time) 
        StarterGui:SetCore("SendNotification", 
        {Title = title; Text = text; Icon = ''; Duration = time;})
    end
    getgenv().SpamFile;
    makefolder('hellokittysouljia')
    ypcall(function()
        SpamFile = readfile('hellokittysouljia/Settings.json')
    end)
    getgenv().findbyte = function(f,n,classtype)
        if not f and not n then
            if classtype == 'Find' then
                local default = f:FindFirstChild(n)
                if default then
                    return default
                end
            elseif classtype == 'Wait' then
                local default = f:WaitForChild(n)
                if default then
                    return default
                end
            end
        end
    end

    -- Booleans
    local BeingPushed = false
    local IsDelayed = true
    local IsOn = false
    local setChat = true
    local setDraggable = false
    local SynFalse = false
    local SynTrue = true
    --Strings
    local Keybind = 'J'
    local Off = '--'
    --Ints, or Floats
    local setDelay = 1

    local function FileSaving()
        if SpamFile ~= nil then
            SpamFile = getHttp:JSONDecode(readfile('hellokittysouljia/Settings.json'))
            for i,v in next,File do
                if SpamFile[i] ~= nil then
                    File[i] = SpamFile[i]
                end
            end
            writefile('hellokittysouljia/Settings.json',getHttp:JSONEncode(File))
        else
            SpamFile = writefile('hellokittysouljia/Settings.json',getHttp:JSONEncode(File))
        end
    end

    local function SaveData()
        if writefile ~= nil and readfile ~= nil then
            writefile('hellokittysouljia/Settings.json',getHttp:JSONEncode(File))
        else
            return AddNotification('hellokittysouljia','Error 210, Send this error & number to @killserver')
        end
    end

    local RGui = findbyte(Core,'RobloxGui','Find')
    local NGui = findbyte(RGui,'NotificationFrame','Find')
    for i, v in pairs(NGui:GetDescendants()) do
        if tostring(v) == "Notification" then
            local Ntitle = findbyte(v,'NotificationTitle','Find')
            local Ntext  = findbyte(v,'NotificationText','Find')
                v.Ntitle.TextColor3 = Color3.fromRGB(255, 0, 0)
            v.Ntext.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end

    function writeinstance(write)
        local Ints={}
        for i,v in pairs(write) do
            Ints[v[1]]=Instance.new(v[2])
        end
        for a,b in pairs(write) do
            for c,d in pairs(b[3]) do
                if type(d)=='table' then
                    Ints[b[1]][c]=Ints[d[1]]
                else
                    Ints[b[1]][c] = d
                end
            end
        end
        return Ints[1]
    end

    Menu = (function()
        local Sort = writeinstance({
            {1,'ScreenGui',{Name = "keepmeinla",Parent = Core,ResetOnSpawn = false,}};
            {2,'ImageLabel',{Name = "Back", Parent = {1}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.0078914836, 0, 0.703473926, 0), Size = UDim2.new(0, 278, 0, 223), Image = "http://www.roblox.com/asset/?id=6906809185",}};
            {3,'ImageLabel',{Name = "MainFrame", Parent = {2}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, Position = UDim2.new(0.049869895, 0, 0.0502973497, 0), Size = UDim2.new(0, 250, 0, 200), Image = "rbxassetid://3570695787", ImageColor3 = Color3.fromRGB(20, 20, 20), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(100, 100, 100, 100), SliceScale = 0.040,}};
            {4,'UIGradient',{Name='UiGradient', Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}, Rotation = 90, Parent = {3},}};
            {5,'TextLabel',{Name = "Title", Parent = {3}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 200, 0, 21), Font = Enum.Font.Highway, Text = "  hellokittysouljia's Spam "..Version, TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000, TextXAlignment = Enum.TextXAlignment.Left,}};
            {6,'TextButton',{Name = "InfoButton", Parent = {3}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.807228982, 0, 0.00999999978, 0), Size = UDim2.new(0, 24, 0, 17), ZIndex = 2, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {7,'ImageLabel',{Name = "InfoImage", Parent = {3}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.807228923, 0, 0.00999999978, 0), Size = UDim2.new(0, 24, 0, 17), Image = "http://www.roblox.com/asset/?id=5599934862",}};
            {8,'TextButton',{Name = "SettingButton", Parent = {3}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.903228998, 0, 0, 0), Size = UDim2.new(0, 24, 0, 21), ZIndex = 2, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {9,'ImageLabel',{Name = "SettingImage", Parent = {3}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.903614461, 0, 0, 0), Size = UDim2.new(0, 24, 0, 21), Image = "http://www.roblox.com/asset/?id=11932591062",}};
            {10,'Frame',{Name='Frame', Parent = {3} BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.104999997, 0), Size = UDim2.new(0, 250, 0, 2),}};
            {11,'TextBox',{Name = "MessageBox,", Parent = {3}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0.0280000605, 0, 0.144999996, 0), Size = UDim2.new(0, 235, 0, 25), ZIndex = 2, Font = Enum.Font.Highway, PlaceholderColor3 = Color3.fromRGB(255, 255, 255), PlaceholderText = "Message Here", Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 12.000,}};
            {12,'TextButton',{Name = "ToggleButton", Parent = {11}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0.055319149, 0, 1.60000002, 0), Size = UDim2.new(0, 20, 0, 15), Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {13,'TextLabel',{Name = "ToggleLabel", Parent = {12}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1.35000002, 0, -0.200000003, 0), Size = UDim2.new(0, 49, 0, 20), Font = Enum.Font.Highway, Text = " - Enable", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000,}};
            {14,'TextButton',{Name = "DelayButton", Parent = {11}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0.617021263, 0, 1.60000002, 0), Size = UDim2.new(0, 20, 0, 15), Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {15,'TextLabel',{Name = "DelayLabel", Parent = {14}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1.35000002, 0, -0.200000003, 0), Size = UDim2.new(0, 49, 0, 20), Font = Enum.Font.Highway, Text = " - Delay", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000,}};
            {16,'TextLabel',{Name = "DelaySlider", Parent = {11}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 2.67000008, 0), Size = UDim2.new(0, 194, 0, 21), Font = Enum.Font.Highway, Text = "  Spam Delay", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000, TextXAlignment = Enum.TextXAlignment.Left,}};
            {17,'Frame',{Name = "SliderFrame", Parent = {16}, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0.0302267168, 0, 1, 0), Size = UDim2.new(0, 223, 0, 8),}};
            {18,'Frame',{Name = "FillFrame", Parent = {17}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.0500000007, 0), Size = UDim2.new(0, 0, 0, 6), ZIndex = 6,}};
            {19,'TextButton',{Name = "Toggler", Parent = {17}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, -0.5, 12), ZIndex = 7, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {20,'TextLabel',{Name = "PrintNumber", Parent = {17}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0, 0, 3, 0), Size = UDim2.new(0, 36, 0, 21), Font = Enum.Font.Highway, Text = "1", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 16.000,}};
            {21,'TextLabel',{Name = "FpsPingLabel", Parent = {3}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0.663228929, 0, 0.709999979, 0), Size = UDim2.new(0, 75, 0, 50), Font = Enum.Font.SourceSans, Text = "Fps: \n Ping:", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17.000, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,}};
            {22,'Frame',{Name = "SettingsFrame", Parent = {8}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-9.41666508, 0, 0, 0), Size = UDim2.new(0, 250, 0, 200), ZIndex = 3, Visible = false,}};
            {23,'TextLabel',{Name = "SettingsTitle", Parent = {22}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 250, 0, 21), ZIndex = 4, Font = Enum.Font.Highway, Text = "Settings", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17.000,}};
            {24,'TextBox',{Name = "KeybindBox", Parent = {22}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0.0599999987, 0, 0.219999999, 0), Size = UDim2.new(0, 20, 0, 20), ZIndex = 4, Font = Enum.Font.Highway, PlaceholderColor3 = Color3.fromRGB(255, 255, 255), PlaceholderText = "J", Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17.000,}};
            {25,'TextLabel',{Name = "KeybindTitle", Parent = {24}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1.25, 0, 0, 0), Size = UDim2.new(0, 71, 0, 20), ZIndex = 4, Font = Enum.Font.Highway, Text = " - Keybind", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17.000,}};
            {26,'TextButton',{Name = "DragButton", Parent = {22}, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.0480000004, 0, 0.430000007, 0), Size = UDim2.new(0, 35, 0, 20), ZIndex = 4, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {27,'UICorner',{Name='UICorner', Parent = {26}, CornerRadius = UDim.new(0, 8),}};
            {28,'Frame',{Name = "BackDrag", Parent = {26}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.060072545, 0, -0.131512448, 0), Size = UDim2.new(0, 39, 0, 24), ZIndex = 3,}};
            {29,'UICorner',{Name = "UICornerBackDrag", Parent = {28}, CornerRadius = UDim.new(0, 8),}};
            {30,'TextButton',{Name = "ToggleButtonDrag", Parent = {26}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 15, 0, 20), ZIndex = 5, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {31,'UICorner',{Name = "UICornerToggleButtonDrag", Parent = {30}, CornerRadius = UDim.new(0, 8),}};
            {32,'TextLabel',{Name = "DragTitle", Parent = {26}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1.25, 0, 0, 0), Size = UDim2.new(0, 71, 0, 20), ZIndex = 4, Font = Enum.Font.Highway, Text = " - Draggable", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17.000,}};
            {33,'TextButton',{Name = "ChatButton", Parent = {22}, BackgroundColor3 = Color3.fromRGB(85, 255, 127), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.0520000011, 0, 0.660000026, 0), Size = UDim2.new(0, 35, 0, 20), ZIndex = 4, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {34,'UICorner',{Name='ChatUICorner', Parent = {33}, CornerRadius = UDim.new(0, 8),}};
            {35,'Frame',{Name = "BackChat", Parent = {33}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.060072545, 0, -0.131512448, 0), Size = UDim2.new(0, 39, 0, 24), ZIndex = 3,}};
            {36,'UICorner',{Name = "UICornerBackDrag", Parent = BackChat, CornerRadius = UDim.new(0, 8),}};
            {37,'TextButton',{Name = "ToggleButtonChat", Parent = {33}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.550000012, 0, 0, 0), Size = UDim2.new(0, 15, 0, 20), ZIndex = 5, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000,}};
            {38,'UICorner',{Name = "UICornerToggleButtonDrag", Parent = {37}, CornerRadius = UDim.new(0, 8),}};
            {39,'TextLabel',{Name = "ChatTitle", Parent = {33}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1.10714281, 0, 0, 0), Size = UDim2.new(0, 78, 0, 20), ZIndex = 4, Font = Enum.Font.Highway, Text = " - Show Chat", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17.000,}};
            {40,'TextButton',{Name = "ExitSettings", Parent = {22}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0.903999746, 0, 0, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 4, Font = Enum.Font.Highway, Text = ">", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 20.000,}};
            {41,'Frame',{Name = "InfoFrame", Visible = false Parent = {6}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-8.41699982, 0, -0.117647059, 0), Size = UDim2.new(0, 250, 0, 200), ZIndex = 3,}};
            {42,'TextLabel',{Name = "InfoTitle", Parent = {41}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 250, 0, 21), ZIndex = 4, Font = Enum.Font.Highway, Text = "Important", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17.000,}};
            {43,'TextButton',{Name = "ExitInfo", Parent = {41}, BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 2, Position = UDim2.new(0.903999746, 0, 0, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 4, Font = Enum.Font.Highway, Text = ">", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 20.000,}};
            {44,'TextLabel',{Name = "Texts", Parent = {41}, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.174999997, 0), Size = UDim2.new(0, 250, 0, 165), ZIndex = 4, Font = Enum.Font.Highway, Text = "  Github: Not-Kyle or hellokittysouljia \nRoblox: hellokittysouljia\nDiscord: killserver or backdoor.exe\nYou should give me a follow!\nThank you for using my scripts!", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 17.000, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,}};
        })
        local Primary = Sort.Back.MainFrame

        local function SynCheck()
            if not syn.protect_gui then
                SynFalse = true
            else
                SynTrue = true
            end
            if SynTrue then
                syn.protect_gui(Sort.Back)
            elseif SynFalse then
                Off.syn.protect_gui(Sort.Back)
            end
        end

        --Slider
        function Round(N, D)
            return tonumber(string.format('%.' .. (D or 0) .. 'f', N))
        end 
        local shorten = Primary.MessageBox.DelaySlider.SliderFrame
        local shortest = Primary.MessageBox.DelaySlider
        local Fill = shorten.FillFrame
        local label = shorten.PrintNumber
        local Toggle = shorten.Toggler
        local Slider = shortest.SliderFrame
        local OutputValue = Instance.new('NumberValue', shorten)
        OutputValue.Value = 0.33

        Fill.Size = UDim2.fromScale(OutputValue.Value,0.935)
        label.Text = tostring(Round(OutputValue.Value*3,1))

        function Update()
            local Sum = math.clamp((Mouse.X-Slider.AbsolutePosition.X)/Slider.AbsoluteSize.X,0,1)

            label.Text = tostring(Round(Sum*3,1))
            OutputValue.Value = Sum
            setDelay = Sum
            Fill.Size = UDim2.fromScale(Sum,0.935)
        end
        function InUse()
            BeingPushed = true
            while BeingPushed do
                Update()
                task.wait()
            end
        end
        Toggle.MouseButton1Down:Connect(InUse)
        Input.InputBegan:Connect(function(Args)
            if Args.UserInputType == Enum.UserInputType.MouseButton1 or Args.UserInputType == Enum.UserInputType.Touch then
                BeingPushed = false
            end
        end)
        --Settings
        do
            local short = Primary.SettingButton.SettingsFrame
            Primary.SettingButton.MouseButton1Down:Connect(function()
                short.Visible = true
                if short.Visible then
                    shortest.Visible = false
                end
            end)

            short.ExitSettings.MouseButton1Down:Connect(function()
                short.Visible = false
                if not short.Visible then
                    shortest.Visible = true
                end
            end)

            short.KeybindBox.MouseButton1Down:Connect(function()
                if string.len(KeybindBox.Text) > 0 then
                    Keybind = string.upper(string.sub(tostring(KeybindBox.Text),1,1))
                    short.KeybindBox.KeybindText = ' - Saved!'
                    SaveData() task.wait(1)
                    short.KeybindBox.KeybindText = ' - Keybind'
                end
            end)

            short.DragButton.MouseButton1Down:Connect(function()
                setDraggable = not setDraggable
                if setDraggable then
                    short.DragButton.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
                    short.DragButton.ToggleButtonDrag.Position:TweenPosition(UDim2.new(0.55, 0, 0, 0), 'InOut', 'Quart', 0.5, false, nil)
                    Sort.Back.Active = true Sort.Back.Draggable = true Sort.Back.Selectable = true 
                else
                    short.DragButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    short.DragButton.ToggleButtonDrag.Position:TweenPosition(UDim2.new(0, 0, 0, 0), 'InOut', 'Quart', 0.5, false, nil)
                    Sort.Back.Active = true Sort.Back.Draggable = false Sort.Back.Selectable = true
                end
            end)

            short.ChatButton.MouseButton1Down:Connect(function()
                setChat = not setChat
                if not setChat then
                    short.ChatButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    short.ChatButton.ToggleButtonDrag.Position:TweenPosition(UDim2.new(0, 0, 0, 0), 'InOut', 'Quart', 0.5, false, nil)
                else
                    short.ChatButton.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
                    short.ChatButton.ToggleButtonDrag.Position:TweenPosition(UDim2.new(0.55, 0, 0, 0), 'InOut', 'Quart', 0.5, false, nil)
                end
            end)
        end     
        -- Spam
        do
            local Secondary = Primary.MessageBox
            Secondary.ToggleButton.MouseButton1Down:Connect(function()
                IsOn = not IsOn
                if IsOn then
                    while IsOn do
                        if string.len(Secondary.Text) > 0 then
                            local DefaultCSCE = findbyte(ReplicatedStorage,'DefaultChatSystemChatEvents','Wait')
                            local Request = findbyte(DefaultCSCE,'SayMessageRequest','Wait')
                            task.wait(setDelay)
                            Request:FireServer(Secondary.Text,'All')
                        elseif string.len(Secondary.Text) == 0 then
                            return nil
                        end
                    end
                    Secondary.ToggleButton.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
                    Secondary.ToggleButton.ToggleLabel.Text = ' - Enabled'
                    Secondary.DelayButton.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
                elseif not IsOn then
                    Secondary.ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    Secondary.ToggleButton.ToggleLabel.Text = ' - Enable'
                    Secondary.DelayButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                end
            end)
        end
        -- Fps & Ping
        do 
            RunService.Stepped:Connect(function()
                local Fps = Workspace:GetRealPhysicsFPS()
                local Performance = findbyte(Stats,'PerformanceStats','Find')
                local Ping = Performance.Ping:GetValue()
                Primary.FpsPingLabel.Text = 'Fps: '..math.round(Fps)..'\nPing: '..math.round(Ping)
            end)
        end
        -- Info
        do
            local shortenest = Primary.ImageButton
            shortenest.MouseButton1Down:Connect(function()
                shortenest.InfoFrame.Visible = true
                if shortenest.InfoFrame.Visible then
                    shortest.Visible = false
                end
            end)

            shortenest.InfoFrame.ExitInfo.MouseButton1Down:Connect(function()
                shortenest.InfoFrame.Visible = false
                if not shortenest.InfoFrame.Visible then
                    shortest.Visible = true
                end
            end)
        end
    end)
end
