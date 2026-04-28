local lever1Activated = Instance.new("BoolValue")
lever1Activated.Name = "Lever1Activated"
lever1Activated.Value = false
lever1Activated.Parent = game.Workspace

local lever = script.Parent.Parent
local prompt = script.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local warningEvent = ReplicatedStorage:WaitForChild("WarningEvent")

local fieldActive = workspace:WaitForChild("Switch")
local isInteractable = false
local gearsPlaced = workspace:WaitForChild("SocketsActivated")

local value = 0

local isInteractable = false

prompt.Triggered:Connect(function(player)
	
	
	if fieldActive.Value and gearsPlaced.Value then
		isInteractable = true
	elseif (not fieldActive.Value) and (not gearsPlaced.Value) then
			warningEvent:FireClient(player, "You need more power and gears...")
	elseif (not fieldActive.Value) then
				warningEvent:FireClient(player, "You need more power...")
	elseif (not gearsPlaced.Value) then
				warningEvent:FireClient(player, "You need more gears...")
			
	end
	
	print(player.Name .. " interacted with lever!")
	if isInteractable then
		warningEvent:FireClient(player, "Success!")
		
		while value > -5 do
			lever:TranslateBy(Vector3.new(0, -0.25, 0))
			value -= 1
			task.wait(0.05)
		end
		lever1Activated.Value = true
		isInteractable = false
		prompt.Enabled = false
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