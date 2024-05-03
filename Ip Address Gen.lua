local SomeJunk = game:GetService'ReplicatedStorage'
local Int = math.random(0,255)
local IntTwo = math.random(0,255)
local IntThree = math.random(0,255)
local IntFour = math.random(0,255)
local All = Int..'.'..IntTwo..'.'..IntThree..'.'..IntFour

print(All)

SomeJunk.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(All,'All')
