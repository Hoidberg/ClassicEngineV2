--[[
	This test runner is invoked in all the environments that we want to test our
	library in.
	We target Lemur, Roblox Studio, and Roblox-CLI.
]]

local isRobloxCli, ProcessService = pcall(game.GetService, game, "ProcessService")

local completed, result = xpcall(function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local StarterGui = game.StarterGui
	local StarterPlayer = game:GetService("StarterPlayer")

	local TestEZ = require(ReplicatedStorage.TestEZ)

	failureCount = 0

	for _, v in ipairs(StarterGui:GetChildren()) do
		if v:IsA("BaseScript") then
			local results = TestEZ.TestBootstrap:run(
				{ v },
				TestEZ.Reporters.TextReporter
			)
			failureCount = failureCount + results.failureCount
		end
	end

	for _, v in ipairs(StarterPlayer:GetDescendants()) do
		if v:IsA("BaseScript") then
			local results = TestEZ.TestBootstrap:run(
				{ v },
				TestEZ.Reporters.TextReporter
			)
			failureCount = failureCount + results.failureCount
		end
	end

	return failureCount == 0 and 0 or 1
end, debug.traceback)

local statusCode
local errorMessage = nil
if completed then
	statusCode = result
else
	statusCode = 1
	errorMessage = result
end

if __LEMUR__ then
	-- Lemur has access to normal Lua OS APIs

	if errorMessage ~= nil then
		print(errorMessage)
	end
	os.exit(statusCode)
elseif isRobloxCli then
	-- Roblox CLI has a special service to terminate the process

	if errorMessage ~= nil then
		print(errorMessage)
	end
	ProcessService:ExitAsync(statusCode)
else
	-- In Studio, we can just throw an error to get the user's attention

	if errorMessage ~= nil then
		error(errorMessage, 0)
	end
end
