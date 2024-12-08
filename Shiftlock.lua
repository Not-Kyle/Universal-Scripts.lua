local host = game:GetService'Players'.LocalPlayer

coroutine.resume(coroutine.create(function()
    while task.wait() do
        host.DevEnableMouseLock = true
    end
end))
