local QBCore = exports['qb-core']:GetCoreObject()

--Consumables
CreateThread(function()
	local cocktails = { "amarettosour", "bellini", "bloodymary", "cosmopolitan", "longisland", "margarita", "pinacolada", "sangria", "screwdriver", "strawdaquiri", "strawmargarita", "midori", "prosecco", "tequila", "triplesec" }
    for k,v in pairs(cocktails) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-vanillaunicorn:client:DrinkAlcohol', source, item.name) end) end
	
	local beers = { "ambeer", "dusche", "logger", "pisswasser", "pisswasser2", "pisswasser3" }
    for k,v in pairs(beers) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-vanillaunicorn:client:DrinkAlcohol', source, item.name) end) end
	
	local drinks = { "sprunk", "sprunklight", "ecola", "ecolalight", "cranberry" }
    for k,v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-vanillaunicorn:client:Drink', source, item.name) end) end
	
	local food = { "chocolate", "vusliders", "vutacos", "nplate", "tots", "nachos" }
    for k,v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-vanillaunicorn:client:Eat', source, item.name) end) end
end)

RegisterServerEvent('jim-vanillaunicorn:GetFood')
AddEventHandler('jim-vanillaunicorn:GetFood', function(ItemMake, craftable)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	if craftable ~= nil then
		for i = 1, #craftable do
			for k, v in pairs(craftable[i]) do
				if ItemMake == k then
					for l, b in pairs(craftable[i][k]) do
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(l)], "remove", b) 
						Player.Functions.RemoveItem(tostring(l), b)
					end
				end
			end
		end	
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, 1, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ItemMake], "add", 1) 
end)


---ITEM REQUIREMENT CHECKS
QBCore.Functions.CreateCallback('jim-vanillaunicorn:get', function(source, cb, item, craftable)
local hasitem = false
local hasanyitem = nil
for i = 1, #craftable do
	for k, v in pairs(craftable[i]) do
		if k == item then
			for l, b in pairs(craftable[i][k]) do
				if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(l) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(l).amount >= b then hasitem = true
				else hasanyitem = false
				end
			end
		end
	end
end
if hasanyitem ~= nil then hasitem = false end
if hasitem then cb(true) else cb(false) end end)