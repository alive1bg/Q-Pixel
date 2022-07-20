
function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 5.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = false

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target
Config.OpenKey = 'LMENU' -- Left Alt
Config.OpenControlKey = 19 -- Control for keypress detection also Left Alt for the eye itself, controls are found here https://docs.fivem.net/docs/game-references/controls/

-- Key to open the menu
Config.MenuControlKey = 237 -- Control for keypress detection on the context menu, this is the Right Mouse Button, controls are found here https://docs.fivem.net/docs/game-references/controls/

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {

    ["BurgershotDuty"] = {
        name = "BurgershotDuty",
        coords = vector3(-1191.48, -900.53, 14.25),
        length = 1.1,
        width = 0.3,
        heading = 212.0,
        debugPoly = false,
        minZ = 14.25,
        maxZ = 15.33,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:DutyB",
                icon = "far fa-clipboard",
                label = "Clock In/Out",
                job = "burgershot",
            }
        },
        distance = 3.0
        },
    ["BurgerShotJob"] = {
        name = "BurgerShotJob",
        coords = vector3(-1196.64, -904.80, 13.04),
        length = 0.8,
        width = 2.5,
        heading = 302,
        debugPoly = false,
        minZ = 13.04,
        maxZ = 14.50,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:startjob",
                icon = "far fa-clipboard",
                label = "Start Job",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["BurgersCounter"] = {
        name = "BurgersCounter",
        coords =vector3(-1198.558, -897.416, 13.830132),
        length = 0.9,
        width = 1,
        heading = 125,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotmenu:burgershotmainmanu",
                icon = "fas fa-hamburger",
                label = "Burgershot Burger Menu",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["BurgershotWashHands"] = {
        name = "BurgershotWasHands",
        coords = vector3(-1200.291, -901.0861, 13.975964),
        length = 0.8,
        width = 0.7,
        heading = 123.5,
        debugPoly = false,
        minZ = 13.53,
        maxZ = 14.29,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:washHands",
                icon = "fas fa-hand-holding-water",
                label = "Wash your Hands!",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["SodaFountain"] = {
        name = "SodaFountain",
        coords = vector3(-1200.03, -895.47, 14.74),
        length = 1.1,
        width = 2.1,
        heading = 125,
        debugPoly = false,
        minZ = 14.00,
        maxZ = 14.73,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotmenu:DrinkMenu",
                icon = "fas fa-filter",
                label = "Burgershot Drink Menu",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["TomatoCounter"] = {
        name = "TomatoCounter",
        coords = vector3(-1198.447, -898.4566, 13.664762),
        length = 1.0,
        width = 1.1,
        heading = 29.83,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:makeTomato",
                icon = "fas fa-hamburger",
                label = "Cut Tomatoes",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:makeOnions",
                icon = "fas fa-hamburger",
                label = "Cut Onions",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["Fries"] = {
        name = "Fries",
        coords = vector3(-1202.03, -898.62, 13.03),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareFries",
                icon = "fas fa-box",
                label = "Make Fries",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareOnionRings",
                icon = "fas fa-box",
                label = "Make Onion Rings",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareChickenNuggets",
                icon = "fas fa-box",
                label = "Make Chicken Nuggets",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["MeatGrill"] = {
        name = "MeatGrill",
        coords = vector3(-1202.83, -897.28, 13.98),
        length = 0.8,
        width = 1.45,
        heading = 304.5,
        debugPoly = false,
        minZ = 13.99,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:BakeMeat",
                icon = "fas fa-box",
                label = "Grill Raw Meat",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["DriveThruWindow"] = {
        name = "DriveThruWindow",
        coords = vector3(-1193.82, -906.99, 12.79),
        length = 1,
        width = 2,
        heading = 171.50,
        debugPoly = false,
        minZ = 12.79,
        maxZ =  15.40,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:DriveThru",
                icon = "fas fa-box",
                label = "Drive Thru",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["FrontCounterTray1"] = {
        name = "FrontCounterTray1",
        coords = vector3(-1196.01, -891.45, 14.03),
        length = 0.5,
        width = 0.5,
        heading = 122,
        debugPoly = false,
        minZ = 14.03,
        maxZ = 14.30,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Tray1",
                icon = "fas fa-box",
                label = "Tray 1",
            }
        },
        distance = 3.0
    },
    ["FrontCounterTray2"] = {
        name = "FrontCounterTray2",
        coords = vector3(-1194.67, -893.23, 14.03),
        length = 0.5,
        width = 0.5,
        heading = 122,
        debugPoly = false,
        minZ = 14.03,
        maxZ = 14.30,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Tray2",
                icon = "fas fa-box",
                label = "Tray 2",
            }
        },
        distance = 3.0
    },
    ["HotTrayStorage"] = {
        name = "HotTrayStorage",
        coords = vector3(-1197.56, -894.57, 13.00),
        length = 1,
        width = 4.5,
        heading = 304.5,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.87,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Storage",
                icon = "fas fa-box",
                label = "BurgerShot Storage",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["BurgerFridge"] = {
        name = "BurgerFridge",
        coords = vector3(-1196.63, -902.0, 13.05),
        length = 0.8,
        width = 1.55,
        heading = 32.5,
        debugPoly = false,
        minZ = 13.05,
        maxZ = 15.47,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:FoodStorage",
                icon = "fas fa-box",
                label = "BurgerShot Fridge",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["UnloadBurgeshotIngredients"] = {
        name = "UnloadBurgeshotIngredients",
        coords = vector3(-1204.985, -891.8149, 13.984722),
        length = 4,
        width = 4,
        heading = 214,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 15.49,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Unloadbox",
                icon = "fas fa-box",
                label = "Unload Ingredients",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["Icecream"] = {
        name = "Ice Cream",
        coords = vector3(-1193.029, -895.7907, 14.0616),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:icecream",
                icon = "fas fa-ice-cream",
                label = "Make Ice Cream",
                job = "burgershot",
            }
        },
        distance = 1.5
    },
    ["donut"] = {
        name = "Donut",
        coords = vector3(-1203.854, -895.6851, 14.44202),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:donut",
                icon = "fas fa-box",
                label = "Get a Donut",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:creampie",
                icon = "fas fa-box",
                label = "Get a Slice of Cream Pie",
                job = "burgershot",
            }
        },
        distance = 1.5
    },
    ["BSRegister1"] = {
        name = "BSRegister1",
        coords = vector3(-1195.27, -892.34, 13.98),
        length = 0.7,
        width = 0.7,
        heading = 90.5,
        debugPoly = false,
        minZ = 14.23,
        maxZ = 14.45,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:registermenu",
                icon = "fas fa-credit-card",
                label = "Open Register",
                job = "burgershot",
            },
        },
        distance = 3.0
    },
    ["BSRegister2"] = {
        name = "BSRegister2",
        coords = vector3(-1194.27, -893.87, 14.06),
        length = 0.7,
        width = 0.7,
        heading = 90.5,
        debugPoly = false,
        minZ = 14.23,
        maxZ = 14.45,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:registermenu",
                icon = "fas fa-credit-card",
                label = "Open Register",
                job = "burgershot",
            },
        },
        distance = 2.0
    },

    ["BSRegister3"] = {
        name = "BSRegister3",
        coords = vector3(-1192.69, -906.48, 13.98),
        length = 0.6,
        width = 0.4,
        heading = 235,
        debugPoly = false,
        minZ = 10.38,
        maxZ = 14.48,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:registermenu",
                icon = "fas fa-credit-card",
                label = "Open Register",
                job = "burgershot",
            },
        },
        distance = 2.0
    },

    ["vinnysWarehouse"] = {
        name = "vinnysWarehouse",
        coords = vector3(858.65527, -3202.554, 5.994996),
        length = 2.5,
        width = 1.1,
        heading = 93.5,
        debugPoly = false,
        minZ = 5.0,
        maxZ = 7.29,
        options = {
            --pizza this
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-pizzathis:Warehousebuypallet",
                icon = "far fa-clipboard",
                label = "Pick Up Ingredients",
                job = "pizzathis",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-uwujob:Warehousebuypallet",
                icon = "far fa-clipboard",
                label = "Pick Up Ingredients",
                job = "uwu",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-bahama:Warehousebuypallet",
                icon = "far fa-clipboard",
                label = "Pick Up Ingredients",
                job = "bahama",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Warehousebuypallet",
                icon = "far fa-clipboard",
                label = "Pick Up Ingredients",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-pearls:Warehousebuypallet",
                icon = "far fa-clipboard",
                label = "Pick Up Ingredients",
                job = "pearls",
            },
        },
        distance = 3.0
    },


      ["pdseized"] = {
        name = "PD Seized",
        coords = vector3(444.59, -985.03, 30.69), 
        length = 1.0,
        width = 1.4,
        heading = 2,
        debugPoly = false,
        minZ=27.69,
        maxZ=31.69,
        options = {
            {
                type = "client",
                event = "qb-garages:client:VehicleListPD", 
                icon = "fas fa-wrench",
                label = "Seized Vehicle List",
                job = "police",
            },
        },
        distance = 2.5
    },

    ["dispatchcarcam"] = {
        name = "PD Cameras",
        coords = vector3(442.31, -999.67, 34.97), 
        length = 1.0,
        width = 3.4,
        heading = 359,
        debugPoly = false,
        minZ=34.77,
        maxZ=35.37,
        options = {
            {
                type = "client",
                event = "rp_interact:client:PoliceDashCams", 
                icon = "fas fa-circle",
                label = "View Dash Cams",
                job = "police",
            },
        },
        distance = 1.5
    },



    -- qb-mechanicparts
    ["mechaniccraft2"] = {
        name = "Mechanic Toolbox2",
        coords = vector3(-1415.3, -452.4, 35.91), 
        length = 1,
        width = 1,
        heading = 0,
        debugPoly = false,
        minZ=35.81,
        maxZ=35.99,
        options = {
            {
                type = "client",
                event = "craft:mechanicparts", 
                icon = "fas fa-wrench",
                label = "Craft",
                job = "hayesauto",
            },
        },
        distance = 2.5
    },
    -- qb-mechanicparts
    ["mechaniccraft"] = {
        name = "Mechanic Toolbox",
        coords = vector3(136.7, -3051.41, 7.04),
        length = 1,
        width = 1,
        heading = 0,
        debugPoly = false,
        minZ=3.44,
        maxZ=7.44,
        options = {
            {
                type = "client",
                event = "craft:mechanicparts", 
                icon = "fas fa-wrench",
                label = "Craft",
                job = "tuner",
            },
        },
        distance = 2.5
    },
}

Config.PolyZones = {

}

Config.TargetBones = {
    ["main"] = {
        bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r",
            "boot"
        },
        options = {
            {
                type = "client",
                event = "police:client:PutPlayerInVehicle",
                icon = "fas fa-chevron-circle-left",
                label = "Place In Vehicle",
            },
            {
                type = "client",
                event = "police:client:SetPlayerOutVehicle",
                icon = "fas fa-chevron-circle-right",
                label = "Take Out Vehicle",
            },
            {
                type = "client",
                event = "qb-policejob:copimpound",  
                icon = "fas fa-car",
                label = "Impound Vehicle",
                job = 'police'
            },
            {
                type = "client",
                event = "qb-policejob:towimpound",
                icon = "fas fa-car",
                label = "Impound",
                job = 'tow'
            },
            {
                type = "client",
                event = "craft:vehmenu",
                icon = "fas fa-magnifying-glass",
                label = "Inspect Vehicle",
                job = "tuner",
                
            },
            {
                type = "client",
                event = "craft:vehmenu",
                icon = "fas fa-magnifying-glass",
                label = "Inspect Upgrades",
                job = "hayesauto",
            },
            {
                type = "client",
                event = "dcrp-policejob:towimpound",
                icon = "fas fa-car",
                label = "Impound Car",
                job = 'tuner'
            },
            {
                type = "client",
                event = "qb-trunk:client:GetIn",
                icon = "fas fa-user-secret",
                label = "Get In Trunk",
            },
            {
                type = "client",
                event = "qb:flipvehicle",
                icon = "fas fa-car",
                label = "Flip Vehicle",
            },
            {
                type = "client",
                event = "vehiclekeys:client:GiveKeys",
                icon = "fas fa-key", 
                label = "Give Keys",
            },
        },
        distance = 2.5
    },
}

Config.TargetEntities = {
    
}

Config.TargetModels = {

    ["BurgershotGarage"] = {
		models = {
		    `csb_talcc`,
		},
		options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
            	event = "qb-burgershotmenu:menu",
                icon = "fas fa-car",
				label = "BurgerShot Garage",
                job = "burgershot",
                canInteract  = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                    local dist = #(GetEntityCoords(PlayerPedId()) - vector3(-1177.112, -892.277, 13.909599))
                    if dist > 6 then
                        return false  -- This will return false if the entity interacted with is a player and otherwise returns true
                    elseif dist < 7 then 
                        return true 
                    end
                end,
            },
		},
		distance = 3.0
	},
    ["bike"] = {
        models = {
            `bmx`,
            `bimx`,
            `cruiser`,
            `scorcher`,
            `fixter`,
            `tribike`,
            `tribike`,
            `tribike3`,
        },
        options = {
            {
                type = "event",
                event = "pickup:bike",
                icon = "fas fa-bicycle",
                label = "Pickup Bike",
            },
        },
        distance = 2.0
    },
    ["SellContabandMWShopSell"] = {
        models = {
            `g_m_m_mexboss_01`
        },
        options = {
            {
                type= "server",
                event = "mw-shopseller:server:sellItems",
                icon = "fas fa-user-secret",
                label = "Sell Contraband"
            },
        },
        distance = 3.0
    }, 

    ["yoga"] = {
        models = {
            `prop_yoga_mat_01`,
            `prop_yoga_mat_02`,
            `prop_yoga_mat_03`,
            `p_yoga_mat_01_s`
        },
        options = {
            {
                type = "client",
                event = "yoga:start",
                icon = "fas fa-yin-yang",
                label = "Do yoga"
            },
        },
        distance = 2.0
    }, 


    ["trashsearch"] = {
        models = {
	    -1096777189,
	    666561306,
	    1437508529,
	    -1426008804,
	    -228596739,
	    161465839,
	    651101403,
        -58485588,
        218085040,
        -206690185,
        },
        options = {
            {
                type = "client",
                event = "qb-trashsearch:client:searchtrash",
                icon = "fas fa-dumpster",
                label = "Dumpster Dive",
            },
            {
             type = "client",
             event = "Jakers-Dumpster:client:open:Dumpster:storage",
             icon = "far fa-trash-alt",
             label = "Open Bin",
            },
        },
        distance = 3.0
    },
    ["ClawMachine"] = {
        models = {
            `ch_prop_arcade_claw_01a`
        },
        options = {
            {
                type= "client",
                event = "clawmachine:client:use",
                icon = "fas fa-user-secret",
                label = "Use Claw Machine ($3000) 2% Chance"
            },
        },
        distance = 3.0
    },   
    ["VehicleRental"] = {
        models = {
            `cs_andreas`,
        },
        options = {
            {
                type = "client",
                event = "qb-rental:openMenu",
                icon = "fas fa-car",
                label = "Rent Vehicle",
            },
        },
        distance = 4.0
    },
    ["garbageman"] = {
		models = { 
			"s_m_y_garbage",
		},
        options = {
            {
                type = "client",
                event = "getGarbagePaySlip",
                icon = "fas fa-clipboard",
                label = "Collect Paycheck",
                job = "garbage"
            },
            {
                type = "client",
                event = "GarbageTruckSpawn",
                icon = "fas fa-clipboard",
                label = "Spawn Garbage-Truck",
                job = "garbage"
            },
        },
        distance = 2.5,
    },

    ["signs"] = {
        models = {
	    1532794617,
        },
        options = {
            {
                type = "client",
                event = "signs:client:hello",
                icon = "fas fa-clipboard",
                label = "Change Sign",
            },
        }, 
        distance = 3.0
    },
}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {
    options = {
        {
            event = "police:client:RobPlayer",
            icon = "fas fa-user-secret",
            label = "Rob Person",
        },
        {
            event = "shoestealing:client:stealshoes",
            icon = "fas fa-socks",
            label = "Steal Shoes",
        },
        {
            type = "client",
            event = "police:client:CuffPlayer",
            icon = "fas fa-hands",
            label = "Cuff",
            item = 'handcuffs',
        },
        {
            type = "client",
            event = "police:client:UnCuffPlayer",
            icon = "fas fa-hands",
            label = "Un Cuff",
            item = 'handcuffkey',
        },
        {
            type = "client",
            event = "police:client:EscortPlayer",
            icon = "fas fa-chevron-circle-right",
            label = "Escort",
        },
        {
            event = "police:client:CheckStatus",
            icon = "fas fa-angry",
            label = "Status Check",
            job = "police"
        },
        {
            type = "client",
            event = "police:client:takeoffmask",
            icon = "las la-mask",
            label = "Take Off Mask",
        },
        
    },
    distance = 3.0
}

Config.Peds = {
    ["GarbagePed"] = {
        model = 's_m_y_garbage', 
        coords = vector4(-349.96, -1569.92, 25.22, 296.46),
        minusOne = true, 
        freeze = true, 
        invincible = true, 
        blockevents = true,
        target = { 
          options = {
             {
                 type = "server",
                 event = "garbage:server:getGarbageJob",
                 icon = "fas fa-sign-in-alt",
                 label = "Get Garbage Job",
             },
             {
                 type = "client",
                 event = "garbage:getTruck",
                 icon = "fas fa-sign-in-alt",
                 label = "Get Garbage Truck",
             },
             {
                 type = "client",
                 event = "garbage:returnTruck",
                 icon = "fas fa-sign-in-alt",
                 label = "Return Garbage Truck",
             },
             {
                 type = "server",
                 event = "garbagejob:server:PayShift",
                 icon = "fas fa-sign-in-alt",
                 label = "Collect Pay Check",
             },
         },
         distance = 1.5,
     },
 },
}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCount() return true end
local function CitizenCheck() return true end

CreateThread(function()
	if not Config.Standalone then
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCount = function(item)
			for _, v in pairs(PlayerData.items) do
				if v.name == item then
					return true
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	else
		local firstSpawn = false
		AddEventHandler('playerSpawned', function()
			if not firstSpawn then
				SpawnPeds()
				firstSpawn = true
			end
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCount(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end
