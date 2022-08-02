local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

local onDuty = false
local alcoholCount = 0

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "vanilla" then
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

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			if PlayerData.job.name == "vanilla" then
				onDuty = PlayerJob.onduty
			end
		end)
    end
end)

CreateThread(function()
    vanillaBlip = AddBlipForCoord(Config.Locations["main"].coords)
    SetBlipSprite(vanillaBlip, 121)
    SetBlipDisplay(vanillaBlip, 4)
    SetBlipColour(vanillaBlip, 61)
    SetBlipScale(vanillaBlip, 0,6)
    SetBlipAsShortRange(vanillaBlip, true)
    SetBlipScale(vanillaBlip, 0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(vanillaBlip)
end)

--Distance Check for if player is too far away, so they don't keep getting tickets for sales while at other side of the planet.
CreateThread(function()
	while true do
		if onDuty and PlayerJob.name == "vanilla" then
			if #(GetEntityCoords(PlayerPedId()) - Config.Locations["main"].coords) >= Config.ClockOutDist then
				onDuty = not onDuty
				TriggerServerEvent("QBCore:ToggleDuty")
			end
		end
	Wait(5000)
	end
end)

CreateThread(function()
	if Config.MLO == "gabz" then
		-- Quick Prop Changes
		local grill = CreateObject(GetHashKey("prop_griddle_02"),134.23, -1290.51, 30.13-1.0,false,false,false)
		SetEntityHeading(grill,GetEntityHeading(grill)-150)
		FreezeEntityPosition(grill, true)	

		local fridge = CreateObject(GetHashKey("prop_trailr_fridge"),132.14, -1291.79, 29.27-1.05,false,false,false)
		SetEntityHeading(fridge,GetEntityHeading(fridge)-240)
		FreezeEntityPosition(fridge, true)	
		
		local rack = CreateObject(GetHashKey("prop_ff_shelves_01"),131.33, -1290.37, 29.27-1.05,false,false,false)
		SetEntityHeading(rack,GetEntityHeading(rack)-60)
		FreezeEntityPosition(rack, true)	
			
		local table = CreateObject(GetHashKey("prop_ff_counter_03"),134.94, -1290.19, 29.27-1.05,false,false,false)
		SetEntityHeading(table,GetEntityHeading(table)-150)
		FreezeEntityPosition(table, true)		
		
		local microwave = CreateObject(GetHashKey("prop_microwave_1"),135.61, -1289.76, 30.13-1.0,false,false,false)
		SetEntityHeading(microwave,GetEntityHeading(microwave)-140)
		FreezeEntityPosition(microwave, true)	
			
		local sink = CreateObject(GetHashKey("prop_ff_sink_02"),136.72, -1289.26, 29.27-1.05,false,false,false)
		SetEntityHeading(sink,GetEntityHeading(sink)-150)
		FreezeEntityPosition(sink, true)		

		local table2 = CreateObject(GetHashKey("prop_ff_counter_01"),136.18, -1287.1, 29.27-1.05,false,false,false)
		SetEntityHeading(table2,GetEntityHeading(table2)-60)
		FreezeEntityPosition(table2, true)	
		
		local plates = CreateObject(GetHashKey("v_res_tt_platepile"),135.98, -1286.75, 30.13-1.0,false,false,false)
		SetEntityHeading(plates,GetEntityHeading(plates)-60)
		FreezeEntityPosition(plates, true)		
		
		local plates2 = CreateObject(GetHashKey("v_res_tt_platepile"),137.05, -1289.05, 30.09-1.0,false,false,false)
		SetEntityHeading(plates,GetEntityHeading(plates2)-60)
		FreezeEntityPosition(plates, true)	
		
		local plates3 = CreateObject(GetHashKey("v_res_tt_pizzaplate"),136.34, -1287.45, 30.13-1.0,false,false,false)
		SetEntityHeading(plates,GetEntityHeading(plates3)-60)
		FreezeEntityPosition(plates, true)
		
		local light1 = CreateObject(GetHashKey("v_serv_ct_striplight"),132.83, -1290.01, 29.27+2.05,false,false,false)
		SetEntityHeading(light1,GetEntityHeading(light1)-60)
		FreezeEntityPosition(light1, true)	
		local light2 = CreateObject(GetHashKey("v_serv_ct_striplight"),135.06, -1288.73, 29.27+2.05,false,false,false)
		SetEntityHeading(light2,GetEntityHeading(light2)-60)
		FreezeEntityPosition(light2, true)
		
		Wait(5000)
		
		CreateModelHide(vector3(132.86, -1288.0, 29.27), 0.2, 1695461688, true)
		
	elseif Config.MLO == "van" then
	
		--CLEAR PROPS
		
		CreateModelHide(vector3(133.51, -1286.62, 30.52), 1.5, 534367705, true)
		CreateModelHide(vector3(133.51, -1286.62, 30.52), 1.5, -1369928609, true)
		
		CreateModelHide(vector3(130.97, -1282.67, 30.35), 1.5, 534367705, true)
		CreateModelHide(vector3(130.97, -1282.67, 30.35), 1.5, 1753238891, true)

		CreateModelHide(vector3(129.5, -1279.94, 30.33), 1.5, 1340914825, true)
		
		--ADD JOB RELATED PROPS
		local tray = CreateObject(GetHashKey("v_res_r_silvrtray"),128.16, -1283.47, 30.29-1.0,false,false,false)
		SetEntityHeading(tray,GetEntityHeading(tray)-60)
		FreezeEntityPosition(tray, true)
		
		local fridge = CreateObject(GetHashKey("v_med_cor_minifridge"),129.34, -1279.91, 30.33-1.0,false,false,false)
		SetEntityHeading(fridge,GetEntityHeading(fridge)-40)
		FreezeEntityPosition(fridge, true)				
		
		local fridgefood = CreateObject(GetHashKey("v_ret_247_ketchup1"),129.34, -1279.91, 30.33-0.8,false,false,false)
		SetEntityHeading(fridgefood,GetEntityHeading(fridgefood)-40)
		FreezeEntityPosition(fridgefood, true)		
		
		local chop = CreateObject(GetHashKey("v_res_mchopboard"),130.97, -1282.67, 30.35-1.0,false,false,false)
		SetEntityHeading(chop,GetEntityHeading(chop)-60)
		FreezeEntityPosition(chop, true)

		local grill = CreateObject(GetHashKey("prop_griddle_02"),133.22, -1286.39, 30.33-1.0,false,false,false)
		SetEntityHeading(grill,GetEntityHeading(grill)-60)
		FreezeEntityPosition(grill, true)		
		
		local tap = CreateObject(GetHashKey("prop_bar_pump_08"),127.99, -1282.71, 30.29-1.0,false,false,false)
		SetEntityHeading(tap,GetEntityHeading(tap)-240)
		FreezeEntityPosition(tap, true)
	end
end)
		
CreateThread(function()
--Stashes
	debug = false
	if Config.MLO == "gabz" then
		exports['qb-target']:AddBoxZone("UniPrepared", vector3(136.13, -1287.12, 29.27), 1.7, 0.8, { name="UniPrepared", heading = 30.0, debugPoly=debug, minZ = 28.37, maxZ = 29.97, }, 
			{ options = { {  event = "jim-vanillaunicorn:Stash", icon = "fas fa-box-open", label = "Prepared Food", stash = "Storage", job = "vanilla" }, }, distance = 1.0 })
			
		exports['qb-target']:AddBoxZone("UniFridge", vector3(129.95, -1280.65, 29.27), 1.5, 0.6, { name="UniFridge", heading = 30.0, debugPoly=debug, minZ=28.22, maxZ=29.22 }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "vanilla" }, }, distance = 1.5 })	
		exports['qb-target']:AddBoxZone("UniFridge2", vector3(128.84, -1284.25, 29.27), 1.5, 0.6, { name="UniFridge2", heading = 30.0, debugPoly=debug, minZ=28.27, maxZ=29.27 }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "vanilla" }, }, distance = 1.5 })	
		exports['qb-target']:AddBoxZone("UniFridge3", vector3(129.74, -1285.53, 29.27), 0.8, 0.4, { name="UniFridge3", heading = 30.0, debugPoly=debug, minZ=28.27, maxZ=29.27 }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "vanilla" }, }, distance = 1.5 })	
		exports['qb-target']:AddBoxZone("UniFridge4", vector3(132.66, -1285.43, 29.27), 1.2, 0.6, { name="UniFridge4", heading = 30.0, debugPoly=debug, minZ=28.27, maxZ=29.27 }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "vanilla" }, }, distance = 1.5 })		
		exports['qb-target']:AddBoxZone("UniFridge5", vector3(119.23, -1302.93, 29.27), 1.4, 0.6, { name="UniFridge5", heading = 300.0, debugPoly=debug, minZ=28.27, maxZ=29.27 }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "vanilla" }, }, distance = 1.5 })
		exports['qb-target']:AddBoxZone("UniFridge6", vector3(132.32, -1291.67, 29.27), 0.8, 0.6, { name="UniFridge6", heading = 30.0, debugPoly=debug, minZ = 28.27, maxZ = 30.07, }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Food Fridge", shop = 2, job = "vanilla" }, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniWash1", vector3(136.45, -1289.37, 29.27), 0.8, 0.8, { name="UniWash1", heading = 30.0, debugPoly=debug, minZ = 28.47, maxZ = 29.87, }, 
			{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", job = "vanilla" }, }, distance = 1.5	})
		exports['qb-target']:AddBoxZone("UniWash2", vector3(130.28, -1286.21, 29.27), 0.8, 0.6, { name="UniWash2", heading = 30.0, debugPoly=debug, minZ = 28.67, maxZ = 29.87, }, 
			{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, }, distance = 1.5 })
			
		exports['qb-target']:AddBoxZone("UniCounter", vector3(128.63, -1284.3, 29.27), 1.1, 1.0, { name="UniCounter", heading = 30.0, debugPoly=debug, minZ = 29.27, maxZ = 30.07, }, 
			{ options = { { event = "jim-vanillaunicorn:Stash", icon = "fas fa-hamburger", label = "Open Counter", stash = "Counter" }, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniReceipt", vector3(129.19, -1284.95, 29.27), 0.6, 0.6, { name="UniReceipt", heading = 30.0, debugPoly=debug, minZ = 29.27, maxZ = 30.07, }, 
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "vanilla" } }, distance = 2.0 })		
		exports['qb-target']:AddBoxZone("UniReceipt2", vector3(133.0, -1286.0, 29.27), 0.6, 0.6, { name="UniReceipt2", heading = 30.0, debugPoly=debug, minZ = 29.27, maxZ = 30.07, }, 
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "vanilla" } }, distance = 2.0 })		
		exports['qb-target']:AddBoxZone("UniReceipt3", vector3(118.96, -1303.18, 29.27), 0.6, 0.6, { name="UniReceipt3", heading = 30.0, debugPoly=debug, minZ = 29.07, maxZ = 29.87, }, 
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "vanilla" } }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniCocktails", vector3(130.3, -1281.51, 29.27), 0.6, 0.6, { name="UniCocktails", heading = 30.0, debugPoly=debug, minZ=28.87, maxZ=29.87 }, 
			{ options = { { event = "jim-vanillaunicorn:Menu:Cocktails", icon = "fas fa-cocktail", label = "Prepare Cocktails", job = "vanilla" }, }, distance = 2.0 })

		exports['qb-target']:AddBoxZone("UniTap", vector3(128.0, -1283.14, 29.27), 0.6, 0.5, { name="UniTap", heading = 30.0, debugPoly=debug, minZ = 29.27, maxZ = 29.87, }, 
			{ options = { { event = "jim-vanillaunicorn:Menu:Beer", icon = "fas fa-beer", label = "Pour Beer", job = "vanilla", id = "beerglass" }, }, distance = 1.5 })
			
		exports['qb-target']:AddBoxZone("UniCoffee", vector3(131.53, -1282.96, 29.27), 0.5, 0.5, { name="UniCoffee", heading = 30.0, debugPoly=debug, minZ = 28.87, maxZ = 30.07, }, 
			{ options = { { event = "jim-vanillaunicorn:JustGive", icon = "fas fa-mug-hot", label = "Pour Coffee", job = "vanilla", id = "coffee"}, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniClockin", vector3(102.19, -1299.53, 28.77), 0.8, 0.3, { name="UniClockin", heading = 30.0, debugPoly=debug, minZ = 28.0, maxZ = 32.0, }, 
			{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "vanilla" }, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniOven", vector3(134.24, -1290.51, 29.27), 0.6, 0.5, { name="UniOven", heading = 300.0, debugPoly=debug, minZ = 28.97, maxZ = 30.07, }, 
			{ options = { { event = "jim-vanillaunicorn:Menu:Oven", icon = "fas fa-temperature-high", label = "Use Oven", job = "vanilla" }, }, distance = 2.0 })
		
	elseif Config.MLO == "van" then
		exports['qb-target']:AddBoxZone("UniDoor", vector3(138.12, -1292.51, 29.23), 0.6, 2.6, { name="UniDoor", heading = 30.0, debugPoly=debug, minZ = 28.23, maxZ = 31.03, }, 
			{ options = { { event = "jim-vanillaunicorn:Door", icon = "fas fa-door-open", label = "Bar Access", job = "vanilla", door = 1 }, }, distance = 2.0	})		
		exports['qb-target']:AddBoxZone("UniDoor2", vector3(132.83, -1288.03, 29.27), 0.6, 1.4, { name="UniDoor2", heading = 30.0, debugPoly=debug, minZ = 28.27, maxZ = 30.57, }, 
			{ options = { { event = "jim-vanillaunicorn:Door", icon = "fas fa-door-open", label = "Bar Exit", job = "vanilla", door = 2 }, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniWash1", vector3(130.4, -1286.45, 29.28), 0.8, 0.6, { name="UniWash1", heading = 30.0, debugPoly=debug, minZ = 28.68, maxZ = 29.28, }, 
			{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", job = "vanilla" }, }, distance = 1.5 })
		
		exports['qb-target']:AddBoxZone("UniFridge", vector3(128.89, -1284.18, 29.28), 3.8, 0.5, { name="UniFridge", heading = 30.0, debugPoly=debug, minZ=28.28, maxZ=29.27 }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "vanilla" }, }, distance = 1.5 })	
		exports['qb-target']:AddBoxZone("UniFridge2", vector3(129.72, -1280.61, 29.27), 2.85, 0.5, { name="UniFridge2", heading = 30.0, debugPoly=debug, minZ=28.27, maxZ=29.27 }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "vanilla" }, }, distance = 1.5 })	
		exports['qb-target']:AddBoxZone("UniFridge3", vector3(132.31, -1285.06, 29.27), 3.6, 0.5, { name="UniFridge3", heading = 30.0, debugPoly=debug, minZ=28.27, maxZ=29.27 }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "vanilla" }, }, distance = 1.5 })
		exports['qb-target']:AddBoxZone("UniFridge4", vector3(129.35, -1279.92, 29.27), 0.75, 0.6, { name="UniFridge4", heading = 50.0, debugPoly=debug, minZ = 29.47, maxZ = 30.47, }, 
			{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Food Fridge", shop = 2, job = "vanilla" }, }, distance = 2.0	})
			
		exports['qb-target']:AddBoxZone("UniReceipt", vector3(129.26, -1285.01, 29.27), 0.6, 0.6, { name="UniReceipt", heading = 30.0, debugPoly=debug, minZ = 29.27, maxZ = 30.07, }, 
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "vanilla" } }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniCounter", vector3(128.15, -1283.48, 29.27), 0.8, 1.1, { name="UniCounter", heading = 30.0, debugPoly=debug, minZ = 29.07, maxZ = 29.87, }, 
			{ options = { { event = "jim-vanillaunicorn:Stash", icon = "fas fa-hamburger", label = "Open Counter", stash = "Counter" }, }, distance = 2.5 })
			
		exports['qb-target']:AddBoxZone("UniCocktails", vector3(130.97, -1282.68, 29.27), 0.55, 0.4, { name="UniCocktails", heading = 30.0, debugPoly=debug, minZ= 29.27, maxZ= 29.87 }, 
			{ options = { { event = "jim-vanillaunicorn:Menu:Cocktails", icon = "fas fa-cocktail", label = "Prepare Cocktails", job = "vanilla" }, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniCoffee", vector3(130.86, -1281.61, 29.27), 0.4, 0.6, { name="UniCoffee", heading = 30.0, debugPoly=debug, minZ = 29.27, maxZ = 30.07, }, 
			{ options = { { event = "jim-vanillaunicorn:JustGive", icon = "fas fa-mug-hot", label = "Pour Coffee", job = "vanilla", id = "coffee"}, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniOven", vector3(133.22, -1286.38, 29.27), 0.8, 0.4, { name="UniOven", heading = 300.0, debugPoly=debug, minZ = 29.27, maxZ = 29.87, }, 
			{ options = { { event = "jim-vanillaunicorn:Menu:Oven", icon = "fas fa-temperature-high", label = "Use Oven", job = "vanilla" }, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("UniTap", vector3(128.08, -1282.65, 29.27), 0.2, 0.3, { name="UniTap", heading = 30.0, debugPoly=debug, minZ = 29.27, maxZ = 29.87, }, 
			{ options = { { event = "jim-vanillaunicorn:Menu:Beer", icon = "fas fa-beer", label = "Pour Beer", job = "vanilla" }, }, distance = 1.5 })	

		exports['qb-target']:AddBoxZone("UniClockin", vector3(102.19, -1299.53, 28.77), 0.8, 0.3, { name="UniClockin", heading = 30.0, debugPoly=debug, minZ = 28.0, maxZ = 32.0, }, 
			{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "vanilla" }, }, distance = 2.0 })			
	end
end)

RegisterNetEvent('jim-vanillaunicorn:Door', function(data)
    DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Citizen.Wait(10)
        end

	if data.door == 1 then
	    SetEntityCoords(PlayerPedId(), 132.41, -1287.36, 29.27, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 30.0)	    
	elseif data.door == 2 then
		SetEntityCoords(PlayerPedId(), 138.62, -1293.34, 29.23, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 210.0)
	end
	DoScreenFadeIn(1000)
    Wait(100)
end)

RegisterNetEvent('jim-vanillaunicorn:washHands')
AddEventHandler('jim-vanillaunicorn:washHands',function()
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, }, {
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


RegisterNetEvent('jim-vanillaunicorn:MakeItem')
AddEventHandler('jim-vanillaunicorn:MakeItem', function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else
		for i = 1, #data.craftable do
			for k, v in pairs(data.craftable[i]) do
				if data.item == k then
					QBCore.Functions.TriggerCallback('jim-vanillaunicorn:get', function(amount) 
						if not amount then TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') else FoodProgress(data.item, data.craftable) end		
					end, data.item, data.craftable)
				end
			end
		end
	end
end)

RegisterNetEvent('jim-vanillaunicorn:Stash')
AddEventHandler('jim-vanillaunicorn:Stash',function(data)
	id = data.stash
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Vanilla_"..id)
    TriggerEvent("inventory:client:SetCurrentStash", "Vanilla_"..id)
end)

RegisterNetEvent('jim-vanillaunicorn:Shop')
AddEventHandler('jim-vanillaunicorn:Shop',function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else
		if data.shop == 1 then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "vanilla", Config.DrinkItems)
		elseif data.shop == 2 then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "vanilla", Config.FoodItems)
		end
	end
end)

-- // Functions \\

function FoodProgress(ItemMake, craftable)
	for i = 1, #Crafting.Cocktails do
		for k, v in pairs(Crafting.Cocktails[i]) do
			if ItemMake == k then
				bartext = "Mixing a "..QBCore.Shared.Items[ItemMake].label
				bartime = 7000
				animDictNow = "anim@heists@prison_heiststation@cop_reactions"
				animNow = "cop_b_idle"
			end
		end
	end
	for i = 1, #Crafting.Food do
		for k, v in pairs(Crafting.Food[i]) do
			if ItemMake == k then
				bartext = "Cooking "..QBCore.Shared.Items[ItemMake].label
				bartime = 5000
				animDictNow = "amb@prop_human_bbq@male@base"
				animNow = "base"
			end
		end
	end
	if ItemMake == "ambeer" or ItemMake == "dusche" or ItemMake == "logger" or ItemMake == "pisswasser" or ItemMake == "pisswasser2" or ItemMake == "pisswasser3" or ItemMake == "coffee" then
		bartext = "Pouring "..QBCore.Shared.Items[ItemMake].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	end
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = animDictNow,
		anim = animNow,
		flags = 8,
	}, {}, {}, function()  
		TriggerServerEvent('jim-vanillaunicorn:GetFood', ItemMake, craftable)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
	end)
end

RegisterNetEvent('jim-vanillaunicorn:Menu:Cocktails', function()
	local CockMenu = {}
	CockMenu[#CockMenu + 1] = { header = "Cocktail Menu", txt = "", isMenuHeader = true }
		for i = 1, #Crafting.Cocktails do
			for k, v in pairs(Crafting.Cocktails[i]) do
				local text = ""
				setheader = QBCore.Shared.Items[k].label
				for l, b in pairs(Crafting.Cocktails[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
					settext = text
				end
				CockMenu[#CockMenu + 1] = { header = setheader, txt = settext, params = { event = "jim-vanillaunicorn:MakeItem", args = { item = k, craftable = Crafting.Cocktails } } }
				settext, setheader = nil
			end
		end
	exports['qb-menu']:openMenu(CockMenu)
end)

RegisterNetEvent('jim-vanillaunicorn:Menu:Oven', function()
	local OvenMenu = {}
	OvenMenu[#OvenMenu + 1] = { header = "Food Menu", txt = "", isMenuHeader = true }
		for i = 1, #Crafting.Food do
			for k, v in pairs(Crafting.Food[i]) do
				local text = ""
				setheader = QBCore.Shared.Items[k].label
				for l, b in pairs(Crafting.Food[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
					settext = text
				end
				OvenMenu[#OvenMenu + 1] = { header = setheader, txt = settext, params = { event = "jim-vanillaunicorn:MakeItem", args = { item = k, craftable = Crafting.Food } } }
				settext, setheader = nil
			end
		end
	exports['qb-menu']:openMenu(OvenMenu)
end)

-- Beer Menu
RegisterNetEvent('jim-vanillaunicorn:Menu:Beer', function()
    exports['qb-menu']:openMenu({
		{ header = "Beer Menu", isMenuHeader = true },
        { header = "", txt = QBCore.Shared.Items["ambeer"].label, params = { event = "jim-vanillaunicorn:JustGive", args = { id = 'ambeer' } } },
        { header = "", txt = QBCore.Shared.Items["dusche"].label, params = { event = "jim-vanillaunicorn:JustGive", args = { id = 'dusche' } } },
        { header = "", txt = QBCore.Shared.Items["logger"].label, params = { event = "jim-vanillaunicorn:JustGive", args = { id = 'logger' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser"].label,  params = { event = "jim-vanillaunicorn:JustGive", args = { id = 'pisswasser' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser2"].label, params = { event = "jim-vanillaunicorn:JustGive", args = { id = 'pisswasser2' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser3"].label, params = { event = "jim-vanillaunicorn:JustGive", args = { id = 'pisswasser3' } } },
    })
end)

RegisterNetEvent('jim-vanillaunicorn:JustGive', function(data) if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else FoodProgress(data.id) end end)

RegisterNetEvent('jim-vanillaunicorn:client:DrinkAlcohol', function(itemName)
	if itemName == "ambeer" then TriggerEvent('animations:client:EmoteCommandStart', {"beer3"})
	elseif itemName == "dusche" then TriggerEvent('animations:client:EmoteCommandStart', {"beer1"})
	elseif itemName == "logger" then TriggerEvent('animations:client:EmoteCommandStart', {"beer2"})
	elseif itemName == "pisswasser" then TriggerEvent('animations:client:EmoteCommandStart', {"beer4"})
	elseif itemName == "pisswasser2" then TriggerEvent('animations:client:EmoteCommandStart', {"beer5"})
	elseif itemName == "pisswasser3" then TriggerEvent('animations:client:EmoteCommandStart', {"beer6"})
	elseif itemName == "amarettosour" or itemName == "bellini" or itemName == "bloodymary" or itemName == "cosmopolitan" or itemName == "longisland" or itemName == "margarita" or itemName == "pinacolada" or itemName == "sangria" or itemName == "screwdriver" or itemName == "strawdaquiri" or itemName == "strawmargarita" then TriggerEvent('animations:client:EmoteCommandStart', {"whiskey"})
	elseif itemName == "rum" then TriggerEvent('animations:client:EmoteCommandStart', {"rumb"})
	elseif itemName == "gin" then TriggerEvent('animations:client:EmoteCommandStart', {"ginb"})
	elseif itemName == "vodka" or itemName == "amaretto" then TriggerEvent('animations:client:EmoteCommandStart', {"vodkab"})
	else TriggerEvent('animations:client:EmoteCommandStart', {"flute"}) end
    QBCore.Functions.Progressbar("snort_coke", "Drinking "..QBCore.Shared.Items[itemName].label.."..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
			AlienEffect()
        end
        
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

function AlienEffect()
	StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
	Wait(math.random(5000, 8000))
	StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
	Wait(math.random(45000, 60000))    
	StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
	StopScreenEffect("DrugsMichaelAliensFightIn")
	StopScreenEffect("DrugsMichaelAliensFight")
	StopScreenEffect("DrugsMichaelAliensFightOut")
end

RegisterNetEvent('jim-vanillaunicorn:client:Drink', function(itemName)
	if itemName == "sprunk" or itemName == "sprunklight" then TriggerEvent('animations:client:EmoteCommandStart', {"sprunk"})
	elseif itemName == "ecola" or itemName == "ecolalight" then TriggerEvent('animations:client:EmoteCommandStart', {"ecola"})
    elseif itemName == "cranberry" or itemName == "pinejuice" then TriggerEvent('animations:client:EmoteCommandStart', {"wine"})
	elseif itemName == "coffee" then TriggerEvent('animations:client:EmoteCommandStart', {"coffee"}) end
	QBCore.Functions.Progressbar("drink_something", "Drinking "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
	end)
end)

RegisterNetEvent('jim-vanillaunicorn:client:Eat', function(itemName)
	if itemName == "crisps" then TriggerEvent('animations:client:EmoteCommandStart', {"crisps"}) 
	else TriggerEvent('animations:client:EmoteCommandStart', {"burger"}) end
    QBCore.Functions.Progressbar("eat_something", "Eating "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
		TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
		DeleteEntity(grill)
		DeleteEntity(fridge)
		DeleteEntity(rack)
		DeleteEntity(table1)
		DeleteEntity(microwave)
		DeleteEntity(table2)
		DeleteEntity(plates)
		DeleteEntity(plates2)
		DeleteEntity(plates3)
		DeleteEntity(light1)
		DeleteEntity(light2)
		DeleteEntity(chop)
		DeleteEntity(grill)
		DeleteEntity(tap)
		DeleteEntity(fridgefood)
		DeleteEntity(tray)
	end
end)