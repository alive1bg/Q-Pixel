Config = {}

Config.MinimumATMRobberyPolice = 0

Config.ItemName = "towingrope"
Config.ATMItemName = "atmobject"

Config.PoliceAlert = true

Config.RemoveItemToUsed = true

Config.MaxTry = 15

Config.Point = {
    ["GodPower"] = 2,
    ["MinPower"] = 1,
}

Config.ATMs = {
    "prop_atm_02",
    "prop_atm_03",
    "prop_fleeca_atm"
}

Config.BlackListCar = {
    8, -- Motorcycles 
    13, -- Cycles  
    14, -- Boats 
    15, -- Helicopters  
    16, -- Planes  
    18, -- Emergency 
    21, -- Trains
}

Config.PowerCar = {
    2, -- SUVs  
    9, -- Off-road  
    12, -- Vans 
}

Config.AttachCarTimer = 5000
Config.AttachATMTimer = 10000
Config.SearchATMTimer = 15000
Config.PickUpATMTimer = 15000

Config.SearchRewardCash = {
    ["min"] = 8000,
    ["max"] = 12000
}

Config.ATMRewardCash = {
    ["min"] = 5000,
    ["max"] = 10000
}

Config.ATMSell = vector3(-2220.63, -366.96, 13.32)

Config.LockPick = {
    ["timer-min"] = 7,
    ["timer-max"] = 12,
    ["circles-min"] = 3,
    ["circles-max"] = 4,
}