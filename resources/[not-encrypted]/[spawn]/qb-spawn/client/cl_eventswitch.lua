function Login.playerLoaded() end

function Login.characterLoaded()
    TriggerServerEvent('character:loadspawns')
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    SetEntityVisible(PlayerPedId(), true)
    FreezeEntityPosition(PlayerPedId(), false)
end

function Login.characterSpawned()

    isNear = false
    
    if Spawn.isNew then
        Wait(1000)
    end

    SetPedMaxHealth(PlayerPedId(), 200)
    -- SetPlayerMaxArmour(PlayerId(), 60)
    
    runGameplay()
    Spawn.isNew = false
end

RegisterNetEvent("qb-spawn:characterSpawned", Login.characterSpawned);
