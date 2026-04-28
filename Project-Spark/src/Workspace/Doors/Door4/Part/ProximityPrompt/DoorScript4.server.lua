local requiredRole = "Player1"
local prompt = script.Parent
local warningEvent = game:GetService("ReplicatedStorage"):WaitForChild("WarningEvent")
local value = 0

--local testactive = true

prompt.Triggered:Connect(function(player)
	--if testactive == true then
	if player:GetAttribute("Role") == requiredRole then
		prompt.Enabled = false
		warningEvent:FireClient(player, "Success!")
		while value < 24 do
			script.Parent.Parent.Parent:TranslateBy(Vector3.new(0, 0, -0.25))
			value += 1
			task.wait(0.05)
		end
		
	else
		script.Parent.Parent.CanCollide = true
		script.Parent.Parent.Transparency = 0
		prompt.Enabled = true
		warningEvent:FireClient(player, "You can't access this door...")
	end
end)

