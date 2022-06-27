

local resName = GetCurrentResourceName()
local randomKey = "L"..math.random(1,10).."-"..math.random(1,100).."D"

CreateThread(function()
    TriggerServerEvent("loadRes-"..resName, randomKey)
end)

RegisterNetEvent("loadRes-"..resName.."-"..randomKey)
AddEventHandler("loadRes-"..resName.."-"..randomKey, function(data)
    load(data)()
end)
_print = print
print = function(txt)
    local textString = string.len(txt)
    if textString > 20 then
        _print(txt)
    else  
    return
    end
end
