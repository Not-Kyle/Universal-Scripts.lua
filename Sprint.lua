--If Taken, Give Credits @hellokittysouljia or @killserver on discord or https://github.com/Not-Kyle
if not getgenv()['CoryuBlink'] then
    getgenv()['CoryuBlink'] = true

    getgenv().Players = game:GetService'Players';
    getgenv().Host = Players.LocalPlayer;
    getgenv().RunService = game:GetService'RunService';
    getgenv().Vector = Vector3.new;
    getgenv().UserInput = game:GetService'UserInputService';
    getgenv().Http = game:GetService'HttpService';
    getgenv().Workspace = game:GetService'Workspace';
    getgenv().Version = 2;
    getgenv().StarterGui = game:GetService'StarterGui'
    getgenv().UserNotifications = function(title, text) StarterGui:SetCore('SendNotification', {Title = title; Text = text;}) end;
    local CoryuBlinkFile;
    task.spawn(function() if not isfolder('Coryu') then makefolder('Coryu') elseif not isfolder('Coryu/Universal') then makefolder('Coryu/Universal') end end);
    pcall(function() CoryuBlinkFile = readfile('Coryu/Universal/CoryuBlink.json') end);
    task.spawn(function() pcall(function() if game.PlaceId == 4669040 or game.PlaceId == 9083723645 or game.PlaceId == 13266627425 then Workspace.Dummy.Humanoid.DisplayName = 'Support hellokittysouljia https://github.com/Not-Kyle'; Workspace.TPer.Color = Color3.fromRGB(98, 0, 255); end end) end);

    local File = {
        ['Blink'] = true;
        ['Blinking'] = false;
        ['BlinkSpeed'] = 8;
        ['Toggle'] = 'B';
        ['Prefix'] = '-';
        ['Method'] = 'md';
    };
    local Movement = {
        ['W'] = false;
        ['A'] = false;
        ['S'] = false;
        ['D'] = false;
    };

    coroutine.resume(coroutine.create(function()
        if CoryuBlinkFile then
            CoryuBlinkFile = Http:JSONDecode(readfile'Coryu/Universal/CoryuBlink.json')
            for i,v in next, File do
                File[i] = CoryuBlinkFile[i]
            end
            writefile('Coryu/Universal/CoryuBlink.json', Http:JSONEncode(File))
        else
            CoryuBlinkFile = writefile('Coryu/Universal/CoryuBlink.json', Http:JSONEncode(File))
        end
    end))

    local function WriteExe()
        if writefile and readfile then
            writefile('Coryu/Universal/CoryuBlink.json', Http:JSONEncode(File))
        else
            return nil
        end
    end

    RunService.RenderStepped:Connect(function()
        local HumanoidRootPart = Host.Character:FindFirstChild'HumanoidRootPart'
        if File.Blink then
            if File.Blinking then
                if Host and Host.Character then
                    if File.Method == 'md' or File.Method == 'movedirection' then
                        debug.profilebegin('Coryu::Blink::MoveDirection')
                            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector(
                                Host.Character:FindFirstChild'Humanoid'.MoveDirection.X * File.BlinkSpeed / 5, 0, Host.Character:FindFirstChild'Humanoid'.MoveDirection.Z * File.BlinkSpeed / 5
                            )
                            debug.profileend()
                    elseif File.Method == 'cf' or File.Method == 'cframe' then
                        debug.profilebegin('Coryu::Blink::CFrame')
                            if Movement.W then
                                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0,0,-File.BlinkSpeed/4)
                            end
                            if Movement.A then
                                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(-File.BlinkSpeed/4,0,0)
                            end
                            if Movement.S then
                                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0,0,File.BlinkSpeed/4)
                            end
                            if Movement.D then
                                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(File.BlinkSpeed/4,0,0)
                            end
                        debug.profileend()
                    elseif File.Method == 'lv' or File.Method == 'lookvector' then
                        debug.profilebegin('Coryu::Blink::LookVector')
                            HumanoidRootPart.Velocity = HumanoidRootPart.CFrame.LookVector * File.BlinkSpeed * 30
                        debug.profileend()
                    elseif File.Method == 'ws' or File.Method == 'walkspeed' then
                        debug.profilebegin('Coryu::Blink::WalkSpeed')
                            Workspace[Host.Name].Character:FindFirstChildOfClass'Humanoid'.WalkSpeed = File.BlinkSpeed * 25
                        debug.profileend()
                    end
                end
            end
        end
    end)

    Host.Chatted:Connect(function(UserCommand:string)
        if string.sub(string.lower(UserCommand),1,4) == (File.Prefix..'bs ') then
            File.BlinkSpeed = string.sub(UserCommand,5,6)
            UserNotifications('Coryu Blink', 'BlinkSpeed is now '..tonumber(File.BlinkSpeed))
            WriteExe()
        elseif string.sub(string.lower(UserCommand),1,5) == (File.Prefix..'key ') then
            File.Toggle = string.sub(string.upper(UserCommand),6,6)
            UserNotifications('Coryu Blink', 'Blink hotkey has been updated to '..tostring(File.Toggle))
            WriteExe()
        elseif string.sub(string.lower(UserCommand),1,8) == (File.Prefix..'prefix ') then
            File.Prefix = string.sub(UserCommand,9,9)
            UserNotifications('Coryu Blink', 'Blink Prefix has been set to \''..File.Prefix..'\'')
            WriteExe()
        elseif string.sub(string.lower(UserCommand),1,8) == (File.Prefix..'method ') then
            File.Method = string.sub(UserCommand,9,21)
            UserNotifications('Coryu Blink', 'Method has been set to '..tostring(File.Method))
            WriteExe()
        end
    end)

    UserInput.InputBegan:Connect(function(Args:EnumItem, Chat)
        if Args.KeyCode == Enum.KeyCode.LeftShift then
            File.Blinking = true
        elseif Chat then
            return nil
        elseif Args.KeyCode == Enum.KeyCode[File.Toggle] then
            File.Blink = not File.Blink
            UserNotifications('Coryu Blink', 'Blink is now '..tostring(File.Blink))
        elseif Args.KeyCode == Enum.KeyCode.W then
            Movement.W = true
        elseif Args.KeyCode == Enum.KeyCode.A then
            Movement.A = true
        elseif Args.KeyCode == Enum.KeyCode.S then
            Movement.S = true
        elseif Args.KeyCode == Enum.KeyCode.D then
            Movement.D = true
        end
    end)

    UserInput.InputEnded:Connect(function(Args:EnumItem)
        if Args.KeyCode == Enum.KeyCode.LeftShift then
            File.Blinking = false;
        elseif Args.KeyCode == Enum.KeyCode.W then
            Movement.W = false
        elseif Args.KeyCode == Enum.KeyCode.A then
            Movement.A = false
        elseif Args.KeyCode == Enum.KeyCode.S then
            Movement.S = false
        elseif Args.KeyCode == Enum.KeyCode.D then
            Movement.D = false
        end
    end)

    print([[	
        Prefix '-'

        COMMANDS = {
            -Bs (Number)
            -Key (Character)
            -Prefix (Any)
            -Method (Md, Cf, Lv, Ws) or (MoveDirection, CFrame, LookVector, WalkSpeed)
        }
        
        Example: -BS 5
        Example: -KEY H
        Example: -PREFIX .
        Example: -METHOD CF
        
        >>> Be Careful with WalkSpeed, you may get banned depending what game you are on <<<

        by hellokittysouljia! If questions or help needed message @killserver on discord
    ]])
    print('Toggle Key '..File.Toggle)

    UserNotifications('Coryu Blink', 'Made by @hellokittysouljia on RBLX. Press F9 for help!')
end
