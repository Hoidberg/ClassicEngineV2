while true do
	-- check if the script is in the players character
	if script.Parent:IsA("Model") and script.Parent:FindFirstChild("Humanoid") then
		if not script.Parent:FindFirstChild("deletemesh") and not script.Parent:FindFirstChild("CL_TorsoMesh") then
			local larm = Instance.new("CharacterMesh", script.Parent) do
				larm.Name = "CL_LeftArmMesh"
				larm.BodyPart = Enum.BodyPart.LeftArm
				larm.MeshId = 1112256772
			end
			local rarm = Instance.new("CharacterMesh", script.Parent) do
				rarm.Name = "CL_RightArmMesh"
				rarm.BodyPart = Enum.BodyPart.RightArm
				rarm.MeshId = 1112244824
			end
			local lleg = Instance.new("CharacterMesh", script.Parent) do
				lleg.Name = "CL_LeftLegMesh"
				lleg.BodyPart = Enum.BodyPart.LeftLeg
				lleg.MeshId = 1112275294
			end
			local rleg = Instance.new("CharacterMesh", script.Parent) do
				rleg.Name = "CL_RightLegMesh"
				rleg.BodyPart = Enum.BodyPart.RightLeg
				rleg.MeshId = 1112267576
			end
			local torso = Instance.new("CharacterMesh", script.Parent) do
				torso.Name = "CL_TorsoMesh"
				torso.BodyPart = Enum.BodyPart.Torso
				torso.MeshId = 1112228624
			end
		end
	end
end
