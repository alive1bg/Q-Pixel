Config = {}

Config.Docks = { -- Allows only one player to be connected per dock
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
    [6] = false,
}

Config.HackBusy = false -- This stops players from hacking the same terminal at the same time
Config.MaxFails = 99 -- Amount of fails before the system shuts down. This resets every time a hack is done successful.

Config.CurrentHack = { -- You don't want to touch this
    id = 1,
    busy = false,
    hacked = false,
    password = false
}

Config.LowerHacks = { -- You don't want to touch this either :>
    [1] = {
        hacked = false,
        busy = false,
        difficulty = 6
    },
    [2] = {
        hacked = false,
        busy = false,
        difficulty = 7
    },
    [3] = {
        hacked = false,
        busy = false,
        difficulty = 8
    },
    [4] = {
        hacked = false,
        busy = false,
        difficulty = 9
    }
}

Config.Hacks = { -- Hack difficulty
    [1] = 6,
    [2] = 6,
    [3] = 6,
    [4] = 7,
    [5] = 7,
    [6] = 7,
    [7] = 8,
    [8] = 8,
    [9] = 8,
    [10] = 9
}

Config.Servers = { -- You can always add more server locations :>
    [1] = {coords = vector3(2349.31, 2895.91, -84.72), label = "B42-6"},
    [2] = {coords = vector3(2344.91, 2904.03, -84.72), label = "B41-3"},
    [3] = {coords = vector3(2353.64, 2912.13, -84.72), label = "B40-9"},
    [4] = {coords = vector3(2343.24, 2921.33, -84.72), label = "B39-2"},
    [5] = {coords = vector3(2345.93, 2929.25, -84.72), label = "A42-3"},
    [6] = {coords = vector3(2348.82, 2937.74, -84.72), label = "A41-5"},
    [7] = {coords = vector3(2348.16, 2946.33, -84.72), label = "A39-5"},
    [8] = {coords = vector3(2326.61, 2946.39, -84.72), label = "A35-4"},
    [9] = {coords = vector3(2304.77, 2946.01, -84.72), label = "A31-2"},
    [10] = {coords = vector3(2305.92, 2920.69, -84.72), label = "A34-4"},
    [11] = {coords = vector3(2286.7, 2912.17, -84.72), label = "B27-4"},
    [12] = {coords = vector3(2264.92, 2904.11, -84.72), label = "B25-3"},
    [13] = {coords = vector3(2266.63, 2895.57, -84.72), label = "B26-4"},
    [14] = {coords = vector3(2252.01, 2921.12, -84.72), label = "B20-7"},
    [15] = {coords = vector3(2245.63, 2945.76, -84.72), label = "A16-3"},
    [16] = {coords = vector3(2286.64, 2945.88, -84.72), label = "A27-4"},
    [17] = {coords = vector3(2286.0, 2929.13, -84.72), label = "A29-3"},
    [18] = {coords = vector3(2266.68, 2929.19, -84.72), label = "A25-4"},
    [19] = {coords = vector3(2243.96, 2946.26, -84.72), label = "A16-5"},
    [20] = {coords = vector3(2241.4, 2929.16, -84.72), label = "A18-4"},
    [21] = {coords = vector3(2247.17, 2904.57, -84.72), label = "B17-7"},
    [22] = {coords = vector3(2139.76, 2903.43, -84.72), label = "C6-2"},
    [23] = {coords = vector3(2119.99, 2899.6, -84.72), label = "C9-5"},
    [24] = {coords = vector3(2136.9, 2912.13, -84.72), label = "C7-4"},
    [25] = {coords = vector3(1985.76, 2895.45, -84.72), label = "C39-7"},
    [26] = {coords = vector3(1989.5, 2904.03, -84.72), label = "C40-4"},
    [27] = {coords = vector3(1990.23, 2912.54, -84.72), label = "C41-3"},
    [28] = {coords = vector3(1983.89, 2920.43, -84.72), label = "C42-9"},
    [29] = {coords = vector3(1991.34, 2946.26, -84.72), label = "D42-2"},
    [30] = {coords = vector3(1982.42, 2938.24, -84.72), label = "D41-9"},
    [31] = {coords = vector3(1986.83, 2929.16, -84.72), label = "D40-6"},
    [32] = {coords = vector3(2008.02, 2946.31, -84.72), label = "D38-5"},
    [33] = {coords = vector3(2012.89, 2937.28, -84.72), label = "D37-2"},
    [34] = {coords = vector3(2010.24, 2920.78, -84.72), label = "C38-3"},
    [35] = {coords = vector3(2003.93, 2894.99, -84.72), label = "C35-9"},
    [36] = {coords = vector3(2014.06, 2912.26, -84.72), label = "C37-1"},
    [37] = {coords = vector3(2011.36, 2946.7, -84.72), label = "D38-2"},
    [38] = {coords = vector3(2007.36, 2937.72, -84.72), label = "D37-7"},
    [39] = {coords = vector3(2032.82, 2937.31, -84.72), label = "D33-2"},
    [40] = {coords = vector3(2051.2, 2912.63, -84.72), label = "C29-2"},
    [41] = {coords = vector3(2113.57, 2921.12, -84.72), label = "C15-3"},
    [42] = {coords = vector3(2108.66, 2944.05, -84.72), label = "D15-2"},
    [43] = {coords = vector3(2119.96, 2899.58, -84.72), label = "C9-5"}
}