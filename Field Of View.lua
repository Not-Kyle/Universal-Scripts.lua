local route = setmetatable({}, {
    __index = function(self, args)
        return game.GetService(game, args);
    end
})

local workSpace = route.Workspace;
local camera = workSpace.CurrentCamera;
local runService = route.RunService;
local contextActionService = route.ContextActionService;

local FieldOfVision = 90;

local plusKey, minusKey = 'K', 'L';

coroutine.resume(coroutine.create(function() --For games that try to lock your FOV
    while runService.Heartbeat:Wait() do
        camera.FieldOfView = FieldOfVision;
    end
end))

function addFieldOfView(actionName:string, properties:EnumItem)
    if actionName == 'add' then
        if properties == Enum.UserInputState.Begin then
            FieldOfVision += 5;
        end
    end
end

function minusFieldOfView(actionName:string, properties:EnumItem)
    if actionName == 'minus' then
        if properties == Enum.UserInputState.Begin then
            FieldOfVision -= 5;
        end
    end
end

contextActionService:BindAction('add', addFieldOfView, true, Enum.KeyCode[plusKey]);
contextActionService:BindAction('minus', minusFieldOfView, true, Enum.KeyCode[minusKey]);
