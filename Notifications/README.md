# How to use!

```
local Import = loadstring(game:HttpGet('https://raw.githubusercontent.com/Not-Kyle/Universal-Scripts.lua/refs/heads/main/Notifications/Source.lua'))();
local Window = Import:Panel(--[[ScreenGui]]); -- Insert your own screengui or leave it blank, there is one already defaulting to Panel

function Notify(Text: string, Delay: number)
    return Window:Notify(Text, Delay); -- Delay defaults to 5 if no time was set
end

Notify('TESTINGGGGG, NOTIFICATIONS BY MAWBORNE');
```
