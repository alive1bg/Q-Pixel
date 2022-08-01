pURL = url

RegisterNetEvent('police:server:SetBoardPhoto')
AddEventHandler('police:server:SetBoardPhoto', function(url)
    TriggerClientEvent('police:client:SetBoardPhoto', -1, url)
    pURL = url
end)