local CoryuH = Drawing.new('Line')
local CoryuV = Drawing.new('Line')

local var = {
    ['RunService'] = game:GetService('RunService');
    ['User'] = game:GetService("UserInputService");
    ['Size'] = 25
}

CoryuH.Visible = true
CoryuH.Size = var['Size']
CoryuH.Thickness = 2
CoryuH.Color = Color3.fromRGB(170, 0, 255)
CoryuH.Transparency = 1

CoryuV.Visible = true
CoryuV.Size = var['Size']
CoryuV.Thickness = 2
CoryuV.Color = Color3.fromRGB(170, 0, 255)
CoryuV.Transparency = 1

var['RunService'].RenderStepped:connect(function()
	local divsize = var['Size'] / 2
    var['User'].MouseIcon = 'rbxassetid://6839635919'
	CoryuH.From = Vector2.new(var['User']:GetMouseLocation().X - divsize, var['User']:GetMouseLocation().Y)
	CoryuH.To = Vector2.new(var['User']:GetMouseLocation().X + divsize, var['User']:GetMouseLocation().Y)
	CoryuV.From = Vector2.new(var['User']:GetMouseLocation().X, var['User']:GetMouseLocation().Y - divsize)
	CoryuV.To = Vector2.new(var['User']:GetMouseLocation().X, var['User']:GetMouseLocation().Y + divsize)
end)
