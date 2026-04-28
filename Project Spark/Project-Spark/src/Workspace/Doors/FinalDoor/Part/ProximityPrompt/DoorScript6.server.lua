local fieldActive = workspace:WaitForChild("Switch")
local prompt = script.Parent
local warningEvent = game:GetService("ReplicatedStorage"):WaitForChild("WarningEvent")
local value = 0
local ButtonOn = game.Workspace:WaitForChild("ButtonOn")
local FinalDoor = Instance.new("BoolValue")
FinalDoor.Name = "FinalDoor"
FinalDoor.Value = false
FinalDoor.Parent = game.Workspace



--local testactive = true

prompt.Triggered:Connect(function(player)
	--if testactive == true then
	
	if fieldActive.Value and ButtonOn.Value then
		prompt.Enabled = false
		FinalDoor.Value = true
		
	elseif not fieldActive.Value and not ButtonOn.Value then
		warningEvent:FireClient(player, "You don't have enough power and button hasn't been pressed...")
	elseif not fieldActive.Value then
		warningEvent:FireClient(player, "You need more power...")	
	else
		warningEvent:FireClient(player, "button hasn't been pressed...")
		
	end
end)

