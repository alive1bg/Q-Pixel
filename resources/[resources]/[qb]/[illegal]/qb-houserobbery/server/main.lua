local webhook = 'YOUR_DISCORD_WEBHOOK' -- Your Discord webhook for logs.

-- This is the door location, you can add as many as you want. The server will pick one randomly on every script start
local doorLocation = {
	{1510.51, 6326.125, 24.60},
--[[
	{2440.1853027344, 4068.1313476562, 38.064727783203},
	{1945.3436279297, 3848.1767578125, 32.162307739258},
	{1360.9454345703, 3603.8234863281, 34.956840515137},
	{-1102.1115722656, 2721.86328125, 18.800397872925},	
	{-167.05793762207, 6312.3432617188, 31.672353744507},	
	{-1131.0240478516, -1551.8345947266, 4.5883464813232},
	{-1126.1490478516, -1447.3342285156, 5.0547857284546},	
	{-845.40698242188, -1088.4503173828, 11.638411521912},
	{810.69061279297, -750.23449707031, 26.738609313965},
	{889.71368408203, -1045.7983398438, 35.171173095703},
	{945.85107421875, -1138.0458984375, 26.459283828735},
	{914.02081298828, -1273.4448242188, 27.096141815186},
	{890.34527587891, -2222.0827636719, 30.509479522705}, 
	]]--
}

--[[
	↓↓↓ DON'T CHANGE ANYTHING FROM HERE ↓↓↓
]]--

local x,y,z
local cooldown = 0
local esperar, puerta, iniciado = false, false, false
local wait = 10000
local num = 0 
local cooldownTimer = {}
local props = {
	['prop_micro_01'] = {item = 'microwave'},
	['prop_coffee_mac_02'] = {item = 'coffeemaker'},
}

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then		 
		local ubicacion = math.random(1, #doorLocation)		
		local coord = doorLocation[ubicacion]
		num = math.random(111,999)
		x, y, z = coord[1], coord[2], coord[3]
		print('^2[AV House Robbery]:^7 '..x..' '..y..' '..z)
		iniciado = true
	end
end)

Citizen.CreateThread(function()
	while not iniciado do
		Citizen.Wait(10)
	end
	if Config.Framework == 'ESX' then
		ESX = nil
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)		
		ESX.RegisterServerCallback('av_houserobbery:entrada', function(source, cb)		
			cb(x,y,z,num)
		end)		
		ESX.RegisterServerCallback('av_houserobbery:lockpick', function(source,cb)
			local xPlayer = ESX.GetPlayerFromId(source)
			local identifier = xPlayer.identifier
			if xPlayer.getInventoryItem(Config.LockpickName).count >= 1 then
				table.insert(cooldownTimer, {identifier = identifier, time = Config.CdTime})
				xPlayer.removeInventoryItem(Config.LockpickName,1)
				cb(true)
			else
				cb(false)
			end
		end)
		ESX.RegisterServerCallback('av_houserobbery:trabajos', function(source,cb)
			local xPlayer = ESX.GetPlayerFromId(source)
			local identifier = xPlayer.identifier
			local status = CheckCooldownTimer(identifier)
			if status then
				cb(false)
			else
				cb(true)
			end
		end)
		print('^2[AV House Robbery]:^7 ESX Framework')
	elseif Config.Framework == 'QBCORE' then
		QBCore.Functions.CreateCallback('av_houserobbery:entrada', function(source, cb)		
			cb(x,y,z,num)
		end)
		QBCore.Functions.CreateCallback('av_houserobbery:lockpick', function(source,cb)
			local player = QBCore.Functions.GetPlayer(source)
			local Item = player.Functions.GetItemByName(Config.LockpickName)
			if Item ~= nil then				
				player.Functions.RemoveItem(Config.LockpickName, 1)
				table.insert(cooldownTimer, {identifier = identifier, time = Config.CdTime})
				cb(true)
			else
				cb(false)
			end
		end)
		QBCore.Functions.CreateCallback('av_houserobbery:trabajos', function(source,cb)
			local player = QBCore.Functions.GetPlayer(source)
			local identifier = QBCore.Functions.GetIdentifier(player, 'license')
			local status = CheckCooldownTimer(identifier)
			if status then
				cb(false)
			else
				cb(true)
			end
		end)
		print('^2[AV House Robbery]:^7 QBCORE Framework')
	elseif Config.Framework == 'VRP' then
		local Tunnel = module("vrp", "lib/Tunnel")
		local Proxy = module("vrp", "lib/Proxy")
		vRP = Proxy.getInterface("vRP")
		RegisterServerCallback('av_houserobbery:entrada', function(source, ...)
			local cb = {x,y,z,num}
			return cb
		end)
		RegisterServerCallback('av_houserobbery:lockpick', function(source, ...)
			local user_id = vRP.getUserId({source})
			local identifier = getIdenti(source)
			if vRP.tryGetInventoryItem(user_id,Config.LockpickName,0) then
				table.insert(cooldownTimer, {identifier = identifier, time = Config.CdTime})
				return true
			else
				return false
			end
		end)
		RegisterServerCallback('av_houserobbery:trabajos', function(source, ...)
			local identifier = getIdenti(source)
			local status = CheckCooldownTimer(identifier)
			return status
		end)
		print('^2[AV House Robbery]:^7 VRP Framework')
	elseif Config.Framework == 'OTHER' then
		RegisterServerCallback('av_houserobbery:entrada', function(source, ...)
			local cb = {x,y,z,num}
			return cb
		end)
		RegisterServerCallback('av_houserobbery:trabajos', function(source, ...)
			local identifier = getIdenti(source)
			local status = CheckCooldownTimer(identifier)
			return status
		end)
		RegisterServerCallback('av_houserobbery:lockpick', function(source, ...)		
			--[[ if Config.LockpickName then 
					return true 
				else 
					return false
				end			
			]]--
			local identifier = getIdenti(source)
			table.insert(cooldownTimer, {identifier = identifier, time = Config.CdTime})
			return true
		end)
		print('^2[AV House Robbery]:^7 OTHER Framework')
	end
end)

RegisterServerEvent('av_houserobbery:item')
AddEventHandler('av_houserobbery:item', function(tipo,m)
	if m ~= num then 
		local usuario = GetPlayerName(source)
		local content = {
			{
				["color"] = '5015295',
				["title"] = "**Lua Injector**",
				["description"] = "**".. usuario .."** got caugh cheating :)",
				["footer"] = {
					["text"] = "AV House Robbery",
				},
			}
		}
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = usuario, embeds = content}), { ['Content-Type'] = 'application/json' })
		DropPlayer(source,'Using LUA Injector =/')
		return 
	end	
	if Config.Framework == 'ESX' then
		local xPlayer = ESX.GetPlayerFromId(source)
		if tipo == 'random' then
			local lucky = math.random(1,#Config.ItemsReward)
			local items = Config.ItemsReward[lucky]
			for i = 1, #items do
				if items[i].type == 'item' then
					xPlayer.addInventoryItem(items[i].itemName,items[i].itemQty)
				elseif items[i].type == 'cash' then
					xPlayer.addMoney(items[i].itemQty)
					TriggerClientEvent('av_houserobbery:notification',source,Config.Lang['money_found']..items[i].itemQty)
				end
			end
		elseif tipo == 'cajafuerte' then
			local lucky = math.random(1,#Config.SafeRewards)
			local items = Config.SafeRewards[lucky]
			for i = 1, #items do
				if items[i].type == 'item' then
					xPlayer.addInventoryItem(items[i].itemName,items[i].itemQty)
				elseif items[i].type == 'cash' then
					xPlayer.addMoney(items[i].itemQty)
					TriggerClientEvent('av_houserobbery:notification',source,Config.Lang['money_found']..items[i].itemQty)
				end
			end
		elseif tipo == 'tv' then
			xPlayer.addInventoryItem('tv',1)
		elseif tipo == 'telescopio' then
			xPlayer.addInventoryItem('telescope',1)
		elseif tipo == 'arte' then
			xPlayer.addInventoryItem('art',1)
		elseif tipo == 'laptop' then
			xPlayer.addInventoryItem('laptop',1)
		else
			local item = props[tipo].item
			xPlayer.addInventoryItem(item,1)
		end
	elseif Config.Framework == 'QBCORE' then
		local player = QBCore.Functions.GetPlayer(source)
		if tipo == 'random' then
			local lucky = math.random(1,#Config.ItemsReward)
			local items = Config.ItemsReward[lucky]
			for i = 1, #items do
				if items[i].type == 'item' then
					player.Functions.AddItem(items[i].itemName, items[i].itemQty)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[items[i].itemName], "add")
				elseif items[i].type == 'cash' then
					player.Functions.AddMoney(items[i].itemQty)
					TriggerClientEvent('av_houserobbery:notification',source,Config.Lang['money_found']..items[i].itemQty)
				end
			end		
		elseif tipo == 'cajafuerte' then
			local lucky = math.random(1,#Config.SafeRewards)
			local items = Config.SafeRewards[lucky]
			for i = 1, #items do
				if items[i].type == 'item' then
					player.Functions.AddItem(items[i].itemName, items[i].itemQty)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[items[i].itemName], "add")
				elseif items[i].type == 'cash' then
					player.Functions.AddMoney(items[i].itemQty)
					TriggerClientEvent('av_houserobbery:notification',source,Config.Lang['money_found']..items[i].itemQty)
				end
			end			
		elseif tipo == 'tv' then
			player.Functions.AddItem('tv', 1)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tv'], "add")
		elseif tipo == 'telescopio' then
			player.Functions.AddItem('telescope', 1)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['telescope'], "add")
		elseif tipo == 'arte' then
			player.Functions.AddItem('art', 1)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['art'], "add")
		elseif tipo == 'laptop' then
			player.Functions.AddItem('laptop', 1)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['laptop'], "add")
		else
			local item = props[tipo].item
			player.Functions.AddItem(item, 1)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
		end
	elseif Config.Framework == 'VRP' then
		local user_id = vRP.getUserId({source})
		if tipo == 'random' then
			local lucky = math.random(1,#Config.ItemsReward)
			local items = Config.ItemsReward[lucky]
			for i = 1, #items do
				if items[i].type == 'item' then
					vRP.giveInventoryItem({user_id,items[i].itemName, items[i].itemQty, true})
				elseif items[i].type == 'cash' then
					vRP.giveMoney(user_id,items[i].itemQty)
					TriggerClientEvent('av_houserobbery:notification',source,Config.Lang['money_found']..items[i].itemQty)
				end
			end		
		elseif tipo == 'cajafuerte' then
			local lucky = math.random(1,#Config.SafeRewards)
			local items = Config.SafeRewards[lucky]
			for i = 1, #items do
				if items[i].type == 'item' then
					vRP.giveInventoryItem({user_id,items[i].itemName, items[i].itemQty, true})
				elseif items[i].type == 'cash' then
					vRP.giveMoney(user_id,items[i].itemQty)
					TriggerClientEvent('av_houserobbery:notification',source,Config.Lang['money_found']..items[i].itemQty)
				end
			end
		elseif tipo == 'tv' then
			vRP.giveInventoryItem({user_id,'tv', 1, true})
		elseif tipo == 'telescopio' then
			vRP.giveInventoryItem({user_id,'telescope', 1, true})
		elseif tipo == 'arte' then
			vRP.giveInventoryItem({user_id,'art', 1, true})
		elseif tipo == 'laptop' then
			vRP.giveInventoryItem({user_id,'laptop', 1, true})
		else
			local item = props[tipo].item
			vRP.giveInventoryItem({user_id,item, 1, true})
		end
	else
		if tipo == 'random' then
			local lucky = math.random(1,#Config.ItemsReward)
			local items = Config.ItemsReward[lucky]
			for i = 1, #items do
				if items[i].type == 'item' then
					-- Your give item function goes here:
					
				elseif items[i].type == 'cash' then
					-- Your give money function goes here:
					
					TriggerClientEvent('av_houserobbery:notification',source,Config.Lang['money_found']..items[i].itemQty)
				end
			end
		elseif tipo == 'cajafuerte' then
			local lucky = math.random(1,#Config.SafeRewards)
			local items = Config.SafeRewards[lucky]
			for i = 1, #items do
				if items[i].type == 'item' then
					-- Your give item function goes here:
					
				elseif items[i].type == 'cash' then
					-- Your give money function goes here:
					
					TriggerClientEvent('av_houserobbery:notification',source,Config.Lang['money_found']..items[i].itemQty)
				end
			end
		elseif tipo == 'tv' then
			-- Your give item function goes here:
		elseif tipo == 'telescopio' then
			-- Your give item function goes here:
		elseif tipo == 'arte' then
			-- Your give item function goes here:
		elseif tipo == 'laptop' then
			-- Your give item function goes here:
		else
			local item = props[tipo].item
			-- Your give item function goes here:
		end
	end
end)

RegisterServerEvent('av_houserobbery:policeCall')
AddEventHandler('av_houserobbery:policeCall', function(c)
	TriggerClientEvent('av_houserobbery:policiablip',-1,c)
end)

function getIdenti(source)
	for k,v in pairs(GetPlayerIdentifiers(source))do       
		if string.sub(v, 1, string.len("license:")) == "license:" then
			return v
		end		
	end
end

Citizen.CreateThread(function()
	while true do
		for k,v in pairs(cooldownTimer) do
			if v.time <= 0 then
				ResetCooldownTimer(v.identifier)
			else
				v.time = v.time - 1
			end
		end
		Citizen.Wait(30 * 60 * 1000)
	end
end)

function ResetCooldownTimer(source)
    for k,v in pairs(cooldownTimer) do
        if v.identifier == source then
            table.remove(cooldownTimer,k)
        end
    end
end

function CheckCooldownTimer(source)
    for k,v in pairs(cooldownTimer) do
        if v.identifier == source then
            return true
        end
    end
    return false
end