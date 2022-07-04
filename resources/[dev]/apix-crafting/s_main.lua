local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('apix-crafting:Server:AddXP', function(xp, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("craftingrep", Player.PlayerData.metadata["craftingrep"]+(xp*amount))
end)