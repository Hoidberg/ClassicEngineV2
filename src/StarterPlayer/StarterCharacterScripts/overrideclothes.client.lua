game:GetService("RunService").Heartbeat:Connect(function()
	-- check if the script is in the players character
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid") then
		if not script.Parent:FindFirstChildWhichIsA("Shirt") then
			local shirt = Instance.new("Shirt") do
				shirt.Parent = script.Parent
				shirt.Name = "oldShirt"
				shirt.ShirtTemplate = "rbxassetid://1110695025"
			end
		elseif not script.Parent:FindFirstChildWhichIsA("Pants") then
			local pants = Instance.new("Pants") do
				pants.Parent = script.Parent
				pants.Name = "oldPants"
				pants.PantsTemplate = "rbxassetid://1110695628"
			end
		elseif script.Parent:FindFirstChild("Shirt") and script.Parent:FindFirstChild("oldShirt") then
			script.Parent:FindFirstChild("oldShirt"):Destroy()
		elseif script.Parent:FindFirstChild("Pants") and script.Parent:FindFirstChild("oldPants") then
			script.Parent:FindFirstChild("oldPants"):Destroy()
		end
	end
end)
