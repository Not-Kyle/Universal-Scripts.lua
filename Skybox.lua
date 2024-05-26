getgenv().game = game
getgenv().gS = game:GetService
getgenv().Lighting = gS"Lighting"
getgenv().Runservice = gS"RunService"

local ColorCorrection = false
local Correction = false
local SunRays = false
-- Change it to On and Off (true & false)
Skybox = Instance.new("Sky", Lighting)
Skybox.SkyboxBk = "rbxassetid://92464172"
Skybox.SkyboxDn = "rbxassetid://92464250"
Skybox.SkyboxFt = "rbxassetid://92464217"
Skybox.SkyboxLf = "rbxassetid://92464234"
Skybox.SkyboxRt = "rbxassetid://92464189"
Skybox.SkyboxUp = "rbxassetid://92464157"

RunService.Stepped:Connect(function()
   if Lighting then
      if Lighting:FindFirstChild"ColorCorrection" then
         if not ColorCorrection then
            Lighting:WaitForChild"ColorCorrection":Destroy()
         else
            return nil
         end
      elseif Lighting:FindFirstChild"Correction" then
         if not Correction then
            Lighting:WaitForChild"Correction":Destroy()
         else
            return nil
         end
      elseif Lighting:FindFirstChildOfClass"SunRaysEffect" then
         if not SunRays then
            Lighting:WaitForChild"SunRaysEffect":Destroy()
         else
            return nil
         end
      end
   end
end)
