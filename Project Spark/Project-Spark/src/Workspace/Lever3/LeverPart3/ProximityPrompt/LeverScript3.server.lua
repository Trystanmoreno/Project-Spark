local lever3Activated = Instance.new("BoolValue")
lever3Activated.Name = "Lever3Activated"
lever3Activated.Value = false
lever3Activated.Parent = game.Workspace

local requiredRole = "Player2"

local lever = script.Parent.Parent
local prompt = script.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local warningEvent = ReplicatedStorage:WaitForChild("WarningEvent")

local isInteractable = true

local value = 0

prompt.Triggered:Connect(function(player)

	print(player.Name .. " interacted with lever!")
	if isInteractable and player:GetAttribute("Role") == requiredRole then
		
		warningEvent:FireClient(player, "Success!")
		
		lever3Activated.Value = true
		isInteractable = false
		prompt.Enabled = false
		
		while value > -5 do
			lever:TranslateBy(Vector3.new(0, -0.25, 0))
			value -= 1
			task.wait(0.05)
		end
		

	else
		warningEvent:FireClient(player, "You can't pull this lever...")
	end

	--elseif isInteractable == false and fieldActive.Value == false and gear1Placed == false and gear2Placed == false then
	--	warningEvent:FireClient(player, "You need more power and gears...")
	--elseif isInteractable == false and fieldActive.Value == false and gear1Placed == false and gear2Placed == true then
	--	warningEvent:FireClient(player, "You need more power and gears...")
	--elseif isInteractable == false and fieldActive.Value == false and gear1Placed == true and gear2Placed == false then
	--	warningEvent:FireClient(player, "You need more power and gears...")
	--elseif isInteractable == false and fieldActive.Value == false and gear1Placed == true and gear2Placed == true then
	--	warningEvent:FireClient(player, "You need more power...")
	--elseif isInteractable == false and fieldActive.Value == true and gear1Placed == false and gear2Placed == false then
	--	warningEvent:FireClient(player, "You need more gears...")
	--elseif isInteractable == false and fieldActive.Value == true and gear1Placed == false and gear2Placed == true then
	--	warningEvent:FireClient(player, "You need more gears...")
	--elseif isInteractable == false and fieldActive.Value == true and gear1Placed == true and gear2Placed == false then
	--	warningEvent:FireClient(player, "You need more gears...")
	--end

end)