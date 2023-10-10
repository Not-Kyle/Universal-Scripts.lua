getgenv().User = game:GetService'Players'.LocalPlayer
getgenv().RunService = game:GetService'RunService'
getgenv().Die = function() if User and User.Character and User.Character:FindFirstChild'Humanoid' then User.Character:WaitForChild'Humanoid':ChangeState(15) end end

local CoryuR6 = false
local CoryuR15 = false

local function Rigtype()
    if User and User.Character and User.Character:FindFirstChild'UpperTorso' or User.Character:FindFirstChild'Humanoid'.RigType == Enum.HumanoidRigType.R15 then
        CoryuR15 = true
    elseif User and User.Character and User.Character:FindFirstChild'Torso' then
        CoryuR6 = true
    end
end

RunService.Stepped:Connect(function()
   if CoryuR6 then
        task.wait(4.9)
        local PreviousCFrameR6 = User.Character:WaitForChild'Torso'.CFrame
        Die()
        User.CharacterAdded:Wait()
        User.Character:WaitForChild'Torso'.CFrame = PreviousCFrameR6
   elseif CoryuR15 then
        task.wait(4.9)
        local PreviousCFrameR15 = User.Character:WaitForChild'UpperTorso'.CFrame
        Die()
        User.CharacterAdded:Wait()
        User.Character:WaitForChild'UpperTorso'.CFrame = PreviousCFrameR15
   end
end)
