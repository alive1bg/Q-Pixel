Config = Config or {}

Config.Interaction = 'target' --- target/radialmenu for the job interaction that you want

Config.UseCoolDown = 'true' -- true/false
Config.CoolDown = 1500 * 1000 --- Cooldown until can start next job, default its 25 minutes

Config.JobNeeded = 'true' -- if you need a specific job to do the deliveries true/false
Config.JobName = 'delivery' -- Job needed to do the deliveries if the config above is set to true
Config.JobPed = 's_m_m_ups_01' -- Model of the starting ped
Config.JobPedLocation = vector4(-429.53, -2786.3, 6.0, 53.77) -- Where the starting ped is
Config.JobBlipName = "Dodo-Deliveries" -- Blip of where the starting ped is

Config.VehicleSpawn = vector4(-445.69, -2789.91, 5.39, 43.89) -- Spot the vehicle spawns 

Config.Packages = math.random(1, 5) -- random amount of packages given for delivery
Config.TrunkItems = {
    [1] = {
        name = "delivery-box",-- Item name in the core shared
        info = {},
        type = "item",
        slot = 1,
    },
}
Config.VehicleReturnCoords = vector4(-454.36, -2799.81, 5.39, 44.51) -- area where to return vehicle
Config.PaymentMethod = 'bank' -- cash/bank

Config.ShopLocations = {
    [1] = {
        Zone = {--- 24/7 Locations
            vector4(24.47, -1346.62, 29.5, 271.66),
            vector4(-3039.54, 584.38, 7.91, 17.27),
            vector4(-3242.97, 1000.01, 12.83, 357.57),
            vector4(1728.07, 6415.63, 35.04, 242.95),
            vector4(1959.82, 3740.48, 32.34, 301.57),
            vector4(549.13, 2670.85, 42.16, 99.39),
            vector4(2677.47, 3279.76, 55.24, 335.08),
            vector4(2556.66, 380.84, 108.62, 356.67),
            vector4(372.66, 326.98, 103.57, 253.73),
        },
        VehicleLivery = 11, -- livery the vehicle will spawn with for the location
        BoxModel = {
            `prop_cs_cardbox_01`, -- Props that spawn in the player hands when package is in the inventory, not all fit on ped(hands) properly so pick and choose lol https://forge.plebmasters.de/
            `prop_cardbordbox_02a`,
        },
        Payment = math.random(450, 800) -- self explanatory
    },
    [2] = {
        Zone = { --- Youtool/ Hardware Locations
            vector4(45.68, -1749.04, 29.61, 53.13),
            vector4(2747.71, 3472.85, 55.67, 255.08),
            vector4(-421.83, 6136.13, 31.88, 228.2),
        },
        VehicleLivery = 7,
        BoxModel = {
            `v_ind_meatboxsml_02`,
            `v_ind_meatboxsml`,
            `prop_cs_cardbox_01`,
            `prop_cardbordbox_02a`,
            `v_ind_cs_toolbox3`,
            `prop_tool_box_01`
        },
        Payment = math.random(450, 800)
    },
    [3] = {
        Zone = { --- Ammunation Locations
            vector4(-661.96, -933.53, 21.83, 177.05),
            vector4(809.68, -2159.13, 29.62, 1.43),
            vector4(1692.67, 3761.38, 34.71, 227.65),
            vector4(-331.23, 6085.37, 31.45, 228.02),
            vector4(253.63, -51.02, 69.94, 72.91),
            vector4(23.0, -1105.67, 29.8, 162.91),
            vector4(2567.48, 292.59, 108.73, 349.68),
            vector4(-1118.59, 2700.05, 18.55, 221.89),
            vector4(841.92, -1035.32, 28.19, 1.56),
            vector4(-1304.19, -395.12, 36.7, 75.03),
            vector4(-3173.31, 1088.85, 20.84, 244.18),
        },
        VehicleLivery = 7,
        BoxModel = {
            `prop_drop_crate_01`,
            `ba_prop_battle_case_sm_03`,
            `ba_prop_battle_rsply_crate_02a`,
            `v_ind_cs_toolbox3`,
            `prop_box_ammo04a`,
            `prop_box_ammo06a`,
        },
        Payment = math.random(450, 800)
    },
}