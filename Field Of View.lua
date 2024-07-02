getgenv().Work = game:GetService'Workspace'
getgenv().UserInput = game:GetService'UserInputService'
getgenv().StarterGui = game:GetService'StarterGui'

local FieldOfVision = 90 -- You can set this to any number if you want a specific number

local function AddNotification(Title, Text)
    StarterGui:SetCore('SendNotification', {Title = Title; Text = Text})
end

local function CoryuMadeThis()
    Work.CurrentCamera.FieldOfView = FieldOfVision
end

UserInput.InputBegan:Connect(function(Array)
    if Array.KeyCode = Enum.KeyCode.K then
        FieldOfVision = FieldOfVision + 10
        AddNotification('Coryu FieldOfView', 'Field Of View is now '..FieldOfVision)
    elseif Array.KeyCode = Enum.KeyCode.L then
        FieldOfVision = FieldOfVision - 10
        AddNotification('Coryu FieldOfView', 'Field Of View is now '..FieldOfVision)
    end
end)

AddNotification('Coryu FieldOfView', 'Press K to make your FOV go up or press L to make it go down')
