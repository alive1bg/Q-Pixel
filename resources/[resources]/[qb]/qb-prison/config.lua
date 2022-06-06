Config = {}

Config.Jobs = {
    ["electrician"] = "Electrician",
    ["cleaner"] = "Cleaner"
}

Config.Locations = {
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = vector4(1761.46, 2540.41, 45.56, 272.249)
            },
            [2] = {
                coords = vector4(1718.54, 2527.802, 45.56, 272.249)
            },
            [3] = {
                coords = vector4(1700.199, 2474.811, 45.56, 272.249)
            },
            [4] = {
                coords = vector4(1664.827, 2501.58, 45.56, 272.249)
            },
            [5] = {
                coords = vector4(1621.622, 2509.302, 45.56, 272.249)
            },
            [6] = {
                coords = vector4(1627.936, 2538.393, 45.56, 272.249)
            },
            [7] = {
                coords = vector4(1625.1, 2575.988, 45.56, 272.249)
            }
        }
    },
    ["freedom"] = {
        coords = vector4(1837.08, 2593.73, 46.01, 177.78)
    },
    ["outside"] = {
        coords = vector4(1848.13, 2586.05, 45.67, 269.5)
    },
    ["yard"] = {
        coords = vector4(1765.67, 2565.91, 45.56, 1.5)
    },
    ["middle"] = {
        coords = vector4(1709.9, 2552.17, 45.55, 85.03)
    },
    ["shop"] = {
        coords = vector4(1786.19, 2557.77, 45.62, 0.5)
    },
    spawns = {
        [1] = {
            animation = "bumsleep",
            coords = vector4(1768.15, 2477.23, 49.69, 39.1)
        },
        [2] = {
            animation = "lean",
            coords = vector4(1743.34, 2488.61, 45.82, 119.02)
        },
        [3] = {
            animation = "lean",
            coords = vector4(1755.54, 2495.18, 45.82, 124.49)
        },
        [4] = {
            animation = "lean",
            coords = vector4(1771.34, 2478.94, 45.82, 32.93)
        },
        [5] = {
            animation = "sleep",
            coords = vector4(1759.42, 2474.21, 47.41, 120.79)
        },
        [6] = {
            animation = "sitchair",
            coords = vector4(1742.56, 2489.44, 49.92, 210.68)
        },
        [7] = {
            animation = "sitchair4",
            coords = vector4(1754.55, 2495.87, 50.43, 179.11)
        },
        [8] = {
            animation = "crossarms5",
            coords = vector4(1773.29, 2481.86, 50.42, 27.38)
        },
        [9] = {
            animation = "sitchair",
            coords = vector4(1759.24, 2472.34, 49.92, 310.24)
        },
        [10] = {
            animation = "chinup",
            coords = vector4(1776.0, 2497.36, 45.82, 32.86)
        },
        [11] = {
            animation = "pee",
            coords = vector4(1761.04, 2474.05, 45.81, 206.89)
        }
    }
}

Config.CanteenItems = {
    [1] = {
        name = "sandwich",
        price = 4,
        amount = 500,
        info = {},
        type = "item",
        slot = 1
    },
    -- [2] = {
        -- name = "water_bottle",
        -- price = 4,
        -- amount = 50,
        -- info = {},
        -- type = "item",
        -- slot = 2
    -- }
}
