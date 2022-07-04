RegisterNetEvent('explosionEvent')
AddEventHandler('explosionEvent', function(sender, ev)
    print("denemeeeee")
    TriggerClientEvent('jd:explotiontype', sender)
end)

RegisterNetEvent('jd:server:elektrikkes')
AddEventHandler('jd:server:elektrikkes', function(durum)
    if durum then
        TriggerClientEvent('jd:client:elektrikkes', -1, true)
        TriggerClientEvent("chatMessage", "[LS Water & Power]", "warning", "City power is currently out, we're working on restoring it!")
        --TriggerClientEvent('chatMessage', -1, "^1[LS Water & Power]", {255, 0, 0}, "City power is currently out, we're working on restoring it!")
    elseif not durum then
        TriggerClientEvent('jd:client:elektrikkes', -1, false)
        TriggerClientEvent("chatMessage", "[LS Water & Power]", "warning", "City power has been restored!")
        --TriggerClientEvent('chatMessage', -1, "^1[LS Water & Power]", {255, 0, 0}, "City power has been restored!")
    end
end)