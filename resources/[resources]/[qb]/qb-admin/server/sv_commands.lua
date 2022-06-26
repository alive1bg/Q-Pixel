QBCore = exports['qb-core']:GetCoreObject()

-- [ Code ] --

-- [ Commands ] --

QBCore.Commands.Add('blips', "Player Blips", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:toggleBlips', src)
end, 'admin')

QBCore.Commands.Add('names', "Player Names", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin:client:toggleNames', src)
end, 'admin')

QBCore.Commands.Add('menu', Lang:t("info.keymapping_desc"), {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-admin/client/try-open-menu', src, false)
end, 'admin')

QBCore.Commands.Add('resetmenu', Lang:t("info.reset_data"), {}, false, function(source)
    TriggerClientEvent('qb-admin/client/reset-menu', -1, false)
end, 'admin')

QBCore.Commands.Add('maxmods', "Max Mod Vehicle", {}, false, function(source)
    local src = source
    TriggerClientEvent('Admin:Tuning:Vehicle', src)
end, 'admin')

QBCore.Commands.Add('admincar', "Save this vehicle into your garage", {}, false, function(source, _)
    TriggerClientEvent('Admin:Save:Vehicle', source)
end, 'admin')

-- Console

RegisterCommand('AdminPanelKick', function(source, args, rawCommand)
    if source == 0 then
        local ServerId = tonumber(args[1])
        table.remove(args, 1)
        local Msg = table.concat(args, " ")
        DropPlayer(ServerId, Lang:t('info.kicked', {reason = Msg}))
    end
end, false)

RegisterCommand('AdminPanelAddItem', function(source, args, rawCommand)
    if source == 0 then
        local ServerId, ItemName, ItemAmount = tonumber(args[1]), tostring(args[2]), tonumber(args[3])
        local Player = QBCore.Functions.GetPlayer(ServerId)
        if Player ~= nil then
            Player.Functions.AddItem(ItemName, ItemAmount, false, false)
            print(Lang:t('info.gaveitem', {amount = ItemAmount, name = ItemName}))
        end
    end
end, false)

RegisterCommand('AdminPanelAddMoney', function(source, args, rawCommand)
    if source == 0 then
        local ServerId, Amount = tonumber(args[1]), tonumber(args[2])
        local Player = QBCore.Functions.GetPlayer(ServerId)
        if Player ~= nil then
            Player.Functions.AddMoney('cash', Amount)
        end
    end
end, false)

RegisterCommand('AdminPanelSetJob', function(source, args, rawCommand)
    if source == 0 then
        local ServerId, JobName, Grade = tonumber(args[1]), tostring(args[2]), tonumber(args[3])
        local Player = QBCore.Functions.GetPlayer(ServerId)
        if Player ~= nil then
            Player.Functions.SetJob(JobName, Grade)
            print(Lang:t('info.setjob', {jobname = JobName}))
        end
    end
end, false)

RegisterCommand('AdminPanelRevive', function(source, args, rawCommand)
    if source == 0 then
        local ServerId = tonumber(args[1])
        TriggerClientEvent('hospital:client:Revive', ServerId, true)
        print(Lang:t('info.revived'))
    end
end, false)