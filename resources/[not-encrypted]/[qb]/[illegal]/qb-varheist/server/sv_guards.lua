local spawnPoints = { -- You can always add more
    vector4(2348.64, 2895.72, -84.72, 85.99),
    vector4(2356.29, 2894.09, -84.8, 104.65),
    vector4(2351.87, 2900.04, -84.8, 118.62),
    vector4(2348.34, 2908.9, -84.8, 84.71),
    vector4(2336.12, 2918.24, -84.8, 323.2),
    vector4(2336.34, 2927.39, -84.8, 343.22),
    vector4(2341.57, 2933.83, -84.8, 219.71),
    vector4(2342.29, 2942.15, -84.79, 291.39),
    vector4(2350.96, 2942.3, -84.8, 301.82),
    vector4(2355.72, 2948.4, -84.8, 214.08),
    vector4(2336.17, 2948.37, -84.8, 97.58),
    vector4(2331.62, 2944.18, -84.8, 119.78),
    vector4(2316.23, 2944.1, -84.8, 63.29),
    vector4(2309.08, 2943.75, -84.8, 111.13),
    vector4(2305.99, 2944.4, -84.8, 49.05),
    vector4(2293.85, 2943.36, -84.8, 81.43),
    vector4(2289.5, 2942.74, -84.8, 56.77),
    vector4(2291.12, 2939.04, -84.8, 358.31),
    vector4(2296.06, 2935.22, -84.8, 170.62),
    vector4(2285.87, 2927.51, -84.8, 187.8),
    vector4(2287.7, 2923.99, -84.8, 353.04),
    vector4(2283.42, 2914.92, -84.8, 30.56),
    vector4(2285.5, 2897.23, -84.8, 12.49),
    vector4(2273.36, 2901.84, -84.8, 173.85),
    vector4(2271.53, 2902.52, -84.8, 212.78),
    vector4(2253.45, 2900.92, -84.8, 349.86),
    vector4(2251.57, 2897.54, -84.8, 342.64),
    vector4(2254.25, 2934.43, -84.8, 169.56),
    vector4(2252.94, 2941.41, -84.8, 335.15),
    vector4(2261.08, 2948.04, -84.8, 328.82),
    vector4(2276.27, 2947.71, -84.8, 111.61),
    vector4(2239.97, 2948.02, -84.8, 292.66),
    vector4(2240.51, 2944.93, -84.8, 220.32),
    vector4(2233.16, 2937.89, -84.8, 246.2),
    vector4(2234.5, 2933.19, -84.8, 98.52),
    vector4(2234.21, 2928.0, -84.8, 166.94),
    vector4(2233.64, 2922.17, -84.8, 175.72),
    vector4(2234.32, 2907.04, -84.8, 155.93),
    vector4(2230.12, 2899.39, -84.8, 42.65),
    vector4(2224.56, 2905.45, -84.8, 56.29),
    vector4(2207.37, 2899.71, -84.8, 12.03),
    vector4(2202.58, 2899.63, -84.8, 179.18),
    vector4(2192.06, 2904.31, -84.8, 13.4),
    vector4(2193.07, 2913.23, -84.8, 353.99),
    vector4(2193.12, 2921.22, -84.8, 54.72),
    vector4(2193.08, 2930.71, -84.8, 20.3),
    vector4(2191.73, 2937.7, -84.8, 11.57),
    vector4(2170.67, 2937.18, -84.8, 270.77),
    vector4(2162.72, 2938.35, -84.8, 84.77),
    vector4(2150.09, 2939.85, -84.8, 51.05),
    vector4(2141.73, 2941.56, -84.8, 85.39),
    vector4(2131.16, 2943.37, -84.8, 88.83),
    vector4(2122.33, 2945.5, -84.8, 90.8),
    vector4(2114.63, 2946.4, -84.8, 95.45),
    vector4(2105.22, 2948.63, -84.8, 116.99),
    vector4(2092.95, 2949.32, -84.8, 62.95),
    vector4(2083.0, 2949.54, -84.8, 97.06),
    vector4(2073.13, 2949.97, -84.8, 94.08),
    vector4(2068.34, 2949.65, -84.76, 93.55),
    vector4(2054.01, 2949.87, -84.8, 88.96),
    vector4(2046.21, 2949.57, -84.8, 93.94),
    vector4(2030.47, 2950.31, -84.8, 87.48),
    vector4(2022.95, 2949.87, -84.8, 104.48),
    vector4(2012.66, 2950.16, -84.8, 93.26),
    vector4(2002.64, 2950.12, -84.8, 87.98),
    vector4(1993.36, 2950.15, -84.8, 86.34),
    vector4(1984.05, 2950.59, -84.8, 78.29),
    vector4(1979.36, 2946.84, -84.8, 201.06),
    vector4(1979.36, 2941.11, -84.79, 152.48),
    vector4(1978.93, 2932.01, -84.8, 195.31),
    vector4(1979.13, 2923.29, -84.79, 182.53),
    vector4(1979.26, 2915.32, -84.79, 183.9),
    vector4(1979.06, 2906.47, -84.8, 174.74),
    vector4(1978.69, 2898.78, -84.8, 183.42),
    vector4(1984.52, 2891.35, -84.8, 257.48),
    vector4(1992.38, 2891.29, -84.8, 275.02),
    vector4(2002.75, 2891.3, -84.8, 267.47),
    vector4(2012.27, 2891.24, -84.8, 276.75),
    vector4(2019.07, 2897.19, -84.8, 308.42),
    vector4(2019.83, 2909.88, -84.8, 356.9),
    vector4(2019.41, 2927.56, -84.8, 357.76),
    vector4(2019.07, 2936.79, -84.8, 14.7),
    vector4(2018.94, 2946.35, -84.8, 334.2),
    vector4(2038.94, 2939.23, -84.8, 242.1),
    vector4(2039.41, 2930.98, -84.8, 181.91)
}

local lootTable = { -- You can always add more, make sure to also add this to the confiscateContraband table
    [1] = {item = 'weapon_assaultrifle', amount = 1},
    [2] = {item = 'weapon_appistol', amount = 1},
    [3] = {item = 'weapon_microsmg', amount = 1},
    [4] = {item = 'pistol_ammo', amount = 6},
    [5] = {item = 'rifle_ammo', amount = 6},
    [6] = {item = 'smg_ammo', amount = 6},
    [7] = {item = 'armor', amount = 3},
    [8] = {item = 'bandage', amount = 4},
    [9] = {item = 'water_bottle', amount = 3},
    [10] = {item = 'sandwich', amount = 3},
    [11] = {item = 'weapon_molotov', amount = 1},
    [12] = {item = 'weapon_grenade', amount = 1},
    [13] = {item = 'var_medkit', amount = 3},
}

spawnedGuards = {}

RemoveGuards = function()
    for i=1, #spawnedGuards, 1 do
        if DoesEntityExist(spawnedGuards[i]) then
            DeleteEntity(spawnedGuards[i])
        end
    end
    spawnedGuards = {}
    if debug then
        print('^3[qb-varheist] ^5Deleted All Guards^7')
    end
end

SpawnGuards = function() -- You can always slot more guards in here
    if not varActive then return end
    local netIds = {}
    local netId
    ------------------------
    local guard1 = CreatePed(30, `s_m_y_blackops_01`, spawnPoints[math.random(#spawnPoints)], true, false)
    spawnedGuards[#spawnedGuards+1] = guard1
    while not DoesEntityExist(guard1) do Wait(25) end
    netId = NetworkGetNetworkIdFromEntity(guard1)
    netIds[#netIds+1] = netId
    ------------------------
    local guard2 = CreatePed(30, `s_m_y_marine_03`, spawnPoints[math.random(#spawnPoints)], true, false)
    spawnedGuards[#spawnedGuards+1] = guard2
    while not DoesEntityExist(guard2) do Wait(25) end
    netId = NetworkGetNetworkIdFromEntity(guard2)
    netIds[#netIds+1] = netId
    ------------------------
    local guard3 = CreatePed(30, `s_m_y_blackops_03`, spawnPoints[math.random(#spawnPoints)], true, false)
    spawnedGuards[#spawnedGuards+1] = guard3
    while not DoesEntityExist(guard3) do Wait(25) end
    netId = NetworkGetNetworkIdFromEntity(guard3)
    netIds[#netIds+1] = netId
    ------------------------
    local guard4 = CreatePed(30, `s_m_m_marine_01`, spawnPoints[math.random(#spawnPoints)], true, false)
    spawnedGuards[#spawnedGuards+1] = guard4
    while not DoesEntityExist(guard4) do Wait(25) end
    netId = NetworkGetNetworkIdFromEntity(guard4)
    netIds[#netIds+1] = netId
    ------------------------
    local guard5 = CreatePed(30, `s_m_y_blackops_01`, spawnPoints[math.random(#spawnPoints)], true, false)
    spawnedGuards[#spawnedGuards+1] = guard5
    while not DoesEntityExist(guard5) do Wait(25) end
    netId = NetworkGetNetworkIdFromEntity(guard5)
    netIds[#netIds+1] = netId
    ------------------------
    local guard6 = CreatePed(30, `s_m_y_marine_03`, spawnPoints[math.random(#spawnPoints)], true, false)
    spawnedGuards[#spawnedGuards+1] = guard6
    while not DoesEntityExist(guard6) do Wait(25) end
    netId = NetworkGetNetworkIdFromEntity(guard6)
    netIds[#netIds+1] = netId
    ------------------------
    local guard7 = CreatePed(30, `s_m_y_blackops_03`, spawnPoints[math.random(#spawnPoints)], true, false)
    spawnedGuards[#spawnedGuards+1] = guard7
    while not DoesEntityExist(guard7) do Wait(25) end
    netId = NetworkGetNetworkIdFromEntity(guard7)
    netIds[#netIds+1] = netId
    ------------------------
    local guard8 = CreatePed(30, `s_m_m_marine_01`, spawnPoints[math.random(#spawnPoints)], true, false)
    spawnedGuards[#spawnedGuards+1] = guard8
    while not DoesEntityExist(guard8) do Wait(25) end
    netId = NetworkGetNetworkIdFromEntity(guard8)
    netIds[#netIds+1] = netId
    ------------------------
    local random = getRandomVarPlayer()
    TriggerClientEvent('qb-varheist:client:SpawnGuards', random, netIds)
    if debug then
        print('^3[qb-varheist] ^5Guards: New Wave^7')
    end
    SetTimeout(3*60*1000, SpawnGuards) -- 3 min interval
end

RegisterNetEvent('qb-varheist:server:LootGuards', function(netId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local guard = NetworkGetEntityFromNetworkId(netId)
    if varActive and Player and varPlayers[src] then
        for i=1, math.random(2, 5), 1 do -- minimum two items, maximum five items
            local random = math.random(#lootTable)
            if Player.Functions.AddItem(lootTable[random].item, lootTable[random].amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[lootTable[random].item], 'add')
            end
            Wait(400)
        end
    end
    DeleteEntity(guard)
end)