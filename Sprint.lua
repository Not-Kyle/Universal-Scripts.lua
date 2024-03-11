-- if taken please give credits
if not getgenv()['CoryuBlink'] then
    
    getgenv()['CoryuBlink'] = true

    getgenv().Players = game:GetService'Players'
    getgenv().LocalPlayer = Players.LocalPlayer
    getgenv().Prefix = '-'
    getgenv().RunService = game:GetService'RunService'
    getgenv().Vector = Vector3.new
    getgenv().UserInput = game:GetService'UserInputService'
    getgenv().Http = game:GetService'HttpService'
    getgenv().Workspace = game:GetService'Workspace'
    getgenv().UserNotifications = function(title, text) game:GetService'StarterGui':SetCore("SendNotification", {Title = title; Text = text;}) end

    local File = {
        ['Blink'] = true;
        ['Blinking'] = false;
        ['BlinkSpeed'] = 8;
        ['Toggle'] = 'B';
    }
    if game.PlaceId == 4669040 or game.PlaceId == 9083723645 or game.PlaceId == 13266627425 then
	    Workspace['Headless Dummy'].Humanoid.DisplayName = 'Coryu is top coder on prison'
	    Workspace.TPer.Color = Color3.fromRGB(255, 255, 0)
    end
    local CoryuBlinkFile;
    local function FolderCheck()
	if isfolder('Coryu') == nil then
            makefolder('Coryu')
	elseif isfolder('Coryu/Universal') == nil then
	    makefolder('Coryu/Universal')
	end
    end
    ypcall(function()
    	CoryuBlinkFile = readfile('Coryu/Universal/CoryuBlink.js')
    end)
    
    RunService.Stepped:Connect(function()
        if File['Blink'] then
            if File['Blinking'] then
                LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame + Vector(
                    LocalPlayer.Character:FindFirstChild'Humanoid'.MoveDirection.X * File['BlinkSpeed'] / 5, 0, LocalPlayer.Character:FindFirstChild'Humanoid'.MoveDirection.Z * File['BlinkSpeed'] / 5
                )
            end
        end
    end)
    
    if CoryuBlinkFile then
    	CoryuBlinkFile = Http:JSONDecode(readfile'Coryu/Universal/CoryuBlink.js') -- reads the table
    	for i,v in next, File do
    		File[i] = CoryuBlinkFile[i]
    	end
    	writefile('Coryu/Universal/CoryuBlink.js', Http:JSONEncode(File)) -- updates the tables strings (basically)
    else
    	CoryuBlinkFile = writefile('Coryu/Universal/CoryuBlink.js', Http:JSONEncode(File))
    end
    
    local function writedate()
    	if writefile and readfile then
    		writefile('Coryu/Universal/CoryuBlink.js', Http:JSONEncode(File))
    	else
    		return nil
    	end
    end
    
    UserInput.InputBegan:Connect(function(Action, Chat)
        if Action.KeyCode == Enum.KeyCode.LeftShift then
            File['Blinking'] = true
        end
        if Chat then
            return nil
        end
        if Action.KeyCode == Enum.KeyCode[File['Toggle']] then
            File['Blink'] = not File['Blink']
            UserNotifications('Coryu Blink', 'Blink is now '..tostring(File['Blink']))
        end
    end)

    UserInput.InputEnded:Connect(function(ActionEnd)
        if ActionEnd.KeyCode == Enum.KeyCode.LeftShift then
            File['Blinking'] = false
        end
    end)

    LocalPlayer.Chatted:Connect(function(Message)
		if string.sub(Message,1,4) == (Prefix..'bs ') then
			File['BlinkSpeed'] = (string.sub(Message, 5,6))
            UserNotifications('Coryu Blink', 'BlinkSpeed is now '..tonumber(File['BlinkSpeed']))
            writedate()
        end
        if string.sub(Message,1,5) == (Prefix..'key ') then
        	File['Toggle'] = (string.sub(Message, 6,6))
        	UserNotifications('Coryu Blink', 'Blink hotkey has been updated to '..tostring(File['Toggle']))
			writedate()
    	end
    end)
    
    print([[

				   ___   ___   ____  _  _ __ __    ____  __    __ __  __ __ __
				  //    // \\  || \\ \\// || ||    || )) ||    || ||\ || || //
				 ((    ((   )) ||_//  )/  || ||    ||=)  ||    || ||\\|| ||<< 
				  \\__  \\_//  || \\ //   \\_//    ||_)) ||__| || || \|| || \\  		
		
		Prefix is -
		Chat Commands = -bs (number) or -key (uppercase letter)
		example: -bs 5
		example: -key H
		
		HOTKEY CANNOT BE LOWERCASE
	]])
	print('Toggle Key '..File['Toggle'])
	
	UserNotifications('Coryu Blink', 'Press F9 for help!')
end
