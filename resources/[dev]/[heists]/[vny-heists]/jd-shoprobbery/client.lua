QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()
local hadikir = true
local shops = {
    [1] = {
        ["basic_kasa"] = vector3(373.49, 328.49, 103.37),
        ["hard_kasa"] = vector3(378.21, 333.79, 103.57),
    },
    [2] = {
        ["basic_kasa"] = vector3(2554.74, 381.45, 108.54),
        ["hard_kasa"] = vector3(2548.88, 384.91, 108.54),
	},
    [3] = {
        ["basic_kasa"] = vector3(-3041.52, 584.43, 7.91),
        ["hard_kasa"] = vector3(-3048.14, 585.44, 7.91),
    },
    [4] = {
        ["basic_kasa"] = vector3(-1486.45, -378.24, 40.16),
        ["hard_kasa"] = vector3(-1478.71, -375.61, 39.16),
    },
    [5] = {
        ["basic_kasa"] = vector3(1393.07, 3606.22, 34.99),
        ["hard_kasa"] = vector3(1394.87, 3614.31, 34.99),
    },
    [6] = {
        ["basic_kasa"] = vector3(-2966.63, 390.88, 14.93),
        ["hard_kasa"] = vector3(-2959.63, 386.69, 14.04),
    },
    [7] = {
        ["basic_kasa"] = vector3(2676.32, 3281.04, 55.24),
        ["hard_kasa"] = vector3(2672.48, 3286.74, 55.24),
    },
    [8] = {
        ["basic_kasa"] = vector3(-46.88, -1757.55, 29.42),
        ["hard_kasa"] = vector3(-43.75, -1748.16, 29.42),
    },
    [9] = {
        ["basic_kasa"] = vector3(1164.38, -322.42, 69.48),
        ["hard_kasa"] = vector3(1159.02, -314.07, 69.48),
    },
    [10] = {
        ["basic_kasa"] = vector3(-706.47, -913.51, 19.58),
        ["hard_kasa"] = vector3(-710.25, -904.18, 19.22),
    },
    [11] = {
        ["basic_kasa"] = vector3(-1820.68, 793.97, 138.09),
        ["hard_kasa"] = vector3(-1829.43, 798.53, 138.09),
    },
    [12] = {
        ["basic_kasa"] = vector3(1698.15, 4923.11, 42.07),
        ["hard_kasa"] = vector3(1708.14, 4920.73, 42.07),
    },
	[13] = {
        ["basic_kasa"] = vector3(1959.4, 3742.23, 32.34),
        ["hard_kasa"] = vector3(1959.04, 3749.27, 32.34),
    },
	[14] = {
        ["basic_kasa"] = vector3(1134.26, -982.52, 46.42),
        ["hard_kasa"] = vector3(1126.8, -979.78, 45.42),
    },
    [15] = {
        ["basic_kasa"] = vector3(24.75, -1344.9, 29.42),
        ["hard_kasa"] = vector3(28.2, -1338.8, 29.42),
    },
	[16] = {
        ["basic_kasa"] = vector3(548.93, 2668.79, 42.04),
        ["hard_kasa"] = vector3(546.55, 2662.4, 42.04),
    },
    [17] = {
        ["basic_kasa"] = vector3(-3244.48, 1000.66, 12.83),
        ["hard_kasa"] = vector3(-3250.4, 1004.37, 12.83),
    },
	[18] = {
        ["basic_kasa"] = vector3(1166.09, 2710.28, 38.02),
        ["hard_kasa"] = vector3(1169.69, 2717.8, 37.16),
    },
	[19] = {
        ["basic_kasa"] = vector3(1729.51, 6417.01, 35.0),
        ["hard_kasa"] = vector3(1734.97, 6421.22, 35.03),
	},
}

local kasa = nil
local kasaNo = nil
local collectmoney = false

RegisterNetEvent('jd-shoprobbery:onrobbery')
AddEventHandler('jd-shoprobbery:onrobbery', function()
    print("geldi")
    local playerPed = PlayerPedId()
    local PlayerCoords = GetEntityCoords(playerPed)
    kasa = nil
    kasaNo = nil
    for i=1, #shops do
    local basitKasaMesafe = #(PlayerCoords - shops[i]["basic_kasa"])
    local hardKasaMesafe = #(PlayerCoords - shops[i]["hard_kasa"])
        if basitKasaMesafe < 1.5 then
            kasa = "basic"
            kasaNo = i
        elseif hardKasaMesafe < 1.5 then
            kasa = "hard"
            kasaNo = i
        end
    end
	QBCore.Functions.TriggerCallback('jd-shoprobbery:serversidecooldown', function(wait1)
        print(wait1)
		if wait1 then
            local obj = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 2.0, 303280717, false, false, false)
            if GetEntityHealth(obj) < 800 then
                TriggerServerEvent("jd-shoprobbery:givereward", "basic", kasaNo)
                --pd bildirim
            else
                QBCore.Functions.Notify("You couldn't break the store!!!", "error")
            end
		end
	end, kasaNo, "basic")
end)

RegisterNetEvent('jd-shoprobbery:backrobbery')
AddEventHandler('jd-shoprobbery:backrobbery', function()
    local playerPed = PlayerPedId()
    local PlayerCoords = GetEntityCoords(playerPed)
    kasa = nil
    kasaNo = nil
    for i=1, #shops do
    local basitKasaMesafe = #(PlayerCoords - shops[i]["basic_kasa"])
    local hardKasaMesafe = #(PlayerCoords - shops[i]["hard_kasa"])
        if basitKasaMesafe < 1.5 then
            kasa = "basic"
            kasaNo = i
        elseif hardKasaMesafe < 1.5 then
            kasa = "hard"
            kasaNo = i
        end
    end
    QBCore.Functions.TriggerCallback('jd-shoprobbery:serversidecooldown', function(wait2)
		if wait2 then
            if hadikir then
            hadikir = false
            exports["memorygame"]:thermiteminigame(9, 6, 4, 8,
            function() -- success
                QBCore.Functions.Notify("You broke the lock, wait", "success")
                Wait(10000)
                QBCore.Functions.Notify("You can collect money now", "success")
                collectmoney = true
                hadikir = true
            end,
            function() -- failure
                hadikir = true
                collectmoney = false
                QBCore.Functions.Notify("You couldn't open the safe", "error")
            end)
         end
		end
	end, kasaNo, "hard")
end)

RegisterNetEvent('jd-shoprobbery:collectmoney')
AddEventHandler('jd-shoprobbery:collectmoney', function()
	if collectmoney then
		TriggerServerEvent("jd-shoprobbery:givereward", "hard", kasaNo)
	else
        QBCore.Functions.Notify("First you have to get past the safe's password!!!", "error")
	end
end)


store = {
	`prop_till_01`,
   -- "prop_till_01_dam"
}

exports['qb-target']:AddTargetModel(store, {
	options = {
		{
            type = "client",
			event = "jd-shoprobbery:onrobbery",
            icon = "fas fa-dollar-sign",
            label = "Collect Money",
			job = "all"
		},
		
	},
	distance = 1.5,
})

exports['qb-target']:AddBoxZone("backstorerobbery", vector3(31.51, -1339.29, 29.5),1, 1, { -- GABZ GSF SHOP
	name = "backstorerobbery",
	heading=0,
	},{
	options = {
		{
            event = "jd-shoprobbery:backrobbery",
            icon = "fas fa-circle",
            label = "Crack Password",
			job = "all"
		},
        {
            event = "jd-shoprobbery:collectmoney",
            icon = "fas fa-circle",
            label = "Collect Money",
			job = "all"
		},
	},
	distance = 1.5,
})

exports['qb-target']:AddBoxZone("backstorerobbery2", vector3(-710.07, -904.14, 18.52),1, 1, { -- GABZ LITTLE SEOUL
	name = "backstorerobbery2",
	heading=0,
	},{
	options = {
		{
            event = "jd-shoprobbery:backrobbery",
            icon = "fas fa-circle",
            label = "Crack Password",
			job = "all"
		},
        {
            event = "jd-shoprobbery:collectmoney",
            icon = "fas fa-circle",
            label = "Collect Money",
			job = "all"
		},
	},
	distance = 1.5,
})

exports['qb-target']:AddBoxZone("backstorerobbery3", vector3(1126.80, -979.76, 45.4157),1, 1, { -- LIQUOR STORE VESPUCCI BLVRD
	name = "backstorerobbery3",
	heading=0,
	},{
	options = {
		{
            event = "jd-shoprobbery:backrobbery",
            icon = "fas fa-circle",
            label = "Crack Password",
			job = "all"
		},
        {
            event = "jd-shoprobbery:collectmoney",
            icon = "fas fa-circle",
            label = "Collect Money",
			job = "all"
		},
	},
	distance = 1.5,
})

exports['qb-target']:AddBoxZone("backstorerobbery4", vector3(381.36, 332.51, 103.57),1, 1, { -- GABZ CLINTON AVE SHOP
	name = "backstorerobbery4",
	heading=0,
	},{
	options = {
		{
            event = "jd-shoprobbery:backrobbery",
            icon = "fas fa-circle",
            label = "Crack Password",
			job = "all"
		},
        {
            event = "jd-shoprobbery:collectmoney",
            icon = "fas fa-circle",
            label = "Collect Money",
			job = "all"
		},
	},
	distance = 1.5,
})

exports['qb-target']:AddBoxZone("backstorerobbery5", vector3(-43.76, -1748.12, 28.82),1, 1, { -- Ballas Gas Station
	name = "backstorerobbery5",
	heading=0,
	},{
	options = {
		{
            event = "jd-shoprobbery:backrobbery",
            icon = "fas fa-circle",
            label = "Crack Password",
			job = "all"
		},
        {
            event = "jd-shoprobbery:collectmoney",
            icon = "fas fa-circle",
            label = "Collect Money",
			job = "all"
		},
	},
	distance = 1.5,
})

exports['qb-target']:AddBoxZone("backstorerobbery6", vector3(1737.66, 6419.29, 35.04),1, 1, { -- Great Ocean Very Top Store
	name = "backstorerobbery6",
	heading=0,
	},{
	options = {
		{
            event = "jd-shoprobbery:backrobbery",
            icon = "fas fa-circle",
            label = "Crack Password",
			job = "all"
		},
        {
            event = "jd-shoprobbery:collectmoney",
            icon = "fas fa-circle",
            label = "Collect Money",
			job = "all"
		},
	},
	distance = 1.5,
})

exports['qb-target']:AddBoxZone("backstorerobbery7", vector3(-1221.3, -916.29, 11.1923),1, 1, { -- Liquor STORE BEHIND BURGERSHOT
	name = "backstorerobbery7",
	heading=0,
	},{
	options = {
		{
            event = "jd-shoprobbery:backrobbery",
            icon = "fas fa-circle",
            label = "Crack Password",
			job = "all"
		},
        {
            event = "jd-shoprobbery:collectmoney",
            icon = "fas fa-circle",
            label = "Collect Money",
			job = "all"
		},
	},
	distance = 1.5,
})

exports['qb-target']:AddBoxZone("backstorerobbery8", vector3(-3048.77, 588.74, 7.91),1, 1, { -- Inseno Rd, Great Ocean Hwy -- Gabz
	name = "backstorerobbery8",
	heading=0,
	},{
	options = {
		{
            event = "jd-shoprobbery:backrobbery",
            icon = "fas fa-circle",
            label = "Crack Password",
			job = "all"
		},
        {
            event = "jd-shoprobbery:collectmoney",
            icon = "fas fa-circle",
            label = "Collect Money",
			job = "all"
		},
	},
	distance = 1.5,
})