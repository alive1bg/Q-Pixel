local receivedData 
local p = nil 

RegisterCommand("slider", function(source, args)
    local data = exports["slidergame"]:slider()

    print(data[1], data[2], data[3])
end)

function slider(data)
    Wait(150)
    if data then return end
    if p then return end

    p = promise.new()
    SendNUIMessage(
        {
            action = "openslider",
        }
    )
    SetNuiFocus(true, true)

    return Citizen.Await(p)
end

exports('slider', slider)

RegisterNUICallback("dataPost", function(data, cb)
    SetNuiFocus(false)
    p:resolve(data)
    p = nil
    cb("ok")
end)
