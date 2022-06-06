Made by Lionh34rt#4305
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Description
My attempt of the Doomsday DLC Server room VAR Heist. Up to 6 players can connect via their VAR Helmets and the master dock can start the heist.
Inside are a set of hacks that need to be completed, players first hack upstairs computers to receive a server location. At the specific server players can acquire the password that needs to be submitted in the upstair computers. Hacks get progressively harder. Guards spawn in waves. These guards can be looted when dead.

Features:
- Source code: No FiveM asset encryption
- qb-target implemented
- low ms (0.00)
- Server synced
- Guards spawn server sided (no onesync scope issues)
- Looting guards
- UI included (Server Location, Submit Password, VAR Hack Minigame)
- Contraband removed (weaponry, .. configurable)
- Full heist reset + guards despawn
- Med kits that allow reviving other players

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [qb-target](https://github.com/BerkieBb/qb-target)
* [var-headset](https://www.gta5-mods.com/player/oculus-rift-cv1-eup) -- Technically optional
* [varhack](https://github.com/JoeSzymkowiczFiveM/varhack) -- Heavily edited

# Installation
* *Add the items to your shared.lua*
* *Install all the dependencies*
* *You should use the enter and exit events in other scripts to disable things like shooting alerts for police*
* *Customise the settings to your likings - loot, confiscated items, difficulty, ...*

# Items for shared
```lua
["var_helmet"] 			 		= {["name"] = "var_helmet", 					["label"] = "VAR Helmet", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "var_helmet.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "VAR Helmet"},
["var_medkit"] 			 		= {["name"] = "var_medkit", 					["label"] = "CPR Medical Kit", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "firstaid.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "VAR CPR Kit"},
["var_usb1"] 			 		= {["name"] = "var_usb1", 						["label"] = "Master Key (25%)", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "var_usb.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Combine multiple USBs to create a master encryption key."},
["var_usb2"] 			 		= {["name"] = "var_usb2", 						["label"] = "Master Key (25%)", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "var_usb.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Combine multiple USBs to create a master encryption key."},
["var_usb3"] 			 		= {["name"] = "var_usb3", 						["label"] = "Master Key (25%)", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "var_usb.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Combine multiple USBs to create a master encryption key."},
["var_usb4"] 			 		= {["name"] = "var_usb4", 						["label"] = "Master Key (25%)", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "var_usb.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Combine multiple USBs to create a master encryption key."},
["var_usb5"] 			 		= {["name"] = "var_usb5", 						["label"] = "Master Key (100%)", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "var_usb.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Master Key to access encrypted data."},
```

# Logs entry:
['varheist'] = {your-webhook-here},

# Trigger for a player to leave the VAR Environment
Since you can't use radialmenu when you are dead and the option is always available I created a simple 'var_exit' command that can be typed in console to exit the the VAR
If you wish to add a trigger in another script to leave the var you can use the following:

* *Client Side: Trigger from a client*
- TriggerServerEvent('qb-varheist:server:VarExit')

* *Server Side: Trigger from server side*
- TriggerEvent('qb-varheist:server:VarExit', source)