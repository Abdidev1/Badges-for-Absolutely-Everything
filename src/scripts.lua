-- Auto-synced from Roblox Studio

-- === ServerScriptService.Welcome Badge ===
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

-- === ServerScriptService.1 Second Badge ===
--!strict

-- Define the Badge ID
-- **IMPORTANT**: Replace the number below with the actual ID of your badge.
-- You can find this ID in the Creator Dashboard under your game's Badges section.
local BADGE_ID: number = 1548639773336055 -- Example: 2124403845

-- Define the required playtime in seconds
local REQUIRED_PLAYTIME: number = 1

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

-- === ServerScriptService.5 Second Badge ===
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

-- === ServerScriptService.10 Second Badge ===
--!strict

-- Define the Badge ID
-- **IMPORTANT**: Replace the number below with the actual ID of your badge.
-- You can find this ID in the Creator Dashboard under your game's Badges section.
local BADGE_ID: number = 2073096192261892 -- Example: 2124403845

-- Define the required playtime in seconds
local REQUIRED_PLAYTIME: number = 10

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

-- === ServerScriptService.Lifetime Playtime Leaderboard ===
--[[
    PlaytimeLeaderboard.lua
    Place this script directly into ServerScriptService.
    It tracks a player's cumulative (lifetime) playtime in minutes and displays it on the in-game leaderboard.
    
    UPDATE: Tracking now increments by 1 every 60 seconds (1 minute).
--]]

-- Services
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

-- Configuration
-- Define the DataStore for storing playtime.
-- IMPORTANT: Change "PlaytimeData" to a unique name for your game!
local PLAYTIME_DATASTORE = DataStoreService:GetDataStore("PlaytimeData_V1")

-- Key for Leaderboard Value (must match exactly)
local LEADERSTAT_NAME = "Playtime" -- Changed to simply "Playtime" as requested

-- Interval for updating playtime (in seconds)
local UPDATE_INTERVAL = 60 -- Value will now increment by 1 every 60 seconds (1 minute)

--- Converts seconds into a more readable HH:MM:SS format (optional, for display purposes if you want)
local function formatPlaytime(totalSeconds)
	local seconds = totalSeconds % 60
	local minutes = math.floor(totalSeconds / 60) % 60
	local hours = math.floor(totalSeconds / 3600)

	return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

-- Called when a player joins the game
local function onPlayerAdded(player)
	-- 1. Create Leaderstats Folder
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	-- 2. Create the Playtime Value
	local playtimeValue = Instance.new("IntValue")
	playtimeValue.Name = LEADERSTAT_NAME
	playtimeValue.Parent = leaderstats

	-- 3. Load Existing Playtime Data
	local success, data = pcall(function()
		-- The key is the player's unique UserID
		return PLAYTIME_DATASTORE:GetAsync(player.UserId)
	end)

	if success and data then
		-- Data successfully loaded
		-- Data is stored as whole minutes now, so we load the minutes count directly.
		playtimeValue.Value = data
		print("Playtime loaded for " .. player.Name .. ": " .. data .. " minutes.")
	else
		-- Could not load data (first time playing or error)
		playtimeValue.Value = 0
		warn("Could not load playtime data for " .. player.Name .. ". Defaulting to 0. Error: " .. tostring(data))
	end

	-- 4. Start Playtime Tracking Loop (FIXED: Increments by 1 every minute)

	local function trackPlaytime()
		while player and player.Parent do -- Loop continues as long as the player exists
			-- This pauses the thread for exactly 60 seconds (1 minute)
			task.wait(UPDATE_INTERVAL)
			-- This increments the minutes count by 1
			playtimeValue.Value = playtimeValue.Value + 1 
		end
	end

	-- Run the tracking function in a new thread
	local playtimeThread = task.spawn(trackPlaytime)

	-- Store the thread for potential future cleanup, although the loop breaks when player leaves
	player:SetAttribute("PlaytimeThread", playtimeThread)

end

-- Called when a player leaves the game
local function onPlayerRemoving(player)

	-- The loop in onPlayerAdded automatically stops/breaks when the player is removed.

	-- Check if leaderstats exist and get the value
	local leaderstats = player:FindFirstChild("leaderstats")
	local playtimeValue = leaderstats and leaderstats:FindFirstChild(LEADERSTAT_NAME)

	if playtimeValue then

		local playtime = math.floor(playtimeValue.Value) -- Playtime is already in whole minutes

		-- 2. Save the Playtime Data
		local success, err = pcall(function()
			-- SetAsync saves the total minutes played
			PLAYTIME_DATASTORE:SetAsync(player.UserId, playtime)
		end)

		if success then
			print("Successfully saved playtime for " .. player.Name .. ": " .. playtime .. " minutes.")
		else
			warn("Error saving playtime for " .. player.Name .. ". Playtime: " .. playtime .. ". Error: " .. tostring(err))
		end
	else
		warn("Could not find playtime value to save for " .. player.Name)
	end
end

-- Connect the functions to the game events
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

-- Handle players already in the game when the script starts (important for testing/fast deployment)
for _, player in ipairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end

