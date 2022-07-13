local QBCore = exports['qb-core']:GetCoreObject()

local chest = {}
local gold = {}

-- Requesting the treasure chest models to load.

CreateThread(function()

    RequestModel(`sm_prop_smug_crate_m_01a`) 
    while not HasModelLoaded(`sm_prop_smug_crate_m_01a`) do 
        Wait(2) 
    end

    chest = CreateObject(`sm_prop_smug_crate_m_01a`, 3062.0, 2219.2, 2.07, false, false, false) --vector3(3062.0, 2219.2, 3.05)
    SetEntityHeading(chest, 249.65)
    FreezeEntityPosition(chest, true)

    RequestModel(`h4_prop_h4_gold_stack_01a`) 
    while not HasModelLoaded(`h4_prop_h4_gold_stack_01a`) do 
        Wait(2) 
    end
    
    gold = CreateObject(`h4_prop_h4_gold_stack_01a`, 3062.0, 2219.2, 2.61, false, false, false) --vector3(3062.54, 2219.01, 3.08)
    SetEntityHeading(gold, 336.63)
    FreezeEntityPosition(gold, true)

    exports['qb-target']:AddBoxZone("treasurechest", vector3(3061.89, 2219.2, 3.12), 1, 1.0, {
        name="trchest",
        heading=340,
        --debugPoly = false,
        minZ=-1.08,
        maxZ=2.92,
        }, {
            options = { 
            {
                type = "client", 
                event = "randol_mib:client:lootingthechest",
                icon = 'fa-solid fa-coins',
                label = 'Loot Chest',
                item = 'message'
            },
        },
        distance = 1.4,
    })

end)

-- Remove chest on resource stop
AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then
        DeleteEntity(chest)
        DeleteEntity(gold)
	end 
end)

local function LootBlip()
	looty = AddBlipForCoord(3062.47, 2219.01, 3.08)
    SetBlipSprite(looty, 112)
    SetBlipColour(looty, 40)
    SetBlipAlpha(looty, 200)
    SetBlipDisplay(looty, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("X Marks the Spot")
    EndTextCommandSetBlipName(looty)
end

RegisterNetEvent('randol_mib:client:pulloutmessage')
AddEventHandler('randol_mib:client:pulloutmessage', function ()
    TriggerEvent('animations:client:EmoteCommandStart', {"parkingmeter"})
    LocalPlayer.state:set("inv_busy", true, true)
    local seconds = math.random(5,8)
    local circles = math.random(2,4)
    local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
    if success then
        QBCore.Functions.Notify('You got the message out of the bottle!', 'success')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        Wait(500)
        TriggerServerEvent('randol_mib:server:usebottle')
        LocalPlayer.state:set("inv_busy", false, true) -- Make inventory accessible again.
    else
        DoRamAnimation(false)
        QBCore.Functions.Notify("You slipped!", "error" , 5000)
    end
end)

RegisterNetEvent('randol_mib:client:setloc') -- Event to set the location after using the scrumpled paper.
AddEventHandler('randol_mib:client:setloc', function ()
    local coords = vector3(3062.47, 2219.01, 3.08)
    TriggerEvent('animations:client:EmoteCommandStart', {"map"})



    local seconds = math.random(5,8)
    local circles = math.random(2,4)
    local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
    if success then
        QBCore.Functions.Notify('You found the location, it\'s on the East Cove!', 'primary', 6000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        LootBlip() -- Add Blip on GPS
        SetNewWaypoint(coords.x, coords.y) -- Set waypoint to chest
        LocalPlayer.state:set("inv_busy", false, true) -- Make inventory accessible again.
    else
        DoRamAnimation(false)
        QBCore.Functions.Notify("You slipped!", "error" , 5000)
    end
end)


RegisterNetEvent('randol_mib:client:lootingthechest')
AddEventHandler('randol_mib:client:lootingthechest', function ()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    local seconds = math.random(5,8)
    local circles = math.random(2,4)
    local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
    if success then
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('randol_mib:server:lootchest') -- Loot from server side.
        LocalPlayer.state:set("inv_busy", false, true) -- Make inventory accessible again.
    else
        DoRamAnimation(false)
        QBCore.Functions.Notify("You slipped!", "error" , 5000)
    end
end)

RegisterNetEvent('randol_mib:client:removeblip')
AddEventHandler('randol_mib:client:removeblip', function ()
    RemoveBlip(looty) -- Bye bye blip
end)
