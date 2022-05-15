-- util

local function newSound(id)
	local sound = Instance.new("Sound")
	sound.SoundId = id
	sound.Archivable = false
	sound.Parent = script.Parent.Head
	return sound
end

-- declarations

local sDied = newSound("rbxasset://sounds/uuhhh.wav")
local sFallingDown = newSound("rbxasset://sounds/splat.wav")
local sFreeFalling = newSound("rbxassetid://12222200")
local sGettingUp = newSound("rbxasset://sounds/hit.wav")
local sJumping = newSound("rbxasset://sounds/button.wav")
local sRunning = newSound("rbxasset://sounds/bfsl-minifigfoots1.mp3")
sRunning.Looped = true

local Figure = script.Parent
local Humanoid = Figure:WaitForChild("Humanoid")

-- functions

local function onDied()
	sDied:Play()
end

local function onState(state, sound)
	if state then
		sound:Play()
	else
		sound:Pause()
	end
end

local function onRunning(speed)
	if speed>0 then
		sRunning:Play()
	else
		sRunning:Pause()
	end
end

-- connect up

Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(function(state)
	onState(state, sJumping)
end)
Humanoid.GettingUp:connect(function(state)
	onState(state, sGettingUp)
end)
Humanoid.FreeFalling:connect(function(state)
	onState(state, sFreeFalling)
end)
Humanoid.FallingDown:connect(function(state)
	onState(state, sFallingDown)
end)
