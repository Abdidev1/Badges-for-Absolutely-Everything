--!strict

-- Define the Badge ID
-- **IMPORTANT**: Replace the number below with the actual ID of your badge.
-- You can find this ID in the Creator Dashboard under your game's Badges section.
local BADGE_ID: number = 2948428668771851 -- Example: 2124403845

-- Define the required playtime in seconds
local REQUIRED_PLAYTIME: number = 5

-- Get the BadgeService
local BadgeService = game:GetService("BadgeService")

-- Function to handle when a player joins the game
local function onPlayerAdded(player: Player)
	-- Wait for the required playtime
	task.wait(REQUIRED_PLAYTIME)

	-- Check if the player is still in the game after waiting
	if not game.Players:FindFirstChild(player.Name) then
		-- Player left before the time was up, so we stop here.
		return
	end

	-- Check if the player already owns the badge
	local success, hasBadge = pcall(function()
		return BadgeService:UserHasBadgeAsync(player.UserId, BADGE_ID)
	end)

	if not success then
		warn("Failed to check if player already owns badge:", hasBadge)
		return
	end

	if hasBadge then
		-- print(player.Name .. " already owns the badge.")
		return
	end

	-- Award the badge
	local success, result = pcall(function()
		BadgeService:AwardBadge(player.UserId, BADGE_ID)
	end)

	if success then
		print("Successfully awarded badge " .. tostring(BADGE_ID) .. " to " .. player.Name)
	else
		warn("Failed to award badge " .. tostring(BADGE_ID) .. " to " .. player.Name .. ". Error: " .. tostring(result))
	end
end

-- Connect the function to the Players.PlayerAdded event
game.Players.PlayerAdded:Connect(onPlayerAdded)

print("Badge Script Initialized. Will award badge after " .. REQUIRED_PLAYTIME .. " seconds.")