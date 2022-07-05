local successCb
local failCb
local resultReceived = false

RegisterNUICallback('callback', function(data, cb)
    SetNuiFocus(false, false)
    resultReceived = true
    if data.success then
        successCb()
    else
        failCb()
    end
    cb('ok')
end)

RegisterCommand('hackingminigame', function(source, args)
    -- Please check the parameters below for exports
    exports["hacking"]:OpenHackingGame(
    function() -- success
        print("Success")
    end,
    function() -- failure
        print("Failed")
    end)
end)

exports('OpenHackingGame', function(success, fail)
    resultReceived = false
    successCb = success
    failCb = fail
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open"
    })
end)
