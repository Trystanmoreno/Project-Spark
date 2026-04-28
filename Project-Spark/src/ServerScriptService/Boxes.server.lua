local factory = workspace:WaitForChild("Factory")

for _, obj in pairs(factory:GetChildren()) do
	if obj.Name == "box" and obj:IsA("BasePart") then
		obj.Anchored = false
		obj.CustomPhysicalProperties = PhysicalProperties.new(0.1, 0.05, 0.1)
	end
end

local s1 = factory:WaitForChild("s_box1")
local s2 = factory:WaitForChild("s_box2")
local s3 = factory:WaitForChild("s_box3")

local function activateSocket(socket)
	socket:SetAttribute("IsActive", true)
	socket.Transparency = 0
	socket.CanCollide = true
end

local function deactivateSocket(socket)
	socket:SetAttribute("IsActive", false)
	socket.Transparency = 1
	socket.CanCollide = false
end

local function snapBox(box, socket, nextSocket)

	box.CFrame = socket.CFrame
	box.Anchored = true
	box.AssemblyLinearVelocity = Vector3.new(0,0,0)
	box.AssemblyAngularVelocity = Vector3.new(0,0,0)

	socket:SetAttribute("IsActive", false)

	if nextSocket then
		activateSocket(nextSocket)
	end
end

local function hookSocket(socket, nextSocket)

	socket.Touched:Connect(function(hit)
		if not socket:GetAttribute("IsActive") then return end
		if hit.Name ~= "box" then return end

		snapBox(hit, socket, nextSocket)
	end)
end


activateSocket(s1)
deactivateSocket(s2)
deactivateSocket(s3)

hookSocket(s1, s2)
hookSocket(s2, s3)
hookSocket(s3, nil)