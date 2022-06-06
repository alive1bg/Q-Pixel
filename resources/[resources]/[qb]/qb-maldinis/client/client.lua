local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

local onDuty = false
local alcoholCount = 0

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "maldinis" then
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
			if PlayerData.job.name == "maldinis" then
				onDuty = PlayerJob.onduty
			end
		end)
    end
end)

CreateThread(function()
    Blip = AddBlipForCoord(Config.Locations["main"].coords)
    SetBlipSprite(Blip, 78)
    SetBlipDisplay(Blip, 3)
    SetBlipColour(Blip, 48)
    SetBlipScale(Blip, 0.6)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(Blip)
end)

--Distance Check for if player is too far away, so they don't keep getting tickets for sales while at other side of the planet.
CreateThread(function()
	while true do
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			if PlayerJob.name == "maldinis" and onDuty then
				if #(pos - Config.Locations["main"].coords) >= Config.ClockOutDist then
					TriggerEvent("jim-pizzathis:toggleDuty")
				end
			end
		Wait(100)
	end
end)

CreateThread(function()
	-- Quick Prop Changes
	if box == nil then
		RequestModel(604847691)
		while not HasModelLoaded(604847691) do Wait(1) end
		local box = CreateObject(604847691,810.94, -749.94, 28.03-1.0,false,false,false)
		SetEntityHeading(box,GetEntityHeading(box)-150)
		FreezeEntityPosition(box, true)
	end
	if box2 == nil then
		RequestModel(-856584171)
		while not HasModelLoaded(-856584171) do Wait(1) end
		local box2 = CreateObject(-856584171,810.98, -752.89, 28.03-1.0,false,false,false)
		SetEntityHeading(box2,GetEntityHeading(box2)-80)
		FreezeEntityPosition(box2, true)
	end
	if clockin == nil then
		RequestModel(502084445)
		while not HasModelLoaded(502084445) do Wait(1) end
		local clockin = CreateObject(502084445,807.07, -761.83, 31.27,false,false,false)
		SetEntityHeading(clockin,GetEntityHeading(clockin)-270)
		FreezeEntityPosition(clockin, true)
	end
end)

CreateThread(function()
--Stashes
	local debug = false
	exports['qb-target']:AddBoxZone("PizzTray", vector3(811.94, -755.57, 26.78), 0.6, 1.6, { name="PizzTray", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.58, }, 
		{ options = { {  event = "jim-pizzathis:Stash", icon = "fas fa-box-open", label = "Toppings Tray", stash = "Toppings", job = "maldinis" }, }, distance = 1.0 })
		
	exports['qb-target']:AddBoxZone("PizzBase", vector3(811.42, -754.55, 26.78), 0.4, 0.4, { name="PizzBase", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.18, }, 
		{ options = { {  event = "jim-pizzathis:Menu:PizzaBase:Check", icon = "fas fa-pizza-slice", label = "Prepare Pizza", job = "maldinis" }, }, distance = 1.0 })
		
	exports['qb-target']:AddBoxZone("PizzDough", vector3(806.98, -757.05, 26.78), 1.2, 3.2, { name="PizzDough", heading = 0.0, debugPoly=debug, minZ = 25.78, maxZ = 27.58, }, 
		{ options = { {  event = "jim-pizzathis:JustGive", icon = "fas fa-cookie", label = "Prepare Dough", job = "maldinis", id = "pizzadough" }, }, distance = 1.0 })	
		
	exports['qb-target']:AddBoxZone("PizzOven", vector3(808.28, -761.19, 26.78), 2.8, 0.7, { name="PizzOven", heading = 0.0, debugPoly=debug, minZ = 26.18, maxZ = 27.38, }, 
		{ options = { {  event = "jim-pizzathis:Menu:Oven:Check", icon = "fas fa-temperature-high", label = "Use Oven", job = "maldinis" }, }, distance = 1.0 })
		
	exports['qb-target']:AddBoxZone("PizzChop", vector3(810.45, -765.17, 26.78), 0.6, 0.6, { name="PizzChop", heading = 0.0, debugPoly=debug, minZ = 26.18, maxZ = 27.38, }, 
		{ options = { {  event = "jim-pizzathis:Menu:ChoppingBoard:Check", icon = "fas fa-utensils", label = "Use Chopping Board", job = "maldinis" }, }, distance = 1.0 })

	exports['qb-target']:AddBoxZone("PizzChop2", vector3(809.26, -761.19, 26.78), 0.55, 0.4, { name="PizzChop2", heading = 10.0, debugPoly=debug, minZ = 26.18, maxZ = 27.38, }, 
		{ options = { {  event = "jim-pizzathis:Menu:ChoppingBoard:Check", icon = "fas fa-utensils", label = "Use Chopping Board", job = "maldinis" }, }, distance = 1.0	})
		
	exports['qb-target']:AddBoxZone("PizzBurner", vector3(814.05, -752.89, 26.78), 2.4, 1.2, { name="PizzBurner", heading = 0.0, debugPoly=debug, minZ = 25.98, maxZ = 27.98, }, 
		{ options = { {  event = "jim-pizzathis:Menu:PizzaOven:Check", icon = "fas fa-temperature-high", label = "Use Stone Oven", job = "maldinis" }, }, distance = 1.0 })

	exports['qb-target']:AddBoxZone("PizzWine", vector3(809.34, -761.84, 22.3), 0.4, 1.7, { name="PizzWine", heading = 0.0, debugPoly=debug, minZ = 21.3, maxZ = 22.9, }, 
		{ options = { {  event = "jim-pizzathis:Menu:Wine", icon = "fas fa-wine-bottle	", label = "Open Wine Rack", job = "maldinis" }, }, distance = 1.0 })	
	exports['qb-target']:AddBoxZone("PizzWine2", vector3(807.25, -761.79, 22.3), 0.4, 1.7, { name="PizzWine", heading = 0.0, debugPoly=debug, minZ = 21.3, maxZ = 22.9, }, 
		{ options = { {  event = "jim-pizzathis:Menu:Wine", icon = "fas fa-wine-bottle", label = "Open Wine Rack", job = "maldinis" }, }, distance = 1.0 })
	
	exports['qb-target']:AddBoxZone("PizzFridge", vector3(814.09, -750.07, 26.78), 0.6, 0.6, { name="PizzFridge", heading = 0.0, debugPoly=debug, minZ=25.98, maxZ=26.83 }, 
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "maldinis" }, }, distance = 1.5 })	
	exports['qb-target']:AddBoxZone("PizzFridge2", vector3(814.07, -748.64, 26.78), 0.6, 0.6, { name="PizzFridge2", heading = 0.0, debugPoly=debug, minZ=25.98, maxZ=26.83 }, 
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-archive", label = "Open Drink Fridge", shop = 1, job = "maldinis" }, }, distance = 1.5 })	
	exports['qb-target']:AddBoxZone("PizzFridge3", vector3(805.68, -761.62, 26.78), 1.6, 0.6, { name="PizzFridge3", heading = 0.0, debugPoly=debug, minZ = 25.98, maxZ = 28.18, }, 
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-temperature-low", label = "Open Food Fridge", shop = 2, job = "maldinis" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzFreezer", vector3(802.75, -756.85, 26.78), 0.6, 4.0, { name="PizzFreezer", heading = 0.0, debugPoly=debug, minZ = 25.78, maxZ = 28.58, }, 
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-temperature-low", label = "Open Freezer", shop = 3, job = "maldinis" }, }, distance = 1.0 })
		
	exports['qb-target']:AddBoxZone("PizzWash1", vector3(809.47, -765.19, 26.78), 0.6, 0.8, { name="PizzWash1", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", }, }, distance = 1.5 })		
	exports['qb-target']:AddBoxZone("PizzWash2", vector3(809.25, -760.15, 26.78), 0.8, 0.6, { name="PizzWash2", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, }, distance = 1.5 })		
	exports['qb-target']:AddBoxZone("PizzWash3", vector3(813.35, -755.46, 26.78), 0.4, 0.8, { name="PizzWash3", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, }, distance = 1.2 })
	exports['qb-target']:AddBoxZone("PizzWash4", vector3(800.88, -767.88, 26.78), 0.8, 0.6, { name="PizzWash4", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", job = "maldinis" }, }, distance = 1.5 })		
	exports['qb-target']:AddBoxZone("PizzWash5", vector3(800.85, -767.07, 26.78), 0.8, 0.6, { name="PizzWash5", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, }, distance = 1.5 })		
	exports['qb-target']:AddBoxZone("PizzWash6", vector3(800.85, -761.18, 26.78), 0.8, 0.6, { name="PizzWash6", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, }, distance = 1.2 })	
	exports['qb-target']:AddBoxZone("PizzWash7", vector3(800.89, -762.04, 26.78), 0.8, 0.6, { name="PizzWash7", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, }, distance = 1.2 })
	exports['qb-target']:AddBoxZone("PizzWash8", vector3(809.9, -765.32, 31.27), 0.6, 0.6, { name="PizzWash8", heading = 0.0, debugPoly=debug, minZ=30.67, maxZ=31.67 }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, }, distance = 1.2 })
	exports['qb-target']:AddBoxZone("PizzWash9", vector3(808.91, -765.34, 31.27), 0.6, 0.6, { name="PizzWash9", heading = 0.0, debugPoly=debug, minZ=30.67, maxZ=31.67 }, 
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands" }, }, distance = 1.2 })
		
	exports['qb-target']:AddBoxZone("PizzCounter", vector3(810.98, -752.9, 26.78), 0.6, 0.6, { name="PizzCounter", heading = 9.0, debugPoly=debug, minZ = 26.78, maxZ = 27.58, }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Counter", stash = "CounterRight" }, }, distance = 2.0 })
	exports['qb-target']:AddBoxZone("PizzCounter2", vector3(810.93, -749.92, 26.78), 0.7, 0.7, { name="PizzCounter2", heading = 30.0, debugPoly=debug, minZ = 26.78, maxZ = 27.58, }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Counter", stash = "CounterLeft" }, }, distance = 2.0 })
		
	exports['qb-target']:AddBoxZone("PizzReceipt", vector3(811.32, -750.77, 26.78), 0.7, 0.35, { name="PizzReceipt", heading = 0.0, debugPoly=debug, minZ = 26.78, maxZ = 27.18, }, 
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "maldinis" } }, distance = 2.0 })		
	exports['qb-target']:AddBoxZone("PizzReceipt2", vector3(811.29, -752.09, 26.78), 0.7, 0.35, { name="PizzReceipt2", heading = 0.0, debugPoly=debug, minZ = 26.78, maxZ = 27.18, }, 
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "maldinis" } }, distance = 2.0	})		

	exports['qb-target']:AddBoxZone("PizzTap", vector3(814.14, -749.35, 26.78), 0.9, 0.6, { name="PizzTap", heading = 0.0, debugPoly=debug, minZ = 26.78, maxZ = 27.48, }, 
		{ options = { { event = "jim-pizzathis:Menu:Beer", icon = "fas fa-beer", label = "Pour Beer", job = "maldinis" }, }, distance = 1.5 })
		
	exports['qb-target']:AddBoxZone("PizzCoffee", vector3(808.78, -765.35, 26.78), 0.6, 0.6, { name="PizzCoffee", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.58, }, 
		{ options = { { event = "jim-pizzathis:JustGive", icon = "fas fa-mug-hot", label = "Pour Coffee", job = "maldinis", id = "coffee"}, }, distance = 2.0 })				
	exports['qb-target']:AddBoxZone("PizzCoffee2", vector3(811.49, -764.82, 26.78), 1.6, 0.63, { name="PizzCoffee2", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.58, }, 
		{ options = { { event = "jim-pizzathis:JustGive", icon = "fas fa-mug-hot", label = "Pour Coffee", job = "maldinis", id = "coffee"}, }, distance = 2.0 })
		
	exports['qb-target']:AddBoxZone("PizzClockin", vector3(807.15, -761.83, 31.27), 1.2, 0.2, { name="PizzClockin", heading = 0.0, debugPoly=debug, minZ = 31.27, maxZ = 32.52, }, 
		{ options = { { event = "jim-pizzathis:toggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "maldinis" }, }, distance = 2.0 })				
	exports['qb-target']:AddBoxZone("PizzClockin2", vector3(804.44, -760.52, 31.27), 0.4, 0.4, { name="PizzClockin2", heading = 0.0, debugPoly=debug, minZ = 30.87, maxZ = 31.67, }, 
		{ options = { { event = "jim-pizzathis:toggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "maldinis" }, }, distance = 2.0 })
		
	exports['qb-target']:AddBoxZone("PizzTable", vector3(807.08, -751.57, 26.78), 1.0, 1.0, { name="PizzTable", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table1" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable2", vector3(803.13, -751.59, 26.78), 1.0, 1.0, { name="PizzTable2", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table2" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable3", vector3(799.13, -751.57, 26.78), 1.0, 1.0, { name="PizzTable3", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table3" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable4", vector3(797.96, -748.86, 26.78), 1.0, 1.0, { name="PizzTable4", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table4" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable5", vector3(795.25, -751.55, 26.78), 1.0, 1.0, { name="PizzTable5", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table5" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable6", vector3(799.46, -755.04, 26.78), 1.0, 1.0, { name="PizzTable6", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table6" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable7", vector3(807.71, -754.9, 26.78), 2.0, 0.8, { name="PizzTable7", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table7" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable8", vector3(805.61, -754.89, 26.78), 2.0, 0.8, { name="PizzTable8", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table8" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable9", vector3(803.51, -754.9, 26.78), 2.0, 0.8, { name="PizzTable9", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table9" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable10", vector3(801.42, -754.93, 26.78), 2.0, 0.8, { name="PizzTable10", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table10" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable11", vector3(799.32, -757.63, 26.78), 0.8, 1.4, { name="PizzTable11", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table11" }, }, distance = 2.0 })	
	exports['qb-target']:AddBoxZone("PizzTable12", vector3(799.32, -759.72, 26.78), 0.8, 1.4, { name="PizzTable12", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = "Open Table", stash = "Table12" }, }, distance = 2.0 })
	
end)

RegisterNetEvent('jim-pizzathis:toggleDuty', function()
	onDuty = not onDuty
	TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNetEvent('jim-pizzathis:washHands')
AddEventHandler('jim-pizzathis:washHands',function()
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, {
        disableMovement = true,
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


RegisterNetEvent('jim-pizzathis:MakeItem')
AddEventHandler('jim-pizzathis:MakeItem', function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else
		--Food
		if data.item == "bolognese" or data.item == "calamari" or data.item == "meatball" or data.item == "alla" or data.item == "pescatore" or data.item == "capricciosabox" or data.item == "diavolabox" or data.item == "marinarabox" or data.item == "margheritabox" or data.item == "prosciuttiobox" or data.item == "vegetarianabox" or data.item == "pizzabase" or data.item == "salami" or data.item == "ham" then
			QBCore.Functions.TriggerCallback('jim-pizzathis:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') else FoodProgress(data.item) end		
			end)
		end
	end
end)

RegisterNetEvent('jim-pizzathis:Stash')
AddEventHandler('jim-pizzathis:Stash',function(data)
	id = data.stash
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizza_"..id)
    TriggerEvent("inventory:client:SetCurrentStash", "pizza_"..id)
end)

RegisterNetEvent('jim-pizzathis:Shop')
AddEventHandler('jim-pizzathis:Shop',function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else
		if data.shop == 1 then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "pizzathis", Config.DrinkItems)
		elseif data.shop == 2 then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "pizzathis", Config.FoodItems)		
		elseif data.shop == 3 then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "pizzathis", Config.FreezerItems)
		end
	end
end)

-- // Functions \\

function FoodProgress(ItemMake)
	if ItemMake == "pizzadough" then
		bartext = "Grabbing "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"	
	elseif ItemMake == "pizzabase" or ItemMake == "ham" or ItemMake == "salami" then
		bartext = "Preparing "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	elseif ItemMake == "bolognese" or ItemMake == "calamari" or ItemMake == "meatball" or ItemMake == "alla" or ItemMake == "pescatore" or ItemMake == "capricciosabox" or ItemMake == "diavolabox" or ItemMake == "marinarabox"  or ItemMake == "margheritabox"  or ItemMake == "prosciuttiobox"  or ItemMake == "vegetarianabox" then
		bartext = "Cooking a "..QBCore.Shared.Items[ItemMake].label
		bartime = 5000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
	elseif ItemMake == "ambeer" or ItemMake == "dusche" or ItemMake == "logger" or ItemMake == "pisswasser" or ItemMake == "pisswasser2" or ItemMake == "pisswasser3" or ItemMake == "coffee" then
		bartext = "Pouring "..QBCore.Shared.Items[ItemMake].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"	
	elseif ItemMake == "amarone" or ItemMake == "barbera" or ItemMake == "dolceto" or ItemMake == "housered" or ItemMake == "housewhite" or ItemMake == "rosso" then
		bartext = "Grabbing "..QBCore.Shared.Items[ItemMake].label
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
		TriggerServerEvent('jim-pizzathis:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
	end)
end

-- // Utilities \\ 
RegisterNetEvent('jim-pizzathis:Menu:Oven:Check', function()
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:bolognese', function(amount) if amount 		then bolognese = "✔" else bolognese = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:calamari', function(amount) if amount 		then calamari = "✔" else calamari = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:meatball', function(amount) if amount 		then meatball = "✔" else meatball = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:alla', function(amount) if amount 			then alla = "✔" else alla = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:pescatore', function(amount) if amount 		then pescatore = "✔" else pescatore = "" end end)
	Wait(500)
	TriggerEvent('jim-pizzathis:Menu:Oven')
end)
RegisterNetEvent('jim-pizzathis:Menu:Oven', function()
    exports['qb-menu']:openMenu({
		{ header = "Oven Menu", isMenuHeader = true },
        { header = QBCore.Shared.Items["bolognese"].label.." "..bolognese, txt = "- "..QBCore.Shared.Items["meat"].label.."<br>- "..QBCore.Shared.Items["sauce"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'bolognese' } } },
        { header = QBCore.Shared.Items["calamari"].label.." "..calamari, txt = "- "..QBCore.Shared.Items["squid"].label.."<br>- "..QBCore.Shared.Items["sauce"].label.."<br>- "..QBCore.Shared.Items["pasta"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'calamari' } } },
        { header = QBCore.Shared.Items["meatball"].label.." "..meatball, txt = "- "..QBCore.Shared.Items["meat"].label.."<br>- "..QBCore.Shared.Items["pasta"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'meatball' } } },
        { header = QBCore.Shared.Items["alla"].label.." "..alla, txt = "- "..QBCore.Shared.Items["ham"].label.."<br>- "..QBCore.Shared.Items["pasta"].label.."<br>- "..QBCore.Shared.Items["vodka"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'alla' } } },
        { header = QBCore.Shared.Items["pescatore"].label.." "..pescatore, txt = "- "..QBCore.Shared.Items["squid"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'pescatore' } } },
    })
end)

RegisterNetEvent('jim-pizzathis:Menu:PizzaBase:Check', function()
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:pizzabase', function(amount) if amount 		then pizzabase = "✔" else pizzabase = "" end end)
	Wait(500)
	TriggerEvent('jim-pizzathis:Menu:PizzaBase')
end)
RegisterNetEvent('jim-pizzathis:Menu:PizzaBase', function()
    exports['qb-menu']:openMenu({
		--{ header = "", isMenuHeader = true },
        { header = QBCore.Shared.Items["pizzabase"].label..' '..pizzabase, txt = "- "..QBCore.Shared.Items["pizzadough"].label.."<br>- "..QBCore.Shared.Items["sauce"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'pizzabase' } } },
    })
end)

RegisterNetEvent('jim-pizzathis:Menu:PizzaOven:Check', function()
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:margheritabox', function(amount) if amount 		then margherita = "✔" else margherita = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:marinarabox', function(amount) if amount 		then marinara = "✔" else marinara = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:prosciuttiobox', function(amount) if amount 	then prosciuttio = "✔" else prosciuttio = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:diavolabox', function(amount) if amount 		then diavola = "✔" else diavola = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:capricciosabox', function(amount) if amount 	then capricciosa = "✔" else capricciosa = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:vegetarianabox', function(amount) if amount 	then vegetariana = "✔" else vegetariana = "" end end)
	Wait(500)
	TriggerEvent('jim-pizzathis:Menu:PizzaOven')
end)
RegisterNetEvent('jim-pizzathis:Menu:PizzaOven', function()
    exports['qb-menu']:openMenu({
		{ header = "Pizza Menu", isMenuHeader = true },
        { header = QBCore.Shared.Items["margherita"].label.." "..margherita, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["mozz"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'margheritabox' } } },
        { header = QBCore.Shared.Items["marinara"].label.." "..marinara, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["basil"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'marinarabox' } } },
        { header = QBCore.Shared.Items["prosciuttio"].label.." "..prosciuttio, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["mozz"].label.."<br>- "..QBCore.Shared.Items["ham"].label.."<br> - "..QBCore.Shared.Items["pizzmushrooms"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'prosciuttiobox' } } },
        { header = QBCore.Shared.Items["diavola"].label.." "..diavola, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["mozz"].label.."<br>- "..QBCore.Shared.Items["salami"].label.."<br> - "..QBCore.Shared.Items["basil"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'diavolabox' } } },
        { header = QBCore.Shared.Items["capricciosa"].label.." "..capricciosa, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["ham"].label.."<br>- "..QBCore.Shared.Items["pizzmushrooms"].label.."<br> - "..QBCore.Shared.Items["olives"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'capricciosabox' } } },
        { header = QBCore.Shared.Items["vegetariana"].label.." "..vegetariana, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["mozz"].label.."<br>- "..QBCore.Shared.Items["lettuce"].label.."<br> - "..QBCore.Shared.Items["basil"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'vegetarianabox' } } },
    })
end)
RegisterNetEvent('jim-pizzathis:Menu:Beer', function()
    exports['qb-menu']:openMenu({
		{ header = "Beer Menu", isMenuHeader = true },
        { header = "", txt = QBCore.Shared.Items["ambeer"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'ambeer' } } },
        { header = "", txt = QBCore.Shared.Items["dusche"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'dusche' } } },
        { header = "", txt = QBCore.Shared.Items["logger"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'logger' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser"].label,  params = { event = "jim-pizzathis:JustGive", args = { id = 'pisswasser' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser2"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'pisswasser2' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser3"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'pisswasser3' } } },
    })
end)
RegisterNetEvent('jim-pizzathis:Menu:Wine', function()
    exports['qb-menu']:openMenu({
		{ header = "Wine Cellar", isMenuHeader = true },
        { header = "", txt = QBCore.Shared.Items["amarone"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'amarone' } } },
        { header = "", txt = QBCore.Shared.Items["barbera"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'barbera' } } },
        { header = "", txt = QBCore.Shared.Items["dolceto"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'dolceto' } } },
        { header = "", txt = QBCore.Shared.Items["housered"].label,  params = { event = "jim-pizzathis:JustGive", args = { id = 'housered' } } },
        { header = "", txt = QBCore.Shared.Items["housewhite"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'housewhite' } } },
        { header = "", txt = QBCore.Shared.Items["rosso"].label, params = { event = "jim-pizzathis:JustGive", args = { id = 'rosso' } } },
    })
end)
RegisterNetEvent('jim-pizzathis:Menu:ChoppingBoard:Check', function()
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:salami', function(amount) if amount 	then salami = "✔" else salami = "" end end)
	QBCore.Functions.TriggerCallback('jim-pizzathis:get:ham', function(amount) if amount 		then ham = "✔" else ham = "" end end)
	Wait(500)
	TriggerEvent('jim-pizzathis:Menu:ChoppingBoard')
end)
RegisterNetEvent('jim-pizzathis:Menu:ChoppingBoard', function()
    exports['qb-menu']:openMenu({
		{ header = "Chopping Board", isMenuHeader = true },
        { header = QBCore.Shared.Items["salami"].label.." "..salami, txt = "- "..QBCore.Shared.Items["meat"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'salami' } } },
        { header = QBCore.Shared.Items["ham"].label.." "..ham, txt = "- "..QBCore.Shared.Items["meat"].label, params = { event = "jim-pizzathis:MakeItem", args = { item = 'ham' } } },
    })
end)

RegisterNetEvent('jim-pizzathis:JustGive', function(data) if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else FoodProgress(data.id) end end)

RegisterNetEvent('jim-pizzathis:client:Eat', function(itemName)
	if itemName == "capricciosa" or itemName == "diavola" or itemName == "marinara" or itemName == "margherita" or itemName == "prosciuttio" or itemName == "vegetariana" then TriggerEvent('animations:client:EmoteCommandStart', {"pizza"})
	elseif itemName == "tiramisu" or itemName == "gelato" then TriggerEvent('animations:client:EmoteCommandStart', {"bowl"})
	elseif itemName == "medfruits" then TriggerEvent('animations:client:EmoteCommandStart', {"pineapple"})
	elseif itemName == "calamari" or itemName == "bolognese" or itemName == "meatball" or itemName == "alla" or itemName == "pescatore" then TriggerEvent('animations:client:EmoteCommandStart', {"foodbowl"}) end
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

RegisterNetEvent('jim-pizzathis:client:DrinkAlcohol', function(itemName)
	if itemName == "ambeer" then TriggerEvent('animations:client:EmoteCommandStart', {"beer3"})
	elseif itemName == "dusche" then TriggerEvent('animations:client:EmoteCommandStart', {"beer1"})
	elseif itemName == "logger" then TriggerEvent('animations:client:EmoteCommandStart', {"beer2"})
	elseif itemName == "pisswasser" then TriggerEvent('animations:client:EmoteCommandStart', {"beer4"})
	elseif itemName == "pisswasser2" then TriggerEvent('animations:client:EmoteCommandStart', {"beer5"})
	elseif itemName == "pisswasser3" then TriggerEvent('animations:client:EmoteCommandStart', {"beer6"})
	elseif itemName == "amarone" or itemName == "barbera" or itemName == "housered" or itemName == "rosso" then	TriggerEvent('animations:client:EmoteCommandStart', {"redwine"})
	elseif itemName == "dolceto" or itemName == "housewhite" then TriggerEvent('animations:client:EmoteCommandStart', {"whitewine"})
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
	Wait(math.random(5000, 8000))    
	StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
	StopScreenEffect("DrugsMichaelAliensFightIn")
	StopScreenEffect("DrugsMichaelAliensFight")
	StopScreenEffect("DrugsMichaelAliensFightOut")
end

RegisterNetEvent('jim-pizzathis:client:Drink', function(itemName)
	if itemName == "sprunk" or itemName == "sprunklight" then TriggerEvent('animations:client:EmoteCommandStart', {"sprunk"})
	elseif itemName == "ecola" or itemName == "ecolalight" then TriggerEvent('animations:client:EmoteCommandStart', {"ecola"}) end
    QBCore.Functions.Progressbar("drink_something", "Drinking "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
		TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
	end)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
		DeleteEntity(clockin)
		DeleteEntity(box)
		DeleteEntity(box2)
    end
end)