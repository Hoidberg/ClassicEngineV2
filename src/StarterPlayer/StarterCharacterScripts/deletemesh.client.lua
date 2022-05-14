game:GetService("RunService").Heartbeat:Connect(function()
	-- check if the script is in the players character
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid") then
		for _,v in ipairs(script.Parent:GetChildren()) do
			if v:IsA("CharacterMesh") then
				v:Destroy()
			end
		end
		script:Destroy()
	end
end)
