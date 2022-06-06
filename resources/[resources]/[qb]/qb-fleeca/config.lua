Config = {}
Config.timer = 30 -- countdown to secure lock in seconds (time needed to pass to door to be closed back)

Config.maxcash = 85 -- maxium amount of bills reward after tray has been grabbed
Config.mincash = 50 -- minimum amount of bills reward after tray has been grabbed
Config.secondtrolley = 50 -- procent chance for the second trolley to spawn
Config.discardItems = true -- if player should get some cash after grabbing money
Config.minDiscardCash = 8000 -- max player should get some straight cash after grabbing money
Config.maxDiscardCash = 10000 -- min player should get some straight cash after grabbing money
Config.debugPoly = false -- if polyzones should show

Config.laptopPrice = 10000
Config.laptopbreak = 25 -- procent chance for the laptop to break 
Config.laptopItem = "greenlaptop"

Config.vaultdoor = "v_ilev_gb_vauldr"
Config.door = "v_ilev_gb_vaubar"
Config.office = "v_ilev_gb_teldr"
Config.vaultOpenTime = 5 -- seconds for the actual vault door to open
Config.bagnumber = 87 -- the number for the bag after money has ben grabbed
Config.vaultclose = 240 -- how long for the vault door to close after the hack (seconds)
Config.mincops = 2 -- minium cops
Config.cooldown = 14400 -- cooldown for the heists

Config.Banks = {
    F1 = {
        doors = {
            startloc = {x = 310.93, y = -284.44, z = 54.16, h = -90.00},
        },

        animation = {x = 311.55, y = -283.85, z = 54.01, h = 205.54},
        trolley1 = {x = 313.45, y = -289.24, z = 53.14, h = -15},
        trolley2 = {x = 311.51, y = -288.54, z = 53.14, h = -15},
        objects = {
            vector3(313.45, -289.24, 53.14),
            vector3(311.51, -288.54, 53.14),
            vector3(314.49, -283.65, 53.14)
        },
        available = true,
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F2 = {
        doors = {
            startloc = {x = 146.61, y = -1046.02, z = 29.37, h = 244.20},
        },

        animation = {x = 147.92, y = -1046.848, z = 30.00, h = 205.54},
        trolley1 = {x = 147.25, y = -1050.38, z = 28.35, h = -15},
        trolley2 = {x = 149.21, y = -1051.07, z = 28.35, h = -15},
        objects = {
            vector3(147.25, -1050.38, 28.35),
            vector3(149.21, -1051.07, 28.35),
            vector3(150.23, -1045.40, 28.35)
        },
        available = true,
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F3 = {
        doors = {
            startloc = {x = -1211.07, y = -336.68, z = 37.78, h = 296.76}, 
        },

        animation = {x = -1210.50, y = -336.15, z = 37.41, h = 205.54},
        trolley1 = {x = -1207.50, y = -339.20, z = 36.76, h = 30},
        trolley2 = {x = -1205.61, y = -338.24, z = 36.76, h = 30},
        objects = {
            vector3(-1207.50, -339.20, 36.76),
            vector3(-1205.61, -338.24, 36.76),
            vector3(-1209.10, -333.59, 36.76)
        },
        available = true,
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F4 = {
        hash = 4231427725,
        doors = {
            startloc = {x = -2956.68, y = 481.34, z = 15.70, h = 353.97},
        },

        animation = {x = -2956.25, y = 482.10, z = 15.28, h = 205.54},
        trolley1 = {x = -2952.69, y = 483.34, z = 14.68, h = 85},
        trolley2 = {x = -2952.57, y = 485.18, z = 14.68, h = 85},
        objects = {
            vector3(-2952.69, 483.34, 14.68),
            vector3(-2952.57, 485.18, 14.68),
            vector3(-2958.35, 484.69, 14.68)
        },
        available = true,
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F5 = {
        doors = {
            startloc = {x = -354.15, y = -55.11, z = 49.04, h = 251.05},
        },

        animation = {x = -354.15, y = -55.11, z = 49.84, h = 205.54},
        trolley1 = {x = -353.34, y = -59.48, z = 48.01, h = -15},
        trolley2 = {x = -351.57, y = -60.09, z = 48.01, h = -15},
        objects = {
            vector3(-353.34, -59.48, 48.01),
            vector3(-351.57, -60.09, 48.01),
            vector3(-350.57, -54.45, 48.01)
        },
        available = true,
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F6 = {
        doors = {
            startloc = {x = 1176.40, y = 2712.75, z = 38.09, h = 84.83},
        },

        animation = {x = 1175.23, y = 2712.98, z = 39.29, h = 205.54},
        trolley1 = {x = 1174.24, y = 2716.69, z = 37.07, h = -180},
        trolley2 = {x = 1172.27, y = 2716.67, z = 37.07, h = -180},
        objects = {
            vector3(1174.24, 2716.69, 37.07),
            vector3(1172.27, 2716.67, 37.07),
            vector3(1173.23, 2711.02, 37.07)
        },
        available = true,
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    }
}