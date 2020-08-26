local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
	-- check if the script is in the players character
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid") then
		for i, child in ipairs(script.Parent:GetChildren()) do
			if child:IsA("CharacterMesh") then
				child:Destroy()
			end
		end
		script:Destroy()
	end
end)
