getgenv().TeleportService = game:GetService'TeleportService'
getgenv().Host = game:GetService'Players'.LocalPlayer

TeleportService:Teleport(game.PlaceId, Host)
