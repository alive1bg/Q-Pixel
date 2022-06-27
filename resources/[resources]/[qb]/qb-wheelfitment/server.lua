QBCore = exports['qb-core']:GetCoreObject()

local tablo = {
    ["qb-wheelfitment:zone1"] = false,
    ["qb-wheelfitment:zone2"] = false
}

RegisterServerEvent('qb-wheelfitment_sv:saveWheelfitment', function(plate, table, veh)
    if plate ~= nil or table ~= nil then
        MySQL.update('UPDATE player_vehicles SET wheelfit = @wheelfit WHERE plate = @plate', {
            ['@plate'] = plate,
            ['@wheelfit'] = json.encode(table)
        })

        TriggerClientEvent('qb-wheelfitment_cl:applySavedWheelFitment', -1, table, veh)
    end
end)

QBCore.Functions.CreateCallback('qb-wheelfitment_sv:getIsWheelFitmentInUse', function(source, cb, gelenzone)
    if not tablo[gelenzone] then
        cb(false)
    else
        cb(true)
    end
end)

local function yarramin_fonksiyonu(zone, bool)
    tablo[zone] = bool
end

RegisterServerEvent('bu-orospu-zonelari-kaydet', yarramin_fonksiyonu)

RegisterServerEvent('qb-wheelfitment_sv:setfit', function(data, veh)
    TriggerClientEvent('qb-wheelfitment_cl:applySavedWheelFitment', -1, data, veh)
end)