local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function hasAnyTool(player)
	return player.Backpack:FindFirstChildWhichIsA("Tool")
		or (player.Character and player.Character:FindFirstChildWhichIsA("Tool"))
end

local function hookPickup(prompt)
	local parent = prompt.Parent
	if not parent then return end

	if parent:GetAttribute("IsPickup") ~= true then
		return
	end

	prompt.Triggered:Connect(function(player)

		if hasAnyTool(player) then return end

		local itemName = parent:GetAttribute("ItemName")
		if not itemName then return end

		local tool = ReplicatedStorage:FindFirstChild(itemName)
		if not tool or not tool:IsA("Tool") then return end

		local clone = tool:Clone()
		clone:SetAttribute("ItemName", itemName)
		clone.Parent = player.Backpack

		parent:Destroy()
	end)
end

for _, obj in pairs(workspace:GetDescendants()) do
	if obj:IsA("ProximityPrompt") then
		hookPickup(obj)
	end
end

workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("ProximityPrompt") then
		hookPickup(obj)
	end
end)

