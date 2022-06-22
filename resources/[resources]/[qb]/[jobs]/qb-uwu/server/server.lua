local QBCore = exports['qb-core']:GetCoreObject()

--Consumables
QBCore.Functions.CreateUseableItem("sake", function(source, item) TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name) end)

QBCore.Functions.CreateUseableItem("bobatea", function(source, item)
	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:Drink", source, item.name)
	end 
end)
QBCore.Functions.CreateUseableItem("bbobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("gbobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("pbobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("obobatea", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("nekolatte", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Drink", source, item.name) end end)

QBCore.Functions.CreateUseableItem("bento", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("blueberry", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("cake", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("nekocookie", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("nekodonut", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("riceball", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("miso", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("bmochi", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("pmochi", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("gmochi", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("omochi", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("strawberry", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("rice", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("consumables:client:Eat", source, item.name) end end)


RegisterServerEvent('qb-uwu:GetFood')
AddEventHandler('qb-uwu:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
	--ChoppingBoard
	if ItemMake == "bmochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['blueberry'], "remove", 1) 
		Player.Functions.RemoveItem('sugar', 1)
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('blueberry', 1)
	elseif ItemMake == "gmochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mint'], "remove", 1) 
		Player.Functions.RemoveItem('sugar', 1)
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('mint', 1)	
	elseif ItemMake == "omochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mint'], "remove", 1) 
		Player.Functions.RemoveItem('sugar', 1)
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('mint', 1)
	elseif ItemMake == "pmochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mint'], "remove", 1) 
		Player.Functions.RemoveItem('sugar', 1)
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('mint', 1)
	elseif ItemMake == "riceball" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rice'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['nori'], "remove", 1) 
		Player.Functions.RemoveItem('rice', 1)
		Player.Functions.RemoveItem('nori', 1)
	elseif ItemMake == "bento" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rice'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['nori'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tofu'], "remove", 1) 
		Player.Functions.RemoveItem('rice', 1)
		Player.Functions.RemoveItem('nori', 1)
		Player.Functions.RemoveItem('tofu', 1)
	--Oven
	elseif ItemMake == "nekocookie" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('milk', 1)
	elseif ItemMake == "nekodonut" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('milk', 1)
	elseif ItemMake == "cake" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['strawberry'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('strawberry', 1)
	elseif ItemMake == "miso" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['nori'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tofu'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['onion'], "remove", 1) 
		Player.Functions.RemoveItem('nori', 1)
		Player.Functions.RemoveItem('tofu', 1)
		Player.Functions.RemoveItem('onion', 1)
	--Coffee
	elseif ItemMake == "coffee" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cofeebeans'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coffeecup'], "remove", 1) 
		Player.Functions.RemoveItem('cofeebeans', 1)
		Player.Functions.RemoveItem('coffeecup', 1)
	elseif ItemMake == "nekolatte" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cofeebeans'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coffeecup'], "remove", 1) 
		Player.Functions.RemoveItem('cofeebeans', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('coffeecup', 1)
	elseif ItemMake == "bobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
	elseif ItemMake == "bbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['blueberry'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('blueberry', 1)
	elseif ItemMake == "gbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mint'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('mint', 1)
	elseif ItemMake == "obobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['orange'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('orange', 1)
	elseif ItemMake == "pbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['strawberry'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('strawberry', 1)	
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