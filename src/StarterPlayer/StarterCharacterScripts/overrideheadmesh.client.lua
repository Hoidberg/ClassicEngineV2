local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid") and script.Parent:FindFirstChild("Head") then -- check if the script is in the players character
		script.Parent.Head:FindFirstChildWhichIsA("FileMesh").MeshId = "rbxassetid://1104623876"
	end
end)