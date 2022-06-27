Config = Config or {}

--##Keys
Config.NoRobWeapons = {
    "WEAPON_UNARMED",
    "WEAPON_Knife",
    "WEAPON_Nightstick",
    "WEAPON_HAMMER",
    "WEAPON_Bat",
    "WEAPON_Crowbar",
    "WEAPON_Golfclub",
    "WEAPON_Bottle",
    "WEAPON_Dagger",
    "WEAPON_Hatchet",
    "WEAPON_KnuckleDuster",
    "WEAPON_Machete",
    "WEAPON_Flashlight",
    "WEAPON_SwitchBlade",
    "WEAPON_Poolcue",
    "WEAPON_Wrench",
    "WEAPON_Battleaxe",
    "WEAPON_Grenade",
    "WEAPON_StickyBomb",
    "WEAPON_ProximityMine",
    "WEAPON_BZGas",
    "WEAPON_Molotov",
    "WEAPON_FireExtinguisher",
    "WEAPON_PetrolCan",
    "WEAPON_Flare",
    "WEAPON_Ball",
    "WEAPON_Snowball",
    "WEAPON_SmokeGrenade",
    'WEAPON_KATANA',
}

--##Tuning & Degredation
Config.StoredDamages = {
    ["Bike"] = {["wheels"] = {1000.0, 1000.0}},
    ["Car"] = {["wheels"] = {1000.0, 1000.0, 1000.0, 1000.0}}
}
Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
	["electronics"] = 100,
    ["StoredDamage"] = {}
}
Config.ValuesLabels = {
    ["engine"] = "Engine",
    ["body"] = "Body",
    ["radiator"] = "Radiator",
    ["axle"] = "Axle",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel",
	["electronics"] = "Electronics"
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 12000,
        max = 50000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 50000,
        max = 150000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 150000,
        max = 2000000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}
Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Axle",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel",
}

--##Go Pros
Config.GoPros = {}