-- Configuration
local BADGE_ID = 1606536658434839 -- REPLACE this with your actual Badge ID!

-- Services
local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")

-- Game ID (obtained automatically from the DataModel)
local GAME_ID = game.GameId

-- Function to award the badge
local function awardWelcomeBadge(player)
	-- Check if the player already owns the badge
	local success, ownsBadge = pcall(function()
		return BadgeService:UserHasBadgeAsync(player.UserId, BADGE_ID)
	end)

	if not success then
		warn("BadgeService:UserHasBadgeAsync failed for player: " .. player.Name .. " Error: " .. ownsBadge)
		return
	end

	if ownsBadge then
		-- Player already has the badge, no action needed
		print(player.Name .. " already owns the Welcome Badge.")
		return
	end

	-- Attempt to award the badge
	local success, result = pcall(function()
		return BadgeService:AwardBadge(player.UserId, BADGE_ID)
	end)

	if success and result == true then
		print("Successfully awarded the Welcome Badge to: " .. player.Name)
	elseif success and result == false then
		-- This usually means the badge is already owned, but it's good to check
		print("Could not award badge to " .. player.Name .. ". Badge might be disabled or already owned.")
	else
		warn("Failed to award the Welcome Badge to " .. player.Name .. ". Error: " .. result)
	end
end

-- Connect the function to run every time a player joins the game
Players.PlayerAdded:Connect(awardWelcomeBadge)

print("Welcome Badge Script Initialized. Targeting Badge ID: " .. BADGE_ID)