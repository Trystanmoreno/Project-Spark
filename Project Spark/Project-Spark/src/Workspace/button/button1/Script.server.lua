local button1 = script.Parent
local clickdetector = script.Parent.ClickDetector

clickdetector.MouseHoverEnter:Connect(function(player)
	clickdetector.MouseClick:Connect(function(player)
		button1.Transparency = 1
	end)
end)

clickdetector.MouseHoverLeave:Connect(function(player)
	button1.Transparency = 0
end)


