local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

local onDuty = false

local function installCheck()
	local items = { "cheesecake", "rhinohorn", "oystershell", "watermelon", "bigfruit", "highnoon", "speedball", "gunkaccino", "bratte", "flusher", "chocolate",
					"ecocoffee", "caffeagra", "beancoffee", "beandonut", "sugar", "water_bottle", "orange", "chickenbreast", "plastic", "ecola", "ecolalight", "sprunk", "sprunklight" }
	for k, v in pairs(items) do if QBCore.Shared.Items[v] == nil then print("Missing Item from QBCore.Shared.Items: '"..v.."'") end end
	if QBCore.Shared.Jobs["beanmachine"] == nil then print("Error: Job role not found - 'beanmachine'") end
	if Config.Debug then print((#Config.GabzChairs + #Config.UncleChairs).." Total seating locations") end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
		installCheck()
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then if PlayerData.job.name == "beanmachine" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate') AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end) 
RegisterNetEvent('QBCore:Client:SetDuty') AddEventHandler('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource)
	installCheck()
    if GetCurrentResourceName() == resource then
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			if PlayerData.job.name == "beanmachine" then onDuty = PlayerJob.onduty end 
		end)
    end
end)

local function jobCheck()
	canDo = true
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') canDo = false end
	return canDo
end

CreateThread(function()
	local bossroles = {}
	for k, v in pairs(QBCore.Shared.Jobs["beanmachine"].grades) do
		if QBCore.Shared.Jobs["beanmachine"].grades[k].isboss == true then
			if bossroles["beanmachine"] ~= nil then
				if bossroles["beanmachine"] > tonumber(k) then bossroles["beanmachine"] = tonumber(k) end
			else bossroles["beanmachine"] = tonumber(k)	end
		end
	end
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			JobLocation = PolyZone:Create(Config.Locations[k].zones, { name = Config.Locations[k].label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "beanmachine" then TriggerServerEvent("QBCore:ToggleDuty") end end)	
		end
	end
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			blip = AddBlipForCoord(Config.Locations[k].blip)	
			SetBlipAsShortRange(blip, true)
			SetBlipSprite(blip, 536)
			SetBlipColour(blip, Config.Locations[k].blipcolor)
			SetBlipScale(blip, 0.7)
			SetBlipDisplay(blip, 6)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString("Bean Machine")
			EndTextCommandSetBlipName(blip)
		end
	end
	
	if Config.Gabz then
		exports['qb-target']:AddBoxZone("BeanWash", vector3(123.73, -1039.24, 29.28), 1.2, 0.6, { name="BeanWash", heading = 340.0, debugPoly=Config.Debug, minZ=28.88, maxZ=29.68 }, 
			{ options = { { event = "qb-beanmachine:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", job = "beanmachine" }, }, distance = 1.5 })

		exports['qb-target']:AddBoxZone("BeanCounter", vector3(120.54, -1040.74, 29.28), 0.6, 0.4, { name="BeanCounter", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 }, 
			{ options = { { event = "qb-beanmachine:Stash", icon = "fas fa-mug-saucer", label = "Open Counter", stash = "Counter" }, }, distance = 2.0 })
		exports['qb-target']:AddBoxZone("BeanCounter2", vector3(121.85, -1037.08, 29.28), 0.6, 0.4, { name="BeanCounter2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 }, 
			{ options = { { event = "qb-beanmachine:Stash", icon = "fas fa-mug-saucer", label = "Open Counter", stash = "Counter2" }, }, distance = 2.0 })
			
		exports['qb-target']:AddBoxZone("BeanReceipt", vector3(120.73, -1040.09, 29.28), 0.6, 0.6, { name="BeanReceipt", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
			{ options = { { event = "qb-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "beanmachine", 
			img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
			} }, distance = 2.0 })
		exports['qb-target']:AddBoxZone("BeanReceipt2",vector3(122.0, -1036.51, 29.28), 0.6, 0.6, { name="BeanReceipt2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 }, 
			{ options = { { event = "qb-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "beanmachine", 
			img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
			} }, distance = 2.0 })

		exports['qb-target']:AddBoxZone("BeanFridge", vector3(124.51, -1037.97, 29.28), 0.85, 0.6, { name="BeanFridge", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=30.08 }, 
			{ options = { {  event = "qb-beanmachine:Shop", icon = "fas fa-archive", label = "Open Storage", job = "beanmachine" }, }, distance = 1.5 })
		exports['qb-target']:AddBoxZone("BeanFridge2", vector3(123.5, -1040.74, 29.28), 0.9, 0.6, { name="BeanFridge2", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=30.08 },  
			{ options = { {  event = "qb-beanmachine:Shop", icon = "fas fa-archive", label = "Open Storage", job = "beanmachine" }, }, distance = 1.5 })

		exports['qb-target']:AddBoxZone("BeanDrink", vector3(124.56, -1036.88, 29.28), 0.7, 0.4, { name="BeanDrink", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 }, 
			{ options = { { event = "qb-beanmachine:Menu:Drinks", icon = "fas fa-mug-hot", label = "Prepare Coffee", job = "beanmachine" }, }, distance = 2.0 })
		exports['qb-target']:AddBoxZone("BeanDrink2", vector3(122.93, -1041.68, 29.28), 0.7, 0.6, { name="BeanDrink2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 }, 
			{ options = { { event = "qb-beanmachine:Menu:Drinks", icon = "fas fa-mug-hot", label = "Prepare Coffee", job = "beanmachine" }, }, distance = 2.0 })

		exports['qb-target']:AddBoxZone("BeanSlush", vector3(126.07, -1036.59, 29.28), 0.6, 0.6, { name="BeanSlush", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=30.08 }, 
			{ options = { { event = "qb-beanmachine:Menu:Slush", icon = "fas fa-cocktail", label = "Prepare Slush", job = "beanmachine" }, }, distance = 2.0 })

		exports['qb-target']:AddBoxZone("BeanSoda", vector3(123.56, -1042.75, 29.28), 0.6, 1.4, { name="BeanSoda", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 }, 
			{ options = { { event = "qb-beanmachine:Menu:Soda", icon = "fas fa-cocktail", label = "Grab Soda", job = "beanmachine" }, }, distance = 2.0 })

		exports['qb-target']:AddBoxZone("BeanDonut", vector3(121.4, -1038.43, 29.28), 1.45, 0.6, { name="BeanDonut", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=29.88 }, 
			{ options = { { event = "qb-beanmachine:Menu:Donut", icon = "fas fa-circle-dot", label = "Grab Food", job = "beanmachine" }, }, distance = 2.0 })

		--Calculations on which role is the boss role (picks the lowest boss grade and makes it automatically usable for all bosses)
		exports['qb-target']:AddBoxZone("BeanClockin", vector3(126.94, -1035.84, 29.28), 1.2, 0.2, { name="BeanClockin", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=31.28 }, 
			{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "beanmachine" },
						  --{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-clipboard-check", label = "Open Bossmenu", job = bossroles, }, 
						}, distance = 2.0 })
	end
	if Config.UncleJust then
		if till == nil or tray == nil then
			CreateModelHide(vector3(-634.28, 235.29, 83.12), 1.5, 270388964, true)
			CreateModelHide(vector3(-634.28, 235.29, 83.12), 1.5, 974883178, true)
			CreateModelHide(vector3(-634.28, 235.29, 83.12), 1.5, -85890288, true)
			CreateModelHide(vector3(-635.73, 235.3, 81.88), 1.5, -1281587804, true)
			CreateModelHide(vector3(-633.47, 233.44, 81.88+1.0), 1.5, 1503218008, true)
			
			RequestModel(GetHashKey("prop_till_03"))
			while not HasModelLoaded(GetHashKey("prop_till_03")) do Citizen.Wait(1) end
			till = CreateObject(GetHashKey("prop_till_03"),-634.38, 235.29, 83.12-1.03,false,false,false)
			SetEntityHeading(till,285.0)
			FreezeEntityPosition(till, true)

			RequestModel(GetHashKey("prop_food_tray_01"))
			while not HasModelLoaded(GetHashKey("prop_food_tray_01")) do Citizen.Wait(1) end
			tray = CreateObject(GetHashKey("prop_food_tray_01"),-634.28, 234.69, 83.12-1.03,false,false,false)
			SetEntityHeading(tray,95.0)
			FreezeEntityPosition(tray, true)
		end                                        
		exports['qb-target']:AddBoxZone("UBeanCounter", vector3(-634.27, 234.69, 81.88), 0.55, 0.4, { name="UBeanCounter", heading = 5.0, debugPoly=Config.Debug, minZ=81.93, maxZ=82.48 }, 
			{ options = { { event = "qb-beanmachine:Stash", icon = "fas fa-mug-saucer", label = "Open Counter", stash = "UCounter" }, }, distance = 2.0 })
		
		exports['qb-target']:AddBoxZone("UBeanReceipt", vector3(-634.38, 235.3, 81.88), 0.4, 0.5, { name="UBeanReceipt", heading = 15.0, debugPoly=Config.Debug, minZ=82.08, maxZ=82.68 }, 
		{ options = { { event = "qb-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "beanmachine", 
		img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
		} }, distance = 2.0 })

		exports['qb-target']:AddBoxZone("UBeanDrink", vector3(-635.7, 236.55, 81.88), 0.6, 1.0, { name="UBeanDrink", heading = 1.0, debugPoly=Config.Debug, minZ=81.88, maxZ=82.68 }, 
			{ options = { { event = "qb-beanmachine:Menu:Drinks", icon = "fas fa-mug-hot", label = "Prepare Coffee", job = "beanmachine" }, }, distance = 2.0 })
		exports['qb-target']:AddBoxZone("UBeanDrink2", vector3(-627.68, 222.8, 81.88), 0.6, 0.8, { name="UBeanDrink2", heading = 0.0, debugPoly=Config.Debug, minZ=81.88, maxZ=82.68 }, 
			{ options = { { event = "qb-beanmachine:Menu:Drinks", icon = "fas fa-mug-hot", label = "Prepare Coffee", job = "beanmachine" }, }, distance = 2.0 })

		exports['qb-target']:AddBoxZone("UBeanFridge", vector3(-635.51, 233.23, 81.88), 0.4, 1.6, { name="UBeanFridge", heading = 339.0, debugPoly=Config.Debug, minZ=80.88, maxZ=83.08 },  
			{ options = { {  event = "qb-beanmachine:Shop", icon = "fas fa-archive", label = "Open Storage", job = "beanmachine" }, }, distance = 1.5 })

		exports['qb-target']:AddBoxZone("UBeanSlush", vector3(-636.74, 234.86, 81.88), 2.6, 0.4, { name="UBeanSlush", heading = 1.0, debugPoly=Config.Debug, minZ=80.88, maxZ=82.08 }, 
			{ options = { { event = "qb-beanmachine:Menu:Slush", icon = "fas fa-cocktail", label = "Prepare Slush", job = "beanmachine" },
						  { event = "qb-beanmachine:Menu:Soda", icon = "fas fa-cocktail", label = "Grab Soda", job = "beanmachine" }, }, distance = 2.0 })
					  
		exports['qb-target']:AddBoxZone("UBeanDonut", vector3(-636.62, 234.98, 81.88), 0.6, 0.6, { name="UBeanDonut", heading = 1.0, debugPoly=Config.Debug, minZ=82.28, maxZ=82.68 }, 
		{ options = { { event = "qb-beanmachine:Menu:Donut", icon = "fas fa-circle-dot", label = "Grab Food", job = "beanmachine" }, }, distance = 2.0 })
		
		exports['qb-target']:AddBoxZone("UBeanWash", vector3(-621.67, 226.77, 81.88), 1.6, 0.6, { name="BeanWash", heading = 0.0, debugPoly=Config.Debug, minZ=80.88, maxZ=82.68 }, 
			{ options = { { event = "qb-beanmachine:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", job = "beanmachine" }, }, distance = 1.5 })
		exports['qb-target']:AddBoxZone("UBeanWash2", vector3(-630.71, 222.83, 81.88), 0.7, 1.4, { name="UBeanWash2", heading = 0.0, debugPoly=Config.Debug, minZ=80.88, maxZ=82.68 }, 
			{ options = { { event = "qb-beanmachine:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", job = "beanmachine" }, }, distance = 1.5 })

		exports['qb-target']:AddBoxZone("UBeanClockin", vector3(-635.89, 227.12, 81.88), 1.6, 0.2, { name="UBeanClockin", heading = 0.0, debugPoly=Config.Debug, minZ=81.68, maxZ=82.93 }, 
		{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "beanmachine" },
					  --{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-clipboard-check", label = "Open Bossmenu", job = bossroles, }, 
					}, distance = 2.0 })
	end

end)

RegisterNetEvent('qb-beanmachine:washHands', function()
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "You've washed your hands!", 'success')
	end, function()
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)

RegisterNetEvent('qb-beanmachine:MakeItem', function(data)
	if data.craftable then
		for k, v in pairs(data.craftable[data.tablenumber]) do
			QBCore.Functions.TriggerCallback('qb-beanmachine:get', function(amount)
				if not amount then TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') else TriggerEvent("qb-beanmachine:FoodProgress", data.item, data.tablenumber, data.craftable) end		
			end, data.item, data.tablenumber, data.craftable)
		end
	end
end)

RegisterNetEvent('qb-beanmachine:JustGive', function(data) if not jobCheck() then return else TriggerEvent("qb-beanmachine:FoodProgress", data.id, nil, nil)  end end)

RegisterNetEvent('qb-beanmachine:Stash', function(data) TriggerServerEvent("inventory:server:OpenInventory", "stash", "beanmachine_"..data.stash) TriggerEvent("inventory:client:SetCurrentStash", "beanmachine_"..data.stash) end)

RegisterNetEvent('qb-beanmachine:Shop', function(data)	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else TriggerServerEvent("inventory:server:OpenInventory", "shop", "beanmachine", Config.FoodItems)	end end)

RegisterNetEvent('qb-beanmachine:FoodProgress', function(ItemMake, tablenumber, craftable)
	if craftable then
		for k, v in pairs(craftable[tablenumber]) do
			if ItemMake == k then
				bartext = "Making "
				bartime = 5000
				animDictNow = "mp_ped_interaction"
				animNow = "handshake_guy_a"
			end
		end
	elseif craftable == nil then	
		bartext = "Grabbing "
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	end
	QBCore.Functions.Progressbar('making_food', bartext..QBCore.Shared.Items[ItemMake].label, bartime, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, }, 
	{ animDict = animDictNow, anim = animNow, flags = 16, }, {}, {}, function()  
		TriggerServerEvent('qb-beanmachine:GetFood', ItemMake, tablenumber, craftable)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function()
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
	end)
end)

RegisterNetEvent('qb-beanmachine:Menu:Drinks', function()
	if not jobCheck() then return end
	local DrinksMenu = {}
	DrinksMenu[#DrinksMenu + 1] = { header = "Drinks Menu", txt = "", isMenuHeader = true }
		for i = 1, #Crafting.Drinks do
			for k, v in pairs(Crafting.Drinks[i]) do
				if k ~= "img" then
					local text = ""
					local setheader = QBCore.Shared.Items[k].label
					if Crafting.Drinks[i]["img"] ~= nil then setheader = Crafting.Drinks[i]["img"]..setheader end
					for l, b in pairs(Crafting.Drinks[i][tostring(k)]) do
						if b == 1 then number = "" else number = " x"..b end
						text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
						settext = text
					end
					DrinksMenu[#DrinksMenu + 1] = { header = setheader, txt = settext, params = { event = "qb-beanmachine:MakeItem", args = { item = k, tablenumber = i, craftable = Crafting.Drinks } } }
					settext, setheader = nil
				end
			end
		end
	exports['qb-menu']:openMenu(DrinksMenu)
end)

RegisterNetEvent('qb-beanmachine:Menu:Slush', function()
	if not jobCheck() then return end
	local SlushMenu = {}
	SlushMenu[#SlushMenu + 1] = { header = "Slushie Menu", txt = "", isMenuHeader = true }
		for i = 1, #Crafting.Slush do
			for k, v in pairs(Crafting.Slush[i]) do
				if k ~= "img" then
					local text = ""
					setheader = QBCore.Shared.Items[k].label
					if Crafting.Slush[i]["img"] ~= nil then setheader = Crafting.Slush[i]["img"]..setheader end
					for l, b in pairs(Crafting.Slush[i][tostring(k)]) do
						if b == 1 then number = "" else number = " x"..b end
						text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
						settext = text
					end
					SlushMenu[#SlushMenu + 1] = { header = setheader, txt = settext, params = { event = "qb-beanmachine:MakeItem", args = { item = k, tablenumber = i, craftable = Crafting.Slush } } }
					settext, setheader = nil
				end
			end
		end
	exports['qb-menu']:openMenu(SlushMenu)
end)

RegisterNetEvent('qb-beanmachine:Menu:Donut', function()
	if not jobCheck() then return end
	local DonutMenu = {}
	DonutMenu[#DonutMenu + 1] = { header = "Food Menu", txt = "", isMenuHeader = true }
	DonutMenu[#DonutMenu + 1] = { header = "<img src=https://i.imgur.com/myyavDX.png width=25px>"..QBCore.Shared.Items['beandonut'].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'beandonut' } } }
	DonutMenu[#DonutMenu + 1] = { header = "<img src=https://i.imgur.com/hhBCnJ2.png width=25px>"..QBCore.Shared.Items['chocolate'].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'chocolate' } } }
	DonutMenu[#DonutMenu + 1] = { header = "<img src=https://i.imgur.com/cdZvyBJ.png width=25px>"..QBCore.Shared.Items['crisps'].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'crisps' } } }
	DonutMenu[#DonutMenu + 1] = { header = "<img src=https://i.imgur.com/5ScW9Gn.png width=25px>"..QBCore.Shared.Items['watermelon'].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'watermelon' } } }
	DonutMenu[#DonutMenu + 1] = { header = "<img src=https://i.imgur.com/3DCQEs1.png width=25px>"..QBCore.Shared.Items['cheesecake'].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'cheesecake' } } }
	DonutMenu[#DonutMenu + 1] = { header = "<img src=https://i.imgur.com/l7nFQgV.png width=25px>"..QBCore.Shared.Items['tosti'].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'tosti' } } }
	exports['qb-menu']:openMenu(DonutMenu)
end)

RegisterNetEvent('qb-beanmachine:Menu:Soda', function()
	if not jobCheck() then return end
    exports['qb-menu']:openMenu({
		{ header = "Soda Menu", isMenuHeader = true },
        { header = "<img src=https://i.imgur.com/8HwNjk3.png width=25px>"..QBCore.Shared.Items["ecola"].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'ecola' } } },
        { header = "<img src=https://i.imgur.com/rS8DMS7.png width=25px>"..QBCore.Shared.Items["ecolalight"].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'ecolalight' } } },
        { header = "<img src=https://i.imgur.com/6hEnNqK.png width=25px>"..QBCore.Shared.Items["sprunk"].label, params = { event = "qb-beanmachine:JustGive", args = { id = 'sprunk' } } },
        { header = "<img src=https://i.imgur.com/JpinZC7.png width=25px>"..QBCore.Shared.Items["sprunklight"].label,  params = { event = "qb-beanmachine:JustGive", args = { id = 'sprunklight' } } },
    })
end)

RegisterNetEvent('qb-beanmachine:client:Drink', function(itemName)
	if itemName == "sprunk" or itemName == "sprunklight" then TriggerEvent('animations:client:EmoteCommandStart', {"sprunk"})
	elseif itemName == "ecola" or itemName == "ecolalight" then TriggerEvent('animations:client:EmoteCommandStart', {"ecola"})
	elseif itemName == "ecocoffee" then TriggerEvent('animations:client:EmoteCommandStart', {"bmcoffee"})
	elseif itemName == "flusher" then TriggerEvent('animations:client:EmoteCommandStart', {"bmcoffee2"})
	elseif itemName == "caffeagra" then TriggerEvent('animations:client:EmoteCommandStart', {"bmcoffee3"})
	else TriggerEvent('animations:client:EmoteCommandStart', {"coffee"}) end
	QBCore.Functions.Progressbar("drink_something", "Drinking "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true, }, 
	{}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
	end)
end)

RegisterNetEvent('qb-beanmachine:client:Eat', function(itemName)
	if itemName == "crisps" then TriggerEvent('animations:client:EmoteCommandStart', {"crisps"})
	elseif itemName == "beandonut" then TriggerEvent('animations:client:EmoteCommandStart', {"donut2"})
	elseif itemName == "chocolate" then TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
	else TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"}) end
    QBCore.Functions.Progressbar("eat_something", "Eating "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true, }, 
	{}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
		TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then 
		if Config.Gabz then
			exports['qb-target']:RemoveZone("BeanClockin") 
			exports['qb-target']:RemoveZone("BeanDonut") 
			exports['qb-target']:RemoveZone("BeanSoda") 
			exports['qb-target']:RemoveZone("BeanSlush") 
			exports['qb-target']:RemoveZone("BeanDrink") 
			exports['qb-target']:RemoveZone("BeanDrink2") 
			exports['qb-target']:RemoveZone("BeanFridge") 
			exports['qb-target']:RemoveZone("BeanFridge2") 
			exports['qb-target']:RemoveZone("BeanReceipt") 
			exports['qb-target']:RemoveZone("BeanReceipt2") 
			exports['qb-target']:RemoveZone("BeanCounter") 
			exports['qb-target']:RemoveZone("BeanCounter2") 
			exports['qb-target']:RemoveZone("BeanWash")
		end
		if Config.UncleJust then
			DeleteEntity(tray)
			DeleteEntity(till)
			exports['qb-target']:RemoveZone("UBeanClockin")
			exports['qb-target']:RemoveZone("UBeanReceipt")
			exports['qb-target']:RemoveZone("UBeanCounter")
			exports['qb-target']:RemoveZone("UBeanDonut")
			exports['qb-target']:RemoveZone("UBeanDrink")
			exports['qb-target']:RemoveZone("UBeanDrink2")
			exports['qb-target']:RemoveZone("UBeanSlush")
			exports['qb-target']:RemoveZone("UBeanFridge")
			exports['qb-target']:RemoveZone("UBeanWash")
			exports['qb-target']:RemoveZone("UBeanWash2")
		end
	end
end)