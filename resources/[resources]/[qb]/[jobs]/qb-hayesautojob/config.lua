Config = {}

Config.AttachedVehicle = nil

Config.AuthorizedIds = {
    "insertcitizenidhere",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = "Motor",
    ["body"] = "Body",
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}

Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "plastic",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 50,
    },
    ["body"] = {
        item = "plastic",
        costs = 100,
    },
    ["radiator"] = {
        item = "steel",
        costs = 40,
    },
    ["axle"] = {
        item = "aluminum",
        costs = 50,
    },
    ["brakes"] = {
        item = "copper",
        costs = 50,
    },
    ["clutch"] = {
        item = "aluminum",
        costs = 40,
    },
    ["fuel"] = {
        item = "metalscrap",
        costs = 35,
    },
}

Config.Businesses = {
    "Auto Repair",
}

Config.Plates = {
    [1] = {
        coords = vector4(-1417.5, -446.01, 35.3, 211.14),
        AttachedVehicle = nil,
    },
    [2] = {
        coords = vector4(-1423.78, -450.1, 35.3, 210.12),
        AttachedVehicle = nil,
    },
}

Config.Locations = {
    ["exit"] = vector3(-1411.3, -442.61, 35.28), -- set
    ["stash"] = vector3(-1409.7, -448.18, 35.91), -- set
    ["duty"] = vector3(124.51, -3011.51, 7.04), -- not using
    ["vehicle"] = vector4(-1376.15, -454.15, 34.48, 279.45), -- set
}

Config.Vehicles = {
    ["flatbed"] = "Flatbed",
    ["towtruck"] = "Towtruck",
    ["minivan"] = "Minivan (Rental Car)",
    ["blista"] = "Blista",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}
