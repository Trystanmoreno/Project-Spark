local frame = script.Parent:WaitForChild("CanvasGroup")

local imageLabel = frame:WaitForChild("ImageLabel")


local textLabel = frame:WaitForChild("TextLabel")

local button = frame:WaitForChild("TextButton")


local beginningScenes = {"rbxassetid://120069720555368", "rbxassetid://129544679392299", "rbxassetid://105711655971169", "rbxassetid://83319049722191", "rbxassetid://103508444531894"}

local sceneTexts = {
	"In a world of greedy billionaires hoarding electricity,",
	"Electric power became a luxury good 99.9% of the population can't afford.",
	"As scientists thrown out by the very billionaires that once hired them,",
	"You both set out to your abandoned factory...",
	"To rebuild the prototype you once worked on, in an effort to decapitalize electricity!"
}

--tween
local TweenService = game:GetService("TweenService")
local function fadeOut()
	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear) -- Duration: 2s
	local tween = TweenService:Create(frame, tweenInfo, {GroupTransparency = 1}) 
	tween:Play()
end


local currentSceneIndex = 1

imageLabel.Image = beginningScenes[currentSceneIndex]
textLabel.Text = sceneTexts[currentSceneIndex]

button.MouseButton1Click:Connect(function()

	currentSceneIndex += 1

	-- Check if we still have scenes left to show
	if currentSceneIndex <= #beginningScenes then
		-- Update the image and text to the new index
		imageLabel.Image = beginningScenes[currentSceneIndex]
		textLabel.Text = sceneTexts[currentSceneIndex]
	else
		-- If the index goes past 4, the cutscene is over
		task.wait(1)
		fadeOut()
	end
end)