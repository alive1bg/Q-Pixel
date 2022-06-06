local QBCore = exports['qb-core']:GetCoreObject()

local Calledbothpallet = false
local Calledmixingpallet = false
local Calledmixingpallet2 = false
local Calleddrinkpallet = false
local JobBusy = false
local Tasks = false
local random = 0
local palletPrice = Config.Palletprice
local bothpalletPrice = Config.AllPalletprice
local uwucafejobPeds = {}
local Working = false
local PlayerData = {}
local currentZone = nil
local holdingplush = false

--Events--

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function(Player)
    PlayerData =  QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('qb-uwujob:uwucounter1', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'uwucounter1')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'uwucounter1', {
        maxweight = 100000,
        slots = 20,
    })
end)

RegisterNetEvent('qb-uwujob:uwucounter2', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'uwucounter2')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'uwucounter2', {
        maxweight = 100000,
        slots = 20,
    })
end)

RegisterNetEvent('qb-uwujob:uwushop', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "uwu_shop", Config.Items)
end)

RegisterNetEvent('qb-uwujob:kitchencounter', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'kitchencounter')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'kitchencounter', {
        maxweight = 100000,
        slots = 20,
    })
end)

RegisterNetEvent('qb-uwujob:Storage', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'uwustorage')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'uwustorage', {
        maxweight = 750000,
        slots = 80,
    })
end)

RegisterNetEvent('qb-uwujob:FoodStorage', function()
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'DoorOpen', 4)
    TriggerEvent('inventory:client:SetCurrentStash', 'uwucoldstorage')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'uwucoldstorage', {
        maxweight = 750000,
        slots = 80,
    })
end)

--mixing
RegisterNetEvent('qb-uwujob:Mixinguwuchocsandy', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwuchocsandy', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Mixing uWu Chocolate Marshmallows Sandy batter..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'cocoapowder', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['cocoapowder'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'butter', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['butter'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'sugar', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['sugar'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'egg', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['egg'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'milk', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['milk'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'flour', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['flour'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'kittymarshmallows', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['kittymarshmallows'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwuchocsandybatter', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwuchocsandybatter'], 'add')

					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Mixinguwuvanillasandy', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwuvanillasandy', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Mixing uWu Vanilla Marshmallows Sandy batter..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'vanillaextract', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['vanillaextract'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'butter', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['butter'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'sugar', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['sugar'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'egg', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['egg'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'milk', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['milk'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'flour', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['flour'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'kittymarshmallows', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['kittymarshmallows'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwuvanillasandybatter', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwuvanillasandybatter'], 'add')

					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Mixinguwucupcake', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwucupcake', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Mixing uWu Cupcake batter..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'flour', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['flour'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'cocoapowder', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['cocoapowder'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'butter', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['butter'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'sugar', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['sugar'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'milk', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['milk'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'egg', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['egg'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'vanillaextract', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['vanillaextract'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'bakingpowder', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['bakingpowder'], 'remove')
						TriggerServerEvent('QBCore:Server:AddItem', 'uwucupcakebatter', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwucupcakebatter'], 'add')
					
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Mixinguwupancake', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwupancake', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Mixing uWu Savory Pancake batter..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'egg', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['egg'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'scallions', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['scallions'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'salt', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['salt'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'soysauce', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['soysauce'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'flour', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['flour'], 'remove')
						TriggerServerEvent('QBCore:Server:AddItem', 'uwupancakebatter', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwupancakebatter'], 'add')
						
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

--baking
RegisterNetEvent('qb-uwujob:Bakinguwuchocsandy', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then 
			QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
				if HasItem then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Baking uWu Chocolate Marshmallows Sandy..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'uwuchocsandybatter', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwuchocsandybatter'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwuchocsandy', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwuchocsandy'], 'add')

					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the batter to bake this', 'error')
				end
			end, 'uwuchocsandybatter')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Bakinguwuvanillasandy', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then 
			QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
				if HasItem then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Baking uWu Vanilla Marshmallows Sandy..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'uwuvanillasandybatter', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwuvanillasandybatter'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwuvanillasandy', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwuvanillasandy'], 'add')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the batter to bake this', 'error')
				end
			end, 'uwuvanillasandybatter')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Bakinguwucupcake', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then 
			QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
				if HasItem then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Baking uWu Cupcake..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'uwucupcakebatter', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwucupcakebatter'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwucupcake', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwucupcake'], 'add')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the batter to bake this', 'error')
				end
			end, 'uwucupcakebatter')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Bakinguwupancake', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then 
			QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
				if HasItem then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Baking uWu Savory Pancake..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'uwupancakebatter', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwupancakebatter'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwupancake', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwupancake'], 'add')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the batter to bake this', 'error')
				end
			end, 'uwupancakebatter')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

--non mixing
RegisterNetEvent('qb-uwujob:Makinguwusushi', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwusushi', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making some uWu Shushi..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'whiterice', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['whiterice'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'vinegar', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['vinegar'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'sugar', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['sugar'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'salt', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['salt'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'seaweed', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['seaweed'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'crabmeat', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['crabmeat'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwusushi', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwusushi'], 'add')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Makinguwubudhabowl', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwubudhabowl', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a uWu Budha Bowl..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'broccoil', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['broccoil'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'cauliflower', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['cauliflower'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'chickpeas', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['chickpeas'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'cashews', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['cashews'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'lemonjuice', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['lemonjuice'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'garlic', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['garlic'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwubudhabowl', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwubudhabowl'], 'add')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Makinguwumisosoup', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwumisosoup', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making some uWu Miso Soup..', 3500, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'dashigranules', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['dashigranules'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'water_bottle', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['water_bottle'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'misopaste', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['misopaste'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'dicedsilkentofu', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['dicedsilkentofu'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'onions', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['onions'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwumisosoup', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwumisosoup'], 'add')

					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

--drinks
RegisterNetEvent('qb-uwujob:Makinguwububbleteamint', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwububbleteamint', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Mixing a Matcha Tea with Mint Boba.', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mini@drinking',
						anim = 'shots_barman_b',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						StopAnimTask(PlayerPedId(), 'mini@drinking', 'shots_barman_b', 1.0)
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'matchapowder', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['matchapowder'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'water_bottle', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['water_bottle'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'heavycream', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['heavycream'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'tapiocapearls', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tapiocapearls'], 'remove')
						TriggerServerEvent('QBCore:Server:AddItem', 'uwububbleteamint', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwububbleteamint'], 'add')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Makinguwububbleteablueberry', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwububbleteablueberry', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Mixing a Lavender Tea with Blueberry Boba.', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mini@drinking',
						anim = 'shots_barman_b',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						StopAnimTask(PlayerPedId(), 'mini@drinking', 'shots_barman_b', 1.0)
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'blueberrylavendertea', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['blueberrylavendertea'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'water_bottle', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['water_bottle'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'heavycream', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['heavycream'], 'remove')
						TriggerServerEvent('QBCore:Server:RemoveItem', 'tapiocapearls', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tapiocapearls'], 'remove')
						TriggerServerEvent('QBCore:Server:AddItem', 'uwububbleteablueberry', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwububbleteablueberry'], 'add')
					
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Makinguwububbletearose', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-uwujob:ingredients:uwububbletearose', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Mixing a Sakura Rose Tea with Vanilla Boba.', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mini@drinking',
						anim = 'shots_barman_b',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						StopAnimTask(PlayerPedId(), 'mini@drinking', 'shots_barman_b', 1.0)
                                            
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('QBCore:Server:RemoveItem', 'sakurarosetea', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['sakurarosetea'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'water_bottle', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['water_bottle'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'heavycream', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['heavycream'], 'remove')
    					TriggerServerEvent('QBCore:Server:RemoveItem', 'tapiocapearls', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tapiocapearls'], 'remove')
    					TriggerServerEvent('QBCore:Server:AddItem', 'uwububbletearose', 1)
    					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwububbletearose'], 'add')

					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

-- Pallets --
RegisterNetEvent('qb-uwujob:Callformixingpallet', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			QBCore.Functions.TriggerCallback('qb-management:server:GetAccount', function(balance)
    			if balance >= palletPrice then-- bossmoney check
					TriggerEvent('qb-uwujob:CallWarehouseSuccess')
					--TriggerServerEvent('qb-management:server:removeAccountMoney', 'uwu', palletPrice)
					exports['qb-management']:RemoveMoney('uwu', palletPrice)
					Calledmixingpallet = true
				else
					QBCore.Functions.Notify('There is no money in the company account Talk to the Boss..', 'error')
				end
			end, 'uwu')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Callformixingpallet2', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			QBCore.Functions.TriggerCallback('qb-management:server:GetAccount', function(balance)
    			if balance >= palletPrice then-- bossmoney check
					TriggerEvent('qb-uwujob:CallWarehouseSuccess')
					--TriggerServerEvent('qb-management:server:removeAccountMoney', 'uwu', palletPrice)
					exports['qb-management']:RemoveMoney('uwu', palletPrice)
					Calledmixingpallet2 = true
				else
					QBCore.Functions.Notify('There is no money in the company account Talk to the Boss..', 'error')
				end
			end, 'uwu')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:Callfordrinkpallet', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			QBCore.Functions.TriggerCallback('qb-management:server:GetAccount', function(balance)
    			if balance >= palletPrice then-- bossmoney check
					TriggerEvent('qb-uwujob:CallWarehouseSuccess')
					--TriggerServerEvent('qb-management:server:removeAccountMoney', 'uwu', palletPrice)
					exports['qb-management']:RemoveMoney('uwu', palletPrice)
					Calleddrinkpallet = true
				else
					QBCore.Functions.Notify('There is no money in the company account Talk to the Boss..', 'error')
				end
			end, 'uwu')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end 
	end)
end)

RegisterNetEvent('qb-uwujob:Callforbothpallets', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			QBCore.Functions.TriggerCallback('qb-management:server:GetAccount', function(balance)
    			if balance >= bothpalletPrice then-- bossmoney check
					TriggerEvent('qb-uwujob:CallWarehouseSuccess')
					--TriggerServerEvent('qb-management:server:removeAccountMoney', 'uwu', bothpalletPrice)
					exports['qb-management']:RemoveMoney('uwu', bothpalletPrice)
					Calledbothpallet = true
				else
					QBCore.Functions.Notify('There is no money in the company account Talk to the Boss..', 'error')
				end
			end, 'uwu')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)


RegisterNetEvent('qb-uwujob:CallWarehouseSuccess', function()
	if Config.vinnyswarehouse then
		QBCore.Functions.Notify('Pick up the ingredients pallet at Vinnys Warehouse', 'success')
		SetNewWaypoint(Config.vinnyswarehouseLocations[2].coords)
	else
		QBCore.Functions.Notify('Pick up the ingredients pallet at uWu Warehouse', 'success')
		SetNewWaypoint(Config.vinnyswarehouseLocations[1].coords)
	end
	Calledwarehouse = true
end)

RegisterNetEvent('qb-uwujob:Warehousebuypallet', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty and not IsPedInAnyVehicle(PlayerPedId(), false) then
			if Calledmixingpallet then
				TriggerServerEvent('QBCore:Server:AddItem', 'uwu-bakingpallet', 1)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-bakingpallet'], 'add')
				Calledmixingpallet = false
			elseif Calledmixingpallet2 then
				TriggerServerEvent('QBCore:Server:AddItem', 'uwu-bakingpallet', 1)
				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-bakingpallet'], 'add')
				Calledmixingpallet2 = false
            elseif Calleddrinkpallet then
                TriggerServerEvent('QBCore:Server:AddItem', 'uwu-drinkpallet', 1)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-drinkpallet'], 'add')
				Calledpastapallet = false
            elseif Calledbothpallet then
                TriggerServerEvent('QBCore:Server:AddItem', 'uwu-bakingpallet', 1)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-bakingpallet'], 'add')
				TriggerServerEvent('QBCore:Server:AddItem', 'uwu-bakingpallet2', 1)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-bakingpallet2'], 'add')
                TriggerServerEvent('QBCore:Server:AddItem', 'uwu-drinkpallet', 1)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-drinkpallet'], 'add')
				Calledbothpallet = false
            else
				QBCore.Functions.Notify('~r~You didnt call the warehouse first..', 'error')
			end
			QBCore.Functions.Notify('Deliver the ingredients pallet back to '..Config.uWuLocation[1].info, 'success')
			SetNewWaypoint(Config.uWuLocation[1].coords)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

-- Unpacking Ingredient Pallets
RegisterNetEvent('qb-uwujob:unloadMixingpallet', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                if HasItem then
					TriggerServerEvent('QBCore:Server:RemoveItem', 'uwu-bakingpallet', 1)
					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-bakingpallet'], 'remove')
					QBCore.Functions.Notify('ingredients have been unpacked!', 'success')
                    TriggerServerEvent('QBCore:Server:AddItem', 'flour', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['flour'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'nutmeg', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['nutmeg'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'butter', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['butter'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'sugar', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['sugar'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'egg', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['egg'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'bakingpowder', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['bakingpowder'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'dashigranules', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['dashigranules'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'misopaste', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['misopaste'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'dicedsilkentofu', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['dicedsilkentofu'], 'add')
                else
					QBCore.Functions.Notify('You don\'t have any pallets.', 'error')
				end
            end, 'uwu-bakingpallet')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:unloadMixingpallet2', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                if HasItem then
					TriggerServerEvent('QBCore:Server:RemoveItem', 'uwu-bakingpallet2', 1)
					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-bakingpallet2'], 'remove')
					QBCore.Functions.Notify('ingredients have been unpacked!', 'success')
                    TriggerServerEvent('QBCore:Server:AddItem', 'onions', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['onions'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'scallions', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['scallions'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'salt', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['salt'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'whiterice', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['whiterice'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'seaweed', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['seaweed'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'crabmeat', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['crabmeat'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'broccoil', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['broccoil'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'cauliflower', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['cauliflower'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'chickpeas', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['chickpeas'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'cashews', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['cashews'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'lemonjuice', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['lemonjuice'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'garlic', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['garlic'], 'add')
                else
					QBCore.Functions.Notify('You don\'t have any pallets.', 'error')
				end
            end, 'uwu-bakingpallet2')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:unloadDrinkpallets', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                if HasItem then
					TriggerServerEvent('QBCore:Server:RemoveItem', 'uwu-drinkpallet', 1)
					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-drinkpallet'], 'remove')
					QBCore.Functions.Notify('ingredients have been unpacked!', 'success')
                    TriggerServerEvent('QBCore:Server:AddItem', 'sakurarosetea', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['sakurarosetea'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'tapiocapearls', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tapiocapearls'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'heavycream', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['heavycream'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'blueberrylavendertea', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['sakurblueberrylavenderteaarosetea'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'whipcream', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['whipcream'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'milk', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['milk'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'kittymarshmallows', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['kittymarshmallows'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'matchapowder', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['matchapowder'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'vanillaextract', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['vanillaextract'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'cocoapowder', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['cocoapowder'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'vinegar', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['vinegar'], 'add')
    				TriggerServerEvent('QBCore:Server:AddItem', 'soysauce', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['soysauce'], 'add')
					TriggerServerEvent('QBCore:Server:AddItem', 'water_bottle', 40)
    				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['water_bottle'], 'add')
                else
					QBCore.Functions.Notify('You don\'t have any pallets.', 'error')
				end
            end, 'uwu-drinkpallet')
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

--jobs
RegisterNetEvent('qb-uwujob:deliveryjob', function()
	random = math.random(1,#Config.DeliveryLocations)
	CreateBlip()
	QBCore.Functions.Notify('Deliver this bag to '..Config.DeliveryLocations[random].info, 'success')
	TriggerServerEvent('QBCore:Server:AddItem', 'uwu-bag', 1)
	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-bag'], 'add')
	if Tasks then
		return
	end
	Tasks = true
	while Tasks do
		Wait(1)
		local pos = GetEntityCoords(PlayerPedId())
		local GetDist = #(pos - Config.DeliveryLocations[random].coords)
		if GetDist <= 5.0 then
			DrawText3D(Config.DeliveryLocations[random].coords.x+0.1, Config.DeliveryLocations[random].coords.y+0.1, Config.DeliveryLocations[random].coords.z+0.1, '~g~E~s~ - Deliver') 
			DrawMarker(2, Config.DeliveryLocations[random].coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 155, false, false, false, true, false, false, false)
				if IsControlJustReleased(0, 38) then
					if not IsPedInAnyVehicle(PlayerPedId(), false) then
						EndJob()
					else
						QBCore.Functions.Notify('You can\'t deliver in your vehicle..', 'error')
				end
			end
		else
			Wait(2000)
		end
	end
end)

RegisterNetEvent('qb-uwujob:startjob', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			if JobBusy == false and not IsPedInAnyVehicle(PlayerPedId(), false) then
				JobBusy = true
				TriggerServerEvent('qb-uwujob:start:deliveryjob')
			elseif JobBusy == true then
				QBCore.Functions.Notify('You\'re already doing another task', 'error')
				Wait(2000)
			end
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

--garage

RegisterNetEvent('qb-uwujob:garage', function(bs)
    local vehicle = bs.vehicle
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == 'uwu' then
            if vehicle == 'stalion2' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, 'uWu'..tostring(math.random(1000, 9999)))
                    exports[Config.Fuel]:SetFuel(veh, 100.0)
                    SetEntityHeading(vehicle, 34.65)
                    TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
                    SetVehicleEngineOn(veh, true, true)
				end, Config.uwucafejobcarspawn["uwucafejob1"].coords, true)
            end
        else 
            QBCore.Functions.Notify('You are not an employee of uwucafejob.', 'error')
        end
    end)    
end)

RegisterNetEvent('qb-uwujob:storecar', function()
    local Player = QBCore.Functions.GetPlayerData()
    QBCore.Functions.Notify('Work Vehicle Stored!', 'primary')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)


--Menus--
RegisterNetEvent('qb-uwujob:menu:mixingstation', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			exports['qb-menu']:openMenu({
		        {
		            header = "『Uwu Mixing Station』",
		            isMenuHeader = true,
		        },
		        {
		            header = "• uWu Chocolate Marshmallows Sandy",
		            txt = "Sweet Vanilla Biscuit with kitty marshmallows",
		            params = {
		                event = "qb-uwujob:Mixinguwuchocsandy"
		            }
		        },
				{
		            header = "• uWu Vanilla Marshmallows Sandy",
		            txt = "Sweet Chocolate Biscuit with kitty marshmallows",
		            params = {
		                event = "qb-uwujob:Mixinguwuvanillasandy"
		            }
		        },
		        {
		            header = "• uWu Cupcake",
		            txt = "Sugar Kitty Cupcake!",
		            params = {
		                event = "qb-uwujob:Mixinguwucupcake"
		            }
		        },
		        {
		            header = "• uWu Savory Pancake",
		            txt = "Korean savory pancake made with scallions.",
		            params = {
		                event = "qb-uwujob:Mixinguwupancake"
		            }
		        },
		    })
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:menu:ovenstation', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			exports['qb-menu']:openMenu({
		        {
		            header = "『Uwu Oven』",
		            isMenuHeader = true,
		        },
		        {
		            header = "• Bake uWu Chocolate Marshmallows Sandy Batter",
		            txt = "Sweet Vanilla Biscuit with kitty marshmallows",
		            params = {
		                event = "qb-uwujob:Bakinguwuchocsandy"
		            }
		        },
				{
		            header = "• Bake uWu Vanilla Marshmallows Sandy Batter",
		            txt = "Sweet Chocolate Biscuit with kitty marshmallows",
		            params = {
		                event = "qb-uwujob:Bakinguwuvanillasandy"
		            }
		        },
		        {
		            header = "• Bake uWu Cupcake Batter",
		            txt = "Sugar Kitty Cupcake!",
		            params = {
		                event = "qb-uwujob:Bakinguwucupcake"
		            }
		        },
		        {
		            header = "• Bake uWu Savory Pancake Batter",
		            txt = "Korean savory pancake made with scallions.",
		            params = {
		                event = "qb-uwujob:Bakinguwupancake"
		            }
		        },
		    })
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:menu:foodstation', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			exports['qb-menu']:openMenu({
				{
					header = "『uWu Menu』",
					isMenuHeader = true,
				},
				{
					header = "• uWu Budha Bowl",
					txt = "Bowl of nourishment and balance.",
					params = {
						event = "qb-uwujob:Makinguwubudhabowl"
					}
				},
				{
					header = "• uWu shushi",
					txt = "Designed as a window to your soul.",
					params = {
						event = "qb-uwujob:Makinguwusushi"
					}
				},
				{
					header = "• uWu Miso Soup",
					txt = "Fungus never tasted so good!",
					params = {
						event = "qb-uwujob:Makinguwumisosoup"
					}
				},
    		})
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:menu:DrinkMenu', function(data)
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
    		exports['qb-menu']:openMenu({
    		    {
    		        header = "『uWu Menu』",
    		        txt = "",
    		    },
    		    {
    		        header = "• Minty B-T",
    		        txt = "Matcha Tea with Mint Boba",
    		        params = {
    		            event = "qb-uwujob:Makinguwububbleteamint"
    		        }
    		    },
    		    {
    		        header = "• Berry Blue B-T",
    		        txt = "Lavender Tea with Blueberry Boba",
    		        params = {
    		            event = "qb-uwujob:Makinguwububbleteablueberry"
    		        }
    		    },
				{
    		        header = "• Rosey B-T",
    		        txt = "Sakura Rose Tea with Vanilla Boba",
    		        params = {
    		            event = "qb-uwujob:Makinguwububbletearose"
    		        }
    		    },
    		})
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-uwujob:menu:registermenu', function()
    local registermenu = {
        {
            header = '『uWu Register』',
            isMenuHeader = true,
        },
        {
            header = '• Warehouse',
            txt = '',
            params = {
                event = 'qb-uwujob:menu:callwearhousemenu',
                args = {
                    
                }
            }
        },
		{
            header = '• Charge a Customer',
            txt = '',
            params = {
                event = 'qb-uwujob:bill',
                args = {
                    
                }
            }
        },
		{
            header = '• Start A Delivery',
            txt = '',
            params = {
                event = 'qb-uwujob:startjob',
                args = {
                    
                }
            }
        },
		{
            header = '• Ticket Payout',
            txt = '',
            params = {
                event = 'qb-uwujob:payout',
                args = {
                    
                }
            }
        },
        {
            header = '• Clock In/Out',
            txt = '',
            params = {
                event = 'qb-uwujob:Toggle:Duty',
                args = {
                    
                }
            }
        },		
    }
	exports['qb-menu']:openMenu(registermenu)
end)

RegisterNetEvent('qb-uwujob:Toggle:Duty', function()
    onDuty = not onDuty
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent('qb-uwujob:menu:callwearhousemenu', function()
    local callwearhousemenu = {
        {
            header = '『uWu Warehouse: Order』',
            isMenuHeader = true,
        },
        {
            header = '• Buy a Mixing ingredients pallet one',
            txt = '$'..palletPrice..' From the companys bank account',
            params = {
                event = 'qb-uwujob:Callformixingpallet',
                args = {
                    
                }
            }
        },
		{
            header = '• Buy a Mixing ingredients pallet two',
            txt = '$'..palletPrice..' From the companys bank account',
            params = {
                event = 'qb-uwujob:Callformixingpallet2',
                args = {
                    
                }
            }
        },
		{
            header = '• Buy a Drink ingredients pallet',
            txt = '$'..palletPrice..' From the companys bank account',
            params = {
                event = 'qb-uwujob:Callfordrinkpallet',
                args = {
                    
                }
            }
        },
        {
            header = '• Buy All ingredients pallets',
            txt = '$'..bothpalletPrice..' From the companys bank account',
            params = {
                event = 'qb-uwujob:Callforbothpallets',
                args = {
                    
                }
            }
        },		
    }
	exports['qb-menu']:openMenu(callwearhousemenu)
end)

RegisterNetEvent('qb-uwujob:menu:unpackpalletmenu', function()
    local unpackpalletmenu = {
        {
            header = '『uWu Cold Storage』',
            isMenuHeader = true,
        },
        {
            header = '• Unpack Mixing ingredients pallet one',
            txt = '',
            params = {
                event = 'qb-uwujob:unloadMixingpallet',
                args = {
                    
                }
            }
        },
		{
            header = '• Unpack Mixing ingredients pallet two',
            txt = '',
            params = {
                event = 'qb-uwujob:unloadMixingpallet2',
                args = {
                    
                }
            }
        },
		{
            header = '• Unpack Drinks ingredients pallet',
            txt = '',
            params = {
                event = 'qb-uwujob:unloadDrinkpallets',
                args = {
                    
                }
            }
        },
    }
	exports['qb-menu']:openMenu(unpackpalletmenu)
end)

RegisterNetEvent('qb-uwujob:menu:garage', function()
    exports['qb-menu']:openMenu({
        {
            header = '『uWu Garage』',
            isMenuHeader = true,
        },
        {
            header = '• Stallion',
            txt = 'Declasse  Shot Stallion',
            params = {
                event = 'qb-uwujob:garage',
                args = {
                    vehicle = 'stalion2',
                }
            }
        },
        {
            header = '• Store Vehicle',
            txt = 'Store Vehicle Inside Garage',
            params = {
                event = 'qb-uwujob:storecar',
                args = {
                    
                }
            }
        },		
    })
end)

-- QB INPUT --

RegisterNetEvent('qb-uwujob:bill', function()
    local bill = exports['qb-input']:ShowInput({
        header = 'Create Receipt',
        inputs = {
            {
                text = 'City ID',
                name = 'citizenid',
                type = 'text',
                isRequired = true
            },
            {
                text = 'Amount',
                name = 'billprice',
                type = 'number',
                isRequired = false
            },
            {
                text = 'Bill Type',
                name = 'billtype',
                type = 'radio',
                options = {
                    { value = 'cash', text = 'Cash' }, -- Options MUST include a value and a text option
                    { value = 'bank', text = 'Debit Card' }
                }
            }
        }
    })
    if bill == nil then return end 
    TriggerServerEvent('qb-uwujob:bill:player', bill)
end)

-- Register Stuff
RegisterNetEvent('qb-uwujob:payout', function()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			TriggerServerEvent('qb-uwujob:payment:money', true)
		else
			QBCore.Functions.Notify('You dont have any delivery tickets on you..', 'error')
		end 
 	end, 'uwu-ticket')
end)

RegisterNetEvent('qb-uwujob:client:uwupurpleplush', function()
	if holdingplush then
		StopAnimTask(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tab)
		ExecuteCommand('propstuck')
		holdingplush = false
	else
		RequestAnimDict("impexp_int-0")
		while not HasAnimDictLoaded("impexp_int-0") do
			Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		tab = CreateObject(818790301, 0, 0, 0, true, true, true)
		AttachEntityToEntity(tab, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.17, 0.11, -0.07, 90.0, 225.0, 180.0, true, true, false, true, 1, true)
		holdingplush = true
	end
end)

RegisterNetEvent('qb-uwujob:client:uwugreenplush', function()
	if holdingplush then
		StopAnimTask(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tab)
		ExecuteCommand('propstuck')
		holdingplush = false
	else
		RequestAnimDict("impexp_int-0")
		while not HasAnimDictLoaded("impexp_int-0") do
			Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		tab = CreateObject(1393952729, 0, 0, 0, true, true, true)
		AttachEntityToEntity(tab, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.17, 0.11, -0.07, 90.0, 225.0, 180.0, true, true, false, true, 1, true)
		holdingplush = true
	end
end)

RegisterNetEvent('qb-uwujob:client:uwublueplush', function()
	if holdingplush then
		StopAnimTask(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tab)
		ExecuteCommand('propstuck')
		holdingplush = false
	else
		RequestAnimDict("impexp_int-0")
		while not HasAnimDictLoaded("impexp_int-0") do
			Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		tab = CreateObject(2001522426, 0, 0, 0, true, true, true)
		AttachEntityToEntity(tab, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.17, 0.11, -0.07, 90.0, 225.0, 180.0, true, true, false, true, 1, true)
		holdingplush = true
	end
end)

RegisterNetEvent('qb-uwujob:client:uwubrownplush', function()
	if holdingplush then
		StopAnimTask(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tab)
		ExecuteCommand('propstuck')
		holdingplush = false
	else
		RequestAnimDict("impexp_int-0")
		while not HasAnimDictLoaded("impexp_int-0") do
			Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		tab = CreateObject(1943054478, 0, 0, 0, true, true, true)
		AttachEntityToEntity(tab, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.17, 0.11, -0.07, 90.0, 225.0, 180.0, true, true, false, true, 1, true)
		holdingplush = true
	end
end)

RegisterNetEvent('qb-uwujob:client:uwuyellowplush', function()
	if holdingplush then
		StopAnimTask(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tab)
		ExecuteCommand('propstuck')
	else
		RequestAnimDict("impexp_int-0")
		while not HasAnimDictLoaded("impexp_int-0") do
			Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		tab = CreateObject(1640596832, 0, 0, 0, true, true, true)
		AttachEntityToEntity(tab, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.17, 0.11, -0.07, 90.0, 225.0, 180.0, true, true, false, true, 1, true)
		holdingplush = true
	end
end)

RegisterNetEvent('qb-uwujob:client:uwuredplush', function()
	if holdingplush then
		StopAnimTask(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tab)
		ExecuteCommand('propstuck')
		holdingplush = false
	else
		RequestAnimDict("impexp_int-0")
		while not HasAnimDictLoaded("impexp_int-0") do
			Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		tab = CreateObject(968344509, 0, 0, 0, true, true, true)
		AttachEntityToEntity(tab, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.17, 0.11, -0.07, 90.0, 225.0, 180.0, true, true, false, true, 1, true)
		holdingplush = true
	end
end)

RegisterNetEvent('qb-uwujob:client:uwugreenrareplush', function()
	if holdingplush then
		StopAnimTask(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tab)
		ExecuteCommand('propstuck')
		holdingplush = false
	else
		RequestAnimDict("impexp_int-0")
		while not HasAnimDictLoaded("impexp_int-0") do
			Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		tab = CreateObject(1351790032, 0, 0, 0, true, true, true)
		AttachEntityToEntity(tab, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.17, 0.11, -0.07, 90.0, 225.0, 180.0, true, true, false, true, 1, true)
		holdingplush = true
	end
end)

RegisterNetEvent('qb-uwujob:client:uwupinkrareplush', function()
	if holdingplush then
		StopAnimTask(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tab)
		ExecuteCommand('propstuck')
		holdingplush = false
	else
		RequestAnimDict("impexp_int-0")
		while not HasAnimDictLoaded("impexp_int-0") do
			Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), "impexp_int-0", "mp_m_waremech_01_dual-0" ,8.0, -8.0, -1, 50, 0, false, false, false)
		tab = CreateObject(-1650444620, 0, 0, 0, true, true, true)
		AttachEntityToEntity(tab, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.17, 0.11, -0.07, 90.0, 225.0, 180.0, true, true, false, true, 1, true)
		holdingplush = true
	end
end)

--Threads--

CreateThread(function()
	uwulocation = AddBlipForCoord(-581.1549, -1073.435, 22.329565)
	SetBlipSprite (uwulocation, 489)
	SetBlipDisplay(uwulocation, 2)
	SetBlipScale  (uwulocation, 0.8)
	SetBlipAsShortRange(uwulocation, true)
	SetBlipColour(uwulocation, 48)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('uWu Cafe')
	EndTextCommandSetBlipName(uwulocation)
end)

if not Config.vinnyswarehouse then
	CreateThread(function()
		uwuwarehouse = AddBlipForCoord(Config.vinnyswarehouseLocations[1].coords)
		SetBlipSprite (uwuwarehouse, 442)
		SetBlipDisplay(uwuwarehouse, 2)
		SetBlipScale  (uwuwarehouse, 0.5)
		SetBlipAsShortRange(uwuwarehouse, true)
		SetBlipColour(uwuwarehouse, 41)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(Config.vinnyswarehouseLocations[1].info)
		EndTextCommandSetBlipName(uwuwarehouse)
	end)
end

if Config.vinnyswarehousemain then
    CreateThread(function()
        vinnyswarehouse = AddBlipForCoord(Config.vinnyswarehouseLocations[2].coords)
        SetBlipSprite (vinnyswarehouse, 85)
        SetBlipDisplay(vinnyswarehouse, 4)
        SetBlipScale  (vinnyswarehouse, 0.5)
        SetBlipAsShortRange(vinnyswarehouse, true)
        SetBlipColour(vinnyswarehouse, 75)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Vinny\'s Warehouse')
        EndTextCommandSetBlipName(vinnyswarehouse)
    end)
end

--functions

function animatedeliverydone()
	loadAnimDict( 'mp_safehouselost@' )
    TaskPlayAnim( PlayerPedId(), 'mp_safehouselost@', 'package_dropoff', 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end 

function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

function CreateBlip()
	if JobBusy then
		blip = AddBlipForCoord(Config.DeliveryLocations[random].coords)
	end
	SetNewWaypoint(Config.DeliveryLocations[random].coords)
	SetBlipSprite(blip, 501)
	SetBlipScale(blip, 0.9)
	SetBlipColour(blip, 48) 
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Delivery Location')
    EndTextCommandSetBlipName(blip)
end

function uwucafejobWaypoint()
	SetNewWaypoint(Config.uWuLocation[1].coords)
end

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local scale = 0.40
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry('STRING')
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
	end
end

function EndJob()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if JobBusy == true and HasItem then
			Tasks = false
			JobBusy = false
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5,  'doorbell' , 0.15)
			Wait(1000)
			animatedeliverydone()
			Wait(800)
			DeleteBlip()
			TriggerServerEvent('QBCore:Server:RemoveItem', 'uwu-bag', 1)
			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-bag'], 'remove')
			TriggerServerEvent('qb-uwujob:reward:ticket', true)
			Wait(800)
			TriggerServerEvent('QBCore:Server:AddItem', 'uwu-ticket', 1)
			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['uwu-ticket'], 'add')
		else
			QBCore.Functions.Notify('You didnt even take the order with you..', 'error')
		end 
 	end, 'uwu-bag')
end

local uwumaincourses = {
	[1] =  {["food"] = 'uwusushi'},
	[2] =  {["food"] = 'uwubudhabowl'},
	[3] =  {["food"] = 'uwumisosoup'},
}

local uwuteas = {
	[1] =  {["food"] = 'uwububbleteablueberry'},
	[2] =  {["food"] = 'uwububbletearose'},
	[3] =  {["food"] = 'uwububbleteamint'},
}

local uwudessert = {
	[1] =  {["food"] = 'uwupancake'},
	[2] =  {["food"] = 'uwucupcake'},
	[3] =  {["food"] = 'uwuvanillasandy'},
	[4] =  {["food"] = 'uwuchocsandy'},
}

local uwuplush = {
	[1] =  {["item"] = 'uwupurpleplush'},
	[2] =  {["item"] = 'uwugreenplush'},
	[3] =  {["item"] = 'uwublueplush'},
	[4] =  {["item"] = 'uwubrownplush'}, 
	[5] =  {["item"] = 'uwuyellowplush'},
	[6] =  {["item"] = 'uwuredplush'},
}

local uwurareplush = {
	[1] =  {["item"] = 'uwugreenrareplush'},
	[2] =  {["item"] = 'uwupinkrareplush'},
}

RegisterNetEvent('qb-uwujob:uwubentoboxMeal', function()
	local randomToy = math.random(1,100)
	local randomcourse = math.random(1,#uwumaincourses)
	local randomtea = math.random(1,#uwuteas)
	local randomdesert = math.random(1,#uwudessert)
	local randomplush = math.random(1,#uwuplush)
	local randomrareplush = math.random(1,#uwurareplush)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'uwubentobox', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', uwumaincourses[randomcourse].food, 1)
	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[uwumaincourses[randomcourse].food], 'add')
	TriggerServerEvent('QBCore:Server:AddItem', uwuteas[randomtea].food, 1)
	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[uwuteas[randomtea].food], 'add')
	TriggerServerEvent('QBCore:Server:AddItem', uwudessert[randomdesert].food, 1)
	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[uwudessert[randomdesert].food], 'add')
	--chance for toys
	if randomToy >= 60 and randomToy <= 90 then
		TriggerServerEvent('QBCore:Server:AddItem', uwuplush[randomplush].item, 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[uwuplush[randomplush].item].item, 'add')
		QBCore.Functions.Notify('Congratulations you won a Plush', 'success')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', uwurareplush[randomrareplush].item, 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[uwurareplush[randomrareplush].item], 'add')
		QBCore.Functions.Notify('Congratulations you won a Rare Plush', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any plushies in the mystery bentobox', 'error')
	end
end)

function SetuwuSeries()
    for k, v in pairs(Config.Items) do
        if k < 6 then
            Config.Items[k].info.serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
        end
    end
end

CreateThread(function()
    local UwuCafe = CircleZone:Create(vector3(-580.54, -1064.7, 22.79), 10.0, {
        name="UwuCafe",
        debugpoly = false,
    })
    while true do
		Wait(3000)
		local plyPed = PlayerPedId()
		local coord = GetEntityCoords(plyPed)
		if UwuCafe:isPointInside(coord)then
            if not spawned then
                spawnUwuCats()
            end
		end
	end
end)

function spawnUwuCats()
	spawned = true
	for key, value in pairs(Config.UwuKittys) do
		local hash = GetHashKey('a_c_cat_01')
		RequestModel(hash)
		while not HasModelLoaded(hash) do
			Wait(10)
		end
		if value.sitting  == true then
			cat = CreatePed(28, hash, value.coords.x, value.coords.y, value.coords.z - 0.9, value.coords.w, false, true)
			DoRequestAnimSet('creatures@cat@amb@world_cat_sleeping_ground@idle_a')
			TaskPlayAnim(cat, 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
			SetPedCanBeTargetted(cat, false)
			SetEntityAsMissionEntity(cat, true,true)
			SetBlockingOfNonTemporaryEvents(cat, true)
		else
			cat = CreatePed(28, hash, value.coords.x, value.coords.y, value.coords.z - 1.0, value.coords.w, false, true)
			SetPedCanBeTargetted(cat, false)
			SetEntityAsMissionEntity(cat, true,true)
			TaskWanderStandard(cat, 0, 0)
			SetBlockingOfNonTemporaryEvents(cat, true)
		end
	end
end
	
function DoRequestAnimSet(anim)
	RequestAnimDict(anim)
	while not HasAnimDictLoaded(anim) do
		Wait(1)
	end
end