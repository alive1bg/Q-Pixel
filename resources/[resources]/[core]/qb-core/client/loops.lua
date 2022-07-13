CreateThread(function()
    while true do
        Wait(0)
        if LocalPlayer.state.isLoggedIn then
            Wait((1000 * 60) * QBCore.Config.UpdateInterval)
            TriggerServerEvent('QBCore:UpdatePlayer')
        end
    end
end)

-- CreateThread(function()
--     while true do
--         Wait(QBCore.Config.StatusInterval)
--         if LocalPlayer.state.isLoggedIn then
--             if QBCore.Functions.GetPlayerData().metadata['hunger'] <= 0 or
--                     QBCore.Functions.GetPlayerData().metadata['thirst'] <= 0 then
--                 local ped = PlayerPedId()
--                 local currentHealth = GetEntityHealth(ped)
--                 SetEntityHealth(ped, currentHealth - math.random(5, 10))
--             end
--         end
--     end
-- end)

CreateThread(function()
    while true do
        local sleep = 0
        if LocalPlayer.state.isLoggedIn then
            sleep = (1000 * 60) * QBCore.Config.UpdateInterval
            local hungerRate = 0
            local thirstRate = 0
            if exports["ps-buffs"]:HasBuff("super-hunger") then hungerRate = QBCore.Config.Player.HungerRate/2 else hungerRate = QBCore.Config.Player.HungerRate end
            if exports["ps-buffs"]:HasBuff("super-thirst") then thirstRate = QBCore.Config.Player.ThirstRate/2 else thirstRate = QBCore.Config.Player.ThirstRate end
            TriggerServerEvent('QBCore:UpdatePlayer', hungerRate, thirstRate)
        end
        Wait(sleep)
    end
end)

