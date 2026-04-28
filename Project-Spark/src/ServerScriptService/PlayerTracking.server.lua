local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local playerCountEvent = Instance.new("RemoteEvent")
playerCountEvent.Name = "PlayerCountEvent"
playerCountEvent.Parent = ReplicatedStorage

local function updateAll()
	local count = #Players:GetPlayers()
	playerCountEvent:FireAllClients(count)
end

Players.PlayerAdded:Connect(updateAll)
Players.PlayerRemoving:Connect(updateAll)

updateAll()

