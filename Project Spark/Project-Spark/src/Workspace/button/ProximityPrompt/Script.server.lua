local prompt = script.Parent
local ButtonOn = Instance.new("BoolValue")
local button = script.Parent.Parent:WaitForChild("button1")
ButtonOn.Name = "ButtonOn"
ButtonOn.Value = false
ButtonOn.Parent = game.Workspace

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local warningEvent = ReplicatedStorage:WaitForChild("WarningEvent")

prompt.Triggered:Connect(function(player)
	local switch = game.Workspace:WaitForChild("Switch")
	if switch.Value == true then
		prompt.Enabled = false
		ButtonOn.Value = true
		button.Color = Color3.new(0, 1, 0)
		
	elseif switch.Value == false then
		warningEvent:FireClient(player, "You need more power")
	end
	
end)

