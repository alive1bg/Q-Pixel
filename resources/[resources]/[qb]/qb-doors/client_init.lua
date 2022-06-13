QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false

PlayerJob = {}
Citizen.CreateThread(function() 
    if LocalPlayer.state['isLoggedIn'] then
        isLoggedIn = true
        PlayerJob = QBCore.Functions.GetPlayerData().job
        onDuty = QBCore.Functions.GetPlayerData().job.onduty
        TriggerServerEvent('doors:request-lock-state')
    end
end)


RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
    TriggerServerEvent('doors:request-lock-state')
end)