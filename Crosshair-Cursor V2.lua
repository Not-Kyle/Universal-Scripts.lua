--If Taken, Give Credits @hellokittysouljia or @killserver on discord or https://github.com/Not-Kyle
local trace = setmetatable({}, {
    __index = function(self, args)
        return game.GetService(game, args);
    end
})

local Draw = {Vertical = Drawing.new'Line'; Horizontal = Drawing.new'Line', lineSize = 27.5};

local runService, userInput = trace.RunService, trace.UserInputService;
local renderStepped, stepped, heartBeat = runService.RenderStepped, runService.Stepped, runService.Heartbeat;

Draw.Vertical.Size           = Draw.lineSize;
Draw.Vertical.Thickness      = 2;
Draw.Vertical.Color          = Color3.fromRGB(170,0,255);
Draw.Vertical.Transparency   = 1;
Draw.Vertical.Visible        = true;

Draw.Horizontal.Size         = Draw.lineSize;
Draw.Horizontal.Thickness    = 2;
Draw.Horizontal.Color        = Color3.fromRGB(170,0,255);
Draw.Horizontal.Transparency = 1;
Draw.Horizontal.Visible      = true;

renderStepped:Connect(function()

    local traceSize = Draw.Size / 2;
    userInput.MouseIconEnabled = false;

    Draw.Vertical.From = Vector2.new(userInput:GetMouseLocation().X, userInput:GetMouseLocation().Y - traceSize)
    Draw.Vertical.To = Vector2.new(userInput:GetMouseLocation().X, userInput:GetMouseLocation().Y + traceSize)

    Draw.Horizontal.From = Vector2.new(userInput:GetMouseLocation().X - traceSize, userInput:GetMouseLocation().Y)
    Draw.Horizontal.To = Vector2.new(userInput:GetMouseLocation().X + traceSize, userInput:GetMouseLocation().Y)

end)
