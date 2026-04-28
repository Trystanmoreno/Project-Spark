local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local LEFT = ServerStorage:WaitForChild("LeftAccessory")
local RIGHT = ServerStorage:WaitForChild("RightAccessory")

local function give(player, character)
	local humanoid = character:WaitForChild("Humanoid")

	local role = player:GetAttribute("Role")
	if not role then return end

	if role == "Player1" then
		humanoid:AddAccessory(LEFT:Clone())

	elseif role == "Player2" then
		humanoid:AddAccessory(RIGHT:Clone())
	end
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		give(player, character)
	end)
end)