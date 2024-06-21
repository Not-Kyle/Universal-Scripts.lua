getgenv().TeleportService = game:GetService'TeleportService';
getgenv().ContextService = game:GetService'ContextActionService';
getgenv().Place = game.PlaceId;

local RejoinKey = 'F1'; -- Change your keybind here

function Rejoin(Type:string, Properties:EnumItem)
    if Type == 'Rejoins' then
        if not Properties or Properties == Enum.UserInputState.Begin then
            TeleportService:Teleport(Place)
        end
    end
end

ContextService:BindAction('Rejoins', Rejoin, true, Enum.KeyCode[RejoinKey])
