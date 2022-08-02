-- Add these to qb-core/shared/items.lua

["bottlemessage"] = {
	["name"] = "bottlemessage",
	["label"] = "Old Bottle",
	["weight"] = 2000,
	["type"] = "item",
	["image"] = "bottlemessage.png",
	["unique"] = false,
	["useable"] = true,
	["shouldClose"] = true,
	["combinable"] = nil,
	["description"] = "Looks like something is inside!"
},
["message"] = {
	["name"] = "message",
	["label"] = "Scrumpled Paper",
	["weight"] = 500,
	["type"] = "item",
	["image"] = "message.png",
	["unique"] = false,
	["useable"] = true,
	["shouldClose"] = true,
	["combinable"] = nil,
	["description"] = "It's a map with an X.."
},

-- [images] folder. Add these to qb-inventory\html\images (or whatever inventory you use)

--Dependencies: rprogress [https://github.com/Mobius1/rprogress] (If you convert it to qbcore's progress bars, you won't need to add this)
 