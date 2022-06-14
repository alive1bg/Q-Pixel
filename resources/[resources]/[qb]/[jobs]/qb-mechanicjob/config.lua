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
        coords = vector4(125.05, -3034.99, 6.54, 269.28),
        AttachedVehicle = nil,
    },
    [2] = {
        coords = vector4(125.04, -3041.28, 6.54, 269.12),
        AttachedVehicle = nil,
    },
}

Config.Locations = {
    ["exit"] = vector3(139.99, -3023.5, 7.04),
    ["stash"] = vector3(128.69, -3013.65, 7.04),
    ["duty"] = vector3(126.17, -3007.91, 7.04), 
    ["vehicle"] = vector4(141.54, -2998.38, 7.12, 27.19), 
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
