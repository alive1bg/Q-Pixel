CreateThread(function()
	while true do
		Wait(0)

		if NetworkIsPlayerActive(PlayerId()) then
			TriggerEvent("QBCore:playerSessionStarted")
			break
		end
	end
end)

local HasLoaded = false

AddEventHandler("QBCore:playerSessionStarted", function()
    while not HasLoaded do
        Wait(100)
    end
    ShutdownLoadingScreen()
    QBCore.SpawnManagerInitialize()
end)

RegisterNetEvent("base:disableLoading", function()
    if not HasLoaded then
        HasLoaded = true
    end
end)

-- CreateThread(function()
--     TriggerEvent("base:disableLoading")
-- end)

function QBCore.SpawnManagerInitialize(self)
    CreateThread(function()        
        FreezeEntityPosition(PlayerPedId(), true)

        TransitionToBlurred(500)
        DoScreenFadeOut(500)

        ShutdownLoadingScreen()

        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)

        SetCamRot(cam, 0.0, 0.0, -45.0, 2)
        SetCamCoord(cam, -682.0, -1092.0, 226.0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, true)

        local ped = PlayerPedId()

        SetEntityCoordsNoOffset(ped, -682.0, -1092.0, 200.0, false, false, false, true)

        SetEntityVisible(ped, false)

        DoScreenFadeIn(500)

        while IsScreenFadingIn() do
            Wait(0)
        end

        SetEntityCoordsNoOffset(PlayerPedId(), vector3(-3972.28, 2017.22, 500.92), false, false, false, false)
        FreezeEntityPosition(PlayerPedId(), true)

        TriggerEvent("PlayerSpawned2")
    end)
end

function QBCore.SpawnManagerInitialSpawn(self)
    CreateThread(function()
        DisableAllControlActions(0)
        DoScreenFadeOut(10)

        while IsScreenFadingOut() do
            Wait(0)
        end

        --Tells raid clothes to set ped to correct skin
        TriggerEvent("initialSpawnModelLoaded")

        local ped = PlayerPedId()

        SetEntityVisible(ped, true)
        FreezeEntityPosition(PlayerPedId(), false)
        
        ClearPedTasksImmediately(ped)
        RemoveAllPedWeapons(ped)
        --ClearPlayerWantedLevel(PlayerId())

        EnableAllControlActions(0)
        TriggerEvent("character:finishedLoadingChar")
    end)
end

AddEventHandler("QBCore:firstSpawn", function()
    QBCore.SpawnManagerInitialSpawn()

    CreateThread(function()
        Wait(600)
        FreezeEntityPosition(PlayerPedId(), false)
    end)
end)