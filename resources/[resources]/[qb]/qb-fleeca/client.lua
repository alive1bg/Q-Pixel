local QBCore = exports['qb-core']:GetCoreObject()

Freeze = {F1 = 0, F2 = 0, F3 = 0, F4 = 0, F5 = 0, F6 = 0}
PlayerData = nil
Check = {F1 = false, F2 = false, F3 = false, F4 = false, F5 = false, F6 = false}
SearchChecks = {F1 = false, F2 = false, F3 = false, F4 = false, F5 = false, F6 = false}
LootCheck = {
    F1 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F2 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F3 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F4 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F5 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false},
    F6 = {Stop = false, Loot1 = false, Loot2 = false, Loot3 = false}
}
Doors = {}
local disableinput = false
local initiator = false
local startdstcheck = false
local currentname = nil
local currentcoords = nil
local done = true
local dooruse = false
local hackSuccess = false
local trolleyChance = 0
local atLaptop = false
local hasBought = false

CreateThread(function() while true do local enabled = false Wait(1) if disableinput then enabled = true DisableControl() end if not enabled then Wait(500) end end end)
function DrawText3D(x, y, z, text, scale) local onScreen, _x, _y = World3dToScreen2d(x, y, z) local pX, pY, pZ = table.unpack(GetGameplayCamCoords()) SetTextScale(scale, scale) SetTextFont(4) SetTextProportional(1) SetTextEntry("STRING") SetTextCentre(true) SetTextColour(255, 255, 255, 215) AddTextComponentString(text) DrawText(_x, _y) local factor = (string.len(text)) / 700 DrawRect(_x, _y + 0.0150, 0.095 + factor, 0.03, 41, 11, 41, 100) end
function DisableControl() DisableControlAction(0, 73, false) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 25, true) DisableControlAction(0, 263, true) DisableControlAction(0, 32, true) DisableControlAction(0, 34, true) DisableControlAction(0, 31, true) DisableControlAction(0, 30, true) DisableControlAction(0, 45, true) DisableControlAction(0, 22, true) DisableControlAction(0, 44, true) DisableControlAction(0, 37, true) DisableControlAction(0, 23, true) DisableControlAction(0, 288, true) DisableControlAction(0, 289, true) DisableControlAction(0, 170, true) DisableControlAction(0, 167, true) DisableControlAction(0, 73, true) DisableControlAction(2, 199, true) DisableControlAction(0, 47, true) DisableControlAction(0, 264, true) DisableControlAction(0, 257, true) DisableControlAction(0, 140, true) DisableControlAction(0, 141, true) DisableControlAction(0, 142, true) DisableControlAction(0, 143, true) end

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

AddEventHandler('qb-polyzone:enter', function(name)
    if LocalPlayer.state["isLoggedIn"] then
        if name == "AtLaptop" then
            atLaptop = true
			if hasBought then
				TriggerEvent("bennyPed:client:pickUpLaptop")
			end
        end  
    end
end)

AddEventHandler('qb-polyzone:exit', function(name)
    if LocalPlayer.state["isLoggedIn"] then
        if name == "AtLaptop" then
            atLaptop = false
        end
    end
end)

RegisterNetEvent('bennyPed:client:buyLaptop', function()   
    QBCore.Functions.TriggerCallback("fleeca:canAfford", function(canAfford)
        if canAfford then
            hasBought = true
            TriggerEvent("bennyPed:client:createBlipAndRoute")
        else
            QBCore.Functions.Notify('You cant afford this!', 'error', 5000)
        end
    end)
end)

RegisterNetEvent("bennyPed:client:createBlipAndRoute")
AddEventHandler("bennyPed:client:createBlipAndRoute", function()
    QBCore.Functions.Notify('You recieved the location.', "success")
    laptopBlip = AddBlipForCoord(361.64, 2977.13, 41.84)
    SetBlipSprite(laptopBlip, 408)
    SetBlipColour(laptopBlip, 46)
    SetBlipScale(laptopBlip, 1.0)
    SetBlipRoute(laptopBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Laptop Location")
    EndTextCommandSetBlipName(laptopBlip)
end)

RegisterNetEvent('bennyPed:client:pickUpLaptop', function()    
	RemoveBlip(laptopBlip)
	TriggerServerEvent("bennyPed:server:giveLaptop")
    QBCore.Functions.Notify('Got yo shit.', "success")
	hasBought = false
end)

CreateThread(function()
    exports['qb-polyzone']:AddBoxZone("AtLaptop", vector3(361.64, 2977.13, 41.84), 2, 2, {
		name="AtLaptop",
		heading=360,
		minZ=39,
		maxZ=43,
		debugPoly=Config.debugPoly
	})

	while hasBought do
		TriggerEvent("qb-polyzone:enter", "AtLaptop")
		TriggerEvent("qb-polyzone:exit", "AtLaptop")
	end
end)

RegisterNetEvent("fleeca:resetDoorState")
AddEventHandler("fleeca:resetDoorState", function(name)
    Freeze[name] = 0
end)

RegisterNetEvent("fleeca:lootup_c")
AddEventHandler("fleeca:lootup_c", function(var, var2)
    LootCheck[var][var2] = true
end)

RegisterNetEvent("fleeca:outcome")
AddEventHandler("fleeca:outcome", function(oc, arg)
    for i = 1, #Check, 1 do
        Check[i] = false
    end
    for i = 1, #LootCheck, 1 do
        for j = 1, #LootCheck[i] do
            LootCheck[i][j] = false
        end
    end
    if oc then
        Check[arg] = true
        TriggerEvent("fleeca:startheist", Config.Banks[arg], arg)
        
    elseif not oc then
        QBCore.Functions.Notify(arg, 'error', 5000)
    end
end)

RegisterNetEvent("fleeca:grabMoney")
AddEventHandler("fleeca:grabMoney", function(var, var2)
    StartGrab(var)
end)

RegisterNetEvent("fleeca:startLoot_c")
AddEventHandler("fleeca:startLoot_c", function(data, name)
    currentname = name
    currentcoords = vector3(data.doors.startloc.x, data.doors.startloc.y, data.doors.startloc.z)
    if not LootCheck[name].Stop then
        CreateThread(function()
            while true do
                local pedcoords = GetEntityCoords(PlayerPedId())
                local dst = GetDistanceBetweenCoords(pedcoords, data.doors.startloc.x, data.doors.startloc.y, data.doors.startloc.z, true)

                if dst < 40 then
                    if not LootCheck[name].Loot1 then
                        local dst1 = GetDistanceBetweenCoords(pedcoords, data.trolley1.x, data.trolley1.y, data.trolley1.z + 1, true)

                        if dst1 < 5 then
                            if dst1 < 0.75 and IsControlJustReleased(0, 38) then
                                TriggerServerEvent("fleeca:lootup", name, "Loot1")
                                StartGrab(name)
                            end
                        end
                    end

                    if not LootCheck[name].Loot2 then
                        local dst1 = GetDistanceBetweenCoords(pedcoords, data.trolley2.x, data.trolley2.y, data.trolley2.z+1, true)

                        if dst1 < 5 then
                            if dst1 < 1 and IsControlJustReleased(0, 38) then
                                TriggerServerEvent("fleeca:lootup", name, "Loot2")
                                StartGrab(name)
                            end
                        end
                    end

                    if LootCheck[name].Stop or (LootCheck[name].Loot1 and LootCheck[name].Loot2 and LootCheck[name].Loot3) then
                        LootCheck[name].Stop = false
                        if initiator then
                            TriggerEvent("fleeca:reset", name, data)
                            return
                        end
                        return
                    end
                    Wait(1)
                else
                    Wait(1000)
                end
            end
        end)
    end
end)

RegisterNetEvent("fleeca:stopHeist_c")
AddEventHandler("fleeca:stopHeist_c", function(name)
    LootCheck[name].Stop = true
end)

RegisterNetEvent("fleeca:policenotify")
AddEventHandler("fleeca:policenotify", function(name)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local blip = nil

    while PlayerData.job == nil do
        Wait(1)
    end

    if PlayerData.job.name == "police" then
        QBCore.Functions.Notify('A bank alarm has been triggered!', 'error', 5000)
        if not DoesBlipExist(blip) then
            blip = AddBlipForCoord(Config.Banks[name].doors.startloc.x, Config.Banks[name].doors.startloc.y, Config.Banks[name].doors.startloc.z)
            SetBlipSprite(blip, 161)
            SetBlipScale(blip, 2.0)
            SetBlipColour(blip, 1)

            PulseBlip(blip)
            Wait(240000)
            RemoveBlip(blip)
        end
    end
end)

AddEventHandler("fleeca:freezeDoors", function()
    CreateThread(function()
        PlayerData = QBCore.Functions.GetPlayerData()
        while true do
            for k, v in pairs(Doors) do
                if v[1].obj == nil or not DoesEntityExist(v[1].obj) then
                    v[1].obj = GetClosestObjectOfType(v[1].loc, 1.5, GetHashKey("v_ilev_gb_vaubar"), false, false, false)
                    FreezeEntityPosition(v[1].obj, v[1].locked)
                else
                    FreezeEntityPosition(v[1].obj, v[1].locked)
                    Wait(100)
                end
                if v[1].locked then
                    SetEntityHeading(v[1].obj, v[1].h)
                end
                Wait(100)
            end
            Wait(1)
        end
    end)
    CreateThread(function()
        doVaultStuff = function()
            while true do
                local pcoords = GetEntityCoords(PlayerPedId())

                for k, v in pairs(Doors) do
                    if GetDistanceBetweenCoords(v[2].loc, pcoords, true) <= 20.0 then
                        if v[2].state ~= nil then
                            local obj
                            if k ~= "F4" then
                                obj = GetClosestObjectOfType(v[2].loc, 1.5, GetHashKey("v_ilev_gb_vauldr"), false, false, false)
                            else
                                obj = GetClosestObjectOfType(v[2].loc, 1.5, 4231427725, false, false, false)
                            end
                            SetEntityHeading(obj, v[2].state)
                            Wait(1000)
                            return doVaultStuff()
                        end
                    else
                        Wait(1000)
                    end
                end
                Wait(1)
            end
        end
        doVaultStuff()
    end)
end)

RegisterNetEvent("fleeca:toggleDoor")
AddEventHandler("fleeca:toggleDoor", function(key, state)
    Doors[key][1].locked = state
    dooruse = false
end)

RegisterNetEvent("fleeca:toggleVault")
AddEventHandler("fleeca:toggleVault", function(key, state)
    Wait(Config.vaultOpenTime*1000)

    dooruse = true
    Doors[key][2].state = nil
    if Config.Banks[key].hash == nil then
        if not state then
            local obj = GetClosestObjectOfType(Config.Banks[key].doors.startloc.x, Config.Banks[key].doors.startloc.y, Config.Banks[key].doors.startloc.z, 2.0, GetHashKey(Config.vaultdoor), false, false, false)
            local count = 0

            repeat
                local heading = GetEntityHeading(obj) - 0.10

                SetEntityHeading(obj, heading)
                count = count + 1
                Wait(10)
            until count == 900
            Doors[key][2].locked = state
            Doors[key][2].state = GetEntityHeading(obj)
            TriggerServerEvent("fleeca:updateVaultState", key, Doors[key][2].state)
        elseif state then
            local obj = GetClosestObjectOfType(Config.Banks[key].doors.startloc.x, Config.Banks[key].doors.startloc.y, Config.Banks[key].doors.startloc.z, 2.0, GetHashKey(Config.vaultdoor), false, false, false)
            local count = 0

            repeat
                local heading = GetEntityHeading(obj) + 0.10

                SetEntityHeading(obj, heading)
                count = count + 1
                Wait(10)
            until count == 900
            Doors[key][2].locked = state
            Doors[key][2].state = GetEntityHeading(obj)
            TriggerServerEvent("fleeca:updateVaultState", key, Doors[key][2].state)
        end
    else
        if not state then
            local obj = GetClosestObjectOfType(Config.Banks.F4.doors.startloc.x, Config.Banks.F4.doors.startloc.y, Config.Banks.F4.doors.startloc.z, 2.0, Config.Banks.F4.hash, false, false, false)
            local count = 0
            repeat
                local heading = GetEntityHeading(obj) - 0.10

                SetEntityHeading(obj, heading)
                count = count + 1
                Wait(10)
            until count == 900
            Doors[key][2].locked = state
            Doors[key][2].state = GetEntityHeading(obj)
            TriggerServerEvent("fleeca:updateVaultState", key, Doors[key][2].state)
        elseif state then
            local obj = GetClosestObjectOfType(Config.Banks.F4.doors.startloc.x, Config.Banks.F4.doors.startloc.y, Config.Banks.F4.doors.startloc.z, 2.0, Config.Banks.F4.hash, false, false, false)
            local count = 0

            repeat
                local heading = GetEntityHeading(obj) + 0.10

                SetEntityHeading(obj, heading)
                count = count + 1
                Wait(10)
            until count == 900
            Doors[key][2].locked = state
            Doors[key][2].state = GetEntityHeading(obj)
            TriggerServerEvent("fleeca:updateVaultState", key, Doors[key][2].state)
        end
    end
    dooruse = false
end)

AddEventHandler("fleeca:reset", function(name, data)
    for i = 1, #LootCheck[name], 1 do
        LootCheck[name][i] = false
    end
    Check[name] = false
    
    Wait(Config.vaultclose*1000)
    exports['qb-target']:RemoveZone("Trolley1")

    if trolleyChance <= Config.secondtrolley then
        exports['qb-target']:RemoveZone("Trolley2")
    end

    TriggerServerEvent("fleeca:toggleVault", name, true)
    TriggerEvent("fleeca:cleanUp", data, name)
end)

AddEventHandler("fleeca:startheist", function(data, name)
    currentname = name
    StartHack(data, name)
    hackfinish = false
end)

AddEventHandler("fleeca:client:hackDone", function(data, name, hackSuccess)
    if not hackSuccess then return end

    initiator = true
    local ped = PlayerPedId()

    PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    TriggerServerEvent("fleeca:toggleVault", name, false)
    startdstcheck = true
    SpawnTrolleys(data, name)
    disableinput = false
end)

AddEventHandler("fleeca:cleanUp", function(data, name)
    Wait(10000)
    for i = 1, 3, 1 do
        local obj = GetClosestObjectOfType(data.objects[i].x, data.objects[i].y, data.objects[i].z, 0.75, GetHashKey("hei_prop_hei_cash_trolly_01"), false, false, false)

        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
    for j = 1, 3, 1 do
        local obj = GetClosestObjectOfType(data.objects[j].x, data.objects[j].y, data.objects[j].z, 0.75, GetHashKey("hei_prop_hei_cash_trolly_03"), false, false, false)

        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
    if DoesEntityExist(IdProp) then
        DeleteEntity(IdProp)
    end
    if DoesEntityExist(IdProp2) then
        DeleteEntity(IdProp2)
    end
    TriggerServerEvent("fleeca:setCooldown", name)
    initiator = false
end)

function SpawnTrolleys(data, name)
    trolleyChance = math.random(0,100)

    RequestModel("hei_prop_hei_cash_trolly_01")
    while not HasModelLoaded("hei_prop_hei_cash_trolly_01") do
        Wait(1)
    end

    if trolleyChance <= Config.secondtrolley then
        Trolley2 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), data.trolley2.x, data.trolley2.y, data.trolley2.z, 1, 1, 0)
        local h2 = GetEntityHeading(Trolley2)

        exports['qb-target']:AddBoxZone("Trolley2", vector3(data.trolley2.x, data.trolley2.y, data.trolley2.z), 1.4, 1.4, { 
            name = "Trolley2", 
            heading=h2, 
            debugPoly = Config.debugPoly, 
            minZ = data.trolley2.z - 1, 
            maxZ = data.trolley2.z + 1, 
            }, {
            options = { 
              { 
                type = "client", 
                event = "fleeca:grabMoney", 
                icon = 'fas fa-hand-holding-usd', 
                label = 'Grab It!', 
              }
            },
            distance = 1.5,
        })

        SetEntityHeading(Trolley2, h2 + Config.Banks[name].trolley2.h)
    end

    Trolley1 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), data.trolley1.x, data.trolley1.y, data.trolley1.z, 1, 1, 0)
    local h1 = GetEntityHeading(Trolley1)

    exports['qb-target']:AddBoxZone("Trolley1", vector3(data.trolley1.x, data.trolley1.y, data.trolley1.z), 1.4, 1.4, { 
        name = "Trolley1", 
        heading=h1, 
        debugPoly = Config.debugPoly, 
        minZ = data.trolley1.z - 1, 
        maxZ = data.trolley1.z + 1, 
        }, {
        options = { 
          { 
            type = "client", 
            event = "fleeca:grabMoney", 
            icon = 'fas fa-hand-holding-usd', 
            label = 'Grab It!', 
          }
        },
        distance = 1.5,
    })

    SetEntityHeading(Trolley1, h1 + Config.Banks[name].trolley1.h)
    
    local players, nearbyPlayer = QBCore.Functions.GetPlayers()

    TriggerServerEvent("fleeca:startLoot", data, name, players)
    done = false
end



function StartGrab(name)
    disableinput = true
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"

    Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.0, GetHashKey("hei_prop_hei_cash_trolly_01"), false, false, false)
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
    local emptyobj = GetHashKey("hei_prop_hei_cash_trolly_03")

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
    SetEntityRotation(NewTrolley, GetEntityRotation(trollyobj))
	while not NetworkHasControlOfEntity(trollyobj) do
		Wait(1)
		NetworkRequestControlOfEntity(trollyobj)
	end
	DeleteObject(trollyobj)
    PlaceObjectOnGroundProperly(NewTrolley)
	Wait(1800)
	DeleteObject(bag)
    SetPedComponentVariation(ped, 5, Config.bagnumber, 0, 0)
	RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
	SetModelAsNoLongerNeeded(emptyobj)
    SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
    disableinput = false
    TriggerServerEvent("fleeca:rewardBill")
end

CreateThread(function()
    QBCore.Functions.TriggerCallback("fleeca:getBanks", function(bank, door)
        Config.Banks = bank
        Doors = door
    end)

    while true do
        if startdstcheck then
            if initiator then
                local playercoord = GetEntityCoords(PlayerPedId())

                if (GetDistanceBetweenCoords(playercoord, currentcoords, true)) > 20 then
                    LootCheck[currentname].Stop = true
                    startdstcheck = false
                    TriggerServerEvent("fleeca:stopHeist", currentname)
                end
            end
            Wait(1)
        else
            Wait(1000)
        end
        Wait(1)
    end
end)

CreateThread(function()
    local resettimer = Config.timer

    while true do
        if startdstcheck then
            if initiator then
                if Config.timer > 0 then
                    Wait(1000)
                    Config.timer = Config.timer - 1
                elseif Config.timer == 0 then
                    startdstcheck = false
                    TriggerServerEvent("fleeca:stopHeist", currentname)
                    Config.timer = resettimer
                end
            end
            Wait(1)
        else
            Wait(1000)
        end
        Wait(1)
    end
end)

RegisterNetEvent("bank:client:useLaptop")
AddEventHandler("bank:client:useLaptop", function(src)
    PlayerData = QBCore.Functions.GetPlayerData()

    if PlayerData.job.name ~= "police" then
        local coords = GetEntityCoords(PlayerPedId())

        for k, v in pairs(Config.Banks) do
            if not v.onaction then
                local dst = GetDistanceBetweenCoords(coords, v.doors.startloc.x, v.doors.startloc.y, v.doors.startloc.z, true)

                if dst <= 5 and not Check[k] then
                    if dst <= 1 then
                        hackSuccess = false
                        TriggerServerEvent("fleeca:startcheck", k)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("fleeca:client:menuCheck")
AddEventHandler("fleeca:client:menuCheck", function()
    TriggerServerEvent("fleeca:server:available")
end)

RegisterNetEvent("fleeca:client:checkAvailability")
AddEventHandler("fleeca:client:checkAvailability", function(f1, f2, f3, f4, f5, f6)
    exports['qb-menu']:openMenu({
        {
            header = "Fleeca: Hawick Avenue",
            txt = f1,
        },
        {
            header = "Fleeca: Legion Square",
            txt = f2,
        },
        {
            header = "Fleeca: Boulevard Del Perro",
            txt = f3,
        },
        {
            header = "Fleeca: Great Ocean",
            txt = f4,
        },
        {
            header = "Fleeca: Burton",
            txt = f5,
        },
        {
            header = "Fleeca: Harmony",
            txt = f6,
        },
    })
end)

function StartHack(data, name)
    Config.hackfinish = false
    local loc = {x,y,z,h}

    loc.x = Config.Banks[currentname].animation.x
    loc.y = Config.Banks[currentname].animation.y
    loc.z = Config.Banks[currentname].animation.z
    loc.h = Config.Banks[currentname].animation.h

    local animDict = "anim@heists@ornate_bank@hack"

    RequestAnimDict(animDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")

    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s") do
        Wait(100)
    end

    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))

    SetEntityHeading(ped, loc.h)
    local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)

    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), targetPosition, 1, 1, 0)
    local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)

    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)

    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)

    local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)

    SetPedComponentVariation(ped, 5, 0, 0, 0)
    Wait(200)
    NetworkStartSynchronisedScene(netScene)
    Wait(6300)
    NetworkStartSynchronisedScene(netScene2)
    Wait(2000)

    exports["hacking2"]:hacking(
    function() -- success
        hackfinish = true
        disableinput = false
        hackSuccess = true
    end,
    function() -- failure
        hackfinish = true
        disableinput = false
        hackSuccess = false
        TriggerServerEvent("fleeca:server:onaction", name)
        Check[name] = false
    end)

    while not hackfinish do
        Wait(1)
    end

    NetworkStartSynchronisedScene(netScene3)
    Wait(4000)
    NetworkStopSynchronisedScene(netScene3)
    DeleteObject(bag)
    DeleteObject(laptop)
    FreezeEntityPosition(ped, false)
    SetPedComponentVariation(ped, 5, Config.bagnumber, 0, 0)

    TriggerEvent("fleeca:client:hackDone", data, name, hackSuccess)
end