Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.Jobs = {
    ["electrician"] = "Electrician"
}

Config.Locations = {
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = vector4(1766.9595, 2531.4284, 45.552799, 202.68838),
            },
            [2] = {
                coords = vector4(1723.207, 2506.1386, 45.552841, 200.52832),
            },
            [3] = {
                coords = vector4(1718.4631, 2488.632, 45.552799, 186.88832),
            },
            [4] = {
                coords = vector4(1668.05, 2488.6381, 45.552806, 175.57391),
            },
            [5] = {
                coords = vector4(1657.7773, 2488.9624, 45.552783, 134.73545),
            },
            [6] = {
                coords = vector4(1618.9682, 2521.5187, 45.552833, 123.8486),
            },
            [7] = {
                coords = vector4(1629.6024, 2564.3642, 45.552825, 353.73544),
            }
        }
    },
    ["freedom"] = {
        coords = vector4(1744.1674, 2477.0939, 45.812473, 310.70074)
    },
    ["outside"] = {
        coords = vector4(1848.13, 2586.05, 44.67, 269.5)
    },
    ["yard"] = {
        coords = vector4(1765.67, 2565.91, 44.56, 1.5)
    },
    ["middle"] = {
        coords = vector4(1693.33, 2569.51, 44.55, 123.5)
    },
    ["shop"] = {
        coords = vector4(1781.0937, 2560.6965, 45.673149, 179.50126)
    },
    spawns = {
        [1] = {
            animation = "bumsleep",
            coords = vector4(1661.046, 2524.681, 45.564, 260.545)
        },
        [2] = {
            animation = "lean",
            coords = vector4(1650.812, 2540.582, 45.564, 230.436)
        },
        [3] = {
            animation = "lean",
            coords = vector4(1654.959, 2545.535, 45.564, 230.436)
        },
        [4] = {
            animation = "lean",
            coords = vector4(1697.106, 2525.558, 45.564, 187.208)
        },
        [5] = {
            animation = "sitchair4",
            coords = vector4(1673.084, 2519.823, 45.564, 229.542)
        },
        [6] = {
            animation = "sitchair",
            coords = vector4(1666.029, 2511.367, 45.564, 233.888)
        },
        [7] = {
            animation = "sitchair4",
            coords = vector4(1691.229, 2509.635, 45.564, 52.432)
        },
        [8] = {
            animation = "finger2",
            coords = vector4(1770.59, 2536.064, 45.564, 258.113)
        },
        [9] = {
            animation = "smoke",
            coords = vector4(1792.45, 2584.37, 45.56, 276.24)
        },
        [10] = {
            animation = "smoke",
            coords = vector4(1768.33, 2566.08, 45.56, 176.83)
        },
        [11] = {
            animation = "smoke",
            coords = vector4(1696.09, 2469.4, 45.56, 1.4)
        }
    }
}

Config.CanteenItems = {
    [1] = {
        name = "sandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1
    },
    [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2
    }
}
