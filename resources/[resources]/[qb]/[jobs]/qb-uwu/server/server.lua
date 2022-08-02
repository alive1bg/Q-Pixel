local QBCore = exports['qb-core']:GetCoreObject()

--Consumables
QBCore.Functions.CreateUseableItem("sake", function(source, item) TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name) end)

QBCore.Functions.CreateUseableItem("bobatea", function(source, item)
	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:Drink", source, item.name)
	end 
end) 
QBCore.Functions.CreateUseableItem("uwubobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwubbobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwugbobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwupbobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwuobobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwunekolatte", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwuuwucapuchino", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwucoffee", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwusake", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwuhotchocolate", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwurbobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)

--OvenFood
QBCore.Functions.CreateUseableItem("uwunekocake", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwunekocookie", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwubmochi", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwupmochi", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwugmochi", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwuomochi", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwurmochi", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)

--hot plates
QBCore.Functions.CreateUseableItem("uwumisosoup", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwucatfood", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwupancakes", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwunekodonut", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwuriceball", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)

--sandwiches
QBCore.Functions.CreateUseableItem("uwuhamcheesesandwich", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwuvanillasandwich", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwuchocolatesandwich", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwustrawberrysandwich", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)

--misc
QBCore.Functions.CreateUseableItem("uwuorange", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwuchocolate", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwutofu", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwustrawberry", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("uwublueberry", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)


RegisterServerEvent('qb-uwu:GetFood')
AddEventHandler('qb-uwu:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
	--ChoppingBoard
	if ItemMake == "uwubmochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwusugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuflour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwublueberry'], "remove", 1) 
		Player.Functions.RemoveItem('uwusugar', 1)
		Player.Functions.RemoveItem('uwuflour', 1)
		Player.Functions.RemoveItem('uwublueberry', 1)
	elseif ItemMake == "uwugmochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwusugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuflour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumint'], "remove", 1) 
		Player.Functions.RemoveItem('uwusugar', 1)
		Player.Functions.RemoveItem('uwuflour', 1)
		Player.Functions.RemoveItem('uwumint', 1)	
	elseif ItemMake == "uwuomochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwusugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuflour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumint'], "remove", 1) 
		Player.Functions.RemoveItem('uwusugar', 1)
		Player.Functions.RemoveItem('uwuflour', 1)
		Player.Functions.RemoveItem('uwumint', 1)
	elseif ItemMake == "uwupmochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwusugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuflour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumint'], "remove", 1) 
		Player.Functions.RemoveItem('uwusugar', 1)
		Player.Functions.RemoveItem('uwuflour', 1)
		Player.Functions.RemoveItem('uwumint', 1)
	elseif ItemMake == "uwuriceball" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwurice'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwunori'], "remove", 1) 
		Player.Functions.RemoveItem('uwurice', 1)
		Player.Functions.RemoveItem('uwunori', 1)
	elseif ItemMake == "uwubento" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwurice'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwunori'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwutofu'], "remove", 1) 
		Player.Functions.RemoveItem('uwurice', 1)
		Player.Functions.RemoveItem('uwunori', 1)
		Player.Functions.RemoveItem('uwutofu', 1)
	--Oven
	elseif ItemMake == "uwunekocookie" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuflour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1) 
		Player.Functions.RemoveItem('uwuflour', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
	elseif ItemMake == "uwunekodonut" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuflour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1) 
		Player.Functions.RemoveItem('uwuflour', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
	elseif ItemMake == "uwucake" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuflour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwustrawberry'], "remove", 1) 
		Player.Functions.RemoveItem('uwuflour', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
		Player.Functions.RemoveItem('uwustrawberry', 1)
	elseif ItemMake == "uwumiso" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwunori'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwutofu'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuonion'], "remove", 1) 
		Player.Functions.RemoveItem('uwunori', 1)
		Player.Functions.RemoveItem('uwutofu', 1)
		Player.Functions.RemoveItem('uwuonion', 1)
	--Coffee
	elseif ItemMake == "uwucoffee" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwucofeebeans'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwucoffeecup'], "remove", 1) 
		Player.Functions.RemoveItem('uwucofeebeans', 1)
		Player.Functions.RemoveItem('uwucoffeecup', 1)
	elseif ItemMake == "uwunekolatte" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwucofeebeans'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwucoffeecup'], "remove", 1) 
		Player.Functions.RemoveItem('uwucofeebeans', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
		Player.Functions.RemoveItem('uwucoffeecup', 1)
	elseif ItemMake == "uwubobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuboba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1) 
		Player.Functions.RemoveItem('uwuboba', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
	elseif ItemMake == "uwubbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuboba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwublueberry'], "remove", 1) 
		Player.Functions.RemoveItem('uwuboba', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
		Player.Functions.RemoveItem('uwublueberry', 1)
	elseif ItemMake == "uwugbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuboba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumint'], "remove", 1) 
		Player.Functions.RemoveItem('uwuboba', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
		Player.Functions.RemoveItem('uwumint', 1)
	elseif ItemMake == "uwuobobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuboba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuorange'], "remove", 1) 
		Player.Functions.RemoveItem('uwuboba', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
		Player.Functions.RemoveItem('uwuorange', 1)
	elseif ItemMake == "uwupbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwuboba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwumilk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['uwustrawberry'], "remove", 1) 
		Player.Functions.RemoveItem('uwuboba', 1)
		Player.Functions.RemoveItem('uwumilk', 1)
		Player.Functions.RemoveItem('uwustrawberry', 1)	
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, 1, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1) 
end)


---ITEM REQUIREMENT CHECKS
--Sandwiches
QBCore.Functions.CreateCallback('qb-uwu:get:uwuhamcheesesandwich', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwubread') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucheese') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwuvanillasandwich', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwubread') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuvanilla') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwuchocolatesandwich', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwubread') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuchocolate') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwustrawberrysandwich', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwubread') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwustrawberry') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil then cb(true) else cb(false) end end)

--Mixtures
QBCore.Functions.CreateCallback('qb-uwu:get:uwunekocakemixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuvanilla') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwubmochimixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwublueberry') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwugmochimixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumatcha') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwuomochimixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuorange') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwupmochimixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwustrawberry') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwuriceballmixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwurise') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwunori') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwunekocookiemixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwunekodonutmixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwupancakesmixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuwater') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwueggs') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwumisosoupmixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuwater') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwueggs') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwucatfoodmixture', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuflour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuwater') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwusugar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwueggs') ~= nil then cb(true) else cb(false) end end)

--Hot Plates
QBCore.Functions.CreateCallback('qb-uwu:get:uwumisosoup', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumisosoupmixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwucatfood', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucatfoodmixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwupancakes', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwupancakesmixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwuriceball', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuriceballmixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwunekodonut', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwunekodonutmixture') ~= nil then cb(true) else cb(false) end end)

--Hot Food
QBCore.Functions.CreateCallback('qb-uwu:get:uwunekocake', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwunekocakemixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwubmochi', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwubmochimixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwugmochi', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwugmochimixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwuomochi', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuomochimixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwupmochi', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwupmochimixture') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwunekocookie', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwunekocookiemixture') ~= nil then cb(true) else cb(false) end end)

--Drinks
QBCore.Functions.CreateCallback('qb-uwu:get:uwucoffee', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucoffeebeans') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwunekolatte', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucoffeebeans') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwuhotchocolate', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuchocolate') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwucapuchino', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucoffeebeans') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuchocolate') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwubobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuboba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwutea') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwubbobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuboba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwutea') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwublueberry') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwugbobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuboba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwutea') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumatcha') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwupbobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuboba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwutea') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwustawberry') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwuobobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuboba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwutea') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuorange') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:uwurbobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwuboba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwutea') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwumilk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwurose') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('uwucup') ~= nil then cb(true) else cb(false) end end)

-- // Register \\ 

RegisterServerEvent('qb-uwu:server:add:to:register')
AddEventHandler('qb-uwu:server:add:to:register', function(Price, Note)
    local RandomID = math.random(1111,9999)
    Config.ActivePayments[RandomID] = {['Price'] = Price, ['Note'] = Note}
    TriggerClientEvent('qb-uwu:client:sync:register', -1, Config.ActivePayments)
end)

RegisterServerEvent('qb-uwu:server:pay:receipt')
AddEventHandler('qb-uwu:server:pay:receipt', function(Price, Note, Id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney('bank', Price, 'cat-cafe') then
        if Config.ActivePayments[tonumber(Id)] ~= nil then
            Config.ActivePayments[tonumber(Id)] = nil
			TriggerEvent('qb-uwu:Tickets:Give')
            TriggerClientEvent('qb-uwu:client:sync:register', -1, Config.ActivePayments)
			TriggerEvent('qb-bossmenu:server:addAccountMoney', "uwu", Price)
		else
            TriggerClientEvent('QBCore:Notify', src, 'Error..', 'error')
        end
    else
		TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash..', 'error')
    end
end)

RegisterServerEvent('qb-uwu:Tickets:Give')
AddEventHandler('qb-uwu:Tickets:Give', function()
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == "uwu" and Player.PlayerData.job.onduty then
                Player.Functions.AddItem('burger-ticket', 1, false, {["quality"] = nil})
				TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'uWu Cafe receipt received', 'success')
				TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['uwu-ticket'], "add", 1) 
            end
        end
    end
end)

RegisterServerEvent('qb-uwu:Tickets:Sell')
AddEventHandler('qb-uwu:Tickets:Sell', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName("burger-ticket") ~= nil then
		tickets = Player.Functions.GetItemByName("burger-ticket").amount
		pay = (tickets * Config.PayPerTicket)
		Player.Functions.RemoveItem('burger-ticket', tickets)
		Player.Functions.AddMoney('bank', pay, 'uwucafe-payment')
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burger-ticket'], "remove", tickets)
		TriggerClientEvent('QBCore:Notify', src, "Tickets: "..tickets.." Total: $"..pay, 'success')
	else 
		TriggerClientEvent('QBCore:Notify', src, "You don't have tickets to trade", 'error')
	end
end)