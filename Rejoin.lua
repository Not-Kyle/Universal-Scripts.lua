local TeleportService = game.GetService(game, 'TeleportService');
local ContextService = game.GetService(game, 'ContextActionService');
local PlaceId, JobId = game.PlaceId, game.JobId;

local RejoinKey = 'F1'; -- Change your keybind here

function Rejoin(Type:string, Properties:EnumItem)
    if Type == 'Rejoins' then
        if not Properties or Properties == Enum.UserInputState.Begin then
            TeleportService:TeleportToPlaceInstance(PlaceId, JobId)
        end
    end
end

ContextService:BindAction('Rejoins', Rejoin, true, Enum.KeyCode[RejoinKey])
