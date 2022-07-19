local QBCore = exports['qb-core']:GetCoreObject()

local pedSpawned = false

-- Minigame and Heist Starting 

RegisterNetEvent('gutso-bobcat:startHeist', function() 
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    QBCore.Functions.TriggerCallback("gutso-bobcat:server:enoughCops", function(enoughCops)  
        if enoughCops >= Config.MinimumPolice then   
            QBCore.Functions.TriggerCallback("gutso-bobcat:server:cooldown", function(cooldown)  
                if not cooldown then
                    if #(coords - Config.FirstDoor) < 2.0 then  
                        exports["memorygame"]:thermiteminigame(3, 3, 3, 10, function() 
                            firstDoor() 
                        end, function() 
                            QBCore.Functions.Notify('You failed!', "error")
                        end) 
                    elseif #(coords - Config.SecondDoor) < 2.0 then      
                        exports["memorygame"]:thermiteminigame(3, 3, 3, 10, function() 
                            secondDoor() 
                            TriggerServerEvent('gutso-bobcat:server:startCooldown')
                            print('cooldown started')
                        end, function() 
                            QBCore.Functions.Notify('You failed!', "error")
                        end) 
                    end
                else
                    QBCore.Functions.Notify('This place is already robbed!', 'error')
                end
            end)
            
        else
            QBCore.Functions.Notify('Not enough cops!', 'error')
        end
    end)
end)

-- Opening Doors 

function firstDoor()
    loadAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(882.1660, -2258.35, 30.54, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 882.1660, -2258.35, 30.54,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomb = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomb, false, true)
    AttachEntityToEntity(bomb, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomb, 1, 1)
    FreezeEntityPosition(bomb, true)
    TriggerServerEvent("gutso-bobcat:particles", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomb)
    StopParticleFxLooped(effect, 0)
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermitecharge", 1) 
    TriggerEvent("gutso-bobcat:openFirstDoor") 
end 


function secondDoor() 
    loadAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(880.4080, -2264.50, 30.441, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 880.4080, -2264.50, 30.441,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomb = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomb, false, true)
    AttachEntityToEntity(bomb, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomb, 1, 1)
    FreezeEntityPosition(bomb, true)
    TriggerServerEvent("gutso-bobcat:particles2", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomb)
    StopParticleFxLooped(effect, 0)
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermitecharge", 1) 
	TriggerEvent("gutso-bobcat:openSecondDoor")
end

-- Doorlocks

RegisterNetEvent('gutso-bobcat:openFirstDoor', function()
    Wait(500)
    -- TriggerServerEvent('qb-doorlock:server:updateState', 'bobcatfirst', false, nil, false, true)
    TriggerServerEvent("doors:change-lock-state", 240)
    TriggerServerEvent("doors:change-lock-state", 241)
end)

RegisterNetEvent('gutso-bobcat:openSecondDoor', function()
    Wait(500)
    -- TriggerServerEvent('qb-doorlock:server:updateState', 'bobcatsecond', false, nil, false, true)
    TriggerServerEvent("doors:change-lock-state", 242)
end)

RegisterNetEvent('gutso-bobcat:openThirdDoor', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    if #(coords - Config.ThirdDoor) < 2.0 then
        local id_card = `p_ld_id_card_01`
        RequestModel(id_card)
        while not HasModelLoaded("p_ld_id_card_01") do
            Wait(1)
        end
        SetEntityCoords(ped, Config.ThirdDoor.x, Config.ThirdDoor.y, Config.ThirdDoor.z)
        idProp = CreateObject(id_card, coords, 1, 1, 0)
        local boneIndex = GetPedBoneIndex(ped, 28422)
        AttachEntityToEntity(idProp, ped, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

        loadAnimDict("amb@prop_human_atm@male@enter")
        loadAnimDict("amb@prop_human_atm@male@idle_a")
        TaskPlayAnim(ped, "amb@prop_human_atm@male@enter", "enter", 1.0, 1.0, -1, 49, 0, 0, 0, 0)

        DetachEntity(idProp, false, false)
        Wait(1000)
        if Config.SpawnGuards then
            TriggerEvent('gutso-bobcat:client:npcSync')
        end
        Wait(1000)
        -- TriggerServerEvent('qb-doorlock:server:updateState', 'bobcatthird', false, nil, false, true)
        TriggerServerEvent("doors:change-lock-state", 243)
        TriggerServerEvent("doors:change-lock-state", 244)
        Wait(500)
        TriggerServerEvent("QBCore:Server:RemoveItem", "bobcatsecuritycard", 1)
    end
end)

-- Particles 

RegisterNetEvent("gutso-bobcat:ptfxparticle", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Wait(1)
    end
        ptfx = vector3(882.1320, -2257.34, 30.461)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(4000) 
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("gutso-bobcat:ptfxparticle2", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Wait(1)
    end
        ptfx = vector3(880.49, -2263.60, 30.441)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(4000) 
    StopParticleFxLooped(effect, 0)
end)    

-- Ped Create

local guards = {} 

RegisterNetEvent('gutso-bobcat:client:npcSync', function()
    SpawnGuards()
end) 

function SpawnGuards()
    ClearAreaOfEverything(894.35, -2278.84, 30.44, 65.34, true, true, true, true)
    local ped = PlayerPedId() 

    SetPedRelationshipGroupHash(ped, GetHashKey("PLAYER"))
    AddRelationshipGroup("Guards")

    for i = 1, #Config.Guards do 
        local guard = Config.Guards[i]
        RequestModel(GetHashKey(guard.ped))
        while not HasModelLoaded(GetHashKey(guard.ped)) do 
            Wait(1)
        end
        guards[i] = CreatePed(4, GetHashKey(guard.ped), guard.pos[1], guard.pos[2], guard.pos[3], guard.pos[4], false, true)  
        NetworkRegisterEntityAsNetworked(guards[i]) 
        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(guards[i]), true)
        SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(guards[i]), true) 
        GiveWeaponToPed(guards[i], GetHashKey(guard.weapon), 255, false, false) 
        SetPedRelationshipGroupHash(guards[i], GetHashKey("Guards"))
        SetPedAccuracy(guards[i], guard.accuracy)
        SetPedArmour(guards[i], guard.armor)
        SetPedFleeAttributes(guards[i], 0, false)
        SetPedCanSwitchWeapon(guards[i], true)
        SetPedDropsWeaponsWhenDead(guards[i], false)
        SetPedAsEnemy(guards[i], true)
        SetPedCombatMovement(guards[i], guard.aggresiveness)
        SetPedAlertness(guards[i], guard.alertness)
        SetPedCombatRange(guards[i], guard.range)
        SetPedSeeingRange(guards[i], 150.0)
        SetPedHearingRange(guards[i], 150.0)
        SetPedCombatAttributes(guards[i], 5000, 1)
        SetPedCanRagdollFromPlayerImpact(guards[i], false)
        SetEntityAsMissionEntity(guards[i])
        SetEntityVisible(guards[i], true)
        SetEntityMaxHealth(guards[i], guard.health)
        SetEntityHealth(guards[i], guard.health) 
        TaskGuardCurrentPosition(guards[i], 5.0, 5.0, 1) 
    end

    SetRelationshipBetweenGroups(0, GetHashKey("Guards"), GetHashKey("Guards"))
    SetRelationshipBetweenGroups(5, GetHashKey("Guards"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("Guards"))	
end


-- Vault Opening 

CreateThread(function()
    local hash = `s_m_m_security_01`
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(3)
    end 
    hostage = CreatePed("PED_TYPE_CIVFEMALE", hash, 870.1760, -2288.20, 30.441, 175.21, true, true)
    SetBlockingOfNonTemporaryEvents(hostage, true)
    SetPedDiesWhenInjured(hostage, false)
    SetPedCanPlayAmbientAnims(hostage, true)
    SetPedCanRagdollFromPlayerImpact(hostage, false)
	SetEntityInvincible(hostage, false)
    loadAnimDict('random@arrests@busted')
    TaskPlayAnim(hostage, 'random@arrests@busted', 'idle_a', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
end) 

RegisterNetEvent('gutso-bobcat:commandPed', function() 
    ClearPedTasks(hostage)
	TaskGoStraightToCoord(hostage, 869.64, -2291.86, 30.47, 171.55, -1, 265.61, 0)
	Wait(2000)
	TaskGoStraightToCoord(hostage, 892.65, -2294.4, 30.47, 348.77, -1, 350.61, 0)
	Wait(6500)
	TriggerEvent("gutso-bobcat:commandPed2")
end)

RegisterNetEvent('gutso-bobcat:commandPed2', function()
	TaskGoStraightToCoord(hostage, 895.11, -2285.09, 30.47, 84.16, -1, 82.56, 0)
	Wait(6500)

    local grenade = `w_ex_grenadefrag`
    RequestModel(grenade)
    while not HasModelLoaded(grenade) do
        Wait(1)
    end

    local coords = GetEntityCoords(hostage)
    local object = CreateObject(grenade, coords.x, coords.y, coords.z, true, false, false)
    AttachEntityToEntity(object, hostage, GetPedBoneIndex(hostage, 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, true, true, 0, true) 

    loadAnimDict('weapons@projectile@grenade_str')
    TaskPlayAnim(hostage, 'weapons@projectile@grenade_str', 'throw_h_fb_backward', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
	Wait(1000)
	AddExplosion(890.7849, -2284.88, 30.441, 32, 150000.0, true, false, 4.0)
	AddExplosion(894.0084, -2284.90, 30.580, 32, 150000.0, true, false, 4.0)  
    TriggerServerEvent('gutso-bobcat:server:explodeVaultDoorSync')
    TriggerEvent("gutso-bobcat:propCreate")
end)

CreateThread(function()
	RequestIpl("prologue06_int_np")
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RefreshInterior(interiorid)
end) 

RegisterNetEvent('gutso-bobcat:client:explodeVaultDoor', function()
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_broken")
	RemoveIpl(interiorid, "np_prolog_broken")
	DeactivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RefreshInterior(interiorid)   

    if Config.SpawnGuards then 
        for i = 1, #guards do 
            SetEntityAsNoLongerNeeded(guards[i])
        end
    end
end) 

RegisterNetEvent('gutso-bobcat:client:resetVault', function()
    print('vault resetlendi')
    RequestIpl("prologue06_int_np")
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_clean") 
    DeactivateInteriorEntitySet(interiorid, "np_prolog_broken")
	RefreshInterior(interiorid)
end)

-- Gun Receiving

local grabbed = false 
local grabbed2 = false
local grabbed3 = false

RegisterNetEvent('gutso-bobcat:giveSmgs', function()  
    if grabbed == false then  
        grabSmgs() 
        grabbed = true
    else  
        QBCore.Functions.Notify('You already plundered here!', 'error')  
    end
end)

RegisterNetEvent('gutso-bobcat:giveExplosives', function()  
    if grabbed2 == false then  
        grabExplosives() 
        grabbed2 = true
    else  
        QBCore.Functions.Notify('You already plundered here!', 'error')  
    end
end)

RegisterNetEvent('gutso-bobcat:giveRifles', function()  
    if grabbed3 == false then  
        grabRifles() 
        grabbed3 = true
    else  
        QBCore.Functions.Notify('You already plundered here!', 'error')  
    end
end)

function grabSmgs()
    QBCore.Functions.Progressbar('plundering', 'Collecting..', 3000, false, true, {
        disableMovement = true, 
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin", 
        flags = 0,
    }, {}, {}, function() 
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('gutso-bobcat:giveRandomSmgs')  
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId()) 
        QBCore.Functions.Notify('You cancelled!', 'error')  
    end)
end

function grabExplosives()
    QBCore.Functions.Progressbar('plundering', 'Collecting..', 3000, false, true, {
        disableMovement = true, 
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin", 
        flags = 0,
    }, {}, {}, function() 
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('gutso-bobcat:giveRandomExplosives')  
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId()) 
        QBCore.Functions.Notify('You cancelled!', 'error')  
    end)
end

function grabRifles()
    QBCore.Functions.Progressbar('plundering', 'Collecting..', 3000, false, true, {
        disableMovement = true, 
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin", 
        flags = 0,
    }, {}, {}, function() 
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('gutso-bobcat:giveRandomRifles')  
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId()) 
        QBCore.Functions.Notify('You cancelled!', 'error')  
    end)
end

-- Target Export 
CreateThread(function()
    exports['qb-target']:AddBoxZone("bobcatPed", vector3(870.22, -2288.59, 30.47), 0.5, 0.5, {
        name = "bobcatPed",
        heading = 0,
        debugPoly = false,
        minZ = 30.0,
        maxZ = 30.7,
    }, {
        options = {
            {
                type = "server",
                event = "gutso-bobcat:server:commandPed",
                icon = "fas fa-bomb",
                label = "Explode Door!",
            }
        },
        distance = 2.5
    })
    exports['qb-target']:AddBoxZone("bobcatSmg",  vector3(881.33, -2282.6, 30.47), 1.8, 1.8, {
        name = "bobcatSmg",
        heading = 335,
        debugPoly = false,
        minZ = 29.5,
        maxZ = 30.9,
    }, {
        options = {
            {
                type = "client",
                event = "gutso-bobcat:giveSmgs",
                icon = "fas fa-circle",
                label = "Grab!",
            },
        },
        distance = 2.5
    })
    exports['qb-target']:AddBoxZone("bobcatExplosives", vector3(882.29, -2286.37, 30.47), 1.8, 1.8, {
        name = "bobcatExplosives",
        heading = 335,
        debugPoly = false,
        minZ = 29.5,
        maxZ = 30.9,
    }, {
        options = {
            {
                type = "client",
                event = "gutso-bobcat:giveExplosives",
                icon = "fas fa-circle",
                label = "Grab!",
            },
        },
        distance = 4.5
    })
    exports["qb-target"]:AddBoxZone("bobcatRifles", vector3(886.63, -2287.1, 30.47), 1.8, 1.5, {
        name = "bobcatRifles",
        heading = 270,
        debugPoly = false,
        minZ = 29.5,
        maxZ = 30.5,
    }, {
        options = {
            {
                type = "client",
                event = "gutso-bobcat:giveRifles",
                icon = "fas fa-circle",
                label = "Grab!",
            },
        },
        distance = 4.5
    })
end)

-- Load Anim Dict 

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end 