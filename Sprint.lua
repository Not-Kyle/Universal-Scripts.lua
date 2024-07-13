--If Taken, Give Credits @hellokittysouljia or @killserver on discord or https://github.com/Not-Kyle
if not getgenv()['CoryuSprint'] then
    getgenv()['CoryuSprint'] = true
    
    local trace = setmetatable({}, {
        __index = function(self, args)
            return game.GetService(game, args);
        end
    })

    getgenv().players = trace.Players;
    getgenv().host = players.LocalPlayer;
    getgenv().runService = trace.RunService;
    getgenv().vector = Vector3.new;
    getgenv().userInput = trace.UserInputService;
    getgenv().http = trace.HttpService;
    getgenv().workspace = trace.Workspace;
    getgenv().scriptName, version = 'hellokittysouljias', 2.1;
    getgenv().starterGui = trace.StarterGui;
    getgenv().userNotifications = function(title, text) starterGui:SetCore('SendNotification', {Title = title; Text = text;}) end;
    local coryuBlinkFile;
    task.spawn(function() if not isfolder('Coryu') then makefolder('Coryu') elseif not isfolder('Coryu/Universal') then makefolder('Coryu/Universal') end end);
    pcall(function() coryuBlinkFile = readfile('Coryu/Universal/CoryuBlink.json') end);
    task.spawn(function() pcall(function() if game.PlaceId == 455366377 or workspace:FindFirstChild'TPer' then scriptName = 'hellokittysouljias Blink'; else scriptName = 'hellokittysouljias Sprint'; end end) end);

    local file = {
        ['Blink'] = true;
        ['Blinking'] = false;
        ['BlinkSpeed'] = 8;
        ['Toggle'] = 'B';
        ['Prefix'] = '-';
        ['Method'] = 'md';
    };
    local movement = {
        ['W'] = false;
        ['A'] = false;
        ['S'] = false;
        ['D'] = false;
    };

    coroutine.resume(coroutine.create(function()
        if coryuBlinkFile then
            coryuBlinkFile = http:JSONDecode(readfile'Coryu/Universal/CoryuBlink.json')
            for i,v in next, file do
                file[i] = coryuBlinkFile[i]
            end
            writefile('Coryu/Universal/CoryuBlink.json', http:JSONEncode(file))
        else
            coryuBlinkFile = writefile('Coryu/Universal/CoryuBlink.json', http:JSONEncode(file))
        end
    end))

    local function writeExe()
        if writefile and readfile then
            writefile('Coryu/Universal/CoryuBlink.json', http:JSONEncode(file))
        else
            return nil
        end
    end

    runService.RenderStepped:Connect(function()
        local humanoidRootPart = host.Character:FindFirstChild'HumanoidRootPart'
        if file.Blink then
            if file.Blinking then
                if host and host.Character then
                    if file.Method == 'md' or file.Method == 'movedirection' then
                        debug.profilebegin('Coryu::Blink::MoveDirection')
                            humanoidRootPart.CFrame = humanoidRootPart.CFrame + vector(
                                host.Character:FindFirstChild'Humanoid'.MoveDirection.X * file.BlinkSpeed / 5, 0, host.Character:FindFirstChild'Humanoid'.MoveDirection.Z * file.BlinkSpeed / 5
                            )
                        debug.profileend()
                    elseif file.Method == 'cf' or file.Method == 'cframe' then
                        debug.profilebegin('Coryu::Blink::CFrame')
                            if movement.W then
                                humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0,0,-file.BlinkSpeed/5)
                            end
                            if movement.A then
                                humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(-file.BlinkSpeed/5,0,0)
                            end
                            if movement.S then
                                humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0,0,file.BlinkSpeed/5)
                            end
                            if movement.D then
                                humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(file.BlinkSpeed/5,0,0)
                            end
                        debug.profileend()
                    elseif file.Method == 'lv' or file.Method == 'lookvector' then
                        debug.profilebegin('Coryu::Blink::LookVector')
                            humanoidRootPart.Velocity = humanoidRootPart.CFrame.LookVector * file.BlinkSpeed * 25
                        debug.profileend()
                    elseif file.Method == 'ws' or file.Method == 'walkspeed' then
                        debug.profilebegin('Coryu::Blink::WalkSpeed')
                            workspace[host.Name].Character:FindFirstChildOfClass'Humanoid'.WalkSpeed = file.BlinkSpeed * 25
                        debug.profileend()
                    end
                end
            end
        end
    end)

    host.Chatted:Connect(function(userCommands)
        if string.sub(string.lower(userCommands),1,4) == (file.Prefix..'bs ') then
            file.BlinkSpeed = string.sub(userCommands,5,6)
            userNotifications('Coryu Sprint', 'Sprint Speed is now '..tonumber(file.BlinkSpeed))
            writeExe()
        elseif string.sub(string.lower(userCommands),1,5) == (file.Prefix..'key ') then
            file.Toggle = string.sub(string.upper(userCommands),6,6)
            userNotifications('Coryu Sprint', 'Sprint Keybind has been updated to '..tostring(file.Toggle))
            writeExe()
        elseif string.sub(string.lower(userCommands),1,8) == (file.Prefix..'prefix ') then
            file.Prefix = string.sub(userCommands,9,9)
            userNotifications('Coryu Sprint', 'Sprint Prefix has been set to \''..file.Prefix..'\'')
            writeExe()
        elseif string.sub(string.lower(userCommands),1,8) == (file.Prefix..'method ') then
            file.Method = string.sub(userCommands,9,21)
            userNotifications('Coryu Sprint', 'Sprint Method has been set to '..tostring(file.Method))
            writeExe()
        end
    end)

    userInput.InputBegan:Connect(function(args, chat)
        if args.KeyCode == Enum.KeyCode.LeftShift then
            file.Blinking = true
        elseif chat then
            return nil
        elseif args.KeyCode == Enum.KeyCode[file.Toggle] then
            file.Blink = not file.Blink
            userNotifications('Coryu Sprint', 'Sprint is now '..tostring(file.Blink))
        elseif args.KeyCode == Enum.KeyCode.W then
            movement.W = true
        elseif args.KeyCode == Enum.KeyCode.A then
            movement.A = true
        elseif args.KeyCode == Enum.KeyCode.S then
            movement.S = true
        elseif args.KeyCode == Enum.KeyCode.D then
            movement.D = true
        end
    end)

    userInput.InputEnded:Connect(function(args)
        if args.KeyCode == Enum.KeyCode.LeftShift then
            file.Blinking = false;
        elseif args.KeyCode == Enum.KeyCode.W then
            movement.W = false
        elseif args.KeyCode == Enum.KeyCode.A then
            movement.A = false
        elseif args.KeyCode == Enum.KeyCode.S then
            movement.S = false
        elseif args.KeyCode == Enum.KeyCode.D then
            movement.D = false
        end
    end)

    print([[	
        Prefix '-'

        COMMANDS = {
            -Bs (Number) 
                // Changes your speed

            -Key (Character) 
                // Changes your keybind

            -Prefix (Any) 
                // Changes your prefix

            -Method (Md, Cf, Lv, Ws) or (MoveDirection, CFrame, LookVector, WalkSpeed)
                // Changes how you move or function
        }
        
        Example: -BS 5
        Example: -KEY H
        Example: -PREFIX .
        Example: -METHOD CF
        
        >>> Be Careful with WalkSpeed, you may get banned depending what game you are on <<<

        by hellokittysouljia! If questions or help needed message @killserver on discord
    ]])
    print('Toggle Key '..file.Toggle)

    userNotifications(scriptName..' V'..version, 'Made by @hellokittysouljia on RBLX. Press F9 for help!')
end
