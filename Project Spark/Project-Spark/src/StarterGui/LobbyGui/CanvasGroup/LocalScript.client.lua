local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage:WaitForChild("PlayerCountEvent")

local gui = script.Parent
local label = gui:WaitForChild("StatusLabel")
local playButton = gui:WaitForChild("PlayButton")

playButton.Visible = false
playButton.Active = false

event.OnClientEvent:Connect(function(count)
	if count < 2 then
		label.Text = "Waiting for another player..."
		playButton.Visible = false
		playButton.Active = false
	else
		label.Text = "Players ready!"
		task.wait(2)
		label.Visible = false
		playButton.Visible = true
		playButton.Active = true
	end
end)
