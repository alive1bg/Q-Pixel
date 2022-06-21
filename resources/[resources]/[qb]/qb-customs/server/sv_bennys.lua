local QBCore = exports['qb-core']:GetCoreObject()

local repairCost = vehicleBaseRepairCost

RegisterNetEvent('qb-customs:attemptPurchase', function(type, upgradeLevel)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local balance = nil
    if Player.PlayerData.job.name == "tuner" or Player.PlayerData.job.name == "mechanic" or Player.PlayerData.job.name == "hayesauto" then
        balance = exports['qb-management']:GetAccount(Player.PlayerData.job.name)
    else
        balance = Player.Functions.GetMoney(moneyType)
    end
    if type == "repair" then
        if balance >= repairCost then
            if Player.PlayerData.job.name == "tuner" or Player.PlayerData.job.name == "mechanic" or Player.PlayerData.job.name == "hayesauto" then
                exports['qb-management']:RemoveMoney(Player.PlayerData.job.name, repairCost)
            else
                Player.Functions.RemoveMoney(moneyType, repairCost, "tuner")
                exports['qb-management']:AddMoney("tuner", repairCost)
            end
            TriggerClientEvent('qb-customs:purchaseSuccessful', source)
        else
            TriggerClientEvent('qb-customs:purchaseFailed', source)
        end
    elseif type == "performance" then
        if balance >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('qb-customs:purchaseSuccessful', source)
            if Player.PlayerData.job.name == "tuner" or Player.PlayerData.job.name == "mechanic" or Player.PlayerData.job.name == "hayesauto" then
                exports['qb-management']:RemoveMoney(Player.PlayerData.job.name, vehicleCustomisationPrices[type].prices[upgradeLevel])
            else
                Player.Functions.RemoveMoney(moneyType, vehicleCustomisationPrices[type].prices[upgradeLevel], "tuner")
                exports['qb-management']:AddMoney("tuner", vehicleCustomisationPrices[type].prices[upgradeLevel])
            end
        else
            TriggerClientEvent('qb-customs:purchaseFailed', source)
        end
    else
        if balance >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('qb-customs:purchaseSuccessful', source)
            if Player.PlayerData.job.name == "tuner" or Player.PlayerData.job.name == "mechanic" or Player.PlayerData.job.name == "hayesauto" then
                exports['qb-management']:RemoveMoney(Player.PlayerData.job.name, vehicleCustomisationPrices[type].price)
            else
                Player.Functions.RemoveMoney(moneyType, vehicleCustomisationPrices[type].price, "tuner")
                exports['qb-management']:AddMoney("tuner", vehicleCustomisationPrices[type].price)
            end
        else
            TriggerClientEvent('qb-customs:purchaseFailed', source)
        end
    end
end)

RegisterNetEvent('qb-customs:updateRepairCost', function(cost)
    repairCost = cost
end)

RegisterNetEvent("updateVehicle", function(myCar)
    local src = source
    if IsVehicleOwned(myCar.plate) then
        MySQL.Async.execute('UPDATE player_vehicles SET mods = ? WHERE plate = ?', {json.encode(myCar), myCar.plate})
    end
end)

function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        retval = true
    end
    return retval
end

RegisterNetEvent('qb-customs:paybiatch', function()
    local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
    xPlayer.Functions.RemoveMoney("bank", 500, "Bennys Repair")
end)