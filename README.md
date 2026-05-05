# SellAllGoods

[Windrose Mod] A UE4SS Lua mod for Windrose that sells all available items to a buyer NPC in a single keypress **G**.
Works with all buyer NPC factions: Smugglers of Port Royal, Brethren of the Coast, Buccaneers, and People of Tortuga.

## Requirements

- [UE4SS for Windrose](https://www.nexusmods.com/windrose/mods/43)

## Installation

1. Download `SellAllGoods.zip` from [Releases](../../releases)
2. Extract the `SellAllGoods` folder into:
   ```
   Windrose\R5\Binaries\Win64\ue4ss\Mods\
   ```
   Result should look like:
   ```
   ue4ss\Mods\SellAllGoods\
   ├── enabled.txt
   └── scripts\
       └── main.lua
   ```
3. Open `ue4ss\Mods\mods.txt` and add `SellAllGoods : 1` after the mod list but before the built-in keybinds section:
   ```
   CheatManagerEnablerMod : 1
   ConsoleCommandsMod : 1
   ...
   SellAllGoods : 1

   ; Built-in keybinds, do not move up!
   Keybinds : 1
   ```
4. Launch the game and open a sell screen with any buyer NPC
5. Press **G** to sell all

## Notes

- Only works while the buyer sell screen is open — pressing G elsewhere does nothing
- Currently singleplayer only (multiplayer support planned)
- The default keybind is **G** — hardcoded for now, configurable keybind coming in a future update

## Changelog

### v1.0.0
- Initial release
- Sell all available items to any buyer NPC faction
