Config = Config or {}

Config.FavoritedItems = {}
Config.PinnedTargets = {}
Config.AdminOptions = {}

-- Customizable

Config.Settings = {
    ['Debug'] = true,
    ['DefaultOpenKeybind'] = 'F5',
    ['Cars'] = {
        ['Custom'] = false, -- Enable if you only want cars with a specific category to show up in list of 'Spawn Vehicle'.
        ['CustomCat'] = 'custom',
    }
}

Config.BanTimeCategories = {
    [1] = {
        ['Name'] = '30m-1h',
        ['Label'] = '30 Minutes - 1 Hour ago',
        ['Times'] = {
            [1] = {
                ['Type'] = 'Minutes',
                ['Value'] = 30,
            },
            [2] = {
                ['Type'] = 'Hours',
                ['Value'] = 1,
            },
        },
    },
    [2] = {
        ['Name'] = '1h-12h',
        ['Label'] = '1-12 Hours ago',
        ['Times'] = {
            [1] = {
                ['Type'] = 'Hours',
                ['Value'] = 1,
            },
            [2] = {
                ['Type'] = 'Hours',
                ['Value'] = 12,
            },
        },
    },
    [3] = {
        ['Name'] = '12h-1d',
        ['Label'] = '12 Hours - 1 Day ago',
        ['Times'] = {
            [1] = {
                ['Type'] = 'Hours',
                ['Value'] = 12,
            },
            [2] = {
                ['Type'] = 'Days',
                ['Value'] = 1,
            },
        },
    },
    [4] = {
        ['Name'] = '1d',
        ['Label'] = '1 Day ago',
        ['Times'] = {
            [1] = {
                ['Type'] = 'Days',
                ['Value'] = 1,
            },
        },
    },
    [5] = {
        ['Name'] = '2d',
        ['Label'] = '2 Days ago',
        ['Times'] = {
            [1] = {
                ['Type'] = 'Days',
                ['Value'] = 2,
            },
        },
    },
}
