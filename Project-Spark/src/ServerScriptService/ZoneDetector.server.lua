-- Player assignment script
local players = game:GetService("Players")
local player1 = nil
local player2 = nil
local radius = 6

local switch = Instance.new("BoolValue")
switch.Name = "Switch"
switch.Value = false
switch.Parent = game.Workspace

local function hookCharacter(player)
	player.CharacterAdded:Connect(function()
		
	end)
end

local function createField(size)
	local field = Instance.new("Part")
	field.Shape = Enum.PartType.Cylinder
	field.Size = Vector3.new(0.2, size*radius, size*radius)
	field.Anchored = true
	field.CanCollide = false
	field.Material = Enum.Material.Neon
	field.Transparency = 1
	field.Parent = workspace
	return field
end

local function playerField(player)
	
end

game.Players.PlayerAdded:Connect(function(player)
	if player1 == nil then 
		player1 = player
		hookCharacter(player1)
		player:SetAttribute("Role", "Player1")
		print(player.Name .. " is player1")
	else 
		player2 = player
		hookCharacter(player2)
		player:SetAttribute("Role", "Player2")
		print(player.Name .. " is player2")
	end
end)

--field creation
	mainField = createField(2)
	p1Field = createField(1)
	p2Field = createField(1)
	
	p1Field.Color = Color3.new(0.117647, 0.533333, 0.898039)--kim this is blue
	p2Field.Color = Color3.new(1, 0.756863, 0.027451) -- this is yellow orange
	mainField.Color = Color3.new(0, 1, 0)
while true do
	task.wait()
	
	
	--field activation
	if not (player1 and player2) then continue end

	local char1 = player1.Character
	local char2 = player2.Character
	if not (char1 and char2) then continue end

	local hrp1 = char1:FindFirstChild("HumanoidRootPart")
	local hrp2 = char2:FindFirstChild("HumanoidRootPart")
	
	if not (hrp1 and hrp2) then continue end
	
	local midpoint = (hrp1.Position + hrp2.Position)/2
	midpoint = Vector3.new(midpoint.X, midpoint.Y-2, midpoint.Z)
	
	local activationDis = (hrp1.Position - hrp2.Position).Magnitude
	
	local state = activationDis < radius
	switch.Value = state
	print("Value of Switch: " .. tostring(switch.Value))
	
--field position
	mainField.CFrame = CFrame.new(midpoint) * CFrame.Angles(0, 0, math.rad(90))
	p1Field.CFrame = CFrame.new(hrp1.Position.X, hrp1.Position.Y-2, hrp1.Position.Z) * CFrame.Angles(0, 0, math.rad(90))
	p2Field.CFrame = CFrame.new(hrp2.Position.X, hrp2.Position.Y-2, hrp2.Position.Z) * CFrame.Angles(0, 0, math.rad(90))
	
	if state then
		mainField.Transparency = 0.8
		p1Field.Transparency = 1
		p2Field.Transparency = 1
	else
		mainField.Transparency = 1.0
		p1Field.Transparency = 0.8
		p2Field.Transparency = 0.8
	end
end



