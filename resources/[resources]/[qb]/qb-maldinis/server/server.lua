local QBCore = exports['qb-core']:GetCoreObject()

--Consumables
CreateThread(function()
	local wines = { "amarone", "barbera", "dolceto", "housered", "housewhite", "rosso" }
    for k,v in pairs(wines) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-pizzathis:client:DrinkAlcohol', source, item.name) end) end
	
	local beers = { "ambeer", "dusche", "logger", "pisswasser", "pisswasser2", "pisswasser3" }
    for k,v in pairs(beers) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-pizzathis:client:DrinkAlcohol', source, item.name) end) end
	
	local drink = { "sprunk", "sprunklight", "ecola", "ecolalight" }
    for k,v in pairs(drink) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-pizzathis:client:Drink', source, item.name) end) end
	
	local food = { "tiramisu", "gelato", "medfruits", "capricciosa", "diavola", "marinara", "margherita", "prosciuttio", "vegetariana", "bolognese", "calamari", "meatball", "alla", "pescatore" }
    for k,v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-pizzathis:client:Eat', source, item.name) end) end
	
	local boxes = { "capricciosabox", "diavolabox", "marinarabox", "margheritabox", "prosciuttiobox", "vegetarianabox" }
    for k,v in pairs(boxes) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerEvent('jim-pizzathis:OpenBox', source, item.name) end) end
end)

RegisterServerEvent('jim-pizzathis:GetFood')
AddEventHandler('jim-pizzathis:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
	if ItemMake == "bolognese" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
	elseif ItemMake == "calamari" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['squid'], "remove", 1) 
		Player.Functions.RemoveItem('squid', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)
	elseif ItemMake == "meatball" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)
	elseif ItemMake == "alla" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['vodka'], "remove", 1) 
		Player.Functions.RemoveItem('vodka', 1)
	elseif ItemMake == "pescatore" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['squid'], "remove", 1) 
		Player.Functions.RemoveItem('squid', 1)
		
	elseif ItemMake == "capricciosabox" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzmushrooms'], "remove", 1) 
		Player.Functions.RemoveItem('pizzmushrooms', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['olives'], "remove", 1) 
		Player.Functions.RemoveItem('olives', 1)
	elseif ItemMake == "diavolabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['salami'], "remove", 1) 
		Player.Functions.RemoveItem('salami', 1)		
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "marinarabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "margheritabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)
	elseif ItemMake == "prosciuttiobox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzmushrooms'], "remove", 1) 
		Player.Functions.RemoveItem('pizzmushrooms', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)
	elseif ItemMake == "vegetarianabox" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1) 
		Player.Functions.RemoveItem('lettuce', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "pizzabase" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzadough'], "remove", 1) 
		Player.Functions.RemoveItem('pizzadough', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
	elseif ItemMake == "ham" or ItemMake == "salami" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, 1, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1)
end)

RegisterServerEvent('jim-pizzathis:OpenBox')
AddEventHandler('jim-pizzathis:OpenBox', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if item == "capricciosabox" then slices = "capricciosa"
	elseif item == "diavolabox" then slices = "diavola"
	elseif item == "marinarabox" then slices = "marinara"
	elseif item == "margheritabox" then slices = "margherita"
	elseif item == "prosciuttiobox" then slices = "prosciuttio"
	elseif item == "vegetarianabox" then slices = "vegetariana" end
	--This removes the box
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", 1) 
	Player.Functions.RemoveItem(item, 1)
	Wait(1000)
	--This gives the slices
	Player.Functions.AddItem(slices, 6, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[slices], "add", 6) 
end)


---ITEM REQUIREMENT CHECKS
--Food
QBCore.Functions.CreateCallback('jim-pizzathis:get:bolognese', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:calamari', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('squid') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:meatball', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:alla', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil  and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('vodka') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:pescatore', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('squid') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('jim-pizzathis:get:margheritabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:marinarabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:prosciuttiobox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzmushrooms') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:diavolabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('salami') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:capricciosabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzmushrooms') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('olives') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:vegetarianabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('jim-pizzathis:get:ham', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-pizzathis:get:salami', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('jim-pizzathis:get:pizzabase', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzadough') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil then cb(true) else cb(false) end end)