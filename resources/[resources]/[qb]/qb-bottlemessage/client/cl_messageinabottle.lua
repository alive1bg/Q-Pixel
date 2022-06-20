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
        --debugPoly=true,
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
            exports.rprogress:Custom({
            Async = true,
            canCancel = false,       -- Allow cancelling
            cancelKey = 200,        -- Custom cancel key
            x = 0.5,                -- Position on x-axis
            y = 0.9,                -- Position on y-axis
            From = 0,               -- Percentage to start from
            To = 100,               -- Percentage to end
            Duration = 5000,        -- Duration of the progress
            Radius = 45,            -- Radius of the dial
            Stroke = 7,            -- Thickness of the progress dial
            Cap = 'butt',           -- or 'round'
            Padding = 0,            -- Padding between the progress dial and the background dial
            MaxAngle = 360,         -- Maximum sweep angle of the dial in degrees
            Rotation = 0,           -- 2D rotation of the dial in degrees
            Width = 300,            -- Width of bar in px if Type = 'linear'
            Height = 40,            -- Height of bar in px if Type = 'linear'
            ShowTimer = false,       -- Shows the timer countdown within the radial dial
            ShowProgress = true,   -- Shows the progress % within the radial dial    
            Easing = "easeLinear",
            Label = "Popping open the bottle..",
            LabelPosition = "right",
            Color = "rgba(255, 255, 255, 1.0)",
            BGColor = "rgba(0, 0, 0, 0.4)",
            ZoneColor = "rgba(51, 105, 30, 1)",
            DisableControls = {
                Mouse = false,
                Player = true,
                Vehicle = false
            },
            onComplete = function(cancelled)
            QBCore.Functions.Notify('You got the message out of the bottle!', 'success')
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(500)
            TriggerServerEvent('randol_mib:server:usebottle')
            LocalPlayer.state:set("inv_busy", false, true) -- Make inventory accessible again.
        end
    })
end)

RegisterNetEvent('randol_mib:client:setloc') -- Event to set the location after using the scrumpled paper.
AddEventHandler('randol_mib:client:setloc', function ()
    local coords = vector3(3062.47, 2219.01, 3.08)
    TriggerEvent('animations:client:EmoteCommandStart', {"map"})
    LocalPlayer.state:set("inv_busy", true, true)
            exports.rprogress:Custom({
            Async = true,
            canCancel = false,       -- Allow cancelling
            cancelKey = 200,        -- Custom cancel key
            x = 0.5,                -- Position on x-axis
            y = 0.9,                -- Position on y-axis
            From = 0,               -- Percentage to start from
            To = 100,               -- Percentage to end
            Duration = 5000,        -- Duration of the progress
            Radius = 45,            -- Radius of the dial
            Stroke = 7,            -- Thickness of the progress dial
            Cap = 'butt',           -- or 'round'
            Padding = 0,            -- Padding between the progress dial and the background dial
            MaxAngle = 360,         -- Maximum sweep angle of the dial in degrees
            Rotation = 0,           -- 2D rotation of the dial in degrees
            Width = 300,            -- Width of bar in px if Type = 'linear'
            Height = 40,            -- Height of bar in px if Type = 'linear'
            ShowTimer = false,       -- Shows the timer countdown within the radial dial
            ShowProgress = true,   -- Shows the progress % within the radial dial    
            Easing = "easeLinear",
            Label = "Locating the treasure..",
            LabelPosition = "right",
            Color = "rgba(255, 255, 255, 1.0)",
            BGColor = "rgba(0, 0, 0, 0.4)",
            ZoneColor = "rgba(51, 105, 30, 1)",
            DisableControls = {
                Mouse = false,
                Player = true,
                Vehicle = false
            },
            onComplete = function(cancelled)
            QBCore.Functions.Notify('You found the location, it\'s on the East Cove!', 'primary', 6000)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            LootBlip() -- Add Blip on GPS
			SetNewWaypoint(coords.x, coords.y) -- Set waypoint to chest
            LocalPlayer.state:set("inv_busy", false, true) -- Make inventory accessible again.
        end
    })
end)


RegisterNetEvent('randol_mib:client:lootingthechest')
AddEventHandler('randol_mib:client:lootingthechest', function ()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    LocalPlayer.state:set("inv_busy", true, true)
            exports.rprogress:Custom({
            Async = true,
            canCancel = false,       -- Allow cancelling
            cancelKey = 200,        -- Custom cancel key
            x = 0.5,                -- Position on x-axis
            y = 0.9,                -- Position on y-axis
            From = 0,               -- Percentage to start from
            To = 100,               -- Percentage to end
            Duration = 15000,        -- Duration of the progress
            Radius = 45,            -- Radius of the dial
            Stroke = 7,            -- Thickness of the progress dial
            Cap = 'butt',           -- or 'round'
            Padding = 0,            -- Padding between the progress dial and the background dial
            MaxAngle = 360,         -- Maximum sweep angle of the dial in degrees
            Rotation = 0,           -- 2D rotation of the dial in degrees
            Width = 300,            -- Width of bar in px if Type = 'linear'
            Height = 40,            -- Height of bar in px if Type = 'linear'
            ShowTimer = false,       -- Shows the timer countdown within the radial dial
            ShowProgress = true,   -- Shows the progress % within the radial dial    
            Easing = "easeLinear",
            Label = "Looting the chest..",
            LabelPosition = "right",
            Color = "rgba(255, 255, 255, 1.0)",
            BGColor = "rgba(0, 0, 0, 0.4)",
            ZoneColor = "rgba(51, 105, 30, 1)",
            DisableControls = {
                Mouse = false,
                Player = true,
                Vehicle = false
            },
            onComplete = function(cancelled)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('randol_mib:server:lootchest') -- Loot from server side.
            LocalPlayer.state:set("inv_busy", false, true) -- Make inventory accessible again.
        end
    })
end)

RegisterNetEvent('randol_mib:client:removeblip')
AddEventHandler('randol_mib:client:removeblip', function ()
    RemoveBlip(looty) -- Bye bye blip
end)
