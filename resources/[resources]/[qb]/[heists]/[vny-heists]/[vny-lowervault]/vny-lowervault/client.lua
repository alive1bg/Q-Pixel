-- QBCore = nil

-- CreateThread(function()
--     while QBCore == nil do
--         TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
--         Wait(0)
--     end
-- end)
local QBCore = exports['qb-core']:GetCoreObject()


local everythingdone = false
-------------- LASERS -------------------


local laserDrawDistancePoint = vector3(265.25,230.31,97.69)
local laserStartPoints = {
    vector3(264.25, 235.052, 100.383),
    vector3(261.913, 235.368, 101.053),
    vector3(264.77, 230.075, 101.084),
    vector3(260.667, 231.566, 101.047),
    vector3(262.524, 230.227, 100.36),
    vector3(261.085, 233.484, 101.34),
    vector3(271.269, 229.828, 101.417),
    vector3(270.478, 227.998, 101.081),
    vector3(266.314, 229.511, 100.986),
    vector3(267.648, 233.283, 101.108),
    vector3(271.874, 231.745, 101.075),
    vector3(269.873, 233.005, 100.391),
}
local laserGridPoints = {
    vector3(261.012, 235.349, 96.683),
    vector3(259.73, 232.177, 96.683),
    vector3(262.421, 230.49, 96.683),
    vector3(264.217, 235.064, 98.187),
    vector3(265.593, 229.976, 96.683),
    vector3(266.833, 233.34, 96.683),
    vector3(268.187, 228.427, 96.683),
    vector3(269.716, 232.852, 96.683),
    vector3(272.094, 231.224, 96.683),
    vector3(271.164, 227.974, 96.683),
    vector3(271.527, 229.697, 96.683),
    vector3(269.417, 230.443, 96.683),
    vector3(266.969, 231.403, 96.683),
    vector3(263.544, 232.629, 96.683),
    vector3(260.519, 233.779, 96.683),
}

local lasers = {}

local lasersActive = false
local function activateLasers(b)
    for _, laser in pairs(lasers) do
        laser.setActive(b)
    end
end

CreateThread(function()
    for k, coords in pairs(laserStartPoints) do
        local cLaser = Laser.new(coords, laserGridPoints, {
            travelTimeBetweenTargets = {1.0, 4.0},
            waitTimeAtTargets = {0.0, 1.0},
            randomTargetSelection = true,
            name = "laser_" .. tostring(k),
            color = {255, 0, 0, 150}
        })
        lasers[#lasers + 1] = cLaser
    end

    while true do
        local sleep = 1000
        local playerCoords = GetEntityCoords(PlayerPedId())
        if not lasersActive and #(laserDrawDistancePoint - playerCoords) < 20 then
            sleep = 0
            lasersActive = true
            activateLasers(true)
        elseif lasersActive and #(laserDrawDistancePoint - playerCoords) > 20 then
            sleep = 0
            lasersActive = false
            activateLasers(false)
        end
        Wait(sleep)
    end
end)

local canrob = false
CreateThread(function()
    while true do
        local sleep = 1000
        local isblackout = exports["arp-blackout"]:checkblackout() 
        if isblackout then
            sleep = 0
            activateLasers(false)
            canrob = true
            
        end
        Wait(sleep)
    end
end)

--------------- for handshoes (gloves) and fingerprints and config
local function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == `mp_m_freemode_01` then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() -- get config
    PlayerJob = QBCore.Functions.GetPlayerData().job
    QBCore.Functions.TriggerCallback('qb-lowervault:server:GetConfig', function(config)
        Config = config
    end)
    onDuty = true
    --ResetBankDoors()
end)


--------------------- DOUBLE DOORS ---------------

RegisterCommand("resetvaultdoor", function()
	TriggerEvent("refreshvaultdoor")
end)

local doors = false

RegisterNetEvent('lowervault:doors')
AddEventHandler('lowervault:doors', function()
	local ped = PlayerPedId()
    local playercoords = GetEntityCoords(ped)
	local doorlocs = vector3(272.015, 230.872, 97.3000)
	if canrob and not doors and #(playercoords - doorlocs) < 3.0 then
		TaskGoStraightToCoord(PlayerPedId(), 272.015, 230.872, 97.3000, 1.0, -1, 341.78, 0.0)
		TriggerEvent("refreshvaultdoor")
		Wait(2500)
		exports['hacking']:OpenHackingGame(function(Success)
            if Success then
				TrolleySpawn()
				animation()
                TriggerServerEvent("lw:openvault", 1) 
				doors = true
			else
				doors = false
				QBCore.Functions.Notify('Haha you suck.', 'error')
				TriggerServerEvent("QBCore:Server:RemoveItem", "goldlaptop", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["goldlaptop"], "remove", 1)
			end 
		end)
    end
end)



function animation()
	if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
        local pos = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    local ped = PlayerPedId()
    SetEntityHeading(ped, 341.78)

    local animDict = "anim@heists@ornate_bank@hack"
    RequestAnimDict(animDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("hei_prop_heist_card_hack_02")
    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
        or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Wait(100)
    end
    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))

    local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 272.340, 231.368, 97.3000, 272.340, 231.368, 97.3000, 0, 2)
    local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 272.340, 231.368, 97.3000, 272.340, 231.368, 97.3000, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 272.340, 231.368, 97.3000, 272.340, 231.368, 97.3000, 0, 2)

    --FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
	-- SetEntityCoords(ped, 262.011, 223.212, 106.284, 1, 0, 0, 1)
    
    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
    
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)

    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
    
    NetworkAddEntityToSynchronisedScene(netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
    Wait(200)
    NetworkStartSynchronisedScene(netScene)
    Wait(6300)
    NetworkStartSynchronisedScene(netScene2)
    -- local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
    Wait(2000)
    Wait(1500)
    
	local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
	SetPedComponentVariation(ped, 5, 0, 0, 0)
    
	NetworkStartSynchronisedScene(netScene3)
	Wait(4600)
	NetworkStopSynchronisedScene(netScene3)
	DeleteObject(laptop)
	--FreezeEntityPosition(ped, false)
	SetPedComponentVariation(ped, 5, 45, 0, 0)
	-- TriggerServerEvent("shx-doors:alterlockstate", 121)
    -- TriggerServerEvent("shx-doors:alterlockstate", 122)
	TriggerServerEvent('qb-doorlock:server:updateState', 6, false, false, false, true, false, false)
	--TriggerServerEvent('qb-doorlock:server:updateState', 7, false, false, false, true, false, false)
	
    
    
end

---------------- VAULT SHIT ------------------





RegisterNetEvent("lw:openvault_c")
AddEventHandler("lw:openvault_c", function(method)
    TriggerEvent("lw:vault", method)
end)

RegisterNetEvent("lw:vault")
AddEventHandler("lw:vault", function(method)
	local PlayerPos = GetEntityCoords(PlayerPedId())
	local obj = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 50.0, -1520917551, false, false, false)
    local count = 0

    if method == 1 then
        -- repeat
	        local rotation = GetEntityHeading(obj) + 0.05

            SetEntityHeading(obj, -220.43)
        --     count = count + 5
        --     Wait(10)
        -- until count == 
    end
    -- else
    --     repeat
	--         local rotation = GetEntityHeading(obj) + 0.05

    --         SetEntityHeading(obj, rotation)
    --         count = count + 1
    --         Wait(10)
    --     until count == 1100
    -- end
    FreezeEntityPosition(obj, true)
end)


RegisterNetEvent("lw:openvault_c2")
AddEventHandler("lw:openvault_c2", function(method)
    TriggerEvent("lw:vault2", method)
end)

RegisterNetEvent("lw:vault2")
AddEventHandler("lw:vault2", function(method)
	local PlayerPos = GetEntityCoords(PlayerPedId())
	local obj = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 50.0, -1520917551, false, false, false)
    local count = 0

    if method == 1 then
        repeat
	        local rotation = GetEntityHeading(obj) - 5

            SetEntityHeading(obj, rotation)
            count = count + 5
            Wait(10)
        until count == 70
    end
    -- else
    --     repeat
	--         local rotation = GetEntityHeading(obj) + 0.05

    --         SetEntityHeading(obj, rotation)
    --         count = count + 1
    --         Wait(10)
    --     until count == 1100
    -- end
    FreezeEntityPosition(obj, true)
end)

-------- PC --------------

local wlnum1 = {}
local wlnum2 = {}
local wlnum3 = {}
local wlnum4 = {}
local allahcanrp = false
RegisterNetEvent("lwvault:accesspc")
AddEventHandler("lwvault:accesspc", function()
	if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
        local pos = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            exports["vny-password"]:password(6, 5000, 5000,
            function() -- success
                local whitelistednum1 = math.random(1000,9999)
                local whitelistednum2 = math.random(1000,9999)
                local whitelistednum3 = math.random(1000,9999)
                local whitelistednum4 = math.random(1000,9999)
                -- wlnum1 = whitelistednum1
                -- wlnum2 = whitelistednum2
                -- wlnum3 = whitelistednum3
                -- wlnum4 = whitelistednum4
                 local ofya = math.random(1,4)
                if ofya == 1 then
                    wlnum1 = whitelistednum1
                    wlnum2 = whitelistednum2
                    wlnum3 = whitelistednum3
                    wlnum4 = whitelistednum4
                elseif ofya == 2 then
                    wlnum1 = whitelistednum4
                     wlnum2 = whitelistednum3
                    wlnum3 = whitelistednum2
                     wlnum4 = whitelistednum1
                elseif ofya == 3 then
                    wlnum1 = whitelistednum3
                    wlnum2 = whitelistednum4
                    wlnum3 = whitelistednum1
                    wlnum4 = whitelistednum2
                elseif ofya == 4 then
                    wlnum1 = whitelistednum2
                    wlnum2 = whitelistednum4
                    wlnum3 = whitelistednum3
                    wlnum4 = whitelistednum1
                end
                
                -- print(whitelistednum1)
                allahcanrp = true
                TriggerEvent("notification", 'Access Codes: ' .. wlnum1 .. ' ' .. wlnum2 .. ' ' .. wlnum3 .. ' ' .. wlnum4 .. ' ' )
                TriggerServerEvent("lw:removeitem", "lvaultusb")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lvaultusb"], "remove")
				TriggerServerEvent("lw:giveitem", "lvaultusbcodes", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lvaultusbcodes"], "add")


                
                
                
            end,
            function() -- failure
                TriggerServerEvent("lw:removeitem", "lvaultusb")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lvaultusb"], "remove")
            end)
    
        else
            TriggerEvent("notification", "Maybe a USB Stick can help huh?", 2)
        end
    end, "lvaultusb")

end)



RegisterNetEvent("notifycodes")
AddEventHandler("notifycodes", function()
    if allahcanrp then
        TriggerEvent("notification", 'Access Codes: ' .. wlnum1 .. ' ' .. wlnum2 .. ' ' .. wlnum3 .. ' ' .. wlnum4 .. ' ' )
    else
        TriggerEvent("notification", "This doesn't seems right", 2)
    end
end)


---------- KEYPAD ---------------


local keypad1 = false
local keypad2 = false
local keypad3 = false
local keypad4 = false

RegisterNetEvent("lw:keypad1")
AddEventHandler("lw:keypad1", function()
    if not keypad1 then
        exports["vny-lvaultcodes"]:openCode(true, wlnum1,
        function()
            print("xd")
            keypad1 = true


        end,
        function() -- failure
            print("failure")
        end)
    end
    
end)

RegisterNetEvent("lw:keypad2")
AddEventHandler("lw:keypad2", function()
    if not keypad2 then
        exports["vny-lvaultcodes"]:openCode(true, wlnum2,
        function()
            print("xd")
            keypad2 = true


        end,
        function() -- failure
            print("failure")
        end)
    end
    
end)

RegisterNetEvent("lw:keypad3")
AddEventHandler("lw:keypad3", function()
    if not keypad3 then
        exports["vny-lvaultcodes"]:openCode(true, wlnum3,
        function()
            print("xd")

            keypad3 = true

        end,
        function() -- failure
            print("failure")
        end)
    end
end)

RegisterNetEvent("lw:keypad4")
AddEventHandler("lw:keypad4", function()
    if not keypad4 then
        exports["vny-lvaultcodes"]:openCode(true, wlnum4,
        function()
            print("xd")

            keypad4 = true


        end,
        function() -- failure
            print("failure")
        end)
    end
    
end)
    
CreateThread(function()
    while true do
        local sleep = 1000
        if keypad1 and keypad2 and keypad3 and keypad4 then
            sleep = 0
            --TriggerServerEvent("shx-doors:alterlockstate", 123)
			TriggerServerEvent('qb-doorlock:server:updateState', 7, false, false, false, true, false, false)
			QBCore.Functions.Notify("Vault Opened!", 'success')
            TriggerServerEvent("lw:openvault2", 1) 
            break
        end
        Wait(sleep)
    end
end)



RegisterNetEvent("refreshvaultdoor")
AddEventHandler("refreshvaultdoor", function()
    RequestIpl("np_int_placement_ch_interior_6_dlc_casino_vault_milo_")
    local interiorid = GetInteriorAtCoords(259.2812, 203.5071, 96.77954)
    DisableInteriorProp(interiorid, "np_vault_clean")
    DisableInteriorProp(interiorid, "np_vault_broken")
    EnableInteriorProp(interiorid, "np_vault_clean")
    RefreshInterior(interiorid)
end)



local visionon = false
RegisterNetEvent("nightvision")
AddEventHandler("nightvision", function()
    if not nightvision then
        SetNightvision(true)
        nightvision = true
    else
        SetNightvision(false)
        nightvision = false
    end
end)







--------------- TROLLEY DO NOT TOUCH --------------------



function TrolleySpawn(data, name)
    RequestModel("ch_prop_ch_cash_trolly_01c")
    while not HasModelLoaded("ch_prop_ch_cash_trolly_01c") do
        Wait(1)
    end
	RequestModel("ch_prop_gold_trolly_01c")
    while not HasModelLoaded("ch_prop_gold_trolly_01c") do
        Wait(1)
    end
    Trolley1 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 300.105, 213.077, 96.6999, 1, 1, 0)
    Trolley2 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 304.871, 214.788, 96.6999, 1, 1, 0)
	Trolley3 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 299.677, 225.940, 96.6999, 1, 1, 0)
    Trolley4 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 296.136, 229.497, 96.6999, 1, 1, 0)
    Trolley5 = CreateObject(GetHashKey("ch_prop_ch_cash_trolly_01c"), 309.161, 223.138, 96.6999, 1, 1, 0)
    SetEntityHeading(Trolley1, 4.16)
	SetEntityHeading(Trolley2, 36.73)
	SetEntityHeading(Trolley3, 200.25)
    SetEntityHeading(Trolley4, 118.19)
    SetEntityHeading(Trolley5, 22.27)
    done = false

end

local ilktrolley = false
local ikincitrolley = false
local ucuncutrolley = false
local fourthtrolley = false
local fifthtrolley = false
RegisterNetEvent("lw:firsttrolley")
AddEventHandler("lw:firsttrolley", function()
    disableinput = true
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"
	local playercoords = GetEntityCoords(ped)
	local firsttrolley = vector3(300.105, 213.077, 96.6999) 
	if #(playercoords - firsttrolley) < 2.0 and not ilktrolley then
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
		local CashAppear = function()
			local pedCoords = GetEntityCoords(ped)
			local grabmodel = GetHashKey(model)

			RequestModel(grabmodel)
			while not HasModelLoaded(grabmodel) do
				Wait(100)
			end
			local grabobj = CreateObject(grabmodel, pedCoords, true)

			FreezeEntityPosition(grabobj, true)
			SetEntityInvincible(grabobj, true)
			SetEntityNoCollisionEntity(grabobj, ped)
			SetEntityVisible(grabobj, false, false)
			AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
			local startedGrabbing = GetGameTimer()

			CreateThread(function()
				while GetGameTimer() - startedGrabbing < 37000 do
					Wait(1)
					DisableControlAction(0, 73, true)
					if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
						if not IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, true, false)
						end
					end
					if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
						if IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, false, false)
							
						end
					end
				end
				DeleteObject(grabobj)
			end)
		end
		local trollyobj = Trolley
		local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")

		if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
			return
		end
		local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

		RequestAnimDict("anim@heists@ornate_bank@grab_cash")
		RequestModel(baghash)
		RequestModel(emptyobj)
		while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
			Wait(100)
		end
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
		local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(scene1)
		Wait(1500)
		CashAppear()
		local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene2)
		Wait(37000)
		local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene3)
		NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
		--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
		SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		DeleteObject(trollyobj)
		while DoesEntityExist(Trolley) do
            Wait(1)
            DeleteObject(Trolley)
        end
		PlaceObjectOnGroundProperly(NewTrolley)
		Wait(1800)
		DeleteObject(bag)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
		SetModelAsNoLongerNeeded(emptyobj)
		SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
		disableinput = false
		ilktrolley = true
		TriggerServerEvent("lw:giveitem", "markedbills", math.random(100,150))
        exports["qb-target"]:RemoveZone("lwfirst")
		
	else 
		TriggerEvent("notification", "You can't do this", 2)
	end
end)

RegisterNetEvent("lw:secondtrolley")
AddEventHandler("lw:secondtrolley", function()
    disableinput = true
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"
	local playercoords = GetEntityCoords(ped)
	local secondtrolley = vector3(304.871, 214.788, 96.6999) 
	if #(playercoords - secondtrolley) < 2.0 and not ikincitrolley then
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
		local CashAppear = function()
			local pedCoords = GetEntityCoords(ped)
			local grabmodel = GetHashKey(model)

			RequestModel(grabmodel)
			while not HasModelLoaded(grabmodel) do
				Wait(100)
			end
			local grabobj = CreateObject(grabmodel, pedCoords, true)

			FreezeEntityPosition(grabobj, true)
			SetEntityInvincible(grabobj, true)
			SetEntityNoCollisionEntity(grabobj, ped)
			SetEntityVisible(grabobj, false, false)
			AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
			local startedGrabbing = GetGameTimer()

			CreateThread(function()
				while GetGameTimer() - startedGrabbing < 37000 do
					Wait(1)
					DisableControlAction(0, 73, true)
					if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
						if not IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, true, false)
						end
					end
					if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
						if IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, false, false)
						end
					end
				end
				DeleteObject(grabobj)
			end)
		end
		local trollyobj = Trolley
		local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")

		if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
			return
		end
		local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

		RequestAnimDict("anim@heists@ornate_bank@grab_cash")
		RequestModel(baghash)
		RequestModel(emptyobj)
		while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
			Wait(100)
		end
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
		local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(scene1)
		Wait(1500)
		CashAppear()
		local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene2)
		Wait(37000)
		local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene3)
		NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
		--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
		SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		DeleteObject(trollyobj)
		while DoesEntityExist(Trolley) do
            Wait(1)
            DeleteObject(Trolley)
        end
		PlaceObjectOnGroundProperly(NewTrolley)
		Wait(1800)
		DeleteObject(bag)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
		SetModelAsNoLongerNeeded(emptyobj)
		SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
		disableinput = false
		ikincitrolley = true
		TriggerServerEvent("lw:giveitem", "markedbills", math.random(100,150))
        exports["qb-target"]:RemoveZone("lwsecond")
	else 
		TriggerEvent("notification", "You can't do this", 2)
	end
end)

RegisterNetEvent("lw:thirdtrolley")
AddEventHandler("lw:thirdtrolley", function()
    disableinput = true
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"
	local playercoords = GetEntityCoords(ped)
	local thirdtrolley = vector3(299.677, 225.940, 96.6999) 
	if #(playercoords - thirdtrolley) < 2.0 and not ucuncutrolley then
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
		local CashAppear = function()
			local pedCoords = GetEntityCoords(ped)
			local grabmodel = GetHashKey(model)

			RequestModel(grabmodel)
			while not HasModelLoaded(grabmodel) do
				Wait(100)
			end
			local grabobj = CreateObject(grabmodel, pedCoords, true)

			FreezeEntityPosition(grabobj, true)
			SetEntityInvincible(grabobj, true)
			SetEntityNoCollisionEntity(grabobj, ped)
			SetEntityVisible(grabobj, false, false)
			AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
			local startedGrabbing = GetGameTimer()

			CreateThread(function()
				while GetGameTimer() - startedGrabbing < 37000 do
					Wait(1)
					DisableControlAction(0, 73, true)
					if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
						if not IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, true, false)
						end
					end
					if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
						if IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, false, false)
							
						end
					end
				end
				DeleteObject(grabobj)
			end)
		end
		local trollyobj = Trolley
		local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")

		if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
			return
		end
		local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

		RequestAnimDict("anim@heists@ornate_bank@grab_cash")
		RequestModel(baghash)
		RequestModel(emptyobj)
		while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
			Wait(100)
		end
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
		local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(scene1)
		Wait(1500)
		CashAppear()
		local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene2)
		Wait(37000)
		local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene3)
		NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
		--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
		SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		while DoesEntityExist(Trolley) do
            Wait(1)
            DeleteObject(Trolley)
        end
		DeleteObject(trollyobj)
		PlaceObjectOnGroundProperly(NewTrolley)
		Wait(1800)
		DeleteObject(bag)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
		SetModelAsNoLongerNeeded(emptyobj)
		SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
		disableinput = false
		ucuncutrolley = true
		TriggerServerEvent("lw:giveitem", "markedbills", math.random(100,150))
        exports["qb-target"]:RemoveZone("lwthird")
	else 
		TriggerEvent("notification", "You can't do this", 2)
	end
end)

RegisterNetEvent("lw:fourthtrolley")
AddEventHandler("lw:fourthtrolley", function()
    disableinput = true
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"
	local playercoords = GetEntityCoords(ped)
	local dorduncutrolley = vector3(296.136, 229.497, 96.6999) 
	if #(playercoords - dorduncutrolley) < 2.0 and not fourthtrolley then
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
		local CashAppear = function()
			local pedCoords = GetEntityCoords(ped)
			local grabmodel = GetHashKey(model)

			RequestModel(grabmodel)
			while not HasModelLoaded(grabmodel) do
				Wait(100)
			end
			local grabobj = CreateObject(grabmodel, pedCoords, true)

			FreezeEntityPosition(grabobj, true)
			SetEntityInvincible(grabobj, true)
			SetEntityNoCollisionEntity(grabobj, ped)
			SetEntityVisible(grabobj, false, false)
			AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
			local startedGrabbing = GetGameTimer()

			CreateThread(function()
				while GetGameTimer() - startedGrabbing < 37000 do
					Wait(1)
					DisableControlAction(0, 73, true)
					if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
						if not IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, true, false)
						end
					end
					if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
						if IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, false, false)
							
						end
					end
				end
				DeleteObject(grabobj)
			end)
		end
		local trollyobj = Trolley
		local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")

		if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
			return
		end
		local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

		RequestAnimDict("anim@heists@ornate_bank@grab_cash")
		RequestModel(baghash)
		RequestModel(emptyobj)
		while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
			Wait(100)
		end
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
		local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(scene1)
		Wait(1500)
		CashAppear()
		local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene2)
		Wait(37000)
		local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene3)
		NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
		--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
		SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		while DoesEntityExist(Trolley) do
            Wait(1)
            DeleteObject(Trolley)
        end
		DeleteObject(trollyobj)
		PlaceObjectOnGroundProperly(NewTrolley)
		Wait(1800)
		DeleteObject(bag)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
		SetModelAsNoLongerNeeded(emptyobj)
		SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
		disableinput = false
		fourthtrolley = true
		TriggerServerEvent("lw:giveitem", "markedbills", math.random(100,150))
        exports["qb-target"]:RemoveZone("lwfourth")
	else 
		TriggerEvent("notification", "You can't do this", 2)
	end
end)

RegisterNetEvent("lw:fifthtrolley")
AddEventHandler("lw:fifthtrolley", function()
    disableinput = true
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"
	local playercoords = GetEntityCoords(ped)
	local besincitrolley = vector3(309.161, 223.138, 96.6999) 
	if #(playercoords - besincitrolley) < 2.0 and not fifthtrolley then
		if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
			local pos = GetEntityCoords(PlayerPedId())
			TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
		end
		Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.2, GetHashKey("ch_prop_ch_cash_trolly_01c"), false, false, false)
		local CashAppear = function()
			local pedCoords = GetEntityCoords(ped)
			local grabmodel = GetHashKey(model)

			RequestModel(grabmodel)
			while not HasModelLoaded(grabmodel) do
				Wait(100)
			end
			local grabobj = CreateObject(grabmodel, pedCoords, true)

			FreezeEntityPosition(grabobj, true)
			SetEntityInvincible(grabobj, true)
			SetEntityNoCollisionEntity(grabobj, ped)
			SetEntityVisible(grabobj, false, false)
			AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
			local startedGrabbing = GetGameTimer()

			CreateThread(function()
				while GetGameTimer() - startedGrabbing < 37000 do
					Wait(1)
					DisableControlAction(0, 73, true)
					if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
						if not IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, true, false)
						end
					end
					if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
						if IsEntityVisible(grabobj) then
							SetEntityVisible(grabobj, false, false)
							
						end
					end
				end
				DeleteObject(grabobj)
			end)
		end
		local trollyobj = Trolley
		local emptyobj = GetHashKey("ch_prop_cash_low_trolly_01c")

		if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
			return
		end
		local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

		RequestAnimDict("anim@heists@ornate_bank@grab_cash")
		RequestModel(baghash)
		RequestModel(emptyobj)
		while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
			Wait(100)
		end
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
		local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
		SetPedComponentVariation(ped, 5, 0, 0, 0)
		NetworkStartSynchronisedScene(scene1)
		Wait(1500)
		CashAppear()
		local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
		NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene2)
		Wait(37000)
		local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

		NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
		NetworkStartSynchronisedScene(scene3)
		NewTrolley = CreateObject(emptyobj, GetEntityCoords(trollyobj) + vector3(0.0, 0.0, - 0.985), true)
		--TriggerServerEvent("utk_fh:updateObj", name, NewTrolley, 2)
		SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
		while not NetworkHasControlOfEntity(trollyobj) do
			Wait(1)
			NetworkRequestControlOfEntity(trollyobj)
		end
		while DoesEntityExist(Trolley) do
            Wait(1)
            DeleteObject(Trolley)
        end
		DeleteObject(trollyobj)
		PlaceObjectOnGroundProperly(NewTrolley)
		Wait(1800)
		DeleteObject(bag)
		SetPedComponentVariation(ped, 5, 45, 0, 0)
		RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
		SetModelAsNoLongerNeeded(emptyobj)
		SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
		disableinput = false
		fifthtrolley = true
		TriggerServerEvent("lw:giveitem", "markedbills", math.random(100,150))
        exports["qb-target"]:RemoveZone("lwfifth")
	else 
		TriggerEvent("notification", "You can't do this", 2)
	end
end)

exports["qb-target"]:AddBoxZone("lwfirst", vector3(300.105, 213.077, 96.6999), 0.4, 0.6, {
    name="lwfirst",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lw:firsttrolley",
                icon = "fas fa-hand-holding",
                label = "Grab It!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone("lwsecond", vector3(304.871, 214.788, 96.6999), 0.4, 0.6, {
    name="lwsecond",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lw:secondtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab It!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone("lwthird", vector3(299.677, 225.940, 96.6999), 0.4, 0.6, {
    name="lwthird",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lw:thirdtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab It!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone("lwfourth", vector3(296.136, 229.497, 96.6999), 0.4, 0.6, {
    name="lwfourth",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lw:fourthtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab It!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone("lwfifth", vector3(309.161, 223.138, 96.6999), 0.4, 0.6, {
    name="lwfifth",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lw:fifthtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab It!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

----- C4 ----

CreateThread(function()
    while true do
        local sleep = 1000
        if ilktrolley and ikincitrolley and ucuncutrolley and fourthtrolley and fifthtrolley then
            sleep = 0
            everythingdone = true
            break
        end
        Wait(0)
    end
end)


local spawned = false
CreateThread(function()
    while true do
        local sleep = 1000
        local plyPed = PlayerPedId()
        local coords = GetEntityCoords(plyPed)
        local objhash = GetHashKey("prop_till_01")
        if everythingdone then
            sleep = 0
            alanda = true
            local obj = CreateObject(objhash, 284.999, 224.823, 97.7117, true, true, false)
            createdobj = obj
            spawned = true
            break
        end
        Wait(sleep)
    end
end)


CreateThread(function()
    while true do
        local sleep = 1000
        if spawned then
            sleep = 0
            if GetEntityHealth(createdobj) < 1000 then
                
                AddExplosion(285.037, 224.833, 97.6880, 29, 6000000000000000000000000000000000000000000.0, true, false, 4.5)
                DeleteObject(createdobj)
                RequestIpl("np_int_placement_ch_interior_6_dlc_casino_vault_milo_")
                local interiorid = GetInteriorAtCoords(259.2812, 203.5071, 96.77954)
                DisableInteriorProp(interiorid, "np_vault_clean")
                EnableInteriorProp(interiorid, "np_vault_broken")
                RefreshInterior(interiorid)
                break
            end
        end
        
    
        Wait(sleep)
    end
    
end)



-- CODES TARGET
exports["qb-target"]:AddBoxZone("lvaultpc", vector3(279.608, 230.495, 97.6865), 0.8, 0.6, {
    name="lvaultpc",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lwvault:accesspc",
                icon = "fas fa-user-secret",
                label = "Print Access Codes",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone("lvaultkeypad1", vector3(285.004, 221.481, 97.6881), 0.8, 0.6, {
    name="lvaultkeypad1",
    debugpoly = false,
    useZ=false
    }, {
        options = {
            {
                event = "lw:keypad1",
                icon = "fas fa-circle",
                label = "Enter Code",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone("lvaultkeypad2", vector3(286.564, 220.548, 97.6881), 0.8, 0.6, {
    name="lvaultkeypad2",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lw:keypad2",
                icon = "fas fa-circle",
                label = "Enter Code",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone("lvaultkeypad3", vector3(287.125, 227.333, 97.6881), 0.8, 0.6, {
    name="lvaultkeypad3",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lw:keypad3",
                icon = "fas fa-circle",
                label = "Enter Code",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone("lvaultkeypad4", vector3(289.019, 227.204, 97.6881), 0.8, 0.6, {
    name="lvaultkeypad4",
    debugpoly = false,
    useZ=true
    }, {
        options = {
            {
                event = "lw:keypad4",
                icon = "fas fa-circle",
                label = "Enter Code",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

