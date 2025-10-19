local StarterGui = game:GetService('StarterGui')

function NotifyMessageBox(Title: string, Text: string, Flag: number, Func: any)
    Func = Func or function() end

    local BindableFunction = Instance.new('BindableFunction')
    local Options = {};

    if Flag == 0 or nil then
        Options.One = 'OK'

    elseif Flag == 1 then
        Options.One = 'OK'
        Options.Two = 'Cancel'

    elseif Flag == 2 then
        Options.One = 'Abort'
        Options.Two = 'Retry'
        Options.Three = 'Ignore'

    elseif Flag == 3 then
        Options.One = 'Yes'
        Options.Two = 'No'
        Options.Three = 'Cancel'

    elseif Flag == 4 then
        Options.One = 'Yes'
        Options.Two = 'No'

    elseif Flag == 5 then
        Options.One = 'Retry'
        Options.Two = 'Cancel'

    elseif Flag == 6 then
        Options.One = 'Cancel'
        Options.Two = 'Try Again'
        Options.Three = 'Continue'
    
    elseif Flag == 7 then
        return
    end

    BindableFunction.OnInvoke = Func

    StarterGui:SetCore('SendNotification', {
        Title = Title;
        Text = Text;
        Duration = 20;
        Button1 = Options.One;
        Button2 = Options.Two;
        Button3 = Options.Three;
        Callback = BindableFunction;
    })
end

NotifyMessageBox('TextHere', 'Title', 1, function(Arguments)
    if Arguments == 'OK' then
        print('OK was pressed')
    
    elseif Arguments == 'Cancel' then
        print('Cancel was pressed')

    end
end)

--[[
NotifyMessageBox(Text, Title, Flag, Function)

Text is just text you write in the box
Title is the Title of the script or your notification
Flag is what buttons will appear (See above to see what each of the 7 flags do
Function is what functions after a certain button is pressed

For each flag after that button has been pressed, for example if Retry was pressed you must write (Arguments == 'Retry')
]]--
