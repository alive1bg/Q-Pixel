local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
local onDuty = false
local debug = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "uwu" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function() 
    henhouseBlip = AddBlipForCoord(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)
    SetBlipSprite(henhouseBlip, 89)
    SetBlipDisplay(henhouseBlip, 3)
    SetBlipColour(henhouseBlip, 48)
    SetBlipScale(henhouseBlip, 0,6)
    SetBlipAsShortRange(henhouseBlip, true)
    SetBlipScale(henhouseBlip, 0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(henhouseBlip)
end)

--Distance Check for if player is too far away, so they don't keep getting tickets for sales while at other side of the planet.
CreateThread(function()
    --local PlayerData = QBCore.Functions.GetPlayerData()
	while true do
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			if onDuty and PlayerJob.Name == "uwu" then
				if #(pos - vector3(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)) >= Config.ClockOutDist then
					onDuty = not onDuty
					TriggerServerEvent("QBCore:ToggleDuty")
				end
			end
		Wait(100)
	end
end)

RegisterNetEvent('qb-uwu:toggleDuty', function()
	onDuty = not onDuty
	TriggerServerEvent('QBCore:ToggleDuty')
end)


Citizen.CreateThread(function()
	--Stashes
	exports['qb-target']:AddBoxZone("uWuPrepared", vector3(-587.37, -1059.62, 22.34), 2.4, 1.7, { name="uWuPrepared", heading = 0.0, debugPoly=debug, minZ=22.14, maxZ=22.74 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-box-open", label = "Prepared Food", stash = "Shelf" }, },
		  distance = 1.0
	})
	
	--Storages
	exports['qb-target']:AddBoxZone("uWuBigStorage", vector3(-588.06, -1067.1, 22.34), 3.5, 0.5, { name="uWuBigStorage", heading = 0, debugPoly=debug, minZ=19.84, maxZ=23.84 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-temperature-low", label = "Big Storage", stash = "BigStorage", job = "uwu" }, },
		  distance = 1.0
	})		
	exports['qb-target']:AddBoxZone("uWuSmallStorage", vector3(-590.67, -1068.1, 22.34), 2.0, 0.6, { name="uWuSmallStorage2", heading = 0, debugPoly=debug, minZ=19.84, maxZ=23.84 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-temperature-low", label = "Small Storage", stash = "SmallStorage", job = "uwu"  }, },
		  distance = 1.0
	})

	--FRIDGE
	exports['qb-target']:AddBoxZone("uWuFridge", vector3(-591.04, -1058.6, 22.34), 1.2, 1, { name="uWuFridge", heading = 0, debugPoly=debug, minZ=19.69, maxZ=23.69 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-temperature-low", label = "Open Fridge", stash = "Fridge", job = "uwu"  }, },
		  distance = 1.0
	})
	
	--WARESTORAGE
	exports['qb-target']:AddBoxZone("uWuShop", vector3(-598.0, -1068.47, 22.34), 4.0, 1.5, { name="uWuShop", heading = 90, debugPoly=debug, minZ=20.94, maxZ=24.94 }, 
		{ options = { {  event = "qb-uwu:Shop", icon = "fas fa-box-open", label = "Open Store", job = "uwu" }, },
		  distance = 2.0
	})
	exports['qb-target']:AddBoxZone("uWuShop2", vector3(-598.25, -1065.61, 22.34), 4.0, 1.5, { name="uWuShop2", heading = 90, debugPoly=debug, minZ=20.94, maxZ=24.94 }, 
		{ options = { {  event = "qb-uwu:Shop", icon = "fas fa-box-open", label = "Open Store", job = "uwu" }, },
		  distance = 2.0
	})
	exports['qb-target']:AddBoxZone("uWuShop3", vector3(-598.31, -1062.79, 22.34), 4.0, 1.5, { name="uWuShop3", heading = 90, debugPoly=debug, minZ=20.94, maxZ=24.94 }, 
		{ options = { {  event = "qb-uwu:Shop", icon = "fas fa-box-open", label = "Open Store", job = "uwu" }, },
		  distance = 2.0
	})

	--CupsAndBags
	exports['qb-target']:AddBoxZone("uWuSmallShop", vector3(-585.3, -1055.29, 22.34), 2.85, 0.6, { name="uWuSmallShop", heading = 270, debugPoly=debug, minZ=21.34, maxZ=23.54 }, 
		{ options = { {  event = "qb-uwu:Shop1", icon = "fas fa-box-open", label = "Open Store", job = "uwu" }, },
		  distance = 2.0
	})
	
	--Sinks
	exports['qb-target']:AddBoxZone("uWuWash1", vector3(-587.89, -1062.58, 22.36), 0.7, 0.7, { name="uWuWash1", heading = 0, debugPoly=debug, minZ=19.11, maxZ=23.11 }, 
		{ options = { { event = "qb-uwu:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, },
		  distance = 1.5
	})		
	exports['qb-target']:AddBoxZone("uWuWash2", vector3(-570.23, -1051.41, 22.34), 0.5, 0.5, { name="uWuWash2", heading = 0, debugPoly=debug, minZ=21.74, maxZ=22.94, }, 
		{ options = { { event = "qb-uwu:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, },
		  distance = 1.2
	})		
	exports['qb-target']:AddBoxZone("uWuWash3", vector3(-570.25, -1056.98, 22.34), 0.5, 0.5, { name="uWuWash3", heading = 0, debugPoly=debug, debugPoly=debug, minZ=21.74, maxZ=22.94, },
		{ options = { { event = "qb-uwu:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, },
		  distance = 1.2
	})
	
	--Clockin
	exports['qb-target']:AddBoxZone("uWuClockin", vector3(-594.34, -1053.35, 22.34), 3.5, 0.5, { name="uWuClockin", heading = 0, debugPoly=debug, minZ=22.19, maxZ=23.79 }, 
		{ options = { { event = "qb-uwu:toggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "uwu" }, },
		  distance = 2.0
	})
	
	--Oven
	exports['qb-target']:AddBoxZone("uWuOven", vector3(-590.98, -1059.74, 22.34), 1.2, 1, { name="uWuOven", heading = 0, debugPoly=debug, minZ=19.84, maxZ = 23.84, }, 
		{ options = { { event = "qb-uwu:Menu:Oven", icon = "fas fa-temperature-high", label = "Use Oven", job = "uwu" }, },
		  distance = 2.0
	})

	--Trays
	exports['qb-target']:AddBoxZone("uWuCounter", vector3(-584.01, -1059.27, 22.34), 0.6, 0.6, { name="uWuCounter", heading = 0, debugPoly=debug, minZ=19.04, maxZ=23.04 }, 
		{ options = { { event = "qb-uwu:Stash", icon = "fas fa-hamburger", label = "Open Counter", stash = "Counter" }, },
		  distance = 2.5
	})	
	exports['qb-target']:AddBoxZone("uWuCounter2", vector3(-584.04, -1062.05, 22.34), 0.6, 0.6, { name="uWuCounter2", heading = 0, debugPoly=debug, minZ=19.04, maxZ=23.04 }, 
		{ options = { { event = "qb-uwu:Stash", icon = "fas fa-hamburger", label = "Open Counter", stash = "Counter2" }, },
		  distance = 2.5
	})
	
	exports['qb-target']:AddBoxZone("HenReceipt1", vector3(-584.07, -1058.69, 22.34), 0.5, 0.5, { name="HenReceipt1", heading = 0, debugPoly=debug, minZ = 19.04, maxZ = 23.04, }, 
		{ options = { { event = "qb-uwu:client:open:register", icon = "fas fa-credit-card", label = "Charge Customer", job = "uwu" },
					  { event = "qb-uwu:client:open:payment", icon = "fas fa-cash-register", label = "Make Payment", }, },
		  distance = 2.0
	})
	exports['qb-target']:AddBoxZone("HenReceipt2", vector3(-584.09, -1061.47, 22.34), 0.5, 0.5, { name="HenReceipt2", heading = 0, debugPoly=debug, minZ = 19.04, maxZ = 23.04, }, 
		{ options = { { event = "qb-uwu:client:open:register", icon = "fas fa-credit-card", label = "Charge Customer", job = "uwu" },
					  { event = "qb-uwu:client:open:payment", icon = "fas fa-cash-register", label = "Make Payment", }, },
		  distance = 2.0
	})	
	--Coffee
	exports['qb-target']:AddBoxZone("uWuCoffee", vector3(-586.8, -1061.89, 22.34), 0.7, 0.5, { name="uWuCoffee", heading = 0, debugPoly=debug, minZ=21.99, maxZ=23.19 }, 
		{ options = { { event = "qb-uwu:Menu:Coffee", icon = "fas fa-mug-hot", label = "Pour Coffee", job = "uwu" }, },
		  distance = 2.0
	})
	--Chopping Board
	exports['qb-target']:AddBoxZone("uWuBoard", vector3(-591.12, -1063.07, 22.34), 0.7, 0.5, { name="uWuBoard", heading = 0, debugPoly=debug, minZ=22.29, maxZ=22.49, }, 
		{ options = { { event = "qb-uwu:Menu:ChoppingBoard", icon = "fas fa-utensils", label = "Sandwiches", job = "uwu" }, },
		  distance = 2.0
	})
	--Microwave
	exports['qb-target']:AddBoxZone("uWuMicrowave", vector3(-591.12, -1061.13, 22.34), 1.1, 0.4, { name="uWuMicrowave", heading = 0, debugPoly=debug, minZ=23.04, maxZ=23.44, }, 
		{ options = { { event = "qb-uwu:Menu:Microwave", icon = "fas fa-fire", label = "Use Microwave", job = "uwu" }, },
		  distance = 2.0
	})
	--Blender
	exports['qb-target']:AddBoxZone("uWuBlender", vector3(-591.03, -1064.16, 22.34), 0.5, 0.5, { name="uWuBlender", heading = 0, debugPoly=debug, minZ=22.14, maxZ=22.74, }, 
		{ options = { { event = "qb-uwu:Menu:Blender", icon = "fas fa-blender", label = "Use Blender", job = "uwu" }, },
		  distance = 2.0
	})
	--Hot Plates
	exports['qb-target']:AddBoxZone("uWuHotPlates", vector3(-591.09, -1056.54, 22.36), 1.05, 0.65, { name="uWuHotPlates", heading = 0, debugPoly=debug, minZ=22.11, maxZ=22.76, }, 
		{ options = { { event = "qb-uwu:Menu:HotPlates", icon = "fab fa-free-code-camp", label = "Cook", job = "uwu" }, },
		  distance = 2.0
	})
	--Tables
	exports['qb-target']:AddBoxZone("uWuTable", vector3(-573.43, -1059.76, 22.49), 1.9, 1.0, { name="uWuTable", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-box-open", label = "Table", stash = "Table_1" }, },
		  distance = 2.5
	})
	exports['qb-target']:AddBoxZone("uWuTable2", vector3(-573.44, -1063.45, 22.34), 1.9, 1.0, { name="uWuTable2", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-box-open", label = "Table", stash = "Table_2" }, },
		  distance = 2.5
	})
	exports['qb-target']:AddBoxZone("uWuTable3", vector3(-573.41, -1067.09, 22.49), 1.9, 1.0, { name="uWuTable3", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-box-open", label = "Table", stash = "Table_3" }, },
		  distance = 2.5
	})
	exports['qb-target']:AddBoxZone("uWuTable4", vector3(-578.68, -1051.09, 22.35), 1.2, 0.9, { name="uWuTable4", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-box-open", label = "Table", stash = "Table_4" }, },
		  distance = 2.5
	})

	exports['qb-target']:AddBoxZone("uWuTable5", vector3(-586.89, -1065.72, 22.34), 0.65, 0.55, { name="uWuTable5", heading = 0, debugPoly=debug, minZ=22.29, maxZ=22.54 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-box-open", label = "Table", stash = "Table_5" }, },
		  distance = 2.5
	})

	exports['qb-target']:AddTargetModel(`ig_bankman`, {
        options = {
            {
                type = 'server',
                event = 'qb-uwu:Tickets:Sell',
                icon = 'fas fa-receipt',
                label = 'Cash in Receipts',
				job = 'uwu',
            },
        },
        distance = 2.5
    })
end)

RegisterNetEvent('qb-uwu:washHands')
AddEventHandler('qb-uwu:washHands',function()
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_arresting", 
        anim = "a_uncuff", 
        flags = 8,
    }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "You've washed your hands!", 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)


RegisterNetEvent('qb-uwu:MakeItem')
AddEventHandler('qb-uwu:MakeItem', function(data)
	if onDuty then
		--Hot Plates
		if data.item == "uwumisosoup" or data.item == "uwucatfood" or data.item == "uwupancakes" or data.item == "uwunekodonut" or data.item == "uwuriceball" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if amount then
					FoodProgress(data.item)
				else 
					TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error')
				end		
			end)
		--Chopping Board
		elseif data.item == "uwuhamcheesesandwich" or data.item == "uwuvanillasandwich" or data.item == "uwuchocolatesandwich" or data.item == "uwustrawberrysandwich" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if amount then
					FoodProgress(data.item)
				else 
					TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error')
				end		
			end)
		--Oven
		elseif data.item == "uwunekocake" or data.item == "uwunekocookie" or data.item == "uwubmochi" or data.item == "uwupmochi" or data.item == "uwugmochi" or data.item == "uwuomochi" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if amount then
					FoodProgress(data.item)
				else 
					TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error')
				end	
			end)
		--Drinks
		elseif data.item == "uwubobatea" or data.item == "uwubbobatea" or data.item == "uwugbobatea" or data.item == "uwupbobatea" or data.item == "uwuobobatea" or data.item == "uwucoffee" or data.item == "uwunekolatte" or data.item == "uwuhotchocolate" or data.item == "uwucapuchino" or data.item == "uwurbobatea" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if amount then
					FoodProgress(data.item)
				else 
					TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error')
				end	
			end)
		--Blender
		elseif data.item == "uwunekocakemixture" or data.item == "uwubmochimixture" or data.item == "uwugmochimixture" or data.item == "uwuomochimixture" or data.item == "uwupmochimixture" or data.item == "uwuriceballmixture" or data.item == "uwunekocookiemixture" or data.item == "uwunekodonutmixture" or data.item == "uwupancakesmixture" or data.item == "uwumisosoupmixture" or data.item == "uwucatfoodmixture" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if amount then
					FoodProgress(data.item)
				else 
					TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error')
				end	
			end)
		end
	else
		TriggerEvent('QBCore:Notify', "Not clocked in!", 'error')
	end
end)

RegisterNetEvent('qb-uwu:Stash')
AddEventHandler('qb-uwu:Stash',function(data)
	if not onDuty then
		TriggerEvent('QBCore:Notify', "Not clocked in!", 'error')
	else
		TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
		id = data.stash
    	TriggerServerEvent("inventory:server:OpenInventory", "stash", "uWuCafe_"..id)
    	TriggerEvent("inventory:client:SetCurrentStash", "uWuCafe_"..id)
	end
end)

RegisterNetEvent('qb-uwu:Shop')
AddEventHandler('qb-uwu:Shop',function()
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else TriggerServerEvent("inventory:server:OpenInventory", "shop", "uWuShop", Config.Items)	end
end)

RegisterNetEvent('qb-uwu:Shop1')
AddEventHandler('qb-uwu:Shop1',function()
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else TriggerServerEvent("inventory:server:OpenInventory", "shop", "uWuShop1", Config.Items1)	end
end)

-- // Functions \\

function FoodProgress(ItemMake)
	--Microwave
	--[[if ItemMake == "uwunekocakemixture" or ItemMake == "uwubmochimixture" or ItemMake == "uwugmochimixture" or ItemMake == "uwuomochimixture" or ItemMake == "uwupmochimixture" or ItemMake == "uwuriceballmixture" or ItemMake == "uwunekocookiemixture" or ItemMake == "uwunekodonutmixture" or ItemMake == "uwupancakesmixture" or ItemMake == "uwumisosoupmixture" or ItemMake == "uwucatfoodmixture" then
		bartext = "Mixing a "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"]]
	--Blender
	if ItemMake == "uwunekocakemixture" or ItemMake == "uwubmochimixture" or ItemMake == "uwugmochimixture" or ItemMake == "uwuomochimixture" or ItemMake == "uwupmochimixture" or ItemMake == "uwuriceballmixture" or ItemMake == "uwunekocookiemixture" or ItemMake == "uwunekodonutmixture" or ItemMake == "uwupancakesmixture" or ItemMake == "uwumisosoupmixture" or ItemMake == "uwucatfoodmixture" then
		bartext = "Mixing a "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	--Hot Plates
	elseif ItemMake == "uwumisosoup" or ItemMake == "uwucatfood" or ItemMake == "uwupancakes" or ItemMake == "uwunekodonut" or ItemMake == "uwuriceball" then
		bartext = "Cooking a "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	--Sandwiches
	elseif ItemMake == "uwuhamcheesesandwich" or ItemMake == "uwuvanillasandwich" or ItemMake == "uwuchocolatesandwich" or ItemMake == "uwustrawberrysandwich" then
		bartext = "Preparing a "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	--Oven
	elseif ItemMake == "uwunekocake" or ItemMake == "uwunekocookie" or ItemMake == "uwubmochi" or ItemMake == "uwupmochi" or ItemMake == "uwugmochi" or ItemMake == "uwuomochi" then
		bartext = "Preparing a "..QBCore.Shared.Items[ItemMake].label
		bartime = 5000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
	--Coffee
	elseif ItemMake == "uwucoffee" or ItemMake == "uwunekolatte" or ItemMake == "uwuhotchocolate" or ItemMake == "uwucapuchino"  or ItemMake == "uwuobobatea" or ItemMake == "uwupbobatea" or ItemMake == "uwugbobatea" or ItemMake == "uwubbobatea" or ItemMake == "uwubobatea" then
		bartext = "Pouring "..QBCore.Shared.Items[ItemMake].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	end
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, {
		disableMovement = true, --
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = animDictNow,
		anim = animNow,
		flags = 8,
	}, {}, {}, function()  
		TriggerServerEvent('qb-uwu:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
	end)
end

-- // Utilities \\ 

RegisterNetEvent('qb-uwu:Ticket:Menu', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Cafe Payment", txt = "Do you want trade your tickets for payment?" },
        { header = "Yes", server = true, params = { event = "qb-uwu:Tickets:Sell" } },
        { header = "No", event = "qb-uwu:Tickets:Sell:no" },
    })
end)

RegisterNetEvent('qb-uwu:Menu:ChoppingBoard', function()
	if not onDuty then 
		TriggerEvent('QBCore:Notify', "Not clocked in!", 'error')
	else
		exports['qb-menu']:openMenu({
			{ header = "| Sandwich Station |", isMenuHeader = true },
			{ header = "• Ham and Cheese Sandwich •", txt = "Bread, Ham, Cheese, Milk", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuhamcheesesandwich' } } },
			{ header = "• Vanilla Sandwich •", txt = "Bread, Vanilla, Milk", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuvanillasandwich' } } },
			{ header = "• Chocolate Sandwich •", txt = "Bread, Chocolate, Milk", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuchocolatesandwich' } } },
			{ header = "• Strawberry Sandwich •", txt = "Bread, Starberry, Milk", params = { event = "qb-uwu:MakeItem", args = { item = 'uwustrawberrysandwich' } } },
			{ header = "<• Close •>", txt = "Close this menu", params = { event = "qb-menu:client:closeMenu"} },
		})
	end
end)

RegisterNetEvent('qb-uwu:Menu:Blender', function()
	if not onDuty then 
		TriggerEvent('QBCore:Notify', "Not clocked in!", 'error')
	else
		exports['qb-menu']:openMenu({
			{ header = "| Mixture Station |", isMenuHeader = true },
			{ header = "• Neko Cake Mixture •", txt = "Sugar, Milk, Flour, Strawberry", params = { event = "qb-uwu:MakeItem", args = { item = 'uwunekocakemixture' } } },
			{ header = "• Blue Mochi Mixture •", txt = "Sugar, Milk, Flour, Blueberry", params = { event = "qb-uwu:MakeItem", args = { item = 'uwubmochimixture' } } },
			{ header = "• Green Mochi Mixture •", txt = "Sugar, Milk, Flour, Matcha", params = { event = "qb-uwu:MakeItem", args = { item = 'uwugmochimixture' } } },
			{ header = "• Orange Mochi Mixture •", txt = "Sugar, Milk, Flour, Orange", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuomochimixture' } } },
			{ header = "• Pink Mochi Mixture •", txt = "Sugar, Milk, Flour, Starberry", params = { event = "qb-uwu:MakeItem", args = { item = 'uwupmochimixture' } } },
			{ header = "• Neko Onigiri Mixture •", txt = "Rice, Milk, Nori", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuriceballmixture' } } },
			{ header = "• Neko Cookie Mixture •", txt = "Sugar, Flour, Milk", params = { event = "qb-uwu:MakeItem", args = { item = 'uwunekocookiemixture' } } },
			{ header = "• Neko Donut Mixture •", txt = "Sugar, Flour, Milk", params = { event = "qb-uwu:MakeItem", args = { item = 'uwunekodonutmixture' } } },
			{ header = "• Pancakes Mixture •", txt = "Sugar, Flour, Eggs, Water", params = { event = "qb-uwu:MakeItem", args = { item = 'uwupancakesmixture' } } },
			{ header = "• Miso Soup Mixture •", txt = "Miso Soup Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwumisosoupmixture' } } },
			{ header = "• Cat Food Mixture •", txt = "Cat Food Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwucatfoodmixture' } } },
			{ header = "<• Close •>", txt = "Close this menu", params = { event = "qb-menu:client:closeMenu"} },
		})
	end
end)

RegisterNetEvent('qb-uwu:Menu:HotPlates', function()
	if not onDuty then 
		TriggerEvent('QBCore:Notify', "Not clocked in!", 'error')
	else
		exports['qb-menu']:openMenu({
			{ header = "| Hot Plates Station |", isMenuHeader = true },
			{ header = "• Miso Soup •", txt = "Miso Soup Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwumisosoup' } } },
			{ header = "• Cat Food •", txt = "Cat Food Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwucatfood' } } },
			{ header = "• Pancakes •", txt = "Pancakes Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwupancakes' } } },
			{ header = "• Neko Onigiri •", txt = "Neko Onigiri Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuriceball' } } },
			{ header = "• Neko Donut •", txt = "Neko Donut Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwunekodonut' } } },
			{ header = "<• Close •>", txt = "Close this menu", params = { event = "qb-menu:client:closeMenu"} },
		})
	end
end)

RegisterNetEvent('qb-uwu:Menu:Oven', function()
	if not onDuty then 
		TriggerEvent('QBCore:Notify', "Not clocked in!", 'error')
	else
		exports['qb-menu']:openMenu({
			{ header = "| Hot Food Station |", isMenuHeader = true },
			{ header = "• Neko Cake •", txt = "Neko Cake Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwunekocake' } } },
			{ header = "• Blue Mochi •", txt = "Blue Mochi Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwubmochi' } } },
			{ header = "• Green Mochi •", txt = "Green Mochi Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwugmochi' } } },
			{ header = "• Orange Mochi •", txt = "Orange Mochi Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuomochi' } } },
			{ header = "• Pink Mochi •", txt = "Pink Mochi Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwupmochi' } } },
			{ header = "• Neko Cookie •", txt = "Neko Cookie Mixture", params = { event = "qb-uwu:MakeItem", args = { item = 'uwunekocookie' } } },
			{ header = "<• Close •>", txt = "Close this menu", params = { event = "qb-menu:client:closeMenu"} },
		})
	end
end)

RegisterNetEvent('qb-uwu:Menu:Microwave', function()
	if not onDuty then 
		TriggerEvent('QBCore:Notify', "Not clocked in!", 'error')
	else
		exports['qb-menu']:openMenu({
			{ header = "| Microwave Station |", isMenuHeader = true },
			{ header = "<• Close •>", txt = "Close this menu", params = { event = "qb-menu:client:closeMenu"} },
		})
	end
end)

RegisterNetEvent('qb-uwu:Menu:Coffee', function()
	if not onDuty then 
		TriggerEvent('QBCore:Notify', "Not clocked in!", 'error')
	else
		exports['qb-menu']:openMenu({
			{ header = "Drink Menu", isMenuHeader = true },
			{ header = "• Coffee •", txt = "Coffee Beans, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwucoffee' } } },
			{ header = "• Neko Latte •", txt = "Coffee Beans, Milk, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwunekolatte' } } },
			{ header = "• Hot Chocolate •", txt = "Chocolate, Milk, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuhotchocolate' } } },
			{ header = "• Capuchino •", txt = "Chocolate, Coffee Beans, Milk, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwucapuchino' } } },
			{ header = "• BobaTea •", txt = "Boba, Tea, Milk, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwubobatea' } } },
			{ header = "• Blue BobaTea •", txt = "Boba, Tea, Milk, Blueberry, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwubbobatea' } } },
			{ header = "• Green BobaTea •", txt = "Boba, Tea, Milk, Matcha, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwugbobatea' } } },
			{ header = "• Pink BobaTea •", txt = "Boba, Tea, Milk, Strawberry, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwupbobatea' } } },
			{ header = "• Orange BobaTea •", txt = "Boba, Tea, Milk, Orange, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwuobobatea' } } },
			{ header = "• Rose BobaTea •", txt = "Boba, Tea, Milk, Rose, Cup", params = { event = "qb-uwu:MakeItem", args = { item = 'uwurbobatea' } } },
			{ header = "<• Close •>", txt = "Close this menu", params = { event = "qb-menu:client:closeMenu"} },
		})
	end
end)



RegisterNetEvent('qb-uwu:JustGive', function(data) 
	FoodProgress(data.item)
end)

RegisterNetEvent('qb-uwu:client:open:payment')
AddEventHandler('qb-uwu:client:open:payment', function()
    SetNuiFocus(true, true)
    SendNUIMessage({action = 'OpenPayment', payments = Config.ActivePayments})
end)

RegisterNetEvent('qb-uwu:client:open:register')
AddEventHandler('qb-uwu:client:open:register', function()
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else
		SetNuiFocus(true, true)
        SendNUIMessage({action = 'OpenRegister'})
	end
end)

RegisterNetEvent('qb-uwu:client:sync:register')
AddEventHandler('qb-uwu:client:sync:register', function(RegisterConfig)
    Config.ActivePayments = RegisterConfig
end)

function GetActiveRegister()
    return Config.ActivePayments
end

RegisterNUICallback('Click', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('ErrorClick', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('AddPrice', function(data)
    TriggerServerEvent('qb-uwu:server:add:to:register', data.Price, data.Note)
end)

RegisterNUICallback('PayReceipt', function(data)
    TriggerServerEvent('qb-uwu:server:pay:receipt', data.Price, data.Note, data.Id)
end)

RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
end)