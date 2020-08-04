local ICONS = {
	FirstPersonIcon = "rbxassetid://5380228628",
	ThirdPersonIcon = "rbxassetid://5380234202"
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local head = game.Players.LocalPlayer.Character:WaitForChild("Head")
local mouse = player:GetMouse()

local function IsFirstPerson()
     return (head.CFrame.p - camera.CFrame.p).Magnitude < 4.5
end

RunService.RenderStepped:Connect(function()
	if not IsFirstPerson() then
		mouse.Icon = ICONS.ThirdPersonIcon
	elseif IsFirstPerson() then
		mouse.Icon = ICONS.FirstPersonIcon
	end
end)
