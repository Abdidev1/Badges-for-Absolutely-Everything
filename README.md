🎮 Badges for Absolutely EverythingA Roblox game built using Rojo where players earn badges for doing literally anything, from joining the server to just standing still. This repository contains the source code, server scripts, and tracked assets.📁 Project Structure.
├── src/
│   ├── ServerScriptService/
│   │   ├── Badges/                   # Server-side badge awarding logic
│   │   │   ├── WelcomeBadge.server.luau
│   │   │   ├── Badge_1Second.server.luau
│   │   │   ├── Badge_5Second.server.luau
│   │   │   └── Badge_10Second.server.luau
│   │   └── Leaderboard/              # Playtime tracking & DataStores
│   │       └── PlaytimeLeaderboard.server.luau
│   ├── StarterPlayer/
│   └── ReplicatedStorage/
├── assets/
│   ├── models/                       # Map and geometry backups
│   │   ├── Classic_House.rbxm
│   │   ├── Parts.rbxm
│   │   ├── walls.rbxm
│   │   ├── Spawn_Location.rbxm
│   │   └── Export.gltf
│   └── audio/                        # Sound assets
│       └── Sound.rbxm
├── docs/                             # Design notes & changelogs
├── default.project.json              # Rojo sync config
└── .gitignore
🚀 Setting Up (Rojo)Clone the repository:Bashgit clone https://github.com/Abdi-01/Badges-for-Absolutely-Everything.git
cd Badges-for-Absolutely-Everything
2. Install dependencies and start the Rojo server:
   ```bash
   aftman install
   rojo serve
Open Roblox Studio, open the Rojo plugin, and hit Connect (localhost:34872).🏅 Implemented BadgesScriptBadge NameRequirementWelcomeBadge.server.luauWelcomeJoin the gameBadge_1Second.server.luau1 SecondStay in-game for 1 secondBadge_5Second.server.luau5 SecondsStay in-game for 5 secondsBadge_10Second.server.luau10 SecondsStay in-game for 10 seconds⚠️ Note: You must replace the BADGE_ID constants in each script with your actual asset IDs from the Creator Dashboard for the rewards to fire.📊 Leaderboard & DataStorePlaytime tracking is handled by PlaytimeLeaderboard.server.luau:DataStore Key: PlaytimeData_V1Stat Name: Playtime (Tracks lifetime minutes)Save Interval: Autosaves every 60 seconds and triggers safely on PlayerRemoving.🗺️ Handling AssetsModel files (.rbxm) are version-controlled in the assets/ directory for backup purposes. Because Rojo doesn't sync physical instance changes back to disk automatically, any updates to the map geometry must be manually exported from Studio or inserted via the Asset Manager.
