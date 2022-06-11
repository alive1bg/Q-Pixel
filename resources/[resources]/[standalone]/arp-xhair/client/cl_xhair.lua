local xhairActive = false
local disableXhair = false
local rgb = false
RegisterCommand("togglexhair", function()
    disableXhair = not disableXhair
end)

RegisterCommand("togglexhair_rgb", function()
    rgb = not rgb
    SendNUIMessage({type = "rgb", state = rgb})
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local get_ped = PlayerPedId()
        local get_ped_veh = GetVehiclePedIsIn(get_ped, false)

        if not disableXhair and not xhairActive and IsPedArmed(get_ped, 7) and IsPlayerFreeAiming(PlayerId()) then
            xhairActive = true
            SendNUIMessage({type = "crosshair", state = xhairActive})
        elseif not IsPlayerFreeAiming(PlayerId()) and xhairActive then
            xhairActive = false
            SendNUIMessage({type = "crosshair", state = xhairActive})
        end
    end
end)