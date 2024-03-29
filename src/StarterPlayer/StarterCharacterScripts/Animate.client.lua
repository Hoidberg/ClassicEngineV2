-- ANIMATION
-- declarations
local Figure = script.Parent
local Torso = Figure:WaitForChild("Torso")
local RightShoulder = Torso:WaitForChild("Right Shoulder")
local LeftShoulder = Torso:WaitForChild("Left Shoulder")
local RightHip = Torso:WaitForChild("Right Hip")
local LeftHip = Torso:WaitForChild("Left Hip")
local Humanoid = Figure:WaitForChild("Humanoid")
local pose = "Standing"
local toolAnim = "None"
local toolAnimTime = 0
-- functions
local function onRunning(speed)
	if speed > 0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end
local function onDied()
	pose = "Dead"
end
local function onJumping()
	pose = "Jumping"
end
local function onClimbing()
	pose = "Climbing"
end
local function onGettingUp()
	pose = "GettingUp"
end
local function onFreeFall()
	pose = "FreeFall"
end
local function onFallingDown()
	pose = "FallingDown"
end
local function onSeated()
	pose = "Seated"
end
local function moveJump()
	RightShoulder.MaxVelocity = 0.5
	LeftShoulder.MaxVelocity = 0.5
	RightShoulder.DesiredAngle = 3.14
	LeftShoulder.DesiredAngle = -3.14
	RightHip.DesiredAngle = 0
	LeftHip.DesiredAngle = 0
end
-- same as jump for now
local function moveFreeFall()
	RightShoulder.MaxVelocity = 0.5
	LeftShoulder.MaxVelocity = 0.5
	RightShoulder.DesiredAngle = 3.14
	LeftShoulder.DesiredAngle = -3.14
	RightHip.DesiredAngle = 0
	LeftHip.DesiredAngle = 0
end
local function moveSit()
	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15
	RightShoulder.DesiredAngle = 3.14 / 2
	LeftShoulder.DesiredAngle = -3.14 / 2
	RightHip.DesiredAngle = 3.14 / 2
	LeftHip.DesiredAngle = -3.14 / 2
end
local function getTool()
	for _, kid in ipairs(Figure:GetChildren()) do
		if kid.className == "Tool" then
			return kid
		end
	end
	return nil
end
local function getToolAnim(tool)
	for _, c in ipairs(tool:GetChildren()) do
		if c.Name == "toolanim" and c.className == "StringValue" then
			return c
		end
	end
	return nil
end
local function animateTool()
	if toolAnim == "None" then
		RightShoulder.DesiredAngle = 1.57
		return
	end
	if toolAnim == "Slash" then
		RightShoulder.MaxVelocity = 0.5
		RightShoulder.DesiredAngle = 0
		return
	end
	if toolAnim == "Lunge" then
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity = 0.5
		RightHip.MaxVelocity = 0.5
		LeftHip.MaxVelocity = 0.5
		RightShoulder.DesiredAngle = 1.57
		LeftShoulder.DesiredAngle = 1.0
		RightHip.DesiredAngle = 1.57
		LeftHip.DesiredAngle = 1.0
		return
	end
end
local function move(time)
	local amplitude
	local frequency
	if pose == "Jumping" then
		moveJump()
		return
	end
	if pose == "FreeFall" then
		moveFreeFall()
		return
	end
	if pose == "Seated" then
		moveSit()
		return
	end
	local climbFudge = 0
	if pose == "Running" then
		RightShoulder.MaxVelocity = 0.15
		LeftShoulder.MaxVelocity = 0.15
		amplitude = 1
		frequency = 9
	elseif pose == "Climbing" then
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity = 0.5
		amplitude = 1
		frequency = 9
		climbFudge = 3.14
	else
		amplitude = 0.1
		frequency = 1
	end
	local desiredAngle = amplitude * math.sin(time * frequency)
	RightShoulder.DesiredAngle = desiredAngle + climbFudge
	LeftShoulder.DesiredAngle = desiredAngle - climbFudge
	RightHip.DesiredAngle = -desiredAngle
	LeftHip.DesiredAngle = -desiredAngle
	local tool = getTool()
	if tool then
		local animStringValueObject = getToolAnim(tool)
		if animStringValueObject then
			toolAnim = animStringValueObject.Value
			-- message recieved, delete StringValue
			animStringValueObject.Parent = nil
			toolAnimTime = time + .3
		end
		if time > toolAnimTime then
			toolAnimTime = 0
			toolAnim = "None"
		end
		animateTool()
	else
		toolAnim = "None"
		toolAnimTime = 0
	end
end
-- connect events
Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
-- main program
while Figure.Parent ~= nil do
	local _, time = wait(0.1)
	move(time)
end
