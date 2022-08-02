local QBCore = exports['qb-core']:GetCoreObject()

local Calledwarehouse = false
local Gotpallet = false
local JobBusy = false
local Tasks = false
local rnd = 0
local palletPrice = Config.Palletprice
local burgershotPeds = {}
local PlayerData = QBCore.Functions.GetPlayerData()
local Working = false
local PlayerData = {}
local deliverynumber = 0

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

CreateThread(function()
	blip = AddBlipForCoord(vector3(-1188.068, -887.2238, 13.984721))
	SetBlipAsShortRange(blip, true)
	SetBlipSprite(blip, 106)
	SetBlipColour(blip, 73)
	SetBlipScale(blip, 0.6)
	SetBlipDisplay(blip, 6)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString("BurgerShot")
	EndTextCommandSetBlipName(blip)
end)

--warehouse
CreateThread(function()
	blip = AddBlipForCoord(vector3(858.62213, -3203.458, 5.9949946))
	SetBlipAsShortRange(blip, true)
	SetBlipSprite(blip, 478)
	SetBlipColour(blip, 31)
	SetBlipScale(blip, 0.6)
	SetBlipDisplay(blip, 6)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString("Ingredient Warehouse")
	EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent('qb-burgershotjob:Fries', function()
    TriggerEvent('qb-burgershotjob:PrepareFries')
end)

RegisterNetEvent('qb-burgershotjob:OnionRings', function()
    TriggerEvent('qb-burgershotjob:PrepareOnionRings')
end)

RegisterNetEvent('qb-burgershotjob:icecream', function()
    TriggerEvent('qb-burgershotjob:makeIcecream')
end)

RegisterNetEvent('qb-burgershotjob:donut', function()
    TriggerEvent('qb-burgershotmenu:donutmainmanu')
end)

RegisterNetEvent('qb-burgershotjob:Meat', function()
    TriggerEvent('qb-burgershotjob:BakeMeat')
end)

RegisterNetEvent('qb-burgershotjob:DriveThru', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'DriveThru')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'DriveThru', {
        maxweight = 25000,
        slots = 8,
    })
end)

RegisterNetEvent('qb-burgershotjob:Tray1', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'burgertray1')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'burgertray1', {
        maxweight = 25000,
        slots = 8,
    })
end)

RegisterNetEvent('qb-burgershotjob:Tray2', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'burgertray2')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'burgertray2', {
        maxweight = 25000,
        slots = 8,
    })
end)

RegisterNetEvent('qb-burgershotjob:Storage', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'burgerstorage')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'burgerstorage', {
        maxweight = 400000,
        slots = 40,
    })
end)

RegisterNetEvent('qb-burgershotjob:FoodStorage', function()
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'DoorOpen', 4)
    TriggerEvent('inventory:client:SetCurrentStash', 'burgerfoodstorage')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'burgerfoodstorage', {
        maxweight = 1250000,
        slots = 15,
    })
end)

RegisterNetEvent('qb-burgershotjob:FinishMeatFreeBurger', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-burgershotjob:get:meatfreeingredient', function(HasItems)  
    			if HasItems then
					Working = true
					LocalPlayer.state:set("inv_busy", true, true)
					TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'wrapping', 0.14)
					QBCore.Functions.Progressbar('pickup_sla', 'Making Burgers..', 3500, false, true, {
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
						LocalPlayer.state:set("inv_busy", false, true)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-lettuce', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cheese', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'tomatoslice', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cheese'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-lettuce'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bun'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tomatoslice'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-meatfree'], 'add')
						TriggerServerEvent('QBCore:Server:AddItem', 'burger-meatfree', 1)
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'consume', 0.2)
					end, function()
						LocalPlayer.state:set("inv_busy", false, true)
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

RegisterNetEvent('qb-burgershotjob:FinishBleederBurger', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('qb-burgershotjob:get:bleederingredient', function(HasItems)  
    			if HasItems then
					Working = true
					LocalPlayer.state:set("inv_busy", true, true)
					TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'wrapping', 0.14)
					QBCore.Functions.Progressbar('pickup_sla', 'Making Burgers..', 3500, false, true, {
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
						LocalPlayer.state:set("inv_busy", false, true)
			--			TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-meat', 1)
			--			TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-lettuce', 1)
			--			TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
			--			TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
			--			TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cheese', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cheese'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-meat'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-lettuce'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bun'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bleeder'], 'add')
						TriggerServerEvent('QBCore:Server:AddItem', 'burger-bleeder', 1)
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'consume', 0.2)
					end, function()
						LocalPlayer.state:set("inv_busy", false, true)
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

RegisterNetEvent('qb-burgershotjob:FinishMoneyshotBurger', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
		    QBCore.Functions.TriggerCallback('qb-burgershotjob:get:moneyshotingredient', function(HasItems)  
		    	if HasItems then
		    		Working = true
		    		LocalPlayer.state:set("inv_busy", true, true)
		    		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'wrapping', 0.14)
		    		QBCore.Functions.Progressbar('pickup_sla', 'Making Burgers..', 3500, false, true, {
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
		    			LocalPlayer.state:set("inv_busy", false, true)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-meat', 1)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-lettuce', 1)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cheese', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cheese', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'tomatoslice', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'tomatoslice', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cheese'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-meat'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-lettuce'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bun'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tomatoslice'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-moneyshot'], 'add')
		    			TriggerServerEvent('QBCore:Server:AddItem', 'burger-moneyshot', 1)
						QBCore.Functions.Notify('You made an Moneyshot Burger', 'success')
		    			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'consume', 0.2)
		    		end, function()
		    			LocalPlayer.state:set("inv_busy", false, true)
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

RegisterNetEvent('qb-burgershotjob:FinishHeartstopperBurger', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
		    QBCore.Functions.TriggerCallback('qb-burgershotjob:get:hearstopperingredient', function(HasItems)  
		    	if HasItems then
		    		Working = true
		    		LocalPlayer.state:set("inv_busy", true, true)
		    		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'wrapping', 0.14)
		    		QBCore.Functions.Progressbar('pickup_sla', 'Making Burgers..', 3500, false, true, {
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
		    			LocalPlayer.state:set("inv_busy", false, true)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-meat', 1)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-lettuce', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'tomatoslice', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'tomatoslice', 1)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cheese', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cheese', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cheese', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cheese', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cheese'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-meat'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-lettuce'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bun'], 'remove')
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tomatoslice'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-heartstopper'], 'add')
		    			TriggerServerEvent('QBCore:Server:AddItem', 'burger-heartstopper', 1)
						QBCore.Functions.Notify('You made an Heartstopper Burger', 'success')
		    			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'consume', 0.2)
		    		end, function()
		    			LocalPlayer.state:set("inv_busy", false, true)
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

RegisterNetEvent('qb-burgershotjob:FinishTorpedoBurger', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
		    QBCore.Functions.TriggerCallback('qb-burgershotjob:get:torpedoingredient', function(HasItems)  
		    	if HasItems then
		    		Working = true
		    		LocalPlayer.state:set("inv_busy", true, true)
		    		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'wrapping', 0.14)
		    		QBCore.Functions.Progressbar('pickup_sla', 'Making Burgers..', 3500, false, true, {
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
		    			LocalPlayer.state:set("inv_busy", false, true)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-meat', 1)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-lettuce', 1)
		    	--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
				--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bun', 1)
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-meat'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-lettuce'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bun'], 'remove')
		    			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-torpedo'], 'add')
		    			TriggerServerEvent('QBCore:Server:AddItem', 'burger-torpedo', 1)
						QBCore.Functions.Notify('You made an Torpedo Burger', 'success')
		    			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'consume', 0.2)
		    		end, function()
		    			LocalPlayer.state:set("inv_busy", false, true)
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

RegisterNetEvent('qb-burgershot:washHands', function()
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'watermachine', 0.6)
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "You've washed your hands!", 'success')
	end, function()
        LocalPlayer.state:set("inv_busy", false, true)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)

RegisterNetEvent('qb-burgershotjob:Soda', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershotjob:get:ingredient:syrup', function(HasSyrup)  
			    if HasSyrup then
					Working = true
			--		TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-syrup', 1)
			    	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-syrup'], 'remove')
					TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'soda', 0.6)
    				QBCore.Functions.Progressbar('pickup_sla', 'Pouring a Softdrink..', 8000, false, true, {
			    			disableMovement = true,
			    			disableCarMovement = false,
			    			disableMouse = false,
			    			disableCombat = false,
			    		}, {
			    			animDict = 'amb@prop_human_bbq@male@base',
			    			anim = 'base',
			    			flags = 8,
			    		}, {}, {}, function() -- Done
    					TriggerServerEvent('QBCore:Server:AddItem', 'burger-softdrink', 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-softdrink'], 'add')
    					QBCore.Functions.Notify('You made an Soda', 'success')
					end, function()
						StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
					end)
				else
					QBCore.Functions.Notify('You dont have enough softdrink syrup..', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:Milkshake', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershotjob:get:ingredient:cream', function(HasCream)  
			    if HasCream then
					Working = true
		--			TriggerServerEvent('QBCore:Server:RemoveItem', 'milk', 1)
			    	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['milk'], 'remove')
		--			TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-cream', 1)
			    	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cream'], 'remove')
    				QBCore.Functions.Progressbar('pickup_sla', 'Making a Milkshake..', 8000, false, true, {
			    		disableMovement = true,
			    		disableCarMovement = false,
			    		disableMouse = false,
			    		disableCombat = false,
			    	}, {
			    		animDict = 'amb@prop_human_bbq@male@base',
			    		anim = 'base',
			    		flags = 8,
			    	}, {}, {}, function() -- Done
    				TriggerServerEvent('QBCore:Server:AddItem', 'burger-milkshake', 1)
					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-milkshake'], 'add')
    				QBCore.Functions.Notify('You made an milkshake', 'success')
					Working = false
			    	end, function()
			    		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
			    	end)
				else
					QBCore.Functions.Notify('You dont have enough milk and cream..', 'error')
			    end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:BakeMeat', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershot:server:getingredient:Rawmeat', function(HasMeat)  
			    if HasMeat then
			    	Working = true
			--    	TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-raw', 1)
			    	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-raw'], 'remove')
			    	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'meat', 0.15)
			    	QBCore.Functions.Progressbar('pickup_sla', 'Baking meat..', 5000, false, true, {
			    		disableMovement = true,
			    		disableCarMovement = false,
			    		disableMouse = false,
			    		disableCombat = false,
			    	}, {
			    		animDict = 'amb@prop_human_bbq@male@base',
			    		anim = 'base',
			    		flags = 8,
			    	}, {
			    		model = 'prop_cs_fork',
			    	    bone = 28422,
			    	    coords = { x = -0.005, y = 0.00, z = 0.00 },
			    	    rotation = { x = 175.0, y = 160.0, z = 0.0 },
			    	}, {}, function() -- Done
			    		TriggerServerEvent('QBCore:Server:AddItem', 'burger-meat', 1)
			    		TriggerEvent('', QBCore.Shared.Items['burger-meat'], 'add')
						QBCore.Functions.Notify('You cooked meat', 'success')
			    		Working = false
			    	end, function()
			    		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
			    	end)
				else
			  		QBCore.Functions.Notify('You dont have enough raw meat..', 'error')
			 	end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)	
end)

RegisterNetEvent('qb-burgershotjob:PrepareFries', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershot:server:getingredient:potato', function(HasFries)  
		        if HasFries then
		        	Working = true
		    --        TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-potato', 1)
		            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-potato'], 'remove')
		        	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'deepfried', 0.15)
		        	QBCore.Functions.Progressbar('pickup_sla', 'Frying Fries', 4100, false, true, {
		        		disableMovement = true,
		        		disableCarMovement = false,
		        		disableMouse = false,
		        		disableCombat = false,
		        	}, {
		        		animDict = 'amb@prop_human_bbq@male@base',
		        		anim = 'base',
		        		flags = 8,
		        	}, {}, {}, function() -- Done
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-fries'], 'add')
						QBCore.Functions.Notify('You made Burgershot Fries', 'success')
		        		Working = false
		        	end, function()
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
		        	end)
		        else
		        	QBCore.Functions.Notify('You dont have enough potatoes to make Fries', 'error')
		        end 
		    end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:PrepareOnionRings', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershot:server:getingredient:OnionRings', function(HasSlicedOnion)  
		        if HasSlicedOnion then
		        	Working = true
		    --        TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-potato', 1)
		            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['slicedonion'], 'remove')
		        	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'deepfried', 0.15)
		        	QBCore.Functions.Progressbar('pickup_sla', 'Frying Onion Rings', 4100, false, true, {
		        		disableMovement = true,
		        		disableCarMovement = false,
		        		disableMouse = false,
		        		disableCombat = false,
		        	}, {
		        		animDict = 'amb@prop_human_bbq@male@base',
		        		anim = 'base',
		        		flags = 8,
		        	}, {}, {}, function() -- Done
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		TriggerServerEvent('QBCore:Server:AddItem', 'burger-onionrings', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-onionrings'], 'add')
						QBCore.Functions.Notify('You made Burgershot Onion Rings', 'success')
		        		Working = false
		        	end, function()
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
		        	end)
		        else
		        	QBCore.Functions.Notify('You dont have enough onions to make Onion Rings', 'error')
		        end 
		    end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:PrepareChickenNuggets', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershot:server:getingredient:ChickenNuggets', function(HasNuggets)  
		        if HasNuggets then
		        	Working = true
		    --        TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-potato', 1)
		            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['frozennugets'], 'remove')
		        	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'deepfried', 0.15)
		        	QBCore.Functions.Progressbar('pickup_sla', 'Frying Chicken Nuggets', 4100, false, true, {
		        		disableMovement = true,
		        		disableCarMovement = false,
		        		disableMouse = false,
		        		disableCombat = false,
		        	}, {
		        		animDict = 'amb@prop_human_bbq@male@base',
		        		anim = 'base',
		        		flags = 8,
		        	}, {}, {}, function() -- Done
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		TriggerServerEvent('QBCore:Server:AddItem', 'burger-chickennuggets', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-chickennuggets'], 'add')
						QBCore.Functions.Notify('You made Burgershot Onion Rings', 'success')
		        		Working = false
		        	end, function()
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
		        	end)
		        else
		        	QBCore.Functions.Notify('You dont have enough Frozen Nuggets to make Chicken Nuggets', 'error')
		        end 
		    end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:makeIcecream', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershot:server:getingredient:Icecreamcone', function(HasCone)  
		        if HasCone then
		        	Working = true
		  --          TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-icecreamcone', 1)
		            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-icecreamcone'], 'remove')
		        	QBCore.Functions.Progressbar('pickup_sla', 'Getting ice cream', 4100, false, true, {
		        		disableMovement = true,
		        		disableCarMovement = false,
		        		disableMouse = false,
		        		disableCombat = false,
		        	}, {
		        		animDict = 'amb@prop_human_bbq@male@base',
		        		anim = 'base',
		        		flags = 8,
		        	}, {}, {}, function() -- Done
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		TriggerServerEvent('QBCore:Server:AddItem', 'burger-icecream', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-icecream'], 'add')
						QBCore.Functions.Notify('You made an Ice Cream', 'success')
		        		Working = false
		        	end, function()
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
		        	end)
		        else
		        	QBCore.Functions.Notify('You do not have an Ice Cream cone', 'error')
		        end 
		    end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:makeTomato', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershot:server:getingredient:Tomato', function(HasTomato)  
		        if HasTomato then
		        	Working = true
	--	            TriggerServerEvent('QBCore:Server:RemoveItem', 'tomato', 1)
		            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tomato'], 'remove')
		        	QBCore.Functions.Progressbar('pickup_sla', 'Chopping tomatoes', 4100, false, true, {
		        		disableMovement = true,
		        		disableCarMovement = false,
		        		disableMouse = false,
		        		disableCombat = false,
		        	}, {
		        		animDict = 'amb@prop_human_bbq@male@base',
		        		anim = 'base',
		        		flags = 8,
		        	}, {}, {}, function() -- Done
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		TriggerServerEvent('QBCore:Server:AddItem', 'tomatoslice', 5)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['tomatoslice'], 'add')
						QBCore.Functions.Notify('You cut a tomato!', 'success')
		        		Working = false
		        	end, function()
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
		        	end)
		        else
		        	QBCore.Functions.Notify('You do not have a tomato on you!', 'error')
		        end 
		    end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:makeOnions', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
			QBCore.Functions.TriggerCallback('qb-burgershot:server:getingredient:Onion', function(HasOnions)  
		        if HasOnions then
		        	Working = true
	--	            TriggerServerEvent('QBCore:Server:RemoveItem', 'tomato', 1)
		            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['onions'], 'remove')
		        	QBCore.Functions.Progressbar('pickup_sla', 'Do not cry', 4100, false, true, {
		        		disableMovement = true,
		        		disableCarMovement = false,
		        		disableMouse = false,
		        		disableCombat = false,
		        	}, {
		        		animDict = 'amb@prop_human_bbq@male@base',
		        		anim = 'base',
		        		flags = 8,
		        	}, {}, {}, function() -- Done
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		TriggerServerEvent('QBCore:Server:AddItem', 'slicedonion', 2)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['slicedonion'], 'add')
						QBCore.Functions.Notify('You cut an onion!', 'success')
		        		Working = false
		        	end, function()
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
		        	end)
		        else
		        	QBCore.Functions.Notify('You do not have an onion on you!', 'error')
		        end 
		    end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:donuts', function(data)
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
		        	Working = true
		        	QBCore.Functions.Progressbar('pickup_sla', 'Getting a Donut', 4100, false, true, {
		        		disableMovement = true,
		        		disableCarMovement = false,
		        		disableMouse = false,
		        		disableCombat = false,
		        	}, {
		        		animDict = 'amb@prop_human_bbq@male@base',
		        		anim = 'base',
		        		flags = 8,
		        	}, {}, {}, function() -- Done
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
						if data.number == 1 then
		        		TriggerServerEvent('QBCore:Server:AddItem', 'burger-donut', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-donut'], 'add')
						elseif data.number == 2 then
						TriggerServerEvent('QBCore:Server:AddItem', 'burger-donutchoc', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-donutchoc'], 'add')
						elseif data.number == 3 then
						TriggerServerEvent('QBCore:Server:AddItem', 'burger-donutcherry', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-donutcherry'], 'add')
						elseif data.number == 4 then
						TriggerServerEvent('QBCore:Server:AddItem', 'burger-donutlemon', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-donutlemon'], 'add')
						elseif data.number == 5 then
						TriggerServerEvent('QBCore:Server:AddItem', 'burger-donutglaze', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-donutglaze'], 'add')
						end
						QBCore.Functions.Notify('You grabbed a delicious Donut', 'success')
		        		Working = false
		        	end, function()
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
		        	end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:creampie', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
		        	Working = true
		        	QBCore.Functions.Progressbar('pickup_sla', 'Getting a Slice of Cream Pie', 4100, false, true, {
		        		disableMovement = true,
		        		disableCarMovement = false,
		        		disableMouse = false,
		        		disableCombat = false,
		        	}, {
		        		animDict = 'amb@prop_human_bbq@male@base',
		        		anim = 'base',
		        		flags = 8,
		        	}, {}, {}, function() -- Done
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
						TriggerServerEvent('QBCore:Server:AddItem', 'burger-creampie', 1)
		        		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-creampie'], 'add')
						QBCore.Functions.Notify('You grabbed a delicious Slice of Cream Pie', 'success')
		        		Working = false
		        	end, function()
		        		StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@base', 'base', 1.0)
		        		QBCore.Functions.Notify('Cancelled..', 'error')
		        		Working = false
		        	end)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

--toy when open meal - no shake

RegisterNetEvent('qb-burgershot:HeartStopperMeal', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'heartstopper-meal', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-heartstopper', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-softdrink', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

RegisterNetEvent('qb-burgershot:MoneyShotMeal', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'moneyshot-meal', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-moneyshot', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-softdrink', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

RegisterNetEvent('qb-burgershot:BleederMeal', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'bleeder-meal', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-bleeder', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-softdrink', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

RegisterNetEvent('qb-burgershot:TorpedoMeal', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'torpedo-meal', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-torpedo', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-softdrink', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

RegisterNetEvent('qb-burgershot:MeatFreeMeal', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'meatfree-meal', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-meatfree', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-softdrink', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

-- toy when open meal - with shake

RegisterNetEvent('qb-burgershot:HeartStopperMealShake', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'heartstopper-meal-shake', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-heartstopper', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-milkshake', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

RegisterNetEvent('qb-burgershot:MoneyShotMealShake', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'moneyshot-meal-shake', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-moneyshot', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-milkshake', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

RegisterNetEvent('qb-burgershot:BleederMealShake', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'bleeder-meal-shake', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-bleeder', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-milkshake', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

RegisterNetEvent('qb-burgershot:TorpedoMealShake', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'torpedo-meal-shake', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-torpedo', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-milkshake', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

RegisterNetEvent('qb-burgershot:MeatFreeMealShake', function()
	local randomToy = math.random(1,100)
	--remove box
	TriggerServerEvent('QBCore:Server:RemoveItem', 'meatfree-meal-shake', 1)
	--add items from box
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-meatfree', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-fries', 1)
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-milkshake', 1)
	--chance for toys
	if randomToy < 20 then
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	elseif randomToy == 20 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy1', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy1'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 20 and randomToy > 40 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 40 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-toy2', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-toy2'], 'add')
		QBCore.Functions.Notify('Congratulations you got a burgershot toy', 'success')
	elseif randomToy < 40 and randomToy > 60 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 60 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-laptop', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-laptop'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 60 and randomToy > 80 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 80 then
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-usb', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-usb'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	elseif randomToy < 80 and randomToy > 100 then
		QBCore.Functions.Notify('You didn\'t get any rare toys', 'error')
	elseif randomToy == 100 then	
		TriggerServerEvent('QBCore:Server:AddItem', 'burger-cyborg', 1)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cyborg'], 'add')
		QBCore.Functions.Notify('Congratulations you got a Rare burgershot toy', 'success')
	else	
		QBCore.Functions.Notify('You didn\'t get any toys', 'error')
	end
end)

----------------------------------------------------

--creating meals no shake

RegisterNetEvent("qb-burgershot:CreateHeartStopperMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientHeartStopperMeal', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Heart-Stopper Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
	--			TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
      --          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-heartstopper", 1)
	--			TriggerServerEvent('QBCore:Server:RemoveItem', "burger-softdrink", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "heartstopper-meal", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heartstopper-meal"], "add", 1)
                QBCore.Functions.Notify('You made a A Heart-Stopper Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent("qb-burgershot:CreateMoneyShotMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMoneyShotMeal', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Money-Shot Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
        --        TriggerServerEvent('QBCore:Server:RemoveItem', "burger-moneyshot", 1)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-softdrink", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "moneyshot-meal", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["moneyshot-meal"], "add", 1)
                QBCore.Functions.Notify('You made a A Moneshot Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent("qb-burgershot:CreateBleederMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBleederMeal', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Bleeder Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
	--			TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
   --             TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bleeder", 1)
	--			TriggerServerEvent('QBCore:Server:RemoveItem', "burger-softdrink", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "bleeder-meal", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bleeder-meal"], "add", 1)
                QBCore.Functions.Notify('You made a A Bleeder Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent("qb-burgershot:CreateTorpedoMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientTorpedoMeal', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Torpedo Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
      --          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-torpedo", 1)
	--			TriggerServerEvent('QBCore:Server:RemoveItem', "burger-softdrink", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "torpedo-meal", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["torpedo-meal"], "add", 1)
                QBCore.Functions.Notify('You made a A Torpedo Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent("qb-burgershot:CreateMeatFreeMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMeatFreeMeal', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Meat-Free Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
        --        TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meatfree", 1)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-softdrink", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "meatfree-meal", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meatfree-meal"], "add", 1)
                QBCore.Functions.Notify('You made a A Meat-Free Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

--creating meals with shakes

RegisterNetEvent("qb-burgershot:CreateHeartStopperShakeMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientHeartStopperMealshake', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Heart-Stopper Shake Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
        --        TriggerServerEvent('QBCore:Server:RemoveItem', "burger-heartstopper", 1)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-milkshake", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "heartstopper-meal-shake", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heartstopper-meal-shake"], "add", 1)
                QBCore.Functions.Notify('You made a A Heart-Stopper Shake Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent("qb-burgershot:CreateMoneyShotShakeMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMoneyShotMealshake', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Money-Shot Shake Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
        --        TriggerServerEvent('QBCore:Server:RemoveItem', "burger-moneyshot", 1)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-milkshake", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "moneyshot-meal-shake", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["moneyshot-meal-shake"], "add", 1)
                QBCore.Functions.Notify('You made a A Moneshot Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent("qb-burgershot:CreateBleederShakeMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBleederMealshake', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Bleeder Shake Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
			--	TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
            --    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bleeder", 1)
			--	TriggerServerEvent('QBCore:Server:RemoveItem', "burger-milkshake", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "bleeder-meal-shake", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bleeder-meal-shake"], "add", 1)
                QBCore.Functions.Notify('You made a A Bleeder Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent("qb-burgershot:CreateTorpedoShakeMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientTorpedoMealshake', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Torpedo Shake Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
        --        TriggerServerEvent('QBCore:Server:RemoveItem', "burger-torpedo", 1)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-milkshake", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "torpedo-meal-shake", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["torpedo-meal-shake"], "add", 1)
                QBCore.Functions.Notify('You made a A Torpedo Meal', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent("qb-burgershot:CreateMeatFreeShakeMeal", function()
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMeatFreeMealshake', function(HasItems)  
    	if HasItems then
			Working = true
			LocalPlayer.state:set("inv_busy", true, true)
			QBCore.Functions.Progressbar("pickup_sla", "Making A Meat-Free Shake Meal..", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				Working = false
				LocalPlayer.state:set("inv_busy", false, true)
		--		TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
      --          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meatfree", 1)
	--			TriggerServerEvent('QBCore:Server:RemoveItem', "burger-milkshake", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "meatfree-meal-shake", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meatfree-meal-shake"], "add", 1)
                QBCore.Functions.Notify('You made a A Meat-Free Meal-shake', 'success')
			end, function()
				LocalPlayer.state:set("inv_busy", false, true)
				QBCore.Functions.Notify('Cancelled..', 'error')
				Working = false
			end)
		else
   			QBCore.Functions.Notify('You dont have the items to make this', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:Callwarehouse', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetAccount', function(balance)
    			if balance >= palletPrice then-- bossmoney check
					if not JobBusy then
						JobBusy = true
						TriggerEvent('qb-burgershotjob:CallWarehouseSuccess')
						TriggerServerEvent('qb-bossmenu:server:removeAccountMoney', 'burgershot', palletPrice)
					elseif not JobBusy then
						QBCore.Functions.Notify('You\'re already doing another task', 'error')
					end
				else
					QBCore.Functions.Notify('There is no money in the company account..', 'error')
				end
			end, PlayerJob.name)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:CallWarehouseSuccess', function()
	if Config.vinnyswarehouse then
		QBCore.Functions.Notify('Pick up the ingredients pallet at '..Config.vinnyswarehouseLocations[2].info, 'success')
		SetNewWaypoint(Config.vinnyswarehouseLocations[2].coords)
	else
		QBCore.Functions.Notify('Pick up the ingredients pallet at '..Config.vinnyswarehouseLocations[1].info, 'success')
		SetNewWaypoint(Config.vinnyswarehouseLocations[1].coords)
	end
	Calledwarehouse = true
end)

RegisterNetEvent('qb-burgershotjob:Warehousebuypallet', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty and not IsPedInAnyVehicle(PlayerPedId(), false) then
			if Calledwarehouse then
				TriggerServerEvent('QBCore:Server:AddItem', 'burger-pallet', 1)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-pallet'], 'add')
				QBCore.Functions.Notify('Deliver the ingredients pallet back to the '..Config.BurgershotLocation[1].info, 'success')
				BurgershotWaypoint()
				Gotpallet = true
				Calledwarehouse = false
			elseif not Calledwarehouse then
				QBCore.Functions.Notify('You didnt call the warehouse first..', 'error')
			end
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:Unloadbox', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			if Gotpallet then
				TriggerEvent('qb-burgershotjob:Delivery')
    		else
				QBCore.Functions.Notify('You\'re still doing something.', 'error')
			end
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:DutyB', function()
    TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNetEvent('qb-burgershotjob:Delivery', function()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			if JobBusy == true then
				TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-pallet', 1)
				TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-pallet'], 'remove')
				QBCore.Functions.Notify('Burgershot ingredients have been unpacked!', 'success')
                TriggerServerEvent('QBCore:Server:AddItem', 'burger-lettuce', 40)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-lettuce'], 'add')
                TriggerServerEvent('QBCore:Server:AddItem', 'burger-raw', 40)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-raw'], 'add')
                TriggerServerEvent('QBCore:Server:AddItem', 'burger-potato', 40)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-potato'], 'add')
                TriggerServerEvent('QBCore:Server:AddItem', 'burger-bun', 60)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bun'], 'add')
				TriggerServerEvent('QBCore:Server:AddItem', 'burger-cheese', 40)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cheese'], 'add')
		--		TriggerServerEvent('QBCore:Server:AddItem', 'burger-milk', 20)
		 --       TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-milk'], 'add')
				TriggerServerEvent('QBCore:Server:AddItem', 'burger-cream', 25)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-cream'], 'add')
				TriggerServerEvent('QBCore:Server:AddItem', 'burger-syrup', 25)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-syrup'], 'add')
				TriggerServerEvent('QBCore:Server:AddItem', 'burger-icecreamcone', 20)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-icecreamcone'], 'add')
				TriggerServerEvent('QBCore:Server:AddItem', 'frozennuggets', 25)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['frozennuggets'], 'add')
				TriggerServerEvent('QBCore:Server:AddItem', 'onions', 15)
		        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['onions'], 'add')
				JobBusy = false
				Calledwarehouse = false
				Gotpallet = false
			else
				QBCore.Functions.Notify('You\'re not coming straight from the warehouse, cant accept those!', 'error')
			end
		else
			QBCore.Functions.Notify('You don\'t even have a box of ingredients..', 'error')
		end
	end, 'burger-pallet')
end)

RegisterNetEvent('qb-burgershotjob:deliveryjob', function()
	rnd = math.random(1,#Config.DeliveryLocations)
	CreateBlip()
	QBCore.Functions.Notify('Deliver this bag to '..Config.DeliveryLocations[rnd].info, 'success')
	TriggerServerEvent('QBCore:Server:AddItem', 'burger-bag', 1)
	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bag'], 'add')
	if Tasks then
		return
	end
	Tasks = true
	while Tasks do
		Wait(1)
		local pos = GetEntityCoords(PlayerPedId())
		local GetDist = #(pos - Config.DeliveryLocations[rnd].coords)
		if GetDist <= 5.0 then
			DrawText3D(Config.DeliveryLocations[rnd].coords.x+0.1, Config.DeliveryLocations[rnd].coords.y+0.1, Config.DeliveryLocations[rnd].coords.z+0.1, '~g~E~s~ - Deliver') 
			DrawMarker(2, Config.DeliveryLocations[rnd].coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 155, false, false, false, true, false, false, false)
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

RegisterNetEvent('qb-burgershotjob:startjob', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			if JobBusy == false and not IsPedInAnyVehicle(PlayerPedId(), false) then
				JobBusy = true
				deliverynumber = deliverynumber + 1
				TriggerServerEvent('qb-burgershotjob:start:deliveryjob')
			elseif JobBusy == true then
				QBCore.Functions.Notify('You\'re already doing another task', 'error')
				Wait(2000)
			end
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotjob:garage', function(bs)
    local vehicle = bs.vehicle
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == 'burgershot' then
            if vehicle == 'stalion2' then
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, 'BURGER'..tostring(math.random(1000, 9999)))
                    exports[Config.Fuel]:SetFuel(veh, 100.0)
                    SetEntityHeading(vehicle, 34.65)
                    TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
                    SetVehicleEngineOn(veh, true, true)
				end, Config.Burgershotcarspawn["Burgershot1"].coords, true)
            end
        else 
            QBCore.Functions.Notify('You are not an employee of BurgerShot.', 'error')
        end
    end)    
end)

RegisterNetEvent('qb-burgershotjob:storecar', function()
    local Player = QBCore.Functions.GetPlayerData()
    QBCore.Functions.Notify('Work Vehicle Stored!', 'primary')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)


--Menus--
RegisterNetEvent('qb-burgershotmenu:burgershotmainmanu', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
    		exports['qb-menu']:openMenu({
				{
    		        header = "• Burgershot Menu",
    		        isMenuHeader = true,
    		    },
    		    {
    		        header = "『Available Burgers』",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotmenu:burgermenu",
    		            args = {
    		                number = 1,
    		                id = 2
    		            }
    		        }
    		    },
				{
    		        header = "『Available Meals with Drinks』",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotmenu:mealmenu",
    		            args = {
    		                number = 2,
    		                id = 3
    		            }
    		        }
    		    },
				{
    		        header = "『Available Meals with Shakes』",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotmenu:shakemealmenu",
    		            args = {
    		                number = 2,
    		                id = 3
    		            }
    		        }
    		    },
    		})
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotmenu:burgermenu', function(data)
    local id = data.id
    local number = data.number
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			exports['qb-menu']:openMenu({
		        {
		            header = "『Available Burgers』",
		            isMenuHeader = true,
		        },
		        {
		            header = "• Moneyshot Burger <img src=https://i.imgur.com/h3e6efA.png width=25px>",
		            txt = "2x buns, patty, lettuce, 2x slices of tomato & a slice of cheese",
		            params = {
		                event = "qb-burgershotjob:FinishMoneyshotBurger"
		            }
		        },
		        {
		            header = "• Bleeder Burger <img src=https://i.imgur.com/RT4cfK6.png width=25px>",
		            txt = "2x buns, patty, lettuce & cheese",
		            params = {
		                event = "qb-burgershotjob:FinishBleederBurger"
		            }
		        },
		        {
		            header = "• The HeartStopper <img src=https://i.imgur.com/gePsUFk.png width=25px>",
		            txt = "2x buns, 2x patties, lettuce, 2x Slices of Tomato & 2x Slices of Cheese",
		            params = {
		                event = "qb-burgershotjob:FinishHeartstopperBurger"
		            }
		        },
		        {
		            header = "• Torpedo Burger <img src=https://i.imgur.com/YiAc3xu.png width=25px>",
		            txt = "2x buns, patty & lettuce ",
		            params = {
		                event = "qb-burgershotjob:FinishTorpedoBurger"
		            }
		        },
				{
		            header = "• Meat Free Burger <img src=https://i.imgur.com/NqvgQKW.png width=25px>",
		            txt = "2x buns, a slice of tomato, lettuce & cheese",
		            params = {
		                event = "qb-burgershotjob:FinishMeatFreeBurger"
		            }
		        },
				{
		            header = "『⬅』Go Back",
		            txt = "",
		            params = {
		                event = "qb-burgershotmenu:burgershotmainmanu"
		            }
		        },
		    })
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)


RegisterNetEvent('qb-burgershotmenu:mealmenu', function(data)
    local id = data.id
    local number = data.number
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			exports['qb-menu']:openMenu({
				{
					header = "『Available Meals with Drinks』",
					isMenuHeader = true,
				},
				{
					header = "• Heart-Stopper Meal <img src=https://i.imgur.com/gePsUFk.png width=25px> <img src=https://i.imgur.com/oxhXI0B.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Heart-Stopper Burger, Fries and a Soft Drink",
					params = {
						event = "qb-burgershot:CreateHeartStopperMeal"
					}
				},
				{
					header = "• Bleeder Meal <img src=https://i.imgur.com/RT4cfK6.png width=25px> <img src=https://i.imgur.com/oxhXI0B.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Bleeder Burger, Fries and a Soft Drink",
					params = {
						event = "qb-burgershot:CreateBleederMeal"
					}
				},
				{
					header = "• Money-Shot Meal <img src=https://i.imgur.com/h3e6efA.png width=25px> <img src=https://i.imgur.com/oxhXI0B.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Money-Shot Burger, Fries and a Soft Drink",
					params = {
						event = "qb-burgershot:CreateMoneyShotMeal"
					}
				},
				{
					header = "• Torpedo Meal <img src=https://i.imgur.com/YiAc3xu.png width=25px> <img src=https://i.imgur.com/oxhXI0B.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Torpedo, Fries and a Soft Drink",
					params = {
						event = "qb-burgershot:CreateTorpedoMeal"
					}
				},
				{
					header = "• Meat Free Meal <img src=https://i.imgur.com/NqvgQKW.png width=25px> <img src=https://i.imgur.com/oxhXI0B.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Meat Free Burger, Fries and a Soft Drink",
					params = {
						event = "qb-burgershot:CreateMeatFreeMeal"
					}
				},
				{
    		        header = "『⬅』Go Back』",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotmenu:burgershotmainmanu"
    		        }
    		    },
    		})
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotmenu:shakemealmenu', function(data)
    local id = data.id
    local number = data.number
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			exports['qb-menu']:openMenu({
				{
					id = 0,
					header = "『Available Meals with Shakes』",
					txt = "",
				},
				{
					id = 1,
					header = "• Heart-Stopper Milkshake Meal <img src=https://i.imgur.com/gePsUFk.png width=25px> <img src=https://i.imgur.com/h8MekhJ.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Heart-Stopper Burger, Fries and Milkshake",
					params = {
						event = "qb-burgershot:CreateHeartStopperShakeMeal"
					}
				},
				{
					id = 2,
					header = "• Bleeder Milkshake Meal <img src=https://i.imgur.com/RT4cfK6.png width=25px> <img src=https://i.imgur.com/h8MekhJ.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Bleeder Burger, Fries and Milkshake",
					params = {
						event = "qb-burgershot:CreateBleederShakeMeal"
					}
				},
				{
					id = 3,
					header = "• Money-Shot Milkshake Meal <img src=https://i.imgur.com/h3e6efA.png width=25px> <img src=https://i.imgur.com/h8MekhJ.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Money-Shot Burger, Fries and Milkshake",
					params = {
						event = "qb-burgershot:CreateMoneyShotShakeMeal"
					}
				},
				{
					id = 4,
					header = "• Torpedo Milkshake Meal <img src=https://i.imgur.com/YiAc3xu.png width=25px> <img src=https://i.imgur.com/h8MekhJ.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Torpedo, Fries and Milkshake",
					params = {
						event = "qb-burgershot:CreateTorpedoShakeMeal"
					}
				},
				{
					id = 5,
					header = "• Meat Free Milkshake Meal <img src=https://i.imgur.com/NqvgQKW.png width=25px> <img src=https://i.imgur.com/h8MekhJ.png width=25px> <img src=https://i.imgur.com/kIQhlNs.png width=25px>",
					txt = "The Meat Free Burger, Fries and Milkshake",
					params = {
						event = "qb-burgershot:CreateMeatFreeShakeMeal"
					}
				},
				{
    		        id = 6,
    		        header = "『⬅』Go Back』",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotmenu:burgershotmainmanu"
    		        }
    		    },
				{
    		        id = 7,
    		        header = "『Close』",
    		        txt = "",
					params = {
    		            event = "qb-burgershotmenu:closedcontextmenu"
    		        }
    		    },
    		})
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotmenu:DrinkMenu', function(data)
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
    		exports['qb-menu']:openMenu({
    		    {
    		        id = 0,
    		        header = "『Drink Menu』",
    		        txt = "",
    		    },
    		    {
    		        id = 1,
    		        header = "• Soft Drink <img src=https://i.imgur.com/oxhXI0B.png width=25px>",
    		        txt = "Ingredients : High Fructose Syrup",
    		        params = {
    		            event = "qb-burgershotjob:Soda"
    		        }
    		    },
    		    {
    		        id = 2,
    		        header = "• Milkshake <img src=https://i.imgur.com/h8MekhJ.png width=25px>",
    		        txt = "Ingredients : Fresh Milk & Ice Cream Mixture ",
    		        params = {
    		            event = "qb-burgershotjob:Milkshake"
    		        }
    		    },
				{
    		        id = 3,
    		        header = "『Close』",
    		        txt = "",
					params = {
    		            event = "qb-burgershotmenu:closedcontextmenu"
    		        }
    		    },
    		})
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('qb-burgershotmenu:menu', function()
    exports['qb-menu']:openMenu({
        {
            header = '『BurgerShot Garage』',
            isMenuHeader = true,
        },
        {
            header = '• Stallion',
            txt = 'Declasse Burger Shot Stallion',
            params = {
                event = 'qb-burgershotjob:garage',
                args = {
                    vehicle = 'stalion2',
                }
            }
        },
        {
            header = '• Store Vehicle',
            txt = 'Store Vehicle Inside Garage',
            params = {
                event = 'qb-burgershotjob:storecar',
                args = {
                    
                }
            }
        },		
    })
end)

RegisterNetEvent('qb-burgershotmenu:donutmainmanu', function(data)
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
    		exports['qb-menu']:openMenu({
				{
    		        header = "• Donuts Menu",
    		        isMenuHeader = true,
    		    },
    		    {
    		        header = "『Strawberry with Sprinkles』<img src=https://i.imgur.com/cmpKLff.png width=25px>",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotjob:donuts",
    		            args = {
    		                number = 1,
    		                id = 1
    		            }
    		        }
    		    },
				{
    		        header = "『Chocolate Glaze』<img src=https://i.imgur.com/Icyw7Bs.png width=25px>",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotjob:donuts",
    		            args = {
    		                number = 2,
    		                id = 2
    		            }
    		        }
    		    },
				{
    		        header = "『Cherry Glaze』<img src=https://i.imgur.com/AjpIPjj.png width=25px>",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotjob:donuts",
    		            args = {
    		                number = 3,
    		                id = 3
    		            }
    		        }
    		    },
				{
    		        header = "『Lemon Glaze』<img src=https://i.imgur.com/ug68rlX.png width=25px>",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotjob:donuts",
    		            args = {
    		                number = 4,
    		                id = 4
    		            }
    		        }
    		    },
				{
    		        header = "『Glazed Donut』<img src=https://i.imgur.com/AITFC3c.png width=25px>",
    		        txt = "",
    		        params = {
    		            event = "qb-burgershotjob:donuts",
    		            args = {
    		                number = 5,
    		                id = 5
    		            }
    		        }
    		    },
			}
    		)
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

-- QB INPUT --

RegisterNetEvent('qb-burgershotjob:bill', function()
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
    TriggerServerEvent('qb-burgershotjob:bill:player', bill)
end)

--Threads--
if not Config.vinnyswarehouse then
	CreateThread(function()
	    BurgerShotwarehouse = AddBlipForCoord(Config.vinnyswarehouseLocations[1].coords)
	    SetBlipSprite (BurgerShotwarehouse, 106)
	    SetBlipDisplay(BurgerShotwarehouse, 4)
	    SetBlipScale  (BurgerShotwarehouse, 0.5)
	    SetBlipAsShortRange(BurgerShotwarehouse, true)
	    SetBlipColour(BurgerShotwarehouse, 75)
	    BeginTextCommandSetBlipName('STRING')
	    AddTextComponentSubstringPlayerName('uWu Cafe Warehouse')
	    EndTextCommandSetBlipName(BurgerShotwarehouse)
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

CreateThread(function()
	while true do
		Wait(500)
		for k,v in pairs(Config.BurgerPedlocation) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - v.coords.xyz)
			if distance < Config.DistanceSpawn and not burgershotPeds[k] then
				local spawnedPed = NearburgerPed(v.model, v.coords, v.gender, v.animDict, v.animName, v.scenario)
				burgershotPeds[k] = { spawnedPed = spawnedPed }
			end
			if distance >= Config.DistanceSpawn and burgershotPeds[k] then
				if Config.FadeIn then
					for i = 255, 0, -51 do
						Wait(50)
						SetEntityAlpha(burgershotPeds[k].spawnedPed, i, false)
					end
				end
				DeletePed(burgershotPeds[k].spawnedPed)
				burgershotPeds[k] = nil
			end
		end
	end
end)

function NearburgerPed(model, coords, gender, animDict, animName, scenario)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(50)
	end
	if Config.MinusOne then
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	else
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z, coords.w, false, true)
	end
	SetEntityAlpha(spawnedPed, 0, false)
	if Config.Frozen then
		FreezeEntityPosition(spawnedPed, true)
	end
	if Config.Invincible then
		SetEntityInvincible(spawnedPed, true)
	end
	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(spawnedPed, true)
	end
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Wait(50)
		end
		TaskPlayAnim(spawnedPed, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
    if scenario then
        TaskStartScenarioInPlace(spawnedPed, scenario, 0, true)
    end
	if Config.FadeIn then
		for i = 0, 255, 51 do
			Wait(50)
			SetEntityAlpha(spawnedPed, i, false)
		end
	end
	return spawnedPed
end

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
		blip = AddBlipForCoord(Config.DeliveryLocations[rnd].coords)
	end
	SetNewWaypoint(Config.DeliveryLocations[rnd].coords)
	SetBlipSprite(blip, 501)
	SetBlipScale(blip, 0.9)
	SetBlipColour(blip, 48) 
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Delivery Location')
    EndTextCommandSetBlipName(blip)
end

function BurgershotWaypoint()
	SetNewWaypoint(Config.BurgershotLocation[1].coords)
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
			TriggerServerEvent('QBCore:Server:RemoveItem', 'burger-bag', 1)
			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-bag'], 'remove')
			TriggerServerEvent('qb-burgershotjob:reward:ticket', true)
			Wait(800)
			TriggerServerEvent('QBCore:Server:AddItem', 'burger-ticket', 1)
			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['burger-ticket'], 'add')
			Wait(800)
			if deliverynumber == Config.deliveryamount then 
				TriggerEvent('qb-burgershotjob:startjob')
			elseif deliverynumber == Config.deliveryamount then
				deliverynumber = 0
			end
		else
			QBCore.Functions.Notify('You didnt even take the order with you..', 'error')
		end 
 	end, 'burger-bag')
end

-- Register Stuff
RegisterNetEvent('qb-burgershotjob:payout', function()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			TriggerServerEvent('qb-burgershot:payment:money', true)
		else
			QBCore.Functions.Notify('You dont have any delivery tickets on you..', 'error')
		end 
 	end, 'burger-ticket')
end)

RegisterNetEvent('qb-burgershot:registermenu', function()
    local bsregistermenu = {
        {
            header = '『Burgershot Register』',
            isMenuHeader = true,
        },
        {
            header = '• Charge Customer <img src=https://i.imgur.com/K7kyu2V.png width=25px>',
            txt = 'Charge Customer for their food!',
            params = {
                event = 'qb-burgershot:bill',
                args = {
                    
                }
            }
        },
        {
            header = '• Ticket Payout <img src=https://i.imgur.com/etWzE95.png width=25px>',
            txt = 'Turn in your delivery tickets',
            params = {
                event = 'qb-burgershotjob:payout',
                args = {
                    
                }
            }
        },
		{
            header = '• Warehouse <img src=https://i.imgur.com/RZH012f.png width=25px>',
            txt = 'Call to buy Burgershot ingredients',
            params = {
                event = 'qb-burgershotjob:Callwarehouse',
                args = {
                    
                }
            }
        },		
    }
	exports['qb-menu']:openMenu(bsregistermenu)
end)

RegisterNetEvent('qb-burgershot:bill', function()
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
    TriggerServerEvent('qb-burgershot:bill:player', bill)
end)

RegisterNetEvent("qb-burgershotjob:client:UseBurgerBox", function()
    TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    print('Box is Opening')
    QBCore.Functions.Notify("Box is being opened...", "error")
    QBCore.Functions.Progressbar("use_box", "Box is being opened", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local RLBagData = {
            outfitData = {
                ["bag"]   = { item = 41, texture = 0},  -- Nek / Das
            }
        }
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerbox_"..QBCore.Functions.GetPlayerData().citizenid, {maxweight = 10000, slots = 8})
        TriggerEvent("inventory:client:SetCurrentStash", "burgerbox_"..QBCore.Functions.GetPlayerData().citizenid)
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'Stash', 1)
        TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
        QBCore.Functions.Notify("Box has been opened successfully", "success")
    end)
end)
