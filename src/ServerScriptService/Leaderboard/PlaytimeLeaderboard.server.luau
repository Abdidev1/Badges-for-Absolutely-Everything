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