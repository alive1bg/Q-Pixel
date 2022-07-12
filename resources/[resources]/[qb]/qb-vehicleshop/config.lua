Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(259.95257, 220.63473, 106.28225)-- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.Shops = {
    ['cardealer'] = {
        ['Type'] = 'managed', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(811.53509521484, -803.42724609375),
                vector2(791.18218994141, -803.62445068359),
                vector2(791.05706787109, -833.19201660156),
                vector2(811.46490478516, -833.70062255859)
            },
            ['minZ'] = 26.10, -- min height of the shop zone
            ['maxZ'] = 26.26, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Otto AutoParts And Sales', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
            ['cycles'] = 'Bicycles'
        },
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(801.00994, -822.8892, 26.181016), -- Blip Location
        ['ReturnLocation'] = vector3(803.93225, -820.6266, 26.181016), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(802.38647, -820.7225, 26.180999, 266.13333), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(802.38647, -820.7225, 26.180999, 266.13333), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(797.95074, -806.8751, 24.663558, 234.14276), -- where the vehicle will spawn on display
                defaultVehicle = 'baller', -- Default display vehicle
                chosenVehicle = 'baller', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(798.09246, -810.5512, 24.600973, 237.48246),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2'
            },
            [3] = {
                coords = vector4(798.27111, -813.7525, 24.578573, 238.25881),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2'
            },
            [4] = {
                coords = vector4(797.99426, -816.7172, 24.575042, 239.4253),
                defaultVehicle = 'sultanrs',
                chosenVehicle = 'sultanrs'
            }
        },
    },
    ['tuner'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(120.79251861572, -3050.908203125),
                vector2(122.50583648682, -3050.1271972656),
                vector2(153.15791320801, -3050.1843261719),
                vector2(153.96586608887, -3019.7687988281),
                vector2(121.33261871338, -3019.9128417969)
            },
            ['minZ'] = 7.0408883094788,
            ['maxZ'] = 7.0411071777344,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'tuner', -- Name of job or none
        ['ShopLabel'] = '6STR Tuner Shop',
        ['showBlip'] = false, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['acura'] = 'Acura',
            ['alfaromeo'] = 'Alfa Romeo',
            ['astonmartin'] = 'Aston Martin',
            ['audi'] = 'Audi',
            ['bentley'] = 'Bentley',
            ['bikes'] = 'Bikes',
            ['bmw'] = 'BMW',
            ['bugatti'] = 'Bugatti',
            ['buick'] = 'Buick',
            ['cadillac'] = 'Cadillac',
            ['chevrolet'] = 'Chevrolet',
            ['chrysler'] = 'Chrysler',
            ['dodge'] = 'Dodge',
            ['ferrari'] = 'Ferrari',
            ['ford'] = 'Ford',
            ['honda'] = 'Honda',
            ['jaguar'] = 'Jaguar',
            ['jeep'] = 'Jeep',
            ['koenigsegg'] = 'Koenigsegg',
            ['Lamborghini'] = 'Lamborghini',
            ['lancia'] = 'Lancia',
            ['lexus'] = 'Lexus',
            ['lotus'] = 'Lotus',
            ['mazda'] = 'Mazda',
            ['mclaren'] = 'McLaren',
            ['mercedes'] = 'Mercedes-Benz',
            ['mitsubishi'] = 'Mitsubishi',
            ['nissan'] = 'Nissan',
            ['peuogeot'] = 'Peugeot',
            ['pontiac'] = 'Pontiac',
            ['porsche'] = 'Porsche',
            ['landrover'] = 'Land Rover',
            ['renault'] = 'Renault',
            ['rollsroyce'] = 'Rolls Royce',
            ['subaru'] = 'Subaru',
            ['toyota'] = 'Toyota',
            ['volkswagen'] = 'Volkswagen',
            ['volvo'] = 'Volvo',
        },
        ['TestDriveTimeLimit'] = 5,
        ['Location'] = vector3(140.61065, -3035.94, 6.4677233),
        ['ReturnLocation'] = vector4(124.73069, -3022.994, 6.4294185, 269.32009),
        ['VehicleSpawn'] = vector4(124.73069, -3022.994, 6.4294185, 269.32009),
        ['TestDriveSpawn'] = vector4(124.73069, -3022.994, 6.4294185, 269.32009),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(151.24, -3043.06, 6.05, 32.22),
                defaultVehicle = 'm3e46',
                chosenVehicle = 'm3e46',
            },
            [2] = {
                coords = vector4(147.54553, -3045.051, 6.05, 38.512878),
                defaultVehicle = 'na1',
                chosenVehicle = 'na1',
            },
            [3] = {
                coords = vector4(137.76, -3047.44, 6.05, 333.78),
                defaultVehicle = 'gtr',
                chosenVehicle = 'gtr',
            },
            [4] = {
                coords = vector4(132.81, -3047.58, 6.05, 0.86),
                defaultVehicle = 'lp670',
                chosenVehicle = 'lp670',
            },
            [5] = {
                coords = vector4(144.64, -3047.52, 6.05, 45.56),
                defaultVehicle = 'gtz34',
                chosenVehicle = 'gtz34',
            },
        }
    },
    ['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-729.39, -1315.84),
                vector2(-766.81, -1360.11),
                vector2(-754.21, -1371.49),
                vector2(-716.94, -1326.88)
            },
            ['minZ'] = 0.0, -- min height of the shop zone
            ['maxZ'] = 5.0, -- max height of the shop zone
            ['size'] = 6.2 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Marina Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 410, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['boats'] = 'Boats'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-738.25, -1334.38, 1.6), -- Blip Location
        ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark', -- Default display vehicle
                chosenVehicle = 'seashark' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-732.84, -1333.5, -0.50, 229.5),
                defaultVehicle = 'dinghy',
                chosenVehicle = 'dinghy'
            },
            [3] = {
                coords = vector4(-737.84, -1340.83, -0.50, 229.5),
                defaultVehicle = 'speeder',
                chosenVehicle = 'speeder'
            },
            [4] = {
                coords = vector4(-741.53, -1349.7, -2.00, 229.5),
                defaultVehicle = 'marquis',
                chosenVehicle = 'marquis'
            },
        },
    },
    ['air'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-1607.58, -3141.7),
                vector2(-1672.54, -3103.87),
                vector2(-1703.49, -3158.02),
                vector2(-1646.03, -3190.84)
            },
            ['minZ'] = 12.99, -- min height of the shop zone
            ['maxZ'] = 16.99, -- max height of the shop zone
            ['size'] = 7.0, -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Air Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 251, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['helicopters'] = 'Helicopters',
            ['planes'] = 'Planes'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-1652.76, -3143.4, 13.99), -- Blip Location
        ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-1617.49, -3086.17, 13.94, 329.2), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
                defaultVehicle = 'volatus', -- Default display vehicle
                chosenVehicle = 'volatus' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
                defaultVehicle = 'luxor2',
                chosenVehicle = 'luxor2'
            },
            [3] = {
                coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
                defaultVehicle = 'nimbus',
                chosenVehicle = 'nimbus'
            },
            [4] = {
                coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
                defaultVehicle = 'frogger',
                chosenVehicle = 'frogger'
            },
        },
    },
    ['police'] = {
        ['Type'] = 'managed', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
            vector2(451.72113037109, -1027.4052734375),
            vector2(466.52694702148, -1026.2106933594),
            vector2(466.84201049805, -1011.0835571289),
            vector2(451.4697265625, -1013.9250488281)
            },
            ['minZ'] = 28.1, -- min height of the shop zone
            ['maxZ'] = 29.8, -- max height of the shop zone
            ['size'] = 2.75, -- size of the vehicles zones 
        },
        ['Job'] = 'police', -- Name of job or none
        ['ShopLabel'] = 'Police Vehicle Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 56, -- Blip sprite
        ['blipColor'] = 21, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['standard'] = 'Police',
            ['interceptor'] = 'Interceptors',
            ['polbike'] = 'Police Bikes',
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(455.3695, -1024.233, 28.264682), -- Blip Location
        ['ReturnLocation'] = vector3(455.3695, -1024.233, 28.264682), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(455.3695, -1024.233, 28.264682, 54.743831), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(463.12777, -1019.371, 26.902521, 92.010543), -- where the vehicle will spawn on display
                defaultVehicle = 'npolvic', -- Default display vehicle
                chosenVehicle = 'npolvic' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(463.23217, -1014.885, 26.356174, 91.169265), -- where the vehicle will spawn on display
                defaultVehicle = 'npolchal', -- Default display vehicle
                chosenVehicle = 'npolchal' -- Same as default but is dynamically changed when swapping vehicles
            },
        },
    },
}

