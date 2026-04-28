local fieldActive = workspace:WaitForChild("Switch")
local prompt = script.Parent
local warningEvent = game:GetService("ReplicatedStorage"):WaitForChild("WarningEvent")
local value = 0
local lever2Activated = game.Workspace:WaitForChild("Lever2Activated")
local lever3Activated = game.Workspace:WaitForChild("Lever3Activated")



--local testactive = true

prompt.Triggered:Connect(function(player)
	--if testactive == true then
	local bothLeversActivated = lever2Activated.Value == true and lever3Activated.Value == true
	print("lever2 " .. tostring(lever2Activated.Value) .. "lever3 " .. tostring(lever3Activated.Value) .. "both " .. tostring(bothLeversActivated))
	if fieldActive.Value and bothLeversActivated then
		prompt.Enabled = false
		warningEvent:FireClient(player, "Success!")
		while value < 24 do
			script.Parent.Parent.Parent:TranslateBy(Vector3.new(-0.25, 0, 0))
			value += 1
			task.wait(0.05)
		end
		
	elseif not fieldActive.Value and not bothLeversActivated then
		warningEvent:FireClient(player, "You don't have enough power and levers activated to access this door...")
	elseif not fieldActive.Value then
		warningEvent:FireClient(player, "You need more power...")	
	else
		warningEvent:FireClient(player, "You don't have enough levers activated...")
		
	end
end)

