local CORYUTABLE = {
	['UserInput'] = game:GetService("UserInputService");
	['RunService'] = game:GetService('RunService');
	['LocalPlayer'] = game:GetService('Players').LocalPlayer;
	['Freeze'] = false;
}

CORYUTABLE['RunService'].RenderStepped:connect(function()
	if CORYUTABLE['Freeze'] == true then
		task.wait(math.random(0.1,0.9))
		CORYUTABLE['LocalPlayer'].Character.HumanoidRootPart.Anchored = false
		task.wait(math.random(0.1,0.9))
		CORYUTABLE['LocalPlayer'].Character.HumanoidRootPart.Anchored = true
	elseif CORYUTABLE['Freeze'] == false then
		CORYUTABLE['LocalPlayer'].Character.HumanoidRootPart.Anchored = false
	end
end)

CORYUTABLE['UserInput'].InputBegan:connect(function(FRZKEY)
	if FRZKEY.KeyCode == Enum.KeyCode.O then
		CORYUTABLE['Freeze'] = true
	elseif FRZKEY.KeyCode == Enum.KeyCode.I then
		CORYUTABLE['Freeze'] = false
	end
end)
