RegisterNetEvent('qb-varheist:client:SpawnGuards', function(netIds)
    Wait(1000)
    local ped = PlayerPedId()
    if VarPoly:isPointInside(GetEntityCoords(ped)) then
        for i=1, #netIds, 1 do
            local guard = NetworkGetEntityFromNetworkId(netIds[i])
            SetPedDropsWeaponsWhenDead(guard, false)
            GiveWeaponToPed(guard, `WEAPON_CARBINERIFLE`, 250, false, true)
            SetPedMaxHealth(guard, 500)
            SetPedArmour(guard, 200)
            SetCanAttackFriendly(guard, false, true)
            TaskCombatPed(guard, ped, 0, 16)
            SetPedCombatAttributes(guard, 46, true)
            SetPedCombatAttributes(guard, 0, false)
            SetPedCombatAbility(guard, 100)
            SetPedAsCop(guard, true)
            SetPedRelationshipGroupHash(guard, `HATES_PLAYER`)
            SetPedAccuracy(guard, 60)
            SetPedFleeAttributes(guard, 0, 0)
            SetPedKeepTask(guard, true)
            TaskGoStraightToCoord(guard, 2172.03, 2923.67, -81.07, 1, -1, 0.0, 0.0)
        end
    end
end)

RobGuard = function(entity)
    local ped = PlayerPedId()
    if VarPoly:isPointInside(GetEntityCoords(ped)) then
        -- ANIMATION
        RequestAnimDict("pickup_object")
        while not HasAnimDictLoaded("pickup_object") do Wait(10) end
        TaskPlayAnim(ped, "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false)
        -- REWARD
        local netId = NetworkGetNetworkIdFromEntity(entity)
        TriggerServerEvent('qb-varheist:server:LootGuards', netId)
        -- FINISH
        Wait(1000)
        ClearPedTasks(ped)
    end
end