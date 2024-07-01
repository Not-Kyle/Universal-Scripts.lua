getgenv().Players = game:GetService'Players';
getgenv().Host = Players.LocalPlayer;
getgenv().ContextService = game:GetService'ContextActionService';

local Key = 'F2'; -- Change key to anything

local Method = 'Enum' -- You can change it to 'Enum, Health, Torso, Head' -- > DM ME @killserver IF YOU KNOW OF ANY MORE METHODS I CAN ADD < --

function KillCharacter(Type:string)
    if Host and Host.Character then
        if Type == 'Enum' then
            Host.Character:FindFirstChild'Humanoid':ChangeState(Enum.HumanoidStateType.Dead)
        elseif Type == 'Health' then
            Host.Character:FindFirstChild'Humanoid'.Health = 0
        elseif Type == 'Torso' then
            if Host.Character:FindFirstChild'Torso' or Host.Character:FindFirstChild'Humanoid'.RigType == Enum.HumanoidRigType.R6 then
                Host.Character:WaitForChild'Torso':Destroy()
            elseif Host.Character:FindFirstChild'UpperTorso' or Host.Character:FindFirstChild'Humanoid'.RigType == Enum.HumanoidRigType.R15 then
                Host.Character:WaitForChild'UpperTorso':Destroy()
            end
        elseif Type == 'Head' then
            Host.Character:FindFirstChild'Head':Destroy()
        elseif Type == 'Joints' then
            Host.Character:BreakJoints()
        end
    end
end

function Reset(Type:string, Properties:EnumItem)
    if Type == 'Kill' then
        if not Properties or Properties == Enum.UserInputState.Begin then
            KillCharacter(Method)
        end
    end
end

ContextService:BindAction('Kill', Reset, true, Enum.KeyCode[Key])
