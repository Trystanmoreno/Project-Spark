local leverActive = workspace:WaitForChild("Lever1Activated")
local value = 0

--local testactive = true
	--if testactive == true then
leverActive:GetPropertyChangedSignal("Value"):Connect(function()
	if leverActive.Value then
		while value < 24 do
			script.Parent.Parent:TranslateBy(Vector3.new(0, 0, -0.25))
			value += 1
			task.wait(0.05)
		end
	end
end)


