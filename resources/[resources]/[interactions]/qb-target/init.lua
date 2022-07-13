
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
