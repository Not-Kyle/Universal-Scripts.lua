getgenv().IP = math.random(0,255)
getgenv().Rep = game:GetService'ReplicatedStorage'

print(IP..'.'..IP..'.'..IP..'.'..IP)

Rep.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(IP..'.'..IP..'.'..IP..'.'..IP,'All')
