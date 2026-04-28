local ReplicatedStorage = game:GetService("ReplicatedStorage")
local warningEvent = ReplicatedStorage:WaitForChild("WarningEvent")

local textLabel = script.Parent

-- Listen for the server to fire the event
warningEvent.OnClientEvent:Connect(function(messageText)
	-- Update the text to whatever the server sent
	textLabel.Text = messageText

	-- Make it visible
	textLabel.Visible = true

	-- Wait for 2 seconds (task.wait is the modern, better version of wait)
	task.wait(2)

	-- Hide it again
	textLabel.Visible = false
end)