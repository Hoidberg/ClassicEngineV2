game:GetService("RunService").Heartbeat:Connect(function()
	-- check if the script is in the players character
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid") then
		if not script.Parent:FindFirstChild("deletemesh") and not script.Parent:FindFirstChild("CL_TorsoMesh") then
			local larm = Instance.new("CharacterMesh") do
				larm.Parent = script.Parent
				larm.Name = "CL_LeftArmMesh"
				larm.BodyPart = Enum.BodyPart.LeftArm
				larm.MeshId = 1112256772
			end
			local rarm = Instance.new("CharacterMesh") do
				rarm.Parent = script.Parent
				rarm.Name = "CL_RightArmMesh"
				rarm.BodyPart = Enum.BodyPart.RightArm
				rarm.MeshId = 1112244824
			end
			local lleg = Instance.new("CharacterMesh") do
				lleg.Parent = script.Parent
				lleg.Name = "CL_LeftLegMesh"
				lleg.BodyPart = Enum.BodyPart.LeftLeg
				lleg.MeshId = 1112275294
			end
			local rleg = Instance.new("CharacterMesh") do
				rleg.Parent = script.Parent
				rleg.Name = "CL_RightLegMesh"
				rleg.BodyPart = Enum.BodyPart.RightLeg
				rleg.MeshId = 1112267576
			end
			local torso = Instance.new("CharacterMesh") do
				torso.Parent = script.Parent
				torso.Name = "CL_TorsoMesh"
				torso.BodyPart = Enum.BodyPart.Torso
				torso.MeshId = 1112228624
			end
		end
	end
end)
