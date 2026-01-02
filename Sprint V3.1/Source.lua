--[[
    # Sprint by Mawborn or hellokittysouljia: discord @killserver
    ## How to use?

    > Press LeftShift to start sprinting
    > Press B to turn sprint off and on

    > To change methods, say in chat [method (cframe / movedirection / lookvector / walkspeed / spoofwalkspeed)]
    > To change speed, say in chat [sprintspeed (number)]
    > To change prefix, say in chat [prefix (character)]
    
    ## What type of commands is there?

    > Loopsprint - This makes it so when you press your movement key usually W, it will sprint
    > Sprint - toggles sprint off and on
    > Sprintspeed - changes your speed
    > Prefix - changes your prefix so you can do -sprint !sprint .sprint /sprint
    > Notify - toggles notifications
    > Deletefile - Deletes your save file
    > Writefile - Makes a save file
    > Factoryreset - Factory resets your keybinds
    > Method - Changes your your blink moves or functions

    > Keybind sprint - Changes your sprints keybind
    > keybind enablesprint - Changes what you have to press in order to start sprinting

    ### Examples:

    > Keybind sprint C
    > Keybind enablesprint Leftctrl

    > Method spoofwalkspeed
    > Speed 25
    > Prefix !
]]--

local Import = setmetatable({}, {
    __index = function(self: Instance, ...)
        local Arguments = {...}
        rawset(self, Arguments, Arguments[1])
        
        return game:GetService(Arguments[1]);
    end
})

local Players = Import.Players;
local RunService = Import.RunService;
local HttpService = Import.HttpService;
local UserInputService = Import.UserInputService;

local Host = Players and Players.LocalPlayer;
local Body = Host and (Host.Character or Host.CharacterAdded:Wait());
local Humanoid = Body and (Body:FindFirstChildOfClass('Humanoid') or Body:WaitForChild('Humanoid', 10));
local Root = Body and Body:WaitForChild('HumanoidRootPart', 10) or (Humanoid and Humanoid.RootPart);
local OrginialWalkSpeed = Humanoid and Humanoid.WalkSpeed;

local LoopSprint = false;
local Sprint = true;

local SprintSpeed = 4;

local Folder = 'mawborn';
local File = 'mawborn/Sprint.xml';
local Method = 'Movedirection';

local Debounce = {};
local Movement = {};

local Config = {
    Keybinds = {
        Sprint = 'B';
        StartSprint = 'LeftShift';
    },

    Data = {
        Notifications = true;
        Prefix = '';
    }
};

local Utils = loadstring(game:HttpGet('https://raw.githubusercontent.com/Not-Kyle/Universal-Scripts.lua/refs/heads/main/Notifications/Source.lua'))();
local Window = Utils:Panel();

function UpdateFile()
    if not writefile then return end
    return writefile(File, HttpService:JSONEncode(Config));
end

task.spawn(function()
    if not makefolder
        or not isfolder
        or not readfile
        or not writefile then
            
        return
    end

    if makefolder and not isfolder(Folder) then 
        makefolder(Folder);
    end

    local Connection, Contents = pcall(readfile, File)

    if Connection then
        local JSON_Decode = HttpService:JSONDecode(Contents)

        for Index, _ in next, Config do
            if JSON_Decode[Index] then
                Config[Index] = JSON_Decode[Index]
            end
        end

        UpdateFile();
    else
        UpdateFile();
    end
end)

function DeleteFile()
    if not deletefile then return end
    return deletefile(File);
end

function Notify(Text: string, Delay: number)
    if not Config.Data.Notifications then return end

    return Window:Notify(Text, Delay);
end

function SentenceCase(Arguments: string) : string
    if #Arguments == 0 then
        return Arguments;
    end

    return string.upper(string.sub(Arguments, 1, 1)) .. string.sub(Arguments, 2)
end

function IndexCommand(Text: string, Prefix: string)
    if not Text or not Prefix then return end
    local Command = SentenceCase(Text);

    if string.sub(Command, 1, #Prefix) == string.lower(Prefix) then
        return Command:sub(#Prefix + 1);
    end

    return
end

function KeybindMap(Keybind: string)
    local KeyMap = {
        Leftctrl = 'LeftControl',
        Rightctrl = 'RightControl',

        Leftcontrol = 'LeftControl',
        Rightcontrol = 'RightControl',

        Leftalt = 'LeftAlt',
        Rightalt = 'RightAlt',

        Leftshift = 'LeftShift',
        Rightshift = 'RightShift',

        Capslock = 'CapsLock',
        Tab = 'Tab',
        Escape = 'Escape',
        Enter = 'Return',
    }

    local NormalizeKeybind = SentenceCase(Keybind);
    return KeyMap[NormalizeKeybind];
end

function IsValidInput(Keybind: string)
    local NormalizeKeybind = SentenceCase(Keybind);

    for _, Index in next, Enum.KeyCode:GetEnumItems() do
        if SentenceCase(Index.Name) == NormalizeKeybind then
            return true, Index;
        end
    end

    local MappedKey = KeybindMap(Keybind)
    if MappedKey then
        return true, MappedKey;
    end

    return false, 'Invalid Keycode, Defaulted to last keybind!';
end

function OnHeartbeat(Delta: number)
    local MoveDirection = (Humanoid and Humanoid.MoveDirection) or Vector3.zero

    if (Sprint and Debounce.Sprint) or LoopSprint then
        local SprintSpeed = SprintSpeed / 6.5

        if Method == 'Movedirection' and MoveDirection then
            Root.CFrame += Vector3.new(MoveDirection.X * SprintSpeed, 0, MoveDirection.Z * SprintSpeed)
        end

        if Method == 'Cframe' and Root then
            local XAxis = (Movement.D and 1 or 0) - (Movement.A and 1 or 0)
            local ZAxis = (Movement.S and 1 or 0) - (Movement.W and 1 or 0)
            local Offset = Vector3.new(XAxis, 0, ZAxis);

            if Offset.Magnitude > 0 then
                Offset = Offset.Unit * SprintSpeed
                Root.CFrame *= CFrame.new(Offset)
            end
        end

        if Method == 'Lookvector' and Root then
            Root.AssemblyLinearVelocity = Root.CFrame.LookVector * (SprintSpeed * 25)
        end

        if Method == 'WalkSpeed' and Humanoid then
            Humanoid.WalkSpeed = (SprintSpeed * 25)
        end
    end
end

function HookData()
    if not hookmetamethod or not newcclosure or not checkcaller then
        Notify('Executor is incompatible for Spoof Walkspeed');
        return;
    end

    local GetIndex; GetIndex = hookmetamethod(game, '__index', newcclosure(function(self: Instance, Index: any)
        if checkcaller() then
            return GetIndex(self, Index);
        end

        if self == Humanoid then
            if Index == 'WalkSpeed' then
                return OrginialWalkSpeed;
            end
        end

        return GetIndex(self, Index);
    end));

    local GetNewIndex; GetNewIndex = hookmetamethod(game, '__newindex', newcclosure(function(self: Instance, Index: any, Value: any)
        if checkcaller() then
            return GetNewIndex(self, Index, Value);
        end

        if self == Humanoid then
            if Index == 'WalkSpeed' and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                return (SprintSpeed * 25)
            end
        end

        return GetNewIndex(self, Index, Value);
    end))
end

function OnChatted(Commands: string)
    if not Config.Data.Prefix then
        Config.Data.Prefix = '';
    end

    local InitializeArguments = IndexCommand(Commands, Config.Data.Prefix);
    if not InitializeArguments then warn('Indexing returns as nil') return end

    local Arguments = string.lower(InitializeArguments);
    local ArgumentsList = {};

    for Method in string.gmatch(Arguments, '%S+') do
        table.insert(ArgumentsList, Method)
    end

    if Arguments == 'deletefile' then -- The purpose is incase your file gets corrupted or you want to reset it
        DeleteFile();
        Notify('File has been deleted');
    end

    if table.find({'makefile', 'writefile'}, Arguments) then
        UpdateFile();
        Notify('File has been written');
    end

    if table.find({'resetfile', 'factoryreset', 'cleanfile'}, Arguments) then
        DeleteFile(); task.wait() UpdateFile();

        Notify('File has been factory reset');
    end

    if table.find({'notify', 'notifications'}, Arguments) then
        Config.Data.Notifications = not Config.Data.Notifications
        UpdateFile();
    end

    if table.find({'loopsprint', 'loopblink'}, Arguments) then
        LoopSprint = not LoopSprint;

        Notify(string.format('Loop Sprint is now: %s', tostring(LoopSprint) or 'null'));
    end

    if table.find({'sprint', 'blink', 'speed', 'run'}, Arguments) then
        Sprint = not Sprint

        Notify(string.format('Sprint is now: %s', tostring(Sprint) or 'null'));
    end

    if table.find({'prefix', 'pf'}, ArgumentsList[1]) then
        Config.Data.Prefix = tostring(ArgumentsList[2]) or '';
        UpdateFile();

        Notify(string.format('Prefix is now: %s', Config.Data.Prefix or 'null'));
    end

    if table.find({'hotkey', 'key', 'keybind', 'macro'}, ArgumentsList[1]) then

        if table.find({'sprint', 'blink', 'run'}, ArgumentsList[2]) then
            Config.Keybinds.Sprint = string.upper(ArgumentsList[3]) or 'B';

            Notify(string.format('Sprint Keybind is now: %s', Config.Keybinds.Sprint or 'null'));
        end

        if table.find({'enablesprint', 'startsprint'}, ArgumentsList[2]) then
            local IsValid, Response = IsValidInput(ArgumentsList[3])

            if IsValid then
                Config.Keybinds.StartSprint = Response;
                Notify(string.format('Enable Sprint Keybind is now: %s', Config.Keybinds.StartSprint or 'null'));
            end

            if not IsValid then
                Notify(string.format(Response));
            end
        end

        UpdateFile();
    end

    if table.find({'sprintspeed', 'blinkspeed', 'ss', 'ws', 'bs', 'speed', 'runspeed'}, ArgumentsList[1]) then
        local NewSpeed = tonumber(ArgumentsList[2]);

        if NewSpeed then
            assert(typeof(NewSpeed) == 'number', 'Sprint speed must be a number')
        end

        SprintSpeed = NewSpeed or 4;
        Notify(string.format('Sprint Speed is now: %s', tostring(SprintSpeed) or '4'));
    end

    if table.find({'method', 'md', 'pattern', 'form'}, ArgumentsList[1]) then
        if table.find({'movedirection', 'cframe', 'lookvector'}, ArgumentsList[2]) then

            Method = SentenceCase(ArgumentsList[2]) or 'Movedirection';
            Notify(string.format('Method is now: %s', Method or 'null'));
        end

        if table.find({'walkspeed', 'spoofwalkspeed', 'ws', 'spoofws'}, ArgumentsList[2]) then
            local OnLower = string.lower(ArgumentsList[2]);

            if OnLower == 'spoofws' or OnLower == 'spoofwalkspeed' then
                HookData();

                Notify(string.format('Now using spoofwalkspeed'));
                return
            end

            Method = 'WalkSpeed';
            Notify(string.format('Now using walkspeed'));
        end
    end
end

function OnCharacterAdded(Character: Model)
    Body = Character or Host.Character;
    Humanoid = Body and Body:WaitForChild('Humanoid', 10) or Body:FindFirstChildOfClass('Humanoid');
    Root = Body and Body:WaitForChild('HumanoidRootPart', 10) or Humanoid and Humanoid.RootPart;
end

function OnInputBegan(Arguments: EnumItem, NilRequest: boolean)
    if Arguments.KeyCode == Enum.KeyCode[Config.Keybinds.StartSprint] then
        if not LoopSprint and Sprint then
            Debounce.Sprint = true;
        end
    end

    if NilRequest then
        return;
    end

    if Arguments.KeyCode == Enum.KeyCode[Config.Keybinds.Sprint] then
        Sprint = not Sprint;

        Notify(string.format('Sprint is now: %s', tostring(Sprint) or 'null'));
    end

    if Arguments.KeyCode == Enum.KeyCode.W then Movement.W = true end;
    if Arguments.KeyCode == Enum.KeyCode.A then Movement.A = true end;
    if Arguments.KeyCode == Enum.KeyCode.S then Movement.S = true end;
    if Arguments.KeyCode == Enum.KeyCode.D then Movement.D = true end;
end

function OnInputEnded(Arguments: InputObject, NilRequest: boolean)
    if Arguments.KeyCode == Enum.KeyCode[Config.Keybinds.StartSprint] then
        if not LoopSprint and Sprint then
            Debounce.Sprint = false;
        end
    end

    if NilRequest then
        return;
    end

    if Arguments.KeyCode == Enum.KeyCode.W then Movement.W = false end;
    if Arguments.KeyCode == Enum.KeyCode.A then Movement.A = false end;
    if Arguments.KeyCode == Enum.KeyCode.S then Movement.S = false end;
    if Arguments.KeyCode == Enum.KeyCode.D then Movement.D = false end;
end

RunService.Heartbeat:Connect(OnHeartbeat);
UserInputService.InputBegan:Connect(OnInputBegan);
UserInputService.InputEnded:Connect(OnInputEnded);

Host.CharacterAdded:Connect(OnCharacterAdded);
Host.Chatted:Connect(OnChatted);

Notify(string.format('Mawborn Sprint V3.1 %s', 'loaded'))
