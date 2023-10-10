if not getgenv()['CoryuSpam'] then
    
    getgenv()['CoryuSpam'] = true
    local wanted_u = Instance.new("ScreenGui")
    local jojiXD = Instance.new("Frame")
    local mainIGNORE = Instance.new("ImageLabel")
    local spamBOX = Instance.new("TextBox")
    local spamTEXT = Instance.new("TextLabel")
    local spamBOXdelay = Instance.new("TextBox")
    local IGNORE2 = Instance.new("ImageLabel")
    local spamTEXTdelay = Instance.new("TextLabel")

    local coryu = {
        ['LocalPlayer'] = game:GetService('Players').LocalPlayer;
        ['UserInput'] = game:GetService("UserInputService");
        ['Key'] = 'Z';
        ['ReplicatedStorage'] = game:GetService("ReplicatedStorage");
        ['Delay'] = 1;
        ['RunService'] = game:GetService("RunService");
        ['Spam'] = true;
    }

    getgenv().CHATVIEW = function()
        local CHATVISIBLE = coryu['LocalPlayer'].PlayerGui.Chat.Frame 
        CHATVISIBLE.ChatChannelParentFrame.Visible = true 
        CHATVISIBLE.ChatBarParentFrame.Position = CHATVISIBLE.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), CHATVISIBLE.ChatChannelParentFrame.Size.Y)
    end
    CHATVIEW()

    wanted_u.Name = "wanted_u"
    wanted_u.Parent = coryu['LocalPlayer']:WaitForChild("PlayerGui")
    wanted_u.ResetOnSpawn = false

    jojiXD.Name = "jojiXD"
    jojiXD.Parent = wanted_u
    jojiXD.Active = true
    jojiXD.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    jojiXD.BorderColor3 = Color3.fromRGB(170, 0, 255)
    jojiXD.Position = UDim2.new(0.324856967, 0, 0.6, 0)
    jojiXD.Selectable = true
    jojiXD.Size = UDim2.new(0, 190, 0, 112)
    jojiXD.Draggable = true

    mainIGNORE.Name = "mainIGNORE"
    mainIGNORE.Parent = jojiXD
    mainIGNORE.AnchorPoint = Vector2.new(0.5, 0.5)
    mainIGNORE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainIGNORE.BackgroundTransparency = 1.000
    mainIGNORE.BorderColor3 = Color3.fromRGB(170, 0, 255)
    mainIGNORE.Position = UDim2.new(0.496027589, 0, 0.5, 0)
    mainIGNORE.Size = UDim2.new(0.99205482, 8, 1, 8)
    mainIGNORE.Image = "rbxassetid://3570695787"
    mainIGNORE.ImageColor3 = Color3.fromRGB(15, 15, 15)
    mainIGNORE.ScaleType = Enum.ScaleType.Slice
    mainIGNORE.SliceCenter = Rect.new(100, 100, 100, 100)
    mainIGNORE.SliceScale = 0.040

    spamBOX.Name = "spamBOX"
    spamBOX.Parent = jojiXD
    spamBOX.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    spamBOX.BorderColor3 = Color3.fromRGB(0, 0, 0)
    spamBOX.BorderSizePixel = 0
    spamBOX.Position = UDim2.new(0, 0, 0.814421535, 0)
    spamBOX.Size = UDim2.new(0, 190, 0, 20)
    spamBOX.ZIndex = 2
    spamBOX.Font = Enum.Font.Code
    spamBOX.PlaceholderColor3 = Color3.fromRGB(170, 0, 255)
    spamBOX.PlaceholderText = "Enter Text Here!"
    spamBOX.Text = ""
    spamBOX.TextColor3 = Color3.fromRGB(170, 0, 255)
    spamBOX.TextSize = 14.000

    spamTEXT.Name = "spamTEXT"
    spamTEXT.Parent = spamBOX
    spamTEXT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    spamTEXT.BackgroundTransparency = 1.000
    spamTEXT.BorderColor3 = Color3.fromRGB(0, 0, 0)
    spamTEXT.BorderSizePixel = 0
    spamTEXT.Position = UDim2.new(0.197583705, 0, -0.996835351, 0)
    spamTEXT.Size = UDim2.new(0, 117, 0, 19)
    spamTEXT.Font = Enum.Font.Code
    spamTEXT.Text = "Spam Text  >"
    spamTEXT.TextColor3 = Color3.fromRGB(170, 0, 255)
    spamTEXT.TextSize = 14.000

    spamBOXdelay.Name = "spamBOXdelay"
    spamBOXdelay.Parent = jojiXD
    spamBOXdelay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    spamBOXdelay.BorderColor3 = Color3.fromRGB(0, 0, 0)
    spamBOXdelay.BorderSizePixel = 0
    spamBOXdelay.Position = UDim2.new(0.199497581, 0, 0.255425036, 0)
    spamBOXdelay.Size = UDim2.new(0, 115, 0, 20)
    spamBOXdelay.ZIndex = 2
    spamBOXdelay.Font = Enum.Font.Code
    spamBOXdelay.PlaceholderColor3 = Color3.fromRGB(170, 0, 255)
    spamBOXdelay.PlaceholderText = "Enter Number!"
    spamBOXdelay.Text = ""
    spamBOXdelay.TextColor3 = Color3.fromRGB(170, 0, 255)
    spamBOXdelay.TextSize = 14.000

    IGNORE2.Name = "IGNORE2"
    IGNORE2.Parent = spamBOXdelay
    IGNORE2.AnchorPoint = Vector2.new(0.5, 0.5)
    IGNORE2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IGNORE2.BackgroundTransparency = 1.000
    IGNORE2.Position = UDim2.new(0.5, 0, 0.600000024, 0)
    IGNORE2.Size = UDim2.new(1, 8, 0.800000012, 8)
    IGNORE2.Image = "rbxassetid://3570695787"
    IGNORE2.ImageColor3 = Color3.fromRGB(0, 0, 0)
    IGNORE2.ScaleType = Enum.ScaleType.Slice
    IGNORE2.SliceCenter = Rect.new(100, 100, 100, 100)
    IGNORE2.SliceScale = 0.040

    spamTEXTdelay.Name = "spamTEXTdelay"
    spamTEXTdelay.Parent = spamBOXdelay
    spamTEXTdelay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    spamTEXTdelay.BackgroundTransparency = 1.000
    spamTEXTdelay.BorderColor3 = Color3.fromRGB(0, 0, 0)
    spamTEXTdelay.BorderSizePixel = 0
    spamTEXTdelay.Position = UDim2.new(0.01644977, 0, -1.34683537, 0)
    spamTEXTdelay.Size = UDim2.new(0, 117, 0, 19)
    spamTEXTdelay.Font = Enum.Font.Code
    spamTEXTdelay.Text = "Spam Delay <"
    spamTEXTdelay.TextColor3 = Color3.fromRGB(170, 0, 255)
    spamTEXTdelay.TextSize = 14.000

    coryu['UserInput'].InputBegan:connect(function(action)
        if action.KeyCode == Enum.KeyCode[coryu['Key']] then
            jojiXD.Visible = not jojiXD.Visible
        end
    end)

    while coryu['Spam'] do
        if string.len(spamBOXdelay.Text) > 0 then
            coryu['Delay'] = string.upper(string.sub(tostring(spamBOXdelay.Text),1,1))
        end
        task.wait(coryu['Delay'])
        if string.len(spamBOX.Text) > 0 then
            coryu['ReplicatedStorage'].DefaultChatSystemChatEvents.SayMessageRequest:FireServer(spamBOX.Text, "All")
        end
    end
end
