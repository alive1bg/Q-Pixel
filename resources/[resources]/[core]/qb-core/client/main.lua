QBCore = {}
QBCore.PlayerData = {}
QBCore.Config = QBConfig
QBCore.Shared = QBShared
QBCore.ServerCallbacks = {}

exports('GetCoreObject', function()
    return QBCore
end)

RegisterCommand('toggleduty', function(source)
    TriggerEvent('qb-policejob:ToggleDuty')
end)

-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local QBCore = exports['qb-core']:GetCoreObject()