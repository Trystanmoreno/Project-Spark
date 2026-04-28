local lever2 = workspace:WaitForChild("Lever2Activated")
local lever3 = workspace:WaitForChild("Lever3Activated")
local stairs = script.Parent

local function setStairs(active)
	for _, obj in ipairs(stairs:GetDescendants()) do
		if obj:IsA("BasePart")  then
			obj.Transparency = active and 0 or 0.8
			obj.CanCollide = active
			
		elseif obj:IsA("Decal") or obj:IsA("Texture") then
			obj.Transparency = active and 0 or 0.8
		end
	end
end

local function checkLevers()
	if lever2.Value and lever3.Value then
		setStairs(true)
	else
		setStairs(false)
	end
end

lever2:GetPropertyChangedSignal("Value"):Connect(checkLevers)
lever3:GetPropertyChangedSignal("Value"):Connect(checkLevers)

checkLevers()


