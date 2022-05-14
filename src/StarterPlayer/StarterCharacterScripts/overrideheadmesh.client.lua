while true do
	-- check if the script is in the players character
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid")
			and script.Parent:FindFirstChild("Head") then
		script.Parent.Head:FindFirstChildWhichIsA("FileMesh").MeshId = "rbxassetid://1104623876"
	end
end
