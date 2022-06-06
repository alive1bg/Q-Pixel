Config = {}
Config.UsingTarget = true -- If you are using qb-target (uses entity zones to target vehicles)
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42) -- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.Shops = {
    --[[['pdm'] = {
        ['Type'] = 'free-use',  -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
            vector2(-56.727394104004, -1086.2325439453),
            vector2(-60.612808227539, -1096.7795410156),
            vector2(-58.26834487915, -1100.572265625),
            vector2(-35.927803039551, -1109.0034179688),
            vector2(-34.427627563477, -1108.5111083984),
            vector2(-32.02657699585, -1101.5877685547),
            vector2(-33.342102050781, -1101.0377197266),
            vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0,  -- min height of the shop zone
            ['maxZ'] = 28.0  -- max height of the shop zone
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true,  --- true or false
        ['Categories'] = { -- Categories available to browse
            ['acura'] = 'Acura',
            ['amc'] = 'AMC',
            ['astonmartin'] = 'Aston Martin',
            ['audi'] = 'Audi',
            ['bentley'] = 'Bentley',
            ['bmw'] = 'BMW',
            ['bugatti'] = 'Bugatti',
            ['cadillac'] = 'Cadillac',
            ['chevrolet'] = 'Chevrolet',
            ['custom'] = 'Custom',
            ['dacia'] = 'Dacia',
            ['dodge'] = 'Dodge',
            ['ferrari'] = 'Ferrari',
            ['ford'] = 'Ford',
            ['holden'] = 'Holden',
            ['honda'] = 'Honda',
            ['italdesign'] = 'Ital Design',
            ['jaguar'] = 'Jaguar',
            ['jeep'] = 'Jeep',
            ['koenigsegg'] = 'Koenigsegg',
            ['lamborghini'] = 'Lamborghini',
            ['landrover'] = 'Land Rover',
            ['lexus'] = 'Lexus',
            ['lotus'] = 'Lotus',
            ['lucis'] = 'Lucis',
            ['maserati'] = 'Maserati',
            ['mazda'] = 'Mazda',
            ['mclaren'] = 'Mclaren',
            ['mercedesbenz'] = 'Mercedes Benz',
            ['mitsubishi'] = 'Mitsubishi',
            ['nissan'] = 'Nissan',
            ['peugot'] = 'Peugot',
            ['porsche'] = 'Porsche',
            ['rangerover'] = 'Range Rover',
            ['renault'] = 'Renault',
            ['rollsroyce'] = 'Rolls Royce',
            ['subaru'] = 'Subaru',
            ['suzuki'] = 'Suzuki',
            ['tesla'] = 'Tesla',
            ['toyota'] = 'Toyota',
            ['vanilla'] = 'Vanilla',
            ['volkswagen'] = 'Volkswagen',
            ['volvo'] = 'Volvo',
            ['wmotors'] = 'W Motors',
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
            ['cycles'] = 'Bicycles',
            ['work'] = 'Work'
        },
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-45.65, -1093.66, 25.44, 69.5), -- where the vehicle will spawn on display
                defaultVehicle = 'adder', -- Default display vehicle
                chosenVehicle = 'adder', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-48.27, -1101.86, 25.44, 294.5),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2',
            },
            [3] = {
                coords = vector4(-39.6, -1096.01, 25.44, 66.5),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2',
            },
            [4] = {
                coords = vector4(-51.21, -1096.77, 25.44, 254.5),
                defaultVehicle = 'vigero',
                chosenVehicle = 'vigero',
            },
            [5] = {
                coords = vector4(-40.18, -1104.13, 25.44, 338.5),
                defaultVehicle = 't20',
                chosenVehicle = 't20',
            },
            [6] = {
                coords = vector4(-43.31, -1099.02, 25.44, 52.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati',
            },
            [7] = {
                coords = vector4(-50.66, -1093.05, 25.44, 222.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati',
            },
            [8] = {
                coords = vector4(-44.28, -1102.47, 25.44, 298.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati',
            }
        },
    },]]
    ['police'] = {
        ['Type'] = 'free-use',  -- -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {
                vector2(388.26, -1600.38),
                vector2(358.71, -1636.36),
                vector2(384.85, -1654.92),
                vector2(413.64, -1619.70)
            },
            ['minZ'] = 29.000000000000,
            ['maxZ'] = 40.000000000000
        },
        ['Job'] = 'police', -- Name of job or none
        ['ShopLabel'] = 'Police Vehicle Shop',
        ['showBlip'] = true,  --- true or false
        ['Categories'] = {
            ['heavy'] = 'Heavy',
            ['polbike'] = 'Bikes',
            ['standard'] = 'Standard',
            ['undercover'] = 'Undercover',
            ['interceptor'] = 'Interceptors'
        },
        ['TestDriveTimeLimit'] = 1.0,
        ['Location'] = vector3(380.17, -1626.33, 30.12),
        ['ReturnLocation'] = vector3(380.17, -1626.33, 30.12),
        ['VehicleSpawn'] = vector4(392.56, -1619.58, 29.1, 319.4),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(380.58, -1626.17, 28.57, 318.51),
                defaultVehicle = 'npolchal',
                chosenVehicle = 'npolchal',
            },
        }
    }, -- Add your next table under this comma
    ['tuner'] = {
        ['Type'] = 'managed',  -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(120.79251861572, -3050.908203125),
                vector2(122.50583648682, -3050.1271972656),
                vector2(153.15791320801, -3050.1843261719),
                vector2(153.96586608887, -3019.7687988281),
                vector2(121.33261871338, -3019.9128417969)
            },
            ['minZ'] = 7.0408883094788,
            ['maxZ'] = 7.0411071777344
        },
        ['Job'] = 'tuner', -- Name of job or none
        ['ShopLabel'] = '6STR Tuner Shop',
        ['showBlip'] = false,  --- true or false
        ['Categories'] = {
            ['donation'] = 'Donation',
            ['6str'] = '6STR Tuner',
            ['drift'] = 'Drift',
            ['gang'] = 'Club/Gang',
            ['hyundai'] = 'Hyundai',
            ['air'] = 'Air',
            ['amc'] = 'AMC',
            ['renault'] = 'Renault',
            ['kia'] = 'KIA',
            ['alfaromeo'] = 'Alfa Romeo',
            ['water'] = 'Water',
            ['fnf'] = 'FNF Tuner',
            ['motorcycles'] = 'Motorcycles',
            ['acura'] = 'Acura',
            ['mercedesbenz'] = 'Mercedes Benz',
            ['ford'] = 'Ford',
            ['rollsroyce'] = 'Rolls Royce',
            ['volvo'] = 'Volvo',
            ['event'] = 'Event',
            ['toyota'] = 'Toyota',
            ['bmw'] = 'BMW',
            ['honda'] = 'Honda',
            ['holden'] = 'Holden',
            ['jeep'] = 'Jeep',
            ['chevrolet'] = 'Chevrolet',
            ['audi'] = 'Audi',
            ['polestar'] = 'Polestar',
            ['cadillac'] = 'Cadillac',
            ['astonmartin'] = 'Aston Martin',
            ['ferrari'] = 'Ferrari',
            ['lamborghini'] = 'Lamborghini',
            ['lexus'] = 'Lexus',
            ['dodge'] = 'Dodge',
            ['landrover'] = 'Land Rover',
            ['porsche'] = 'Porsche',
            ['mclaren'] = 'McLaren',
            ['datsun'] = 'Datsun',
            ['holden'] = 'Holden',
            ['pagani'] = 'Pagani',
            ['maserati'] = 'Maserati',
            ['mitsubishi'] = 'Mitsubishi',
            ['nissan'] = 'Nissan',
            ['mazda'] = 'Mazda',
            ['subaru'] = 'Subaru',
            ['shelby'] = 'Shelby',
            ['bentley'] = 'Bentley',
            ['bugatti'] = 'Bugatti',
            ['brabham'] = 'Brabham',
            ['bikes'] = 'Bikes',
            ['local'] = 'Local',
            ['idk'] = 'IDFK',
            ['super'] = 'Super',
            ['sports'] = 'Sports'
        },
        ['TestDriveTimeLimit'] = 2.0,
        ['Location'] =vector3(140.61065, -3035.94, 6.4677233),
        ['ReturnLocation'] = vector4(162.57214, -3044.205, 5.3714504, 271.17129),
        ['VehicleSpawn'] = vector4(162.57214, -3044.205, 5.3714504, 271.17129),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(151.76, -3039.76, 6.05, 31.26),
                defaultVehicle = 'zx10',
                chosenVehicle = 'zx10',
            },
            [2] = {
                coords = vector4(151.24, -3044.06, 6.05, 32.22),
                defaultVehicle = 'm3e46',
                chosenVehicle = 'm3e46',
            },
            [3] = {
                coords = vector4(148.28, -3045.55, 6.05, 28.07),
                defaultVehicle = 'na1',
                chosenVehicle = 'na1',
            },
            [4] = {
                coords = vector4(137.76, -3047.44, 6.05, 333.78),
                defaultVehicle = 'gtr',
                chosenVehicle = 'gtr',
            },
            [5] = {
                coords = vector4(132.81, -3047.58, 6.05, 0.86),
                defaultVehicle = 'lp670',
                chosenVehicle = 'lp670',
            },
            [6] = {
                coords = vector4(144.64, -3047.52, 6.05, 45.56),
                defaultVehicle = 's15rb',
                chosenVehicle = 's15rb',
            },
        }
    } -- Add your next table under this comma
}
