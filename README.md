# Badges for Absolutely Everything 

A simple Roblox project managed with Rojo where players get badges for doing basically nothing. Mostly a project to practice Luau scripting, Rojo syncing, and saving data.
PLAY THE GAME HERE : 

https://www.roblox.com/games/98010957959094/Badges-for-Absolutely-Everything

## 📁 Project Structure

* `src/ServerScriptService/Badges/` - Holds all individual server scripts for badge triggers.
* `src/ServerScriptService/Leaderboard/` - Contains the playtime data saving system.
* `assets/` - Local backups of `.rbxm` and `.gltf` files (Classic House, map walls, spawn locations, audio).
* `default.project.json` - Rojo configuration for syncing code into Studio.

##  Badges Included

| Script | Badge Name | Requirement |
| :--- | :--- | :--- |
| `WelcomeBadge.server.luau` | Welcome | Join the game |
| `Badge_1Second.server.luau` | 1 Second | Stay for 1 second |
| `Badge_5Second.server.luau` | 5 Seconds | Stay for 5 seconds |
| `Badge_10Second.server.luau` | 10 Seconds | Stay for 10 seconds |

> ⚠️ **Important:** You need to open up the badge scripts inside `src/ServerScriptService/Badges/` and replace the placeholder `BADGE_ID` constants with your actual IDs from the Roblox Creator Dashboard, or they won't award anything.

## Playtime Tracking

The `PlaytimeLeaderboard.server.luau` script handles player stats:
* **DataStore:** `PlaytimeData_V1`
* **Leaderstat:** `Playtime` (Tracks lifetime minutes)
* **Save Logic:** Autosaves every 60 seconds and saves when a player leaves the server.

##  How to Run

1. Clone the repo.
2. If you use Aftman, run `aftman install`.
3. Start the Rojo server by running `rojo serve` in your terminal.
4. Open your place file in Roblox Studio, open the Rojo plugin, and click **Connect**.

*Note: Since Rojo doesn't sync physical 3D instances back to your local files automatically, map models in the `assets/` folder have to be inserted or updated manually via Studio.*
