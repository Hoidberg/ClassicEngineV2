local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
	-- check if the script is in the players character
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid") then
		for _,v in ipairs(script.Parent.Head:GetChildren()) do
			if v:IsA("Decal") and v.Texture == "rbxasset://textures/face.png" then
				v.Texture = "rbxassetid://1104210678"
			end
		end
	end
end)
