getgenv().TeleportService = game:GetService'TeleprotService'
getgenv().Host = game:GetService'Players'.LocalPlayer

TeleportService:Teleport(game.PlaceId, Host)
