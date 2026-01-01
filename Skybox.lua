local Lighting = game:GetService('Lighting');

Lighting:FindFirstChild('ColorCorrection').Parent = nil;
Lighting:FindFirstChild('Correction').Parent = nil;
Lighting:FindFirstChild('SunRaysEffect').Parent = nil;

local Skybox = Instance.new('Sky', Lighting);
Skybox.SkyboxBk = 'rbxassetid://92464172';
Skybox.SkyboxDn = 'rbxassetid://92464250';
Skybox.SkyboxFt = 'rbxassetid://92464217';
Skybox.SkyboxLf = 'rbxassetid://92464234';
Skybox.SkyboxRt = 'rbxassetid://92464189';
Skybox.SkyboxUp = 'rbxassetid://92464157';
