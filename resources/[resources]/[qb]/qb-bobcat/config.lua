Config = {}

Config.MinimumPolice = 4 -- minimum police to start heist

Config.Cooldown = 120 -- seconds / reset vault time // check the server side line 77

Config.FirstDoor = vector3(882.29, -2258.11, 30.54)
Config.SecondDoor = vector3(880.64, -2264.07, 30.47)
Config.ThirdDoor = vector3(883.05, -2267.8, 29.47)

Config.Smgs = {
    "weapon_smg",
    "weapon_pistol50"
}

Config.Explosives = {
    "weapon_bzgas",
    "weapon_molotov",
    "weapon_stickybomb",

}

Config.Rifles = {
    "weapon_assaultrifle2", 
    "weapon_compactrifle",
    "weapon_mg",
    "weapon_pumpshotgun",
}

Config.SpawnGuards = true

Config.Guards = {
    [1] = {
        pos = {889.25, -2277.2, 30.47, 45.51}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    },  
    [2] = {
        pos = {894.96, -2275.74, 30.47, 76.28}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    },  
    [3] = {
        pos = {895.44, -2279.01, 30.47, 68.48}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    }, 
    [4] = {
        pos = {893.06, -2289.42, 30.47, 18.59}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    }, 
    [5] = {
        pos = {895.49, -2288.31, 30.47, 8.73}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    }, 
    [6] = {
        pos = {893.15, -2294.35, 30.47, 357.54}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    }, 
    [7] = {
        pos = {878.09, -2294.41, 30.47, 280.55}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    }, 
    [8] = {
        pos = {871.41, -2295.3, 30.47, 280.26}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    }, 
    [9] = {
        pos = {871.2, -22100.24, 30.47, 264.2}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    }, 
    [10] = {
        pos = {880.77, -22100.49, 30.47, 257.26}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_M4', -- guards weapon
        health = 2000, -- guards health
        range = 2, -- guards range
        accuracy = 100, -- guards accuracy from 0 to 100
        aggresiveness = 3, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 3, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 100 -- guards armor 
    }, 
}