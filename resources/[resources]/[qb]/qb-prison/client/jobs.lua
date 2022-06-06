local currentLocation = 0
local isWorking = false

-- Functions



-- Creating the JobList Clock In Board Prop
CreateThread(function()
		if isWorking == false then
            RequestModel(502084445)
            Wait(100)
            local clockin = CreateObject(GetHashKey("v_ind_tor_clockincard"),1758.76, 2497.05, 45.74,false,false,false)
            SetEntityHeading(clockin,GetEntityHeading(clockin)-59)
            FreezeEntityPosition(clockin, true)
        end
end)

-- Electrician Months Off
local function JobDone()
    if math.random(1, 100) <= 50 then
        QBCore.Functions.Notify("No time reduced", "error")
	elseif math.random(1, 100) <= 75 then
		QBCore.Functions.Notify("1 month reduced")
        jailTime = jailTime - 1
	elseif math.random(1, 100) <= 90 then	
		QBCore.Functions.Notify("2 months reduced")
        jailTime = jailTime - 2
	elseif math.random(1, 100) == 100 then	
		QBCore.Functions.Notify("10 months reduced")
        jailTime = jailTime - 10	
    end
end
-- Cleaner Months Off
local function JobDoneCleaner()
    if math.random(1, 100) <= 50 then
        QBCore.Functions.Notify("No time reduced", "error")
	elseif math.random(1, 100) <= 75 then
		QBCore.Functions.Notify("1 month reduced")
        jailTime = jailTime - 1
	elseif math.random(1, 100) <= 90 then	
		QBCore.Functions.Notify("2 months reduced")
        jailTime = jailTime - 2
	elseif math.random(1, 100) == 100 then	
		QBCore.Functions.Notify("10 months reduced")
        jailTime = jailTime - 10	
    end
end


-- Item Searching
local function ItemSearching()
    if math.random(1, 100) <= 40 then
        QBCore.Functions.Notify("You found nothing", "error")
    elseif math.random(1, 100) <= 55 then
        TriggerServerEvent('QBCore:Server:AddItem', 'lockpick', 1)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["lockpick"], "add")
        QBCore.Functions.Notify("You found an ass lockpick..", "success")
    elseif math.random(1, 100) <= 65 then
        TriggerServerEvent('QBCore:Server:AddItem', 'gatecrack', 1)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["gatecrack"], "add")
        QBCore.Functions.Notify("You found a Gate Cracker.. time to get the fuck out of here..", "success")
	elseif math.random(1, 100) <= 75 then
        TriggerServerEvent('QBCore:Server:AddItem', 'radio', 1)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["radio"], "add")
        QBCore.Functions.Notify("You found a Radio.", "success")
	elseif math.random(1, 100) <= 90 then	
        TriggerServerEvent('QBCore:Server:AddItem', 'coke_baggy', 1)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["coke_baggy"], "add")
        QBCore.Functions.Notify("You found a coke bag..", "success")
	elseif math.random(1, 100) == 100 then	
        TriggerServerEvent('QBCore:Server:AddItem', 'weapon_shiv', 1)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["weapon_shiv"], "add")
        QBCore.Functions.Notify("You found a shiv..", "success")	
    end
end

-- Starting The Electrician Job
RegisterNetEvent('prison:ashton:ElectricianStartJob', function()
					if inJail and currentJob == "electrician" then
						isWorking = true
                        QBCore.Functions.Progressbar("work_electric", "Working on electricity..", math.random(15000, 20000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@gangops@facility@servers@",
                            anim = "hotwire",
                            flags = 16,
                        }, {}, {}, function() -- Done
                            isWorking = false
                            StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                            JobDone()
                        end, function() -- Cancel
                            isWorking = false
                            StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                            QBCore.Functions.Notify("Cancelled..", "error")
                        end)
					else
						QBCore.Functions.Notify("Electrician Job Needed!", "error")
					end
end)
-- Starting The Cleaner sort
RegisterNetEvent('prison:ashton:CleanerSortItems', function()
					if inJail and currentJob == "cleaner" then
						isWorking = true
                        QBCore.Functions.Progressbar("work_electric", "Sorting Items..", math.random(15000, 20000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@gangops@facility@servers@",
                            anim = "hotwire",
                            flags = 16,
                        }, {}, {}, function() -- Done
                            isWorking = false
                            StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                            JobDone()
                        end, function() -- Cancel
                            isWorking = false
                            StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                            QBCore.Functions.Notify("Cancelled..", "error")
                        end)
					else
						QBCore.Functions.Notify("Cleaner Job Needed!", "error")
					end
end)
-- Starting The Cleaner sort
RegisterNetEvent('prison:ashton:CleanerWashHands', function()
					if inJail and currentJob == "cleaner" then
						isWorking = true
                        QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, {
						disableMovement = true, --
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					}, {
						animDict = "mp_arresting", 
						anim = "a_uncuff", 
						flags = 8,
					}, {}, {}, function()  
						TriggerEvent('QBCore:Notify', "You\'ve washed your hands!", 'success')
						JobDoneCleaner()
					end, function() --
						TriggerEvent('inventory:client:busy:status', false)
						TriggerEvent('QBCore:Notify', "Cancelled", 'error')
					end)
					else
						QBCore.Functions.Notify("Cleaner Job Needed!", "error")
					end
end)

-- Item Searching Event
RegisterNetEvent('prison:ashton:SeachItems', function()
					if inJail and currentJob ~= nil then
						isWorking = true
                        QBCore.Functions.Progressbar("work_electric", "Searching For Items...", math.random(5000, 10000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@gangops@morgue@table@",
                            anim = "player_search",
                            flags = 16,
                        }, {}, {}, function() -- Done
                            isWorking = false
                            StopAnimTask(PlayerPedId(), "anim@gangops@morgue@table@", "player_search", 1.0)
                            ItemSearching()
                        end, function() -- Cancel
                            isWorking = false
                            StopAnimTask(PlayerPedId(), "anim@gangops@morgue@table@", "player_search", 1.0)
                            QBCore.Functions.Notify("Cancelled..", "error")
                        end)
					end
end)


CreateThread(function()
-- Prison Search Items
exports['qb-target']:AddBoxZone("PrisonSearch", vector3(1778.1, 2545.73, 45.67), 1.0, 1.6, {
    name="PrisonSearch",
    heading=0,
    debugPoly = false,
    minZ=44.47,
	maxZ=46.07
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:SeachItems",
                icon = "fas fa-search",
                label = "Search For Items",
            },
        },
        distance = 2.5
})
exports['qb-target']:AddBoxZone("PrisonSearch2", vector3(1773.22, 2567.84, 45.73), 1.0, 1.6, {
    name="PrisonSearch2",
    heading=0,
    debugPoly = false,
    minZ=45.53,
	maxZ=45.93
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:SeachItems",
                icon = "fas fa-search",
                label = "Search For Items",
            },
        },
        distance = 2.5
})
-- Electrician Box 1
exports['qb-target']:AddBoxZone("PrisonJob1", vector3(1652.62, 2565.34, 45.56), 1.4, 3.8, {
    name="PrisonJob1",
    heading=0,
    debugPoly = false,
    minZ=42.16,
	maxZ=46.96
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:ElectricianStartJob",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Electrician Box 2
exports['qb-target']:AddBoxZone("PrisonJob2", vector3(1629.93, 2565.21, 45.56), 3.6, 1.2, {
    name="PrisonJob2",
    heading=273,
    debugPoly = false,
    minZ=42.96,
	maxZ=46.96
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:ElectricianStartJob",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Electrician Box 3
exports['qb-target']:AddBoxZone("PrisonJob3", vector3(1608.6, 2567.41, 45.56), 2.2, 1, {
	name="PrisonJob3",
	heading=315,
	debugPoly = false,
	minZ=45.26,
	maxZ=47.26
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:ElectricianStartJob",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Electrician Box 4
exports['qb-target']:AddBoxZone("PrisonJob4", vector3(1609.44, 2539.21, 45.56), 2.1, 0.8, {
	name="PrisonJob4",
	heading=45,
	debugPoly = false,
	minZ=44.56,
	maxZ=47.16
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:ElectricianStartJob",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Electrician Box 5
exports['qb-target']:AddBoxZone("PrisonJob5", vector3(1643.92, 2490.32, 45.56), 1.0, 2.2, {
	name="PrisonJob5",
	heading=7,
	debugPoly = false,
	minZ=45.06,
	maxZ=47.26
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:ElectricianStartJob",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Electrician Box 6
exports['qb-target']:AddBoxZone("PrisonJob6", vector3(1700.84, 2474.1, 45.56), 1.4, 3.6, {
	name="PrisonJob6",
	heading=45,
	debugPoly = false,
	minZ=44.76,
	maxZ=46.96
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:ElectricianStartJob",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Electrician Box 7
exports['qb-target']:AddBoxZone("PrisonJob7", vector3(1737.12, 2503.89, 45.57), 1.4, 2.4, {
	name="PrisonJob7",
	heading=345,
	debugPoly = false,
	minZ=43.17,
	maxZ=47.17
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:ElectricianStartJob",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Electrician Box 8
exports['qb-target']:AddBoxZone("PrisonJob8", vector3(1761.36, 2518.88, 45.57), 2.2, 1, {
	name="PrisonJob8",
	heading=345,
	debugPoly = false,
	minZ=43.22,
	maxZ=47.22
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:ElectricianStartJob",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Cleaner Sort Items
exports['qb-target']:AddBoxZone("CleanerSortItems", vector3(1786.84, 2564.97, 45.67), 1.0, 2.8, {
	name="CleanerSortItems",
	heading=0,
	-- debugpoly = false,
	minZ=44.67,
	maxZ=46.87
    }, {
        options = {
            {
                type = "client",
                event = "prison:ashton:CleanerSortItems",
                icon = "fas fa-wrench",
                label = "Start Work",
            },
        },
        distance = 2.5
})
-- Cleaner Wash Hands
-- exports['qb-target']:AddBoxZone("CleanerSortItems", vector3(1786.84, 2564.97, 45.67), 1.0, 2.8, {
	-- name="CleanerSortItems",
	-- heading=0,
	-- debugpoly = false,
	-- minZ=44.67,
	-- maxZ=46.87
    -- }, {
        -- options = {
            -- {
                -- type = "client",
                -- event = "prison:ashton:ElectricianStartJob",
                -- icon = "fas fa-wrench",
                -- label = "Start Work",
            -- },
        -- },
        -- distance = 2.5
-- })
end)