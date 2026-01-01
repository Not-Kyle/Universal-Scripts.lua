local Players = game:GetService('Players');
local Host = Players.LocalPlayer;

task.spawn(function() -- Incase games enforce no shiftlock?
    while task.wait() do
        Host.DevEnableMouseLock = true;
    end
end)
