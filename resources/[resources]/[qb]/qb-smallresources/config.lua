Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = false
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 50 -- carwash
Config.DirtLevel = 0.1 --carwash dirt level
Config.RagdollChance = 0.3 -- Decimal Value (Currently 20%)

ConsumeablesEat = {
    ["slushy"] = math.random(5, 10),
    ["sandwich"] = math.random(15, 24),
    ["tosti"] = math.random(15, 24),
    ["twerks_candy"] = math.random(20, 23),
    ["snikkel_candy"] = math.random(20, 23),
    --uwu start
    ["uwupancake"] = math.random(25, 34),                           
    ["uwubudhabowl"] = math.random(50, 60),
    ["uwusushi"] = math.random(45, 50),
    ["uwucupcake"] = math.random(40, 45),
    ["uwuvanillasandy"] = math.random(50, 65),
    ["uwuchocsandy"] = math.random(50, 65),
    --uwu end
}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(35, 50),
    ["slushy"] = math.random(35, 55),
    ["kurkakola"] = math.random(25, 45),
    ["coffee"] = math.random(40, 60),
    --uwu start
    ["uwububbleteablueberry"] = math.random(55, 60),
    ["uwububbletearose"] = math.random(55, 60),
    ["uwububbleteamint"] = math.random(55, 60),
    ["uwumisosoup"] = math.random(80, 90),
    --uwu end
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(30, 40),
    ["beer"] = math.random(20, 30),
    ["vodka"] = math.random(30, 40),
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        --`ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = false,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = false,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = false,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = false,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
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
        ["label"] = "Car Wash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Car Wash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Car Wash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [5] = {
        ["label"] = "Car Wash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [6] = {
        ["label"] = "Car Wash",
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
    "bcso",
    "parkranger",
    "sast",
    "pbso",
    "sdso",
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
        ["XenonHeadlightsColor"] = 0,
    },
    ["A+"] = {
        ["Turbo"] = false,
        ["XenonHeadlights"] = false,
        ["Engine"] = 2,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
        ["Suspension"] = 2,
        ["XenonHeadlightsColor"] = 0,
    },
    ["S"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = false,
        ["Engine"] = 3,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
        ["Suspension"] = 3,
        ["XenonHeadlightsColor"] = 0,
    },
    ["S+"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = true,
        ["Engine"] = 4,
        ["Brakes"] = 2,
        ["Transmission"] = 3,
        ["Suspension"] = 4,
        ["XenonHeadlightsColor"] = 1,
    }
}

-- To add more cars just copy an existing one and adjust the values correspondingly (don't forget to change the model name aswell, e.g. police3) 
-- You can remove or add any value that is a float, integer or vector3 (for available values check handling.meta) but make sure to do so for every mode / class of that vehicle, otherwise the value won't be reset
Config.VehiclesConfig = {
    ["police3"] = {
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
            ["fInitialDriveMaxFlatVel"] = 190.0,
            ["fSteeringLock"] = 40.3,
            ["fInitialDriveForce"] = 0.45
        }
    },
    ["pd3"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 1.700000,
            ["fInitialDriveMaxFlatVel"] = 130.000000,
            ["fSteeringLock"] = 43.300000,
            ["fInitialDriveForce"] = 0.270000
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 2.000000,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 44.200000,
            ["fInitialDriveForce"] = 0.32
        },
        ["S"] = {
            ["fDriveInertia"] = 1.2,
            ["fBrakeForce"] = 3.5,
            ["fInitialDriveMaxFlatVel"] = 170.0,
            ["fSteeringLock"] = 45.3,
            ["fInitialDriveForce"] = 0.37
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.3,
            ["fBrakeForce"] = 4.5,
            ["fInitialDriveMaxFlatVel"] = 190.0,
            ["fSteeringLock"] = 46.3,
            ["fInitialDriveForce"] = 0.45
        }
    },
    ["lspd18char"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 1.700000,
            ["fInitialDriveMaxFlatVel"] = 130.000000,
            ["fSteeringLock"] = 50.0,
            ["fInitialDriveForce"] = 0.270000
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 2.000000,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] =50.0,
            ["fInitialDriveForce"] = 0.32
        },
        ["S"] = {
            ["fDriveInertia"] = 1.2,
            ["fBrakeForce"] = 3.5,
            ["fInitialDriveMaxFlatVel"] = 170.0,
            ["fSteeringLock"] = 50.0,
            ["fInitialDriveForce"] = 0.37
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.3,
            ["fBrakeForce"] = 4.5,
            ["fInitialDriveMaxFlatVel"] = 190.0,
            ["fSteeringLock"] =55.0,
            ["fInitialDriveForce"] = 0.45
        }
    },
}

Config.UseGeneralVehicleConfig = true -- change this if you want every EMERGENCY vehicle to be able to change modes (still restricted by Configs.AuthorizedJobs)
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

