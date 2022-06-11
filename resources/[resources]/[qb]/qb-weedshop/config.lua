Config = Config or {}

--# DOES NOT SUPPORT qbtarget YET #--
Config.Option = "drawtext" -- "drawtext" or "qbtarget" --
Config.Job = "weedshop"
Config.img = "qb-inventory/html/images/" -- Set this to your inventory
Config.MinBudPerPlant = 1
Config.MaxBudPerPlant = 2
Config.RollingRequiredItem = "rolling_paper"
Config.GrinderItem = "weedgrinder"
Config.BrownieMixItem = "browniemix"

Config.AddArmor = true
Config.AmountOfArmorPerJoint = 10
Config.AmountOfArmorMultiplier = 2.5  -- If Above Is "10" Then "10*2.5" = 25 Armor
Config.AddHealth = true
Config.MinOfHealthPerJoint = 6
Config.MaxOfHealthPerJoint = 11
Config.ReliefStress = true
Config.MinOfStressReliefPerJoint = 5
Config.MaxOfStressReliefPerJoint = 15

Config.HighTime = 100
Config.SetEffectDrunk = false

Config.FPWEEDSHOP = {
    ["fp-weedshop-duty"] = {
        [1] = vector3(382.77, -819.73, 29.3),
    },
    ["fp-weedshop-bill"] = {
        [1] = vector3(380.24, -827.33, 29.29),
        [2] = vector3(375.550, -827.33, 29.29),
    },
    ["fp-weedshop-counter"] = {
        [1] = vector3(378.6299, -827.344, 29.29),
    },
    ["fp-weedshop-jointstorage"] = {
        [1] = vector3(374.5466, -825.501, 29.29),
    },
    ["fp-weedshop-shop"] = {
        [1] = vector3(379.9002, -819.873, 29.29),
    },
    ["fp-weedshop-jointtable"] = {
        [1] = vector3(375.77, -824.32, 29.09),
    },
    ["fp-weedshop-grindweed"] = {
        [1] = vector3(374.5927, -816.114, 29.29),
    },
    ["fp-weedshop-brownietable"] = {
        [1] = vector3(382.5267, -817.283, 29.29),
    },
    ["fp-weedshop-vehicle"] = {
        [1] = vector3(369.4199, -826.803, 29.292),
    },
    --Plants
    ["fp-weedshop-OG-Kush"] = {
        [1] = vector3(378.12, -813.26, 29.3),
        [2] = vector3(379.36, -813.27, 29.3),
    },
    ["fp-weedshop-Purple-Haze"] = {
        [1] = vector3(380.43, -813.4, 29.3),
        [2] = vector3(382.17, -813.44, 29.3),
    },
    ["fp-weedshop-AK47"] = {
        [1] = vector3(383.25, -813.38, 29.3),
        [2] = vector3(382.86, -811.58, 29.3),
    },
    ["fp-weedshop-Skunk"] = {
        [1] = vector3(381.8, -811.6, 29.3),
        [2] = vector3(380.64, -811.54, 29.3),
    },
    ["fp-weedshop-White-Widow"] = {
        [1] = vector3(379.35, -811.56, 29.3),
    },
    ["fp-weedshop-Amnesia"] = {
        [1] = vector3(378.18, -811.4, 29.3),
    },
}

Config.Items = { 
    label = "Weed Shop Items", slots = 2,
    items = {
        [1] = { name = Config.RollingRequiredItem, price = 3, amount = 100, info = {}, type = "item", slot = 1, },
        [2] = { name = "lighter", price = 4, amount = 100, info = {}, type = "item", slot = 2, },
        [3] = { name = Config.GrinderItem, price = 20, amount = 100, info = {}, type = "item", slot = 3, },
        [4] = { name = Config.BrownieMixItem, price = 10, amount = 100, info = {}, type = "item", slot = 4, },
   
    },
}

Config.Blip = { Name = "Weed Dispensary", Sprite = 140, Scale = 0.5, Color = 1,
    ["Coords"] = { [1] = vector3(377.4846, -836.813, 29.291), },
}