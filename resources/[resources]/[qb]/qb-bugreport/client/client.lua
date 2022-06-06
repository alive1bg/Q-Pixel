RegisterCommand("bug", function(args,rawCommand) 
    SetNuiFocus(true, true)

    SendNUIMessage({
        type = "open",
    })  
end)

RegisterNUICallback("exit" , function()
    SetNuiFocus(false, false)

end)


RegisterNUICallback('sumbit', function(data, cb)
    TriggerServerEvent("send" , data)
    SetNuiFocus(false, false)

end)