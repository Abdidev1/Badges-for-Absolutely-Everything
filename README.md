# 🎮 Badges-for-Absolutely-Everything

Dive into the world where literally everything earns you a badge! Badges for Absolutely Everything is the game designed to satisfy your craving for achievements. From the simplest actions to the most bizarre exploits, every moment counts, and every action is rewarded.

---

## 📁 Project Structure

```
.
├── src/
│   ├── ServerScriptService/
│   │   ├── Badges/                   # Badge award scripts (server-side)
│   │   │   ├── WelcomeBadge.server.luau
│   │   │   ├── Badge_1Second.server.luau
│   │   │   ├── Badge_5Second.server.luau
│   │   │   └── Badge_10Second.server.luau
│   │   └── Leaderboard/              # Leaderboard / DataStore scripts
│   │       └── PlaytimeLeaderboard.server.luau
│   ├── StarterPlayer/                # Client-side player scripts
│   └── ReplicatedStorage/            # Shared modules / remotes
├── assets/
│   ├── models/                       # .rbxm and .gltf model files
│   │   ├── Classic_House.rbxm
│   │   ├── Parts.rbxm
│   │   ├── walls.rbxm
│   │   ├── Spawn_Location.rbxm
│   │   └── Export.gltf
│   └── audio/                        # Sound assets
│       └── Sound.rbxm
├── docs/                             # Design notes, badge IDs, changelogs
├── default.project.json              # Rojo sync configuration
└── .gitignore
```

---

## 🚀 Getting Started

### Prerequisites

- [Roblox Studio](https://www.roblox.com/create)
- [Rojo](https://rojo.space/) (for live-syncing code from VS Code → Studio)

### Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
   cd YOUR_REPO
   ```

2. Install Rojo (if you haven't):
   ```bash
   aftman install   # if using aftman toolchain manager
   # or download from https://github.com/rojo-rbx/rojo/releases
   ```

3. Start the Rojo server:
   ```bash
   rojo serve
   ```

4. In Roblox Studio, open the **Rojo plugin** and connect to `localhost:34872`.

---

## 🏅 Badges

| Script | Badge | Requirement |
|---|---|---|
| `WelcomeBadge.server.luau` | Welcome | Join the game |
| `Badge_1Second.server.luau` | 1 Second | Stay for 1 second |
| `Badge_5Second.server.luau` | 5 Seconds | Stay for 5 seconds |
| `Badge_10Second.server.luau` | 10 Seconds | Stay for 10 seconds |

> ⚠️ Update `BADGE_ID` constants in each script with your real badge IDs from the Creator Dashboard.

---

## 📊 Leaderboard

`PlaytimeLeaderboard.server.luau` tracks each player's **lifetime playtime in minutes** using a `DataStore`. Playtime is saved on player leave and loaded on join.

- DataStore key: `PlaytimeData_V1`
- Leaderstat name: `Playtime`
- Update interval: every 60 seconds

---

## 🗺️ Assets

Model files (`.rbxm`) are stored under `assets/` and should be inserted into the place manually via Studio's **Asset Manager** or **Insert from File**. They are version-controlled here for reference and backup.

---

## 📝 Contributing

1. Create a branch: `git checkout -b feature/your-feature`
2. Make your changes and test in Studio
3. Commit: `git commit -m "feat: describe your change"`
4. Push and open a Pull Request

---

