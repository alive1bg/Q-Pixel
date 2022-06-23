local QBCore = exports['qb-core']:GetCoreObject()

local cooldown = false

QBCore.Functions.CreateUseableItem('thermitecharge', function(source) 
	TriggerClientEvent('gutso-bobcat:startHeist', source) 
end) 

RegisterNetEvent('gutso-bobcat:particles', function(method)
	TriggerClientEvent('gutso-bobcat:ptfxparticle', -1, method)
end)

RegisterNetEvent('gutso-bobcat:particles2', function(method)
	TriggerClientEvent('gutso-bobcat:ptfxparticle2', -1, method)
end)

QBCore.Functions.CreateUseableItem('bobcatsecuritycard', function(source)
	TriggerClientEvent('gutso-bobcat:openThirdDoor', source)
end) 

RegisterNetEvent('gutso-bobcat:giveRandomSmgs', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	for i = 1, math.random(1, 2), 1 do 
		local randomWeapon = Config.Smgs[math.random(1, #Config.Smgs)] --weapon circles
		local amount = math.random(0, 1) --weapon counts
		Player.Functions.AddItem(randomWeapon, amount)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Wait(300)
	end 
end) 

RegisterNetEvent('gutso-bobcat:giveRandomExplosives', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	for i = 1, math.random(1, 2), 1 do 
		local randomWeapon = Config.Explosives[math.random(1, #Config.Explosives)] --weapon circles
		local amount = math.random(0, 1) --weapon counts
		Player.Functions.AddItem(randomWeapon, amount)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Wait(300)
	end 
end) 

RegisterNetEvent('gutso-bobcat:giveRandomRifles', function()
	local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
	for i = 1, math.random(1, 2), 1 do 
		local randomWeapon = Config.Rifles[math.random(1, #Config.Rifles)] --weapon circles
		local amount = math.random(0, 1) --weapon counts
		Player.Functions.AddItem(randomWeapon, amount)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomWeapon], 'add')
		Wait(300)
	end 
end) 

QBCore.Functions.CreateCallback('gutso-bobcat:server:enoughCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)  

QBCore.Functions.CreateCallback('gutso-bobcat:server:cooldown', function(source, cb)
	if cooldown then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('gutso-bobcat:server:startCooldown', function()
	cooldown = true 
	local timer = Config.Cooldown * 6000
	while timer > 0 do 
		Wait(1000)
		timer = timer - 1000
		print(timer)
		print('cooldown işliyor..')
		if timer == 0 then 
			print('cooldown finished')
			TriggerEvent('gutso-bobcat:server:resetVault')
			cooldown = false 
		end 
	end
end)

RegisterNetEvent('gutso-bobcat:server:resetVault', function()
	TriggerClientEvent('gutso-bobcat:client:resetVault', -1)
end)

RegisterNetEvent("gutso-bobcat:server:commandPed", function()
	TriggerClientEvent("gutso-bobcat:commandPed", -1)
end)

RegisterNetEvent("gutso-bobcat:server:explodeVaultDoorSync", function() 
	TriggerClientEvent("gutso-bobcat:client:explodeVaultDoor", -1)
end)

RegisterNetEvent("gutso-bobcat:server:npcSync", function() 
	local src = source
    TriggerClientEvent("gutso-bobcat:client:npcSync", src)
end) 