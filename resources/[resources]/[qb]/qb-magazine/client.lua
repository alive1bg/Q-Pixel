RegisterNetEvent('libro:libro', function()
    SetNuiFocus(true,true)
    SendNUIMessage({
        show = true
    })
end)

RegisterNUICallback('escape', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)


AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        SetNuiFocus(false,false)
        SendNUIMessage({
            show = false
        })

    end
end)


  