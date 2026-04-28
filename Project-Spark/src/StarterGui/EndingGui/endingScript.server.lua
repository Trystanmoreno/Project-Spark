local frame = script.Parent:WaitForChild("CanvasGroup")
local endingGui = script.Parent

local imageLabel = frame:WaitForChild("ImageLabel")


local textLabel = frame:WaitForChild("TextLabel")

local button = frame:WaitForChild("TextButton")


local endingScenes = {"rbxassetid://124170881460969", "rbxassetid://135198536151081", "rbxassetid://93346220481080"}

local sceneTexts = {
	"Entering transmitter room ...",
	"Combining tesla coils...",
	"We did it!"
}

--door
local FinalDoor = game.Workspace:WaitForChild("FinalDoor")

--tween
local TweenService = game:GetService("TweenService")
local function fadeIn()
	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear) 
	local tween = TweenService:Create(frame, tweenInfo, {GroupTransparency = 0}) 
	tween:Play()
end


local currentSceneIndex = 1

imageLabel.Image = endingScenes[currentSceneIndex]
textLabel.Text = sceneTexts[currentSceneIndex]
--frame.GroupTransparency = 1

FinalDoor.Changed:Connect(function(newValue)
	if newValue == true then
		frame.Visible = true
	end
end)

if FinalDoor.Value == true then
	frame.Visible = true
	button.MouseButton1Click:Connect(function()
		currentSceneIndex += 1
		if currentSceneIndex <= #endingScenes then
			imageLabel.Image = endingScenes[currentSceneIndex]
			textLabel.Text = sceneTexts[currentSceneIndex]
			
		else
			imageLabel.Image = "rbxassetid://94309951267232"
			textLabel.Text = "Thank you for playing!"
			button.Visible = false
		end
	end)
end

