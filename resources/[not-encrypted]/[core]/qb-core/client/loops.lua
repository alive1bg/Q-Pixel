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

CreateThread(function() -- if you go into laststand due to hunger or thirst being at zero. Laststand would give you 50% health but because your thirst or hunger was still at zero it would take that health away. 
    while true do       -- this snippet fixes that issue of deducting health if in last stand
        Wait(QBCore.Config.StatusInterval)
        local PlayerData = QBCore.Functions.GetPlayerData() 
        if LocalPlayer.state['isLoggedIn'] then
            if not QBCore.Functions.GetPlayerData().metadata['inlaststand'] then
                if (PlayerData.metadata['hunger'] <= 0 or PlayerData.metadata['thirst'] <= 0) and (not PlayerData.metadata['isdead']) then		
                    local ped = PlayerPedId()
                    local currentHealth = GetEntityHealth(ped)
                    SetEntityHealth(ped, currentHealth - math.random(5, 10))
                end
            end
        end
    end
end)
