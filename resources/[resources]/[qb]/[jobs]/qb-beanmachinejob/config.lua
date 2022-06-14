Config = {}
Config.Debug = false  -- false to remove green boxes

Config.Gabz = true -- Set to true if using Gabz legion MLO
Config.UncleJust = true -- Set to true if using Unclejust's Vinewood MLO
-- ^ These are separate from the polyzone locations below
	--Enable to add chairs and job stuff.


Config.FoodItems = {
    label = "Food Store",
    slots = 11,
    items = {
        [1] = { name = "water_bottle", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "sugar", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "chickenbreast", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "rhinohorn", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
		[6] = { name = "oystershell", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "milk", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
        [8] = { name = "cheddar", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
        [9] = { name = "flour", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
        [10] = { name = "beancoffee", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
    }
}

Config.Locations = {
    [1] = {
		zoneEnable = true,
        label = "beanlegion", -- Set this to the required job
        zones = {
		  vector2(137.44329833984, -1019.5242919922),
		  vector2(122.99235534668, -1058.451171875),
		  vector2(101.35326385498, -1048.4799804688),
		  vector2(115.27521514893, -1011.9081420898)
        },
		blip = vector3(120.27, -1038.09, 29.28),
		blipcolor = 56,
    },
	[2] = {
		zoneEnable = true,
        label = "beanvinewood", -- Set this to the required job
        zones = {
		  vector2(-649.89886474609, 259.69918823242),
		  vector2(-611.98547363281, 257.3210144043),
		  vector2(-614.646484375, 203.47846984863),
		  vector2(-649.29040527344, 203.21409606934)
        },
		blip = vector3(-629.63, 234.39, 81.88),
		blipcolor = 56,
    },
}

Crafting = {}

Crafting.Slush = {
	[1] = { ['bigfruit'] = { ['watermelon'] = 1, ['water_bottle'] = 1,	['orange'] = 1, ['sugar'] = 1, }, ["img"] = "<img src=https://i.imgur.com/Cx95xxK.png width=20px>", },
}

Crafting.Drinks = {
	[1] = { ['highnoon'] = { ['beancoffee'] = 1, ['water_bottle'] = 1, ['orange'] = 1, }, ["img"] = "<img src=https://i.imgur.com/6QHx5GY.png width=25px>", },
	[2] = { ['speedball'] = { ['beancoffee'] = 3, ['sugar'] = 1, }, ["img"] = "<img src=https://i.imgur.com/PnHHGXq.png width=25px>", },
	[3] = { ['gunkaccino'] = { ['beancoffee'] = 1, ['sugar'] = 2, ['cheesecake'] = 1, }, ["img"] = "<img src=https://i.imgur.com/zUfbxMq.png width=25px>",},
	[4] = { ['bratte'] = { ['beancoffee'] = 2, ['sugar'] = 5, }, ["img"] = "<img src=https://i.imgur.com/r1s9nNw.png width=25px>", },
	[5] = { ['flusher'] = { ['beancoffee'] = 1, ['water_bottle'] = 1, ['orange'] = 1, ['chickenbreast'] = 1, }, ["img"] = "<img src=https://i.imgur.com/XvDxsz6.png width=25px>", },
	[6] = {	['ecocoffee'] = { ['beancoffee'] = 1, ['water_bottle'] = 1,	['milk'] = 1, ['plastic'] = 1, }, ["img"] = "<img src=https://i.imgur.com/LN6E8uJ.png width=25px>", },
	[7] = {	['caffeagra'] = { ['beancoffee'] = 1, ['rhinohorn'] = 2, ['oystershell'] = 1, }, ["img"] = "<img src=https://i.imgur.com/vfTfEsF.png width=25px>", },
}

