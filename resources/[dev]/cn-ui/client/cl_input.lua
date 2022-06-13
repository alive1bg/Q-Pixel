local InputVal = nil

RegisterNUICallback("InputDataPost", function(data, cb)
    SetNuiFocus(false, false)
    InputVal:resolve(data.data)
    InputVal = nil    
    cb("ok")
end)

RegisterNUICallback("CancelInput", function(data, cb)
    SetNuiFocus(false, false)
    InputVal:resolve(nil)
    InputVal = nil    
    cb("ok")
end)

InputUI = function(data)
    Wait(150)
    if not data then return end
    if InputVal ~= nil then return end    
    InputVal = promise.new()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "input",
        input = "OPEN",
        data = data
    })
    return Citizen.Await(InputVal)
end

CloseInput = function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "input",
        input = "CLOSE",
    })
end

RegisterCommand("showinput", function()
    local inputvalue = exports["cn-ui"]:InputUI({
        header = "Vehicle Menu",
        rows = {
            {
                id = 0,
                txt = "Spawn Name"
            },
        }
    })
    if inputvalue[1].input == nil then return end    
    TriggerServerEvent("VehicleSpawnEvent", {inputvalue[1].input}) -- EXAMPLE
end)
