local ICONS = {
	FirstPersonIcon = "rbxassetid://5380228628",
	ThirdPersonIcon = "rbxassetid://5380234202"
}

local Players = game:GetService("Players")

local camera = workspace.CurrentCamera
local head = Players.LocalPlayer.Character:WaitForChild("Head")
local mouse = Players.LocalPlayer:GetMouse()

local function IsFirstPerson()
     return (head.CFrame.p - camera.CFrame.p).Magnitude < 1
end

game:GetService("RunService").Heartbeat:Connect(function()
	if not IsFirstPerson() then
		mouse.Icon = ICONS.ThirdPersonIcon
	elseif IsFirstPerson() then
		mouse.Icon = ICONS.FirstPersonIcon
	end
end)
