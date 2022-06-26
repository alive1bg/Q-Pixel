QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
            SetScenarioGroupEnabled(scgrp, false)
        end
		Wait(10000)
    end
end)

local RightClick = false
Citizen.CreateThread(function()
    while true do
        DisableControlAction(0, 140, true)
    DisableControlAction(0, 263, true)
    if RightClick == false then
        DisableControlAction(0,24,true)
    end
    if IsControlPressed(0, 25) then
        RightClick = true
    end
    if IsControlJustReleased(0, 25) then
        RightClick = false
    end
        Wait(1)
    end
end)

AddEventHandler("populationPedCreating", function(x, y, z, model)
	Wait(500)	-- Give the entity some time to be created
	local found, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
	SetPedDropsWeaponsWhenDead(handle, false)
end)

CreateThread(function() -- all these should only need to be called once
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetAudioFlag("PoliceScannerDisabled", true)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	DistantCopCarSirens(false)
    RemoveVehiclesFromGeneratorsInArea(306.09 - 300.0, -1459.3 - 300.0, 46.51 - 300.0, 306.09 + 300.0, -1459.35 + 300.0, 46.51 + 300.0) -- central los santos medical center
	RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- central los santos medical center
	RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- police station mission row
	RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
	RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
	RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
	RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- police station paleto
	RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- police station sandy
	RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW
end)


CreateThread(function()
	while true do
		Wait(1)
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			SetPedMinGroundTimeForStungun(ped, math.random(4000, 7000))
		else
			Wait(1000)
		end
	end
end)


CreateThread(function() -- disable wanted level
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

	SetMaxWantedLevel(0)
end)

if Config.IdleCamera then --Disable Idle Cinematic Cam
  	DisableIdleCamera(true)
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
		if weapon ~= GetHashKey("WEAPON_UNARMED") then
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end

			if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER")then
				if IsPedShooting(ped) then
					SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
				end
			end
		else
			Wait(500)
		end
        Wait(7)
    end
end)

CreateThread(function() -- prevent weapon drop upon player death
    local pedPool = GetGamePool('CPed')
    for k,v in pairs(pedPool) do
        SetPedDropsWeaponsWhenDead(v, false)
    end
    Wait(500)
end)

-- remove stuck props in hand
RegisterCommand('propstuck', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            TriggerEvent("backitems:displayItems", false)
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
            TriggerEvent("backitems:displayItems", true)
        end
    end
end)

-- get rid of the pesky "combat stance" after punching, shooting ect
CreateThread(function()
    while true do
        Wait(15)
        local ped = PlayerPedId()
        if IsPedUsingActionMode(ped) then
            SetPedUsingActionMode(ped, -1, -1, 1)
        end
    end
end)

CreateThread(function() -- STOP IDLE CAMERA THAT PLAYS AFTER 30 SECS
    while true do
        InvalidateIdleCam()
        InvalidateVehicleIdleCam()
        Wait(29000) --The idle camera activates after 30 second so we don't need to call this per frame
    end
end)

CreateThread(function() -- TRAIN SPAWNS / SPAWN TRAINS
	SwitchTrainTrack(0, true)
	SwitchTrainTrack(3, true)
	N_0x21973bbf8d17edfa(0, 120000)
	SetRandomTrains(true)
end)

CreateThread(function() -- ONLY 2 CAMERA VIEWS
    local setpov = false
    while true do
        DisableControlAction(0, 0, true) -- Controlkey "V"
        local PlayerPed = PlayerPedId()
        local VehicleCurrentCamViewMode = GetFollowVehicleCamViewMode(PlayerPed) -- src https://runtime.fivem.net/doc/natives/?_0xAC253D7842768F48
        if IsPedInAnyVehicle(PlayerPed) then -- When in Vehicle
            if not setpov and IsDisabledControlJustPressed(0, 0) then
                setpov = true
                SetFollowVehicleCamViewMode(4) -- First Person View
            elseif setpov and IsDisabledControlJustPressed(0, 0) then
                setpov = false
                SetFollowVehicleCamViewMode(0) -- Third Person View Close
            end
        elseif not IsPedInAnyVehicle(PlayerPed2) then -- When on foot
            local CurrentCamViewMode = GetFollowPedCamViewMode(PlayerPed)
            if not setpov and IsDisabledControlJustPressed(0, 0) then
                setpov = true
                SetFollowPedCamViewMode(4)
            elseif setpov and IsDisabledControlJustPressed(0, 0) then
                setpov = false
                SetFollowPedCamViewMode(0)
            end
        end
        Wait(0)
    end
end)

CreateThread(function() -- ANTI JUMP SPAM -- SEE CONFIG TO ADJUST %
    while true do
        Wait(100)
        if IsPedOnFoot(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) and (IsPedRunning(PlayerPedId()) or IsPedSprinting(PlayerPedId())) and not IsPedClimbing(PlayerPedId()) and IsPedJumping(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) then
            local Result = math.random()
            if Result < Config.RagdollChance then 
                Wait(600)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                SetPedToRagdoll(PlayerPedId(), 5000, 1, 2)
            else
                Wait(2000)
            end
        end
    end
end)

-- stop controller aim exploit START
--[[CreateThread(function()
    while true do
        Wait(0)
        if IsPedArmed(PlayerPedId(), 2) and IsPedArmed(PlayerPedId(), 4) then
        SetPlayerLockon(PlayerId(), false)
        end
    end
end)]]
-- controller aim exploit start END

-- PICKUP BIKES START
RegisterNetEvent('pickup:bike')
AddEventHandler('pickup:bike', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)
    local bone = GetPedBoneIndex(playerPed, 0xE5F3)
    local bike = false

    if GetEntityModel(vehicle) == GetHashKey("bmx") or GetEntityModel(vehicle) == GetHashKey("bimx") or GetEntityModel(vehicle) == GetHashKey("scorcher") or GetEntityModel(vehicle) == GetHashKey("cruiser") or GetEntityModel(vehicle) == GetHashKey("fixter") or GetEntityModel(vehicle) == GetHashKey("tribike") or GetEntityModel(vehicle) == GetHashKey("tribike2") or GetEntityModel(vehicle) == GetHashKey("tribike3") then

    AttachEntityToEntity(vehicle, playerPed, bone, 0.0, 0.24, 0.10, 340.0, 330.0, 330.0, true, true, false, true, 1, true)
	QBCore.Functions.Notify('Press G to drop the bike ..', 'error')

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do Wait(0) end
    TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 2.0, 2.0, 50000000, 51, 0, false, false, false)
    bike = true

    RegisterCommand('dropbike', function()
        if IsEntityAttached(vehicle) then
        DetachEntity(vehicle, nil, nil)
        SetVehicleOnGroundProperly(vehicle)
        ClearPedTasksImmediately(playerPed)
        bike = false
        end
    end, false)

        RegisterKeyMapping('dropbike', 'Drop Bike', 'keyboard', 'g')
                CreateThread(function()
                while true do
                Wait(0)
                if bike and IsEntityPlayingAnim(playerPed, "anim@heists@box_carry@", "idle", 3) ~= 1 then
                    RequestAnimDict("anim@heists@box_carry@")
                    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do Wait(0) end
                    TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 2.0, 2.0, 50000000, 51, 0, false, false, false)
                    if not IsEntityAttachedToEntity(playerPed, vehicle) then
                        bike = false
                        ClearPedTasksImmediately(playerPed)
                    end
                end
            end
        end)
    end
end)

-- PICKUP BIKES END




-- taser ammo

maxTaserCarts = 2 -- The amount of taser cartridges a person can have.

local taserCartsLeft = maxTaserCarts

RegisterNetEvent("FillTaser")
AddEventHandler("FillTaser",function(source, args, rawCommand)
    QBCore.Functions.Progressbar("load_tazer", "Reloading Tazer..", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@weapons@pistol@singleshot_str",
        anim = "reload_aim",
        flags = 48,
    }, {}, {}, function() -- Done
        taserCartsLeft = maxTaserCarts
        TriggerServerEvent("QBCore:Server:RemoveItem", "taserammo", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taserammo"], "remove")  
    end)
end) 

local taserModel = GetHashKey("WEAPON_STUNGUN")

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if GetSelectedPedWeapon(ped) == taserModel then
            if IsPedShooting(ped) then
                DisplayAmmoThisFrame(true)
                taserCartsLeft = taserCartsLeft - 1
            end
        end
        if taserCartsLeft <= 0 then
            if GetSelectedPedWeapon(ped) == taserModel then
                SetPlayerCanDoDriveBy(ped, false)
                DisablePlayerFiring(ped, true)
                if IsControlJustReleased(0, 106) then
                    QBCore.Functions.Notify("You need to reload your taser!", "error")
                end
            end
        end
        if longerTazeTime then
            SetPedMinGroundTimeForStungun(ped, longerTazeSecTime * 1000)
        end
    end
end)