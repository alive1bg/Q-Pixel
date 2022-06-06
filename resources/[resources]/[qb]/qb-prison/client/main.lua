exports['qb-core']:GetCoreObject() -- Used Globally
QBCore = exports['qb-core']:GetCoreObject() -- Used Globally
inJail = false
jailTime = 0
currentJob = ""
PlayerJob = {}

-- Functions

function DrawText3D(x, y, z, text) -- Used Globally
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end



-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.metadata["injail"] > 0 then
			TriggerEvent("prison:client:Enter", PlayerData.metadata["injail"])
		end
	end)

	QBCore.Functions.TriggerCallback('prison:server:IsAlarmActive', function(active)
		if active then
			TriggerEvent('prison:client:JailAlarm', true)
		end
	end)

	PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	inJail = false
	currentJob = nil
end)

RegisterNetEvent('prison:client:Enter', function(time)
	QBCore.Functions.Notify( Lang:t("error.injail", {Time = time}), "error")

	-- TriggerEvent("chatMessage", "SYSTEM", "warning", "Your property has been seized, you'll get everything back when your time is up..")
	DoScreenFadeOut(500)
	while not IsScreenFadedOut() do
		Wait(10)
	end
	local RandomStartPosition = Config.Locations.spawns[math.random(1, #Config.Locations.spawns)]
	SetEntityCoords(PlayerPedId(), RandomStartPosition.coords.x, RandomStartPosition.coords.y, RandomStartPosition.coords.z - 0.9, 0, 0, 0, false)
	SetEntityHeading(PlayerPedId(), RandomStartPosition.coords.w)
	Wait(500)
	-- TriggerEvent('animations:client:EmoteCommandStart', {RandomStartPosition.animation})
	DoScreenFadeIn(1000)
    TriggerClientEvent('QBCore:Notify', src, 'You have been jailed. You can pick up your shit when you leave')
	TriggerEvent('qb-ui:ShowUI', 'show', "Started: Lockup - Hang out in the cells. Read a book, Nerd")
	Wait(3000)
	TriggerEvent('cd_drawtextui:HideUI')
	inJail = true
	jailTime = time
	-- currentJob = "electrician"
	TriggerServerEvent("prison:server:SetJailStatus", jailTime)
	TriggerServerEvent("prison:server:SaveJailItems", jailTime)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "jail", 0.5)
	Wait(2000)
	-- DoScreenFadeIn(1000)
	-- QBCore.Functions.Notify( Lang:t("error.do_some_work", {currentjob = Config.Jobs[currentJob] }), "error")
end)

RegisterNetEvent('prison:ashton:Leave', function()
	if jailTime > 0 then
		QBCore.Functions.Notify( Lang:t("info.timeleft", {JAILTIME = jailTime}))
	else
		jailTime = 0
		TriggerServerEvent("prison:server:SetJailStatus", 0)
        --QBCore.Functions.Notify('Go grab your shit from the front desk..', 'inform', 3500)
		--TriggerServerEvent("prison:server:GiveJailItems") -- commented out due to new event, people can pick up their shit from front desk
		--TriggerEvent("chatMessage", "SYSTEM", "warning", "you've received your property back..")
        
		inJail = false
		--QBCore.Functions.Notify(Lang:t("success.free_"))
        QBCore.Functions.Notify('You are free! Go grab your shit from the front desk..', 'inform', 5000)
		DoScreenFadeOut(500)
		while not IsScreenFadedOut() do
			Wait(10)
		end
		SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
		SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.w)

		Wait(500)

		DoScreenFadeIn(1000)
	end
end)

RegisterNetEvent('prison:client:UnjailPerson', function()
	if jailTime > 0 then
		TriggerServerEvent("prison:server:SetJailStatus", 0)
		TriggerServerEvent("prison:server:GiveJailItems")
		TriggerEvent("chatMessage", "SYSTEM", "warning", "You got your property back..")
		inJail = false
		QBCore.Functions.Notify(Lang:t("success.free_"))
		DoScreenFadeOut(500)
		while not IsScreenFadedOut() do
			Wait(10)
		end
		SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
		SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.w)
		Wait(500)
		DoScreenFadeIn(1000)
	end
end)

-- Threads

CreateThread(function()
    TriggerEvent('prison:client:JailAlarm', false)
	while true do
		Wait(7)
		if jailTime > 0 and inJail then
			Wait(1000 * 60)
			if jailTime > 0 and inJail then
				jailTime = jailTime - 1
				if jailTime <= 0 then
					jailTime = 0
					QBCore.Functions.Notify(Lang:t("success.timesup"), "success", 10000)
				end
				TriggerServerEvent("prison:server:SetJailStatus", jailTime)
			end
		else
			Wait(5000)
		end
	end
end)

-- CreateThread(function()
	-- while true do
		-- Wait(1)
		-- if LocalPlayer.state.isLoggedIn then
			-- if inJail then
				-- local pos = GetEntityCoords(PlayerPedId())
				-- if #(pos - vector3(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z)) < 1.5 then
					-- DrawText3D(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, "~g~E~w~ - Check time")
					-- if IsControlJustReleased(0, 38) then
						-- TriggerEvent("prison:client:Leave")
					-- end
				-- elseif #(pos - vector3(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z)) < 2.5 then
					-- DrawText3D(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, "Check time")
				-- end

				-- if #(pos - vector3(Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z)) < 1.5 then
					-- DrawText3D(Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, "~g~E~w~ - Canteen")
					-- if IsControlJustReleased(0, 38) then
                        -- local ShopItems = {}
                        -- ShopItems.label = "Prison Canteen"
                        -- ShopItems.items = Config.CanteenItems
                        -- ShopItems.slots = #Config.CanteenItems
                        -- TriggerServerEvent("inventory:server:OpenInventory", "shop", "Canteenshop_"..math.random(1, 99), ShopItems)
					-- end
					-- DrawMarker(2, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 55, 22, 222, false, false, false, 1, false, false, false)
				-- elseif #(pos - vector3(Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z)) < 2.5 then
					-- DrawText3D(Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, "Canteen")
					-- DrawMarker(2, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 55, 22, 222, false, false, false, 1, false, false, false)
				-- elseif #(pos - vector3(Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z)) < 10 then
					-- DrawMarker(2, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 55, 22, 222, false, false, false, 1, false, false, false)
				-- end
			-- end
		-- else
			-- Wait(5000)
		-- end
	-- end
-- end)
-- Open Canteen
RegisterNetEvent('prison:ashton:OpenCanteen')
AddEventHandler('prison:ashton:OpenCanteen',function(data)
	local ShopItems = {}
    ShopItems.label = "Prison Canteen"
    ShopItems.items = Config.CanteenItems
    ShopItems.slots = #Config.CanteenItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Canteenshop_"..math.random(1, 99), ShopItems)
end)

-- Selecting Electrician Job
RegisterNetEvent('police:ashton:SelectElectrician', function()
	if inJail and currentJob ~= nil then
		isWorking = true
		currentJob = "electrician"
		QBCore.Functions.Notify("You are now the Prison Electrician", "success")
	end

end)
-- Selecting Cleaner Job
RegisterNetEvent('police:ashton:SelectCleaner', function()
	if inJail and currentJob ~= nil then
		currentJob = "cleaner"
		QBCore.Functions.Notify("You are now the Prison Cleaner", "success")
	end
end)

-- Job List Event
RegisterNetEvent('police:ashton:JobList', function()
    exports['qb-menu']:openMenu({
        {
            header = "Prison Jobs",
            isMenuHeader = true, 
        },
        {
            header = "Electrician",
            txt = "Walk around the Prison and Find the electrical boxes",
            params = {
                event = "police:ashton:SelectElectrician",
                args = {
                }
            }
        },
		{
            header = "Cleaner",
            txt = "Head to the canteen to work!",
            params = {
                event = "police:ashton:SelectCleaner",
                args = {
                }
            }
        },
    })
end)
-- Making A Drink Event
RegisterNetEvent('police:ashton:MakeDrink', function()
    Wait(1000)
    local ped = PlayerPedId()
    local seconds = math.random(5,9)
    local circles = math.random(4,8)
    local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
    if success then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "pour-drink", 0.3)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)
        QBCore.Functions.Progressbar("hospital_waiting", "Making a Good Slushy...", 10000, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('prison:ashton:GiveItem')
            ClearPedTasks(PlayerPedId())
        end, function() -- Cancel
            QBCore.Functions.Notify("Failed...", "error")
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify("You Failed making a Slushy..", "error")
        ClearPedTasks(PlayerPedId())
    end
end)
-- Prison Canteen Tables
-- Table 1
RegisterNetEvent('police:ashton:Table1')
AddEventHandler('police:ashton:Table1',function(data)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "PrisonCanteenTable1")
	TriggerEvent("inventory:client:SetCurrentStash", "PrisonCanteenTable1")
end)
-- Table 2
RegisterNetEvent('police:ashton:Table2')
AddEventHandler('police:ashton:Table2',function(data)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "PrisonCanteenTable2")
	TriggerEvent("inventory:client:SetCurrentStash", "PrisonCanteenTable2")
end)
-- Table 3
RegisterNetEvent('police:ashton:Table3')
AddEventHandler('police:ashton:Table3',function(data)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "PrisonCanteenTable3")
	TriggerEvent("inventory:client:SetCurrentStash", "PrisonCanteenTable3")
end)
-- Table 4
RegisterNetEvent('police:ashton:Table4')
AddEventHandler('police:ashton:Table4',function(data)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "PrisonCanteenTable4")
	TriggerEvent("inventory:client:SetCurrentStash", "PrisonCanteenTable4")
end)
-- Table 5
RegisterNetEvent('police:ashton:Table5')
AddEventHandler('police:ashton:Table5',function(data)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "PrisonCanteenTable5")
	TriggerEvent("inventory:client:SetCurrentStash", "PrisonCanteenTable5")
end)
-- Table 6
RegisterNetEvent('police:ashton:Table6')
AddEventHandler('police:ashton:Table6',function(data)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "PrisonCanteenTable6")
	TriggerEvent("inventory:client:SetCurrentStash", "PrisonCanteenTable6")
end)

-- PolyZones
CreateThread(function()
-- Prison Canteen Table
exports['qb-target']:AddBoxZone("PrisonCanteenTable1", vector3(1780.78, 2556.42, 45.67), 1.2, 1.2, {
	name="prisontable 1",
	heading=0,
	debugpoly = false,
	minZ=45.37,
	maxZ=45.57
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:Table1",
                icon = "fas fa-hamburger",
                label = "Table 1",
            },
        },
        distance = 2.5
})
-- Prison Canteen Table 2
exports['qb-target']:AddBoxZone("PrisonCanteenTable2", vector3(1789.82, 2556.23, 45.67), 1.2, 1.2, {
	name="prisontable 2",
	heading=0,
	debugpoly = false,
	minZ=45.37,
	maxZ=45.57
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:Table2",
                icon = "fas fa-hamburger",
                label = "Table 2",
            },
        },
        distance = 2.5
})
-- Prison Canteen Table 3
exports['qb-target']:AddBoxZone("PrisonCanteenTable3", vector3(1790.0, 2548.09, 45.67), 1.2, 1.2, {
	name="prisontable 3",
	heading=0,
	debugpoly = false,
	minZ=45.37,
	maxZ=45.57
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:Table3",
                icon = "fas fa-hamburger",
                label = "Table 3",
            },
        },
        distance = 2.5
})
-- Prison Canteen Table 4
exports['qb-target']:AddBoxZone("PrisonCanteenTable4", vector3(1786.43, 2547.81, 45.67), 4.8, 1.2, {
	name="prisontable 4",
	heading=0,
	debugpoly = false,
	minZ=45.37,
	maxZ=45.57
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:Table4",
                icon = "fas fa-hamburger",
                label = "Table 4",
            },
        },
        distance = 2.5
})
-- Prison Canteen Table 5
exports['qb-target']:AddBoxZone("PrisonCanteenTable5", vector3(1782.23, 2547.65, 45.67), 4.8, 1.2, {
	name="prisontable 5",
	heading=0,
	debugpoly = false,
	minZ=45.37,
	maxZ=45.57
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:Table5",
                icon = "fas fa-hamburger",
                label = "Table 5",
            },
        },
        distance = 2.5
})
-- Prison Canteen Table 6
exports['qb-target']:AddBoxZone("PrisonCanteenTable6", vector3(1777.8, 2547.9, 45.67), 1.2, 1.2, {
	name="prisontable 6",
	heading=0,
	debugpoly = false,
	minZ=45.37,
	maxZ=45.57
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:Table6",
                icon = "fas fa-hamburger",
                label = "Table 6",
            },
        },
        distance = 2.5
})
-- Prison Job CheckIn Board
exports['qb-target']:AddBoxZone("PrisonCheckInBoard", vector3(1758.69, 2497.05, 45.73), 0.2, 1.4, {
    name="PrisonCheckInBoard",
    heading=301,
    debugPoly = false,
	minZ=45.54,
	maxZ=47.14
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:JobList",
                icon = "fas fa-hard-hat",
                label = "Select Job",
            },
        },
        distance = 2.5
})
-- Making a Drink (with Minigame)
exports['qb-target']:AddBoxZone("MakeDrink", vector3(1777.66, 2560.07, 45.67), 0.6, 2.0, {
    name="MakeDrink",
    heading=0,
    debugPoly = false,
    minZ=45.67,
    maxZ=46.67,
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:MakeDrink",
                icon = "fas fa-wine-bottle",
                label = "Make Slushy",
            },
        },
        distance = 2.5
})
-- Canteen
exports['qb-target']:AddBoxZone("PrisonCanteen", vector3(1781.05,2560.16,45.16), 1.6, 3.85, {
    name="PrisonCanteen",
    heading=0,
    debugPoly = false,
    minZ=45.67,
    maxZ=46.67,
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:OpenCanteen",
                icon = "fas fa-utensils",
                label = "Canteen",
            },
        },
        distance = 2.5
})
-- Prison Phone Service (Check Time / Leave Prison)
exports['qb-target']:AddBoxZone("PrisonServices", vector3(1828.77, 2579.5, 46.01), 0.8, 0.6, {
    name="PrisonServices",
    heading=0,
    debugPoly = false,
    minZ=45.67,
    maxZ=46.67,
    }, {
        options = {
            {
                type = "client",
                event = "qb-prison:client:prisonmenu",
                icon = "fas fa-clipboard",
                label = "Prison Services",
            },
        },
        distance = 2.5
})

exports['qb-target']:AddBoxZone("CollectPossessions", vector3(1840.31, 2578.41, 46.01), 0.8, 0.6, {
    name="CollectPossessions",
    heading=0,
    debugPoly = false,
    minZ=45.95,
    maxZ=46.46,
    }, {
        options = {
            {
                type = "client",
                event = "police:ashton:claimpossessions",
                icon = "fas fa-suitcase",
                label = "Collect Possessions",
            },
			{
                type = "client",
                event = "qb-policejob:ToggleDuty",
                icon = "fas fa-sign-in-alt",
                label = "Go On/Off Duty",
                job = "police",
            },
        },
        distance = 2.5 
})

exports['qb-target']:AddBoxZone("PrisonArmory", vector3(1844.32, 2573.86, 46.05), 1.0, 1.0, {
    name="PrisonArmory",
    heading=0,
    debugPoly = false,
    minZ=45.67,
    maxZ=46.67,
    }, {
        options = {
            {
                type = "client",
                event = "police:armory",
                icon = "fas fa-clipboard",
                label = "Armory",
            },
        },
        distance = 2.5
})



RegisterNetEvent('police:ashton:claimpossessions')
AddEventHandler('police:ashton:claimpossessions',function(data)
    TriggerServerEvent("prison:server:GiveJailItems")
    QBCore.Functions.Notify('You have claimed your possessions..', 'success', 3500)
end)


end)

RegisterNetEvent("qb-prison:client:prisonmenu", function(source, raw)
    exports['qb-menu']:openMenu({
        {
            header = "Time Remaining",
            txt = "Check your remaining jail time",
            params = {
                event = "prison:ashton:Leave",
            }
        },
        {
            header = "Character Switch",
            txt = "Go bowling with your cousin",
            params = {
                event = "qb-houses:client:ChangeCharacter",

            }
        },
        {
            header = "Make Phone Call",
            txt = "Go bowling with your cousin",
            params = {
                event = "stx-phone:client:publocphoneopen",

            }
        },
        {
            header = "Check Lawyers",
            txt = "Get a list of available lawyers (Coming Soon)",
            params = {
                event = "",

            }
        },
    })
end)



