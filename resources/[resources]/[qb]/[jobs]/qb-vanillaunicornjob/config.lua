

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {}

Config.Locations = { ["main"] = { label = "Vanilla Unicorn", coords = vector3(111.05, -1287.96, 28.26) } }

Config.ClockOutDist = 35 --25 Seems about fair, just outside the boundaries of the building

Config.MLO = "van" --Set to "van" for the default interior
				   --Set to "gabz" for Gabz VU interior

Config.DrinkItems = {
    label = "Drinks Store",
    slots = 18,
    items = {
        [1] = { name = "cranberry", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "gin", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "rum", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "amaretto", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
        [6] = { name = "midori", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "pinejuice", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
        [8] = { name = "prosecco", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
        [9] = { name = "tequila", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
        [10] = { name = "triplsec", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
		[11] = { name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
        [12] = { name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
        [13] = { name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
        [14] = { name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
        [15] = { name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 15, },
        [16] = { name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 16, },
        [17] = { name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 17, },
        [18] = { name = "lemon", price = 0, amount = 50, info = {}, type = "item", slot = 18, },
    }
}

Config.FoodItems = {
    label = "Food Fridge Store",
    slots = 14,
    items = {
        [1] = { name = "meat", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "nachos", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "potato", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "lettuce", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "cheddar", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
        [6] = { name = "chocolate", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
		[7] = { name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
        [8] = { name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
        [9] = { name = "lemon", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
        [10] = { name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
        [11] = { name = "cubasil", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
        [12] = { name = "mintleaf", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
        [13] = { name = "peach", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
        [14] = { name = "strawberry", price = 0, amount = 50, info = {}, type = "item", slot = 15, },
    }
}

Crafting = {}
Crafting.Cocktails = {
	[1] = {
		['amarettosour'] = {
				['amaretto'] = 1,
				['lemon'] = 1,
		}
	},
	[2] = {
		['bellini'] = {
				['prosecco'] = 1,
				['peach'] = 1,
		}
	},
	[3] = {
		['cosmopolitan'] = {
				['vodka'] = 1,
				['orange'] = 1,
				['cranberry'] = 1,
				['cubasil'] = 1,
		}
	},
	[4] = {
		['longisland'] = {
				['gin'] = 1,
				['tequila'] = 1,
				['vodka'] = 1,
				['ecola'] = 1,
				['lemon'] = 1,
		}
	},
	[5] = {
		['margarita'] = {
				['tequila'] = 1,
				['lime'] = 1,
				['orange'] = 1,
		}
	},
	[6] = {
		['pinacolada'] = {
				['rum'] = 1,
				['pinejuice'] = 1,
		}
	},
	[7] = {
		['sangria'] = {
				['prosecco'] = 1,
				['sprunk'] = 1,
				['orange'] = 1,
				['mintleaf'] = 1,
		}
	},
	[8] = {
		['screwdriver'] = {
				['vodka'] = 1,
				['orange'] = 1,
		}
	},
	[9] = {
		['strawdaquiri'] = {
				['rum'] = 1,
				['lime'] = 1,
		}
	},
	[10] = {
		['strawmargarita'] = {
				['tequila'] = 1,
				['strawberry'] = 1,
		}
	},
}

Crafting.Food = {
	[1] = { ['vusliders'] = { ['meat'] = 1,	['lettuce'] = 1, } },
	[2] = { ['vutacos'] = { ['meat'] = 1, ['lettuce'] = 1, } },	
	[3] = {	['nplate'] = { ['nachos'] = 1, ['cheddar'] = 1, } },
	[4] = {	['tots'] = { ['potato'] = 1, } },
}