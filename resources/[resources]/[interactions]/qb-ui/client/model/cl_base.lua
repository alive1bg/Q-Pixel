-- CLOSE APP
function SetUIFocus(hasKeyboard, hasMouse)
  SetNuiFocus(hasKeyboard, hasMouse)
end

exports('SetUIFocus', SetUIFocus)

RegisterNUICallback("qb-ui:closeApp", function(data, cb)
    SetUIFocus(false, false)
    cb({data = {}, meta = {ok = true, message = 'done'}})
    Wait(800)
    TriggerEvent("attachedItems:block",false)
end)

RegisterNUICallback("qb-ui:applicationClosed", function(data, cb)
    TriggerEvent("qb-ui:application-closed", data.name, data)
    cb({data = {}, meta = {ok = true, message = 'done'}})
end)

-- FORCE CLOSE
RegisterCommand("qb-ui:force-close", function()
    SendUIMessage({source = "qb-nui", app = "", show = false});
    SetUIFocus(false, false)
end, false)

-- SMALL MAP
RegisterCommand("qb-ui:small-map", function()
  SetRadarBigmapEnabled(false, false)
end, false)

local function restartUI(withMsg)
  SendUIMessage({ source = "qb-nui", app = "main", action = "restart" });
  if withMsg then
    TriggerEvent("QBCore:Notify", src, "You can also use 'ui-r' as a shorter version to restart!")
  end
end
RegisterCommand("qb-ui:restart", function() restartUI(true) end, false)
RegisterCommand("ui-r", function() restartUI() end, false)
RegisterNetEvent("qb-ui:server-restart")
AddEventHandler("qb-ui:server-restart", restartUI)

RegisterNUICallback("qb-ui:resetApp", function(data, cb)
    SetUIFocus(false, false)
    cb({data = {}, meta = {ok = true, message = 'done'}})
    sendCharacterData()
end)