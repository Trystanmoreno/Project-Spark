local button = script.Parent
local canvasGroup = button.parent
local TweenService = game:GetService("TweenService")
local statusLabel = canvasGroup:WaitForChild("StatusLabel")
local beginningGui = script.Parent.Parent.Parent.Parent:WaitForChild("BeginningGui")

canvasGroup.GroupTransparency = 0

local function fadeOut()
	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear) -- Duration: 2s
	local tween = TweenService:Create(canvasGroup, tweenInfo, {GroupTransparency = 1}) 
	tween:Play()
end

button.MouseButton1Click:Connect(function()
	print("The play button was clicked!")
	print("Starting the game!")
	task.wait(1)
	fadeOut()
	beginningGui.Enabled = true
	
end)

