Config = {}

Config.debug = false -- Debug mode, disable on prod servers

Config.Drinks = {
    ['coke'] = {
        name = 'Coke', -- The name of the drink
        item = 'cocacola', -- The actual item name (in shared.lua)
        amount = 1, -- The amount it gives
        price = 200 -- THe price of the drink
    },
    ['whiskey'] = {
        name = 'Whiskey',
        item = 'whiskey',
        amount = 1,
        price = 100 
    },
    ['vodka'] = {
        name = 'Vodka',
        item = 'vodka',
        amount = 1,
        price = 100
    },
    ['rum'] = {
        name = 'Rum',
        item = 'rum',
        amount = 1,
        price = 100
    },
}

Config.Settings = {
    ['bahma'] = {
        ['duty'] = { 
            coords = vector3(-1379.144, -629.984, 31.044561), -- On Duty settings
            minZ = 30.0158, 
            maxZ = 32.0158,
            length = 0.5,
            width = 0.5,
            heading = 120
        },
        ['stash'] = { 
            coords = vector3(-1372.871, -627.7084, 30.674585), -- Coords for worker stash
            minZ = 29.566408, 
            maxZ = 31.566408,
            length = 4,
            width = 0.5,
            heading = 120
        },
        ['bossSettings'] = { -- Boss Action Settings
            hash = `g_f_y_lost_01`,
            coords = vector4(-1371.675, -625.7395, 29.744567, 31.914962),
            spawnped = true, -- Spawn the boss ped? Leave as false for now (waiting for qb-bossmenu fix)
            bossJob = 'bahma' -- Name of the job that can access the boss menu
        },
        ['barSettings'] = { -- Bartender Settings
            hash = `g_f_y_lost_01`,
            coords = vector4(-1391.288, -606.2483, 29.189079, 130.98039),
            playAnimation = true
        },
        ['strippers'] = { -- WIP
            enabled = true, -- Enable Strippers
            coords = {
                vector4(112.43, -1286.53, 28.00, 317.46),
                vector4(113.17, -1288.12, 28.00, 300.63),
            }
        }
    },
}

Config.Translation = 'en'

Translation = {
    ['en'] = {
        -- Drinks + bar handling
        ['coke'] = "CoCa Cola",
        ['vodka'] = "Vodka",
        ['vodkaDesc'] = "You russian or something?",
        ['rumDesc'] = "I'm sure that person wants to fight!",
        ['whiskeyDesc'] = "What are you? 60?",
        ['rum'] = "Rum",
        ['whiskey'] = "Whiskey",
        ['cokedesc'] = "Designated Driver? No worries, have this!",
        ['browseDrinks'] = "Browse the drinks",
        ['browseDesc'] = "Click here to browse what the bartender has to offer",
        ['barMenu'] = "Bar Menu",
        ['confirmDrink'] = "Are you sure you wish to purchase a ",
        ['yes'] = "Yes",
        ['no'] = "No",
        ['accessBarMenu'] = "Access Bar Menu",
        ['cost'] = "This will cost $", 
        -- Employee Management
        ['employeeTitle'] = "Boss Menu",
        ['employeeHire'] = "Open Boss Menu",
        ['openEmployee'] = "Open Employee Management",
        ['employeeHireDesc'] = "Click here to open the boss menu",
        ['goBack'] = "< Go Back",
        -- qb-target settings
        ['toggleDuty'] = "Clock On/Clock Off",
        ['openStash'] = "Open Stash",
    }
}