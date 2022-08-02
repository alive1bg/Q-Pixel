Config = {}

Config.Locations = {
    ["main"] = {
        label = "Cat Cafe",
        coords = {x = -581.06, y = -1066.22, z = 22.34, h = 38.46}
    }
}

Config.ActivePayments = {}

Config.PayPerTicket = 50  --How much per ticket given at the bank

Config.ClockOutDist = 25 --25 Seems about fair, just outside the boundaries of the building

Config.PatHeal = 2 			--how much you are healed by patting a cat, 2 hp seems resonable, enough not to be over powered and enough to draw people in.
							--set to 0 if you don't want to use this

Config.Items = {
    label = "Ingredients Storage",
    slots = 20,
    items = { 
        [1] = { name = "uwuboba", price = 5, amount = 25, info = {}, type = "item", slot = 1, },
        [2] = { name = "uwublueberry", price = 5, amount = 25, info = {}, type = "item", slot = 2, },
        [3] = { name = "uwustrawberry", price = 5, amount = 25, info = {}, type = "item", slot = 3, },
        [4] = { name = "uwuvanilla", price = 5, amount = 25, info = {}, type = "item", slot = 4, },
        [5] = { name = "uwurose", price = 6, amount = 25, info = {}, type = "item", slot = 5, },
        [6] = { name = "uwumint", price = 5, amount = 25, info = {}, type = "item", slot = 6, },
        [7] = { name = "uwuorange", price = 5, amount = 25, info = {}, type = "item", slot = 7, },
        [8] = { name = "uwubread", price = 5, amount = 25, info = {}, type = "item", slot = 8, },
        [9] = { name = "uwumilk", price = 5, amount = 25, info = {}, type = "item", slot = 9, },
        [10] = { name = "uwuonion", price = 5, amount = 25, info = {}, type = "item", slot = 10, },
        [11] = { name = "uwunori", price = 5, amount = 25, info = {}, type = "item", slot = 11, },
        [12] = { name = "uwutofu", price = 5, amount = 25, info = {}, type = "item", slot = 12, },
        [13] = { name = "uwusugar", price = 5, amount = 25, info = {}, type = "item", slot = 13, },
        [14] = { name = "uwurice", price = 6, amount = 25, info = {}, type = "item", slot = 14, },
        [15] = { name = "uwuflour", price = 6, amount = 25, info = {}, type = "item", slot = 15, },
        [16] = { name = "uwueggs", price = 6, amount = 25, info = {}, type = "item", slot = 16, },
        [17] = { name = "uwutea", price = 6, amount = 25, info = {}, type = "item", slot = 17, },
        [18] = { name = "uwucheese", price = 6, amount = 25, info = {}, type = "item", slot = 18, },
        [19] = { name = "uwuham", price = 6, amount = 25, info = {}, type = "item", slot = 19, },
        [20] = { name = "uwuchocolate", price = 6, amount = 25, info = {}, type = "item", slot = 20, },

    }
}

Config.Items1 = {
    label = "Ingredients Storage",
    slots = 15,
    items = {
        [1] = { name = "uwucup", price = 0, amount = 25, info = {}, type = "item", slot = 1, },
        [2] = { name = "uwubox", price = 0, amount = 25, info = {}, type = "item", slot = 2, },
        [3] = { name = "uwusake", price = 0, amount = 25, info = {}, type = "item", slot = 3, },
        [4] = { name = "uwutoy1", price = 0, amount = 25, info = {}, type = "item", slot = 4, },
        [5] = { name = "uwutoy2", price = 0, amount = 25, info = {}, type = "item", slot = 5, },
        [6] = { name = "uwutoy3", price = 0, amount = 25, info = {}, type = "item", slot = 6, },
        [7] = { name = "uwutoy4", price = 0, amount = 25, info = {}, type = "item", slot = 7, },
    }
}

