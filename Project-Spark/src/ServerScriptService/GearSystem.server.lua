local REQUIRED_ITEM = "Gear"
local value =  workspace:FindFirstChild("SocketsActivated")
if not value then
	value = Instance.new("BoolValue")
	value.Name = "SocketsActivated"
	value.Value = false
	value.Parent = workspace
end

local function getItem(player)
	for _, container in pairs({player.Backpack, player.Character}) do
		if container then
			for _, obj in pairs(container:GetChildren()) do
				if obj:IsA("Tool") and obj:GetAttribute("ItemName") == REQUIRED_ITEM then
					return obj
				end
			end
		end
	end
	return nil
end

local function allSocketsActivated()
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:GetAttribute("IsSocket") == true then
			if obj:GetAttribute("IsActivated") ~= true then
				return false
			end
		end
	end
	return true
end

local function hookSocket(prompt)
	local socket = prompt.Parent
	if not socket then return end

	if socket:GetAttribute("IsSocket") ~= true then
		return
	end

	prompt.Triggered:Connect(function(player)

		if socket:GetAttribute("IsActivated") == true then
			return
		end

		local item = getItem(player)
		if not item then return end

		item:Destroy()

		socket:SetAttribute("IsActivated", true)

		socket.Transparency = 0
		socket.CanCollide = true
		socket.CanTouch = true

		prompt:Destroy()

		if allSocketsActivated() then
			value.Value = true
			print("ALL SOCKETS ACTIVATED")
			-- trigger your field / door / puzzle here
		end
	end)
end

for _, obj in pairs(workspace:GetDescendants()) do
	if obj:IsA("ProximityPrompt") then
		hookSocket(obj)
	end
end

workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("ProximityPrompt") then
		hookSocket(obj)
	end
end)
