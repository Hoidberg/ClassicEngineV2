local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid") then -- check if the script is in the players character
		for i, child in ipairs(script.Parent.Head:GetChildren()) do
			if child:IsA("Decal") and child.Texture == "rbxasset://textures/face.png" then
				child.Texture = "rbxassetid://1104210678"
			end
		end
	end
end)