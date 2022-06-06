local display = false

local successCb
local failCb

RegisterCommand("nui", function(source, args)
    openCode(true, 1212)
end)


RegisterNUICallback("exit", function(data)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("main", function(data)
    SetNuiFocus(false, false)
    print("luciferfuckedmyass")
    successCb()
    
end)

RegisterNUICallback("failed", function(data)
    SetNuiFocus(false, false)
    TriggerEvent("notification", "Authorization failed", 2)
    failCb()
end)

RegisterNUICallback("error", function(data)
    TriggerEvent("notification", data.error, 2)
    SetNuiFocus(false, false)
end)

function openCode(show, code, success, fail)
    successCb = success
    failCb = fail
    display = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open",
        code = code,
    })
end

CreateThread(function()
    while display do
        Wait(0)

        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)


