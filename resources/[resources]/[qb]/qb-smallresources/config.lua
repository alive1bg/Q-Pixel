Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = true
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- carwash
Config.DirtLevel = 0.1 --carwash dirt level
Config.RagdollChance = 1
Config.densityMultipliers = {}

ConsumeablesEat = {
    ["sandwich"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["bmochi"] = math.random(30, 40),
    ["pmochi"] = math.random(40, 50),
    ["gmochi"] = math.random(40, 50),
    ["omochi"] = math.random(40, 50),
    ["bento"] = math.random(40, 50),
    ["riceball"] = math.random(40, 50),
    ["miso"] = math.random(40, 50),
    ["cake"] = math.random(40, 50),
    ["nekocookie"] = math.random(40, 50),
    ["nekodonut"] = math.random(40, 50),
    ["rice"] = math.random(30, 40),
    ["blueberry"] = math.random(30, 40),
    ["strawberry"] = math.random(30, 40),
    ["orange"] = math.random(30, 40),
}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    ["nekolatte"] = math.random(20, 40),
    ["bobatea"] = math.random(20, 40),
    ["bbobatea"] = math.random(20, 40),
    ["gbobatea"] = math.random(20, 40),
    ["obobatea"] = math.random(20, 40),
    ["pbobatea"] = math.random(20, 40),
    ["milk"] = math.random(20, 40),
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["sake"] = math.random(20, 40),
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
    }
}

Config.BlacklistedVehs = {
    ['SHAMAL'] = true,
    ['JET'] = true,
    ['LAZER'] = true,
    ['BUZZARD'] = true,
    ['BUZZARD2'] = true,
    ['ANNIHILATOR'] = true,
    ['SAVAGE'] = true,
    ['TITAN'] = true,
    ['RHINO'] = true,
    ['FIRETRUK'] = true,
    ['MULE'] = true,
    ['MAVERICK'] = true,
    ['BLIMP'] = true,
    ['AIRTUG'] = true,
    ['CAMPER'] = true,
    ['HYDRA'] = true,
    ['OPPRESSOR'] = true,
    ['technical3'] = true,
    ['insurgent3'] = true,
    ['apc'] = true,
    ['tampa3'] = true,
    ['trailersmall2'] = true,
    ['halftrack'] = true,
    ['hunter'] = true,
    ['vigilante'] = true,
    ['akula'] = true,
    ['barrage'] = true,
    ['khanjali'] = true,
    ['caracara'] = true,
    ['blimp3'] = true,
    ['menacer'] = true,
    ['oppressor2'] = true,
    ['scramjet'] = true,
    ['strikeforce'] = true,
    ['cerberus'] = true,
    ['cerberus2'] = true,
    ['cerberus3'] = true,
    ['scarab'] = true,
    ['scarab2'] = true,
    ['scarab3'] = true,
    ['rrocket'] = true,
    ['ruiner2'] = true,
    ['BESRA'] = true,
    ['stromberg'] = true,
    ['cargoplane'] = true,
    ['voltic2'] = true,
    ['Toreador'] = true,
    ['Kosatka'] = true,
    ['technical2'] = true,
    ['technical'] = true,
    ['alkonost'] = true,
    ['chernobog'] = true,
    ['annihilator2'] = true,
    ['minitank'] = true,
    ['bombushka'] = true,
    ['volatol'] = true,
    ['tuga'] = true,
    ['tug'] = true,
    ['patrolboat'] = true,
    ['valkyrie'] = true,
}

Config.BlacklistedPeds = {
    ['s_m_y_ranger_01'] = true,
    ['s_m_y_sheriff_01'] = true,
    ['s_m_y_cop_01'] = true,
    ['s_f_y_sheriff_01'] = true,
    ['s_f_y_cop_01'] = true,
    ['s_m_y_hwaycop_01'] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    --Coke Processing Enter/Exit
    [2] = {
        [1] = {
            coords = vector4(909.49, -1589.22, 30.51, 92.24),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Coke Processing'
        },
        [2] = {
            coords = vector4(1088.81, -3187.57, -38.99, 181.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [6] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}

------------PURSUIT MODE----------------------------
Config.DefaultKey = 'N'

Config.SlowdownOnSwitch = true
Config.SlowdownPercentage = 0.2 -- 0.2 => 20%

Config.PlaySoundOnSwitch = true

Config.PlayServerSyncedSound = true -- server synced sounds can be heard by other players, disable if you cannot hear the sounds at higher speeds or mess with the distance settings below
Config.MaxSoundDistance = 3.0 -- Server Synced only, and no volume falloff
Config.MaxSoundDistanceAtMediumSpeeds = 5.0 -- Do not touch if you don't know what you're doing!
Config.MaxSoundDistanceAtHighSpeeds = 10.0 -- Do not touch if you don't know what you're doing!

Config.SoundFile = 'beep-sound-1' -- file name without the .ogg (located in /resources/[standalone]/interact-sound/client/html/sounds/)
Config.SoundVolume = 0.05

Config.SwitchNotification = "Changed mode to %s" -- %s will be replaced with the vehicle mode, e.g. S+

Config.AuthorizedJobs = { -- empty => everyone can use it
    "police",
    "ambulance",
}

Config.VehicleModes = { -- If you define a new mode, you will have to add a new Vehicle Modification and a new mode for EVERY vehicle defined in Config.VehiclesConfig!
    "A",
    "A+",
    "S",
    "S+"
}

Config.VehicleModifications = {
    ["A"] = {
        ["Turbo"] = false,
        ["XenonHeadlights"] = false,
        ["Engine"] = -1,
        ["Brakes"] = -1,
        ["Transmission"] = -1,
        ["Suspension"] = -1,
        ["Armor"] = -1,
        ["XenonHeadlightsColor"] = 0,
    },
    ["A+"] = {
        ["Turbo"] = false,
        ["XenonHeadlights"] = false,
        ["Engine"] = 1,
        ["Brakes"] = 0,
        ["Transmission"] = 1,
        ["Suspension"] = 1,
        ["Armor"] = 1,
        ["XenonHeadlightsColor"] = 0,
    },
    ["S"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = true,
        ["Engine"] = 2,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
        ["Suspension"] = 2,
        ["Armor"] = 2,
        ["XenonHeadlightsColor"] = 0,
    },
    ["S+"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = true,
        ["Engine"] = 4,
        ["Brakes"] = 2,
        ["Transmission"] = 3,
        ["Suspension"] = 3,
        ["Armor"] = 3,
        ["XenonHeadlightsColor"] = 0,
    }
}

-- To add more cars just copy an existing one and adjust the values correspondingly (don't forget to change the model name aswell, e.g. police3) 
-- You can remove or add any value that is a float, integer or vector3 (for available values check handling.meta) but make sure to do so for every mode / class of that vehicle, otherwise the value won't be reset
Config.VehiclesConfig = {
    ["npolvic"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 1.200000,
            ["fInitialDriveMaxFlatVel"] = 130.000000,
            ["fSteeringLock"] = 44.500000,
            ["fInitialDriveForce"] = 0.271000
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.1000000,
            ["fBrakeForce"] = 1.500000,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 45.500000,
            ["fInitialDriveForce"] = 0.321000
        },
        ["S"] = {
            ["fDriveInertia"] = 1.2000000,
            ["fBrakeForce"] = 3.500000,
            ["fInitialDriveMaxFlatVel"] = 160.000000,
            ["fSteeringLock"] = 47.500000,
            ["fInitialDriveForce"] = 0.4300000
        },
    },
    ["npolexp"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.0000000,
            ["fBrakeForce"] = 1.150000,
            ["fInitialDriveMaxFlatVel"] = 120.0000000,
            ["fSteeringLock"] = 45.00000,
            ["fInitialDriveForce"] = 0.135000
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.0000000,
            ["fBrakeForce"] = 2.0000000,
            ["fInitialDriveMaxFlatVel"] = 130.0000000,
            ["fSteeringLock"] = 46.0000000,
            ["fInitialDriveForce"] = 0.17000000
        },
        ["S"] = {
            ["fDriveInertia"] = 1.0000000,
            ["fBrakeForce"] = 3.5000000,
            ["fInitialDriveMaxFlatVel"] = 150.0000000,
            ["fSteeringLock"] = 47.0000000,
            ["fInitialDriveForce"] = 0.2200000
        },
    },
    ["npolchar"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.0000000,
            ["fBrakeForce"] = 1.200000,
            ["fInitialDriveMaxFlatVel"] = 130.0000000,
            ["fSteeringLock"] = 45.000000,
            ["fInitialDriveForce"] = 0.270000
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.1000000,
            ["fBrakeForce"] = 2.000000,
            ["fInitialDriveMaxFlatVel"] = 150.0,
            ["fSteeringLock"] = 46.000000,
            ["fInitialDriveForce"] = 0.305069
        },
        ["S"] = {
            ["fDriveInertia"] = 1.2000000,
            ["fBrakeForce"] = 2.5000000,
            ["fInitialDriveMaxFlatVel"] = 160.0000000,
            ["fSteeringLock"] = 47.000000,
            ["fInitialDriveForce"] = 0.355069
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.3000000,
            ["fBrakeForce"] = 3.5000000,
            ["fInitialDriveMaxFlatVel"] = 180.000000,
            ["fSteeringLock"] = 48.000000,
            ["fInitialDriveForce"] = 0.405069
        }
    },
    ["npolstang"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.0000000,
            ["fBrakeForce"] = 1.200000,
            ["fInitialDriveMaxFlatVel"] = 130.0000000,
            ["fSteeringLock"] = 44.000000,
            ["fInitialDriveForce"] = 0.270000
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.1000000,
            ["fBrakeForce"] = 2.00000,
            ["fInitialDriveMaxFlatVel"] = 150.0000000,
            ["fSteeringLock"] = 45.0000000,
            ["fInitialDriveForce"] = 0.320000
        },
        ["S"] = {
            ["fDriveInertia"] = 1.2000000,
            ["fBrakeForce"] = 3.500000,
            ["fInitialDriveMaxFlatVel"] = 170.0000000,
            ["fSteeringLock"] = 46.0000000,
            ["fInitialDriveForce"] = 0.37000000
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.3000000,
            ["fBrakeForce"] = 4.500000,
            ["fInitialDriveMaxFlatVel"] = 180.000000,
            ["fSteeringLock"] = 47.0000000,
            ["fInitialDriveForce"] = 0.80000000
        }
    },
    ["npolchal"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.0000000,
            ["fBrakeForce"] = 1.7000000,
            ["fInitialDriveMaxFlatVel"] = 130.0000000,
            ["fSteeringLock"] = 45.000000,
            ["fInitialDriveForce"] = 0.27000000
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.1000000,
            ["fBrakeForce"] = 2.0000000,
            ["fInitialDriveMaxFlatVel"] = 150.0000000,
            ["fSteeringLock"] = 46.000000,
            ["fInitialDriveForce"] = 0.42000000
        },
        ["S"] = {
            ["fDriveInertia"] = 1.2000000,
            ["fBrakeForce"] = 3.5000000,
            ["fInitialDriveMaxFlatVel"] = 170.0000000,
            ["fSteeringLock"] = 47.000000,
            ["fInitialDriveForce"] = 0.57000000
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.3000000,
            ["fBrakeForce"] = 4.5000000,
            ["fInitialDriveMaxFlatVel"] = 180.000000,
            ["fSteeringLock"] = 48.000000,
            ["fInitialDriveForce"] = 0.72000000
        }
    },
    ["npolvette"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.0000000,
            ["fBrakeForce"] = 1.70000000,
            ["fInitialDriveMaxFlatVel"] = 130.0000000,
            ["fSteeringLock"] = 46.000000,
            ["fInitialDriveForce"] = 0.27000000
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.1000000,
            ["fBrakeForce"] = 2.0000000,
            ["fInitialDriveMaxFlatVel"] = 150.0000000,
            ["fSteeringLock"] = 47.000000,
            ["fInitialDriveForce"] = 0.42000000
        },
        ["S"] = {
            ["fDriveInertia"] = 1.2,
            ["fBrakeForce"] = 3.5,
            ["fInitialDriveMaxFlatVel"] = 170.0000000,
            ["fSteeringLock"] = 48.000000,
            ["fInitialDriveForce"] = 0.67000000
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.3000000,
            ["fBrakeForce"] = 4.5000000,
            ["fInitialDriveMaxFlatVel"] = 180.000000,
            ["fSteeringLock"] = 49.000000,
            ["fInitialDriveForce"] = 0.80000000
        }
    },
}

Config.UseGeneralVehicleConfig = false -- change this if you want every EMERGENCY vehicle to be able to change modes (still restricted by Configs.AuthorizedJobs)
Config.EmergencyVehiclesOnly = true -- change this if you want EVERY vehicle to be able to change modes (still restricted by Configs.AuthorizedJobs)
Config.GeneralVehicleConfig = {
    ["A"] = {
        ["fDriveInertia"] = 1.000000,
        ["fBrakeForce"] = 1.700000,
        ["fInitialDriveMaxFlatVel"] = 130.000000,
        ["fSteeringLock"] = 44.300000,
        ["fInitialDriveForce"] = 0.270000
    },
    ["A+"] = {
        ["fDriveInertia"] = 1.100000,
        ["fBrakeForce"] = 2.000000,
        ["fInitialDriveMaxFlatVel"] = 150.000000,
        ["fSteeringLock"] = 45.200000,
        ["fInitialDriveForce"] = 0.32
    },
    ["S"] = {
        ["fDriveInertia"] = 1.2,
        ["fBrakeForce"] = 3.5,
        ["fInitialDriveMaxFlatVel"] = 170.0,
        ["fSteeringLock"] = 43.3,
        ["fInitialDriveForce"] = 0.37
    },
    ["S+"] = {
        ["fDriveInertia"] = 1.3,
        ["fBrakeForce"] = 4.5,
        ["fInitialDriveMaxFlatVel"] = 490.0,
        ["fSteeringLock"] = 40.3,
        ["fInitialDriveForce"] = 0.85
    }
}


Config.populationDensity = 0.8

Config.antiGhostDebug = false
Config.antiGhostYeetVehicles = true
Config.antiGhostScaleX = 10.0
Config.antiGhostScaleY = 5.0

Config.VendingMachines = {
    ['drinks'] = {
        ['Label'] = 'Drinks',
        ['Items'] = {
            [1] = {
                ['name'] = "kurkakola",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 1,
            },
            [2] = {
                ['name'] = "water_bottle",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 2,
            },
        }
    },
    ['candy'] = {
        ['Label'] = 'Fast Eating',
        ['Items'] = {
            [1] = {
                ['name'] = "twerks_candy",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 1,
            },
            [2] = {
                ['name'] = "snikkel_candy",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 2,
            },
            [3] = {
                ['name'] = "sandwich",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 3,
            },
        }
    },
    ['coffee'] = {
        ['Label'] = 'Coffee',
        ['Items'] = {
            [1] = {
                ['name'] = "coffee",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 1,
            },
        }
    },
    ['water'] = {
        ['Label'] = 'Water',
        ['Items'] = {
            [1] = {
                ['name'] = "water_bottle",
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = "item",
                ['slot'] = 1,
            },
        }
    },
}

Config.Vendings = {
    [1] = {
        ['Model'] = 'prop_vend_coffe_01', -- Model name of prop
        ['Category'] = 'coffee', -- Category from list above
        ['Label'] = 'Coffee', -- Name of vending
        ['Icon'] = 'fas fa-coffee' -- Fontawesome icon
    },
    [2] = {
        ['Model'] = 'prop_vend_water_01',
        ['Category'] = 'water',
        ['Label'] = 'Water Dispenser',
        ['Icon'] = 'fas fa-tint'
    },
    [3] = {
        ['Model'] = 'prop_watercooler',
        ['Category'] = 'water',
        ['Label'] = 'Water Dispenser',
        ['Icon'] = 'fas fa-tint'
    },
    [4] = {
        ['Model'] = 'prop_watercooler_Dark',
        ['Category'] = 'water',
        ['Label'] = 'Water Dispenser',
        ['Icon'] = 'fas fa-tint'
    },
    [5] = {
        ['Model'] = 'prop_vend_snak_01',
        ['Category'] = 'candy',
        ['Label'] = 'Candy Vending',
        ['Icon'] = 'fas fa-candy-cane'
    },
    [6] = {
        ['Model'] = 'prop_vend_snak_01_tu',
        ['Category'] = 'candy',
        ['Label'] = 'Candy Vending',
        ['Icon'] = 'fas fa-candy-cane'
    },
    [7] = {
        ['Model'] = 'prop_vend_fridge01',
        ['Category'] = 'drinks',
        ['Label'] = 'Drinks Vending',
        ['Icon'] = 'fas fa-glass-whiskey'
    },
    [8] = {
        ['Model'] = 'prop_vend_soda_01',
        ['Category'] = 'drinks',
        ['Label'] = 'Drinks Vending',
        ['Icon'] = 'fas fa-glass-whiskey'
    },
    [9] = {
        ['Model'] = 'prop_vend_soda_02',
        ['Category'] = 'drinks',
        ['Label'] = 'Drinks Vending',
        ['Icon'] = 'fas fa-glass-whiskey'
    },
}