local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('pwasher:onPumpBreak', function()
    QBCore.Functions.Notify("You Broke The Pressure Pump, A Fee Of $" .. Config.PumpBreakFee .. " Have Been Deducted!")
    TriggerServerEvent('pwasher:pay', Config.PumpBreakFee)
end)

AddEventHandler('pwasher:requestEquipPump', function()
    local currentCash = QBCore.Functions.GetPlayerData().money['cash']
    if currentCash >= Config.PumpUsePrice then
        TriggerEvent("pwasher:equipPump")
        TriggerServerEvent('pwasher:pay', Config.PumpUsePrice)
    else
        QBCore.Functions.Notify("You don't have enough money to use the pressure pump!")
    end
end)

AddEventHandler('pwasher:playSplashParticle', function(pname, posx, posy, posz, heading)
	CreateThread(function()
        UseParticleFxAssetNextCall("core")
        local pfx = StartParticleFxLoopedAtCoord(pname, posx, posy, posz, 0.0, 0.0, heading, 1.0, false, false, false, false)
        Wait(100)
        StopParticleFxLooped(pfx, 0)
    end)
end)

AddEventHandler('pwasher:playWaterParticle', function(pname, entity, density)
    print("Play Particle")
	CreateThread(function()
        for i = 0, density, 1 do
            UseParticleFxAssetNextCall("core")
            StartParticleFxNonLoopedOnEntity(pname, objID, 0.5, 0.0, 0.0, 90.0, 0.0, -90.0, 1.0, true, true, true)
        end
    end)
end)

CreateThread(function()
    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded("core") do
         Wait(1)
    end
end)