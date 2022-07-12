-- Variables

local QBCore = exports['qb-core']:GetCoreObject()
local HasVehicleKey = false
local IsRobbing = false
local IsHotwiring = false
local AlertSend = false
local lockpicked = false
local lockpickedPlate = nil
local usingAdvanced
local hacked = false
local hackedPlate = nil
VehicleClass = {
    [0] = 'compacts',
    [1] = 'sedans',
    [2] = 'suvs',
    [3] = 'coupes',
    [4] = 'muscle',
    [5] = 'sportclassics',
    [6] = 'sports',
    [7] = 'super',
    [8] = 'motorcycles',
    [9] = 'offroad',
    [10] = 'industrial',
    [11] = 'utility',
    [12] = 'vans',
    [13] = 'bicycles',
    [14] = 'boats',
    [15] = 'helicopters',
    [16] = 'planes',
    [17] = 'services',
    [18] = 'emergency',
    [19] = 'military',
    [20] = 'commercial',
    [21] = 'trains',
}

-- Functions

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

RegisterCommand('resetvehkeys', function ()
    local veh = QBCore.Functions.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
    if veh and veh ~= 0 then
        print(veh)
        SetVehicleDoorsLocked(veh, 1)
    end
end)

-- local function HasVehicleKey(plate)
-- 	QBCore.Functions.TriggerCallback('vehiclekeys:server:CheckHasKey', function(result)
-- 		if result then
-- 			HasVehicleKey = true
-- 		else
-- 			HasVehicleKey = false
-- 		end
-- 	end, plate)
-- 	return HasVehicleKey
-- end

local function LockVehicle()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local veh = QBCore.Functions.GetClosestVehicle(pos)
    local plate = QBCore.Functions.GetPlate(veh)
    local vehpos = GetEntityCoords(veh)
    if IsPedInAnyVehicle(ped) then
        veh = GetVehiclePedIsIn(ped)
    end
    if veh ~= nil and #(pos - vehpos) < 7.5 then
        QBCore.Functions.TriggerCallback('vehiclekeys:server:CheckHasKey', function(result)
            if result then
                local vehLockStatus = GetVehicleDoorLockStatus(veh)
                loadAnimDict("anim@mp_player_intmenu@key_fob@")
                TaskPlayAnim(ped, 'anim@mp_player_intmenu@key_fob@', 'fob_click', 3.0, 3.0, -1, 49, 0, false, false,
                    false)

                if vehLockStatus == 1 then
                    Wait(750)
                    ClearPedTasks(ped)
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
                    SetVehicleDoorsLocked(veh, 2)
                    if (GetVehicleDoorLockStatus(veh) == 2) then
                        SetVehicleLights(veh, 2)
                        Wait(250)
                        SetVehicleLights(veh, 1)
                        Wait(200)
                        SetVehicleLights(veh, 0)
                        QBCore.Functions.Notify("Vehicle locked!")
                    else
                        QBCore.Functions.Notify("Something went wrong with the locking system!")
                    end
                else
                    Wait(750)
                    ClearPedTasks(ped)
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "unlock", 0.3)
                    SetVehicleDoorsLocked(veh, 1)
                    if (GetVehicleDoorLockStatus(veh) == 1) then
                        SetVehicleLights(veh, 2)
                        Wait(250)
                        SetVehicleLights(veh, 1)
                        Wait(200)
                        SetVehicleLights(veh, 0)
                        QBCore.Functions.Notify("Vehicle unlocked!")
                    else
                        QBCore.Functions.Notify("Something went wrong with the locking system!")
                    end
                end
            else
                QBCore.Functions.Notify('You don\'t have the keys of the vehicle..', 'error')
            end
        end, plate)
    end
end

local function GetNearbyPed()
    local retval = nil
    local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        PlayerPeds[#PlayerPeds+1] = ped
    end
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
    if not IsEntityDead(closestPed) and closestDistance < 30.0 then
        retval = closestPed
    end
    return retval
end

local function PoliceCall()
    if not AlertSend then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local chance = Config.PoliceAlertChance
        if GetClockHours() >= 1 and GetClockHours() <= 6 then
            chance = Config.PoliceNightAlertChance
        end
        if math.random() <= chance then
            local closestPed = GetNearbyPed()
            if closestPed ~= nil then
                local msg = ""
                local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
                local streetLabel = GetStreetNameFromHashKey(s1)
                local street2 = GetStreetNameFromHashKey(s2)
                if street2 ~= nil and street2 ~= "" then
                    streetLabel = streetLabel .. " " .. street2
                end
                local alertTitle = ""
                if IsPedInAnyVehicle(ped) then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    local modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
                    if QBCore.Shared.Vehicles[modelName] ~= nil then
                        Name = QBCore.Shared.Vehicles[modelName]["brand"] .. ' ' .. QBCore.Shared.Vehicles[modelName]["name"]
                    else
                        Name = "Unknown"
                    end
                    local modelPlate = QBCore.Functions.GetPlate(vehicle)
                    local msg = "Vehicle theft attempt at " .. streetLabel .. ". Vehicle: " .. Name .. ", Licenseplate: " .. modelPlate
                    local alertTitle = "Vehicle theft attempt at"
                    TriggerServerEvent("police:server:VehicleCall", pos, msg, alertTitle, streetLabel, modelPlate, Name)
                else
                    local vehicle = QBCore.Functions.GetClosestVehicle()
                    local modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
                    local modelPlate = QBCore.Functions.GetPlate(vehicle)
                    if QBCore.Shared.Vehicles[modelName] ~= nil then
                        Name = QBCore.Shared.Vehicles[modelName]["brand"] .. ' ' .. QBCore.Shared.Vehicles[modelName]["name"]
                    else
                        Name = "Unknown"
                    end
                    local msg = "Vehicle theft attempt at " .. streetLabel .. ". Vehicle: " .. Name .. ", Licenseplate: " .. modelPlate
                    local alertTitle = "Vehicle theft attempt at"
                    TriggerServerEvent("police:server:VehicleCall", pos, msg, alertTitle, streetLabel, modelPlate, Name)
                end
            end
        end
        AlertSend = true
        SetTimeout(Config.AlertCooldown, function()
            AlertSend = false
        end)
    end
end

local function lockpickFinish(success)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle(pos)
    local chance = math.random()
    if success then
        TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
        QBCore.Functions.Notify('Opened Door!', 'success')
        SetVehicleDoorsLocked(vehicle, 1)
        lockpicked = true
        lockpickedPlate = QBCore.Functions.GetPlate(vehicle)
    else
        PoliceCall()
        TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
        QBCore.Functions.Notify('Someone Called The Police!', 'error')
    end
    if usingAdvanced then
        if chance <= Config.RemoveLockpickAdvanced then
            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["advancedlockpick"], "remove")
            TriggerServerEvent("QBCore:Server:RemoveItem", "advancedlockpick", 1)
        end
    else
        if chance <= Config.RemoveLockpickNormal then
            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["lockpick"], "remove")
            TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
        end
    end
end

local function isAuthorized(vehicle)
    local authorized = true
    local vehClass = VehicleClass[GetVehicleClass(vehicle)]
    local vehModel = GetEntityModel(vehicle)
    local vehName2 = GetDisplayNameFromVehicleModel(vehModel)
    local vehName = vehName2:lower()
    for i = 1, #Config.Vehicle['name'], 1 do
        if vehName == Config.Vehicle['name'][i] then
            authorized = false
            return authorized
        end
    end
    for i = 1, #Config.Vehicle['vehicle_class'], 1 do
        if vehClass == Config.Vehicle['vehicle_class'][i] then
            authorized = false
            return authorized
        end
    end
    for i = 1, #Config.Vehicle['brand'], 1 do
        if QBCore.Shared.Vehicles[vehName]['brand']:lower() == Config.Vehicle['brand'][i]:lower() then
            authorized = false
            return authorized
        end
    end
    return authorized
end

local function LockpickMinigame()
    local authorized
    local finished = exports['qb-lock']:StartLockPickCircle(7, 20)
    if finished then
        authorized = true
    else
        authorized = false
    end
    return authorized
end

local function LockpickDoor(isAdvanced)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle(pos)
    if vehicle ~= nil and vehicle ~= 0 then
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 2.5 then
            local vehLockStatus = GetVehicleDoorLockStatus(vehicle)
            local vehicleClass = GetVehicleClass(vehicle)
            if (vehLockStatus > 0) then
                usingAdvanced = isAdvanced
                local authorized = isAuthorized(vehicle)
                if not authorized then
                    return QBCore.Functions.Notify("You can't use lockpick for this type of vehicle", 'error')
                end
                local animstart = true
                CreateThread(function ()
                    while animstart do
                        loadAnimDict("veh@break_in@0h@p_m_one@")
                        TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds" ,3.0, 3.0, 10000, 16, 0, false, false, false)
                        Wait(1000)
                    end
                end)
                local success = LockpickMinigame()
                if success then
                    lockpicked = true
                    lockpickedPlate = QBCore.Functions.GetPlate(vehicle)
                    QBCore.Functions.Notify('You just unlocked the door', 'success')
                    SetVehicleDoorsLocked(vehicle, 1)
                    animstart = false
                    StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
                else
                    exports['qb-dispatch']:VehicleTheft(vehicle)
                    animstart = false
                    StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
                end
            end
        end
    end
end

local function HackVeh()
    if not HasVehicleKey then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, true)
        if vehicle then   
            local authorized = isAuthorized(vehicle)
            if authorized then
                return QBCore.Functions.Notify("You don't need high tech stuff to unlock this vehicle, go get a lockpick", 'error')
            end
            IsHotwiring = true
            lockpickedPlate = nil
            loadAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
            TaskPlayAnim(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 16, 0, false, false, false)
            local success = exports['boostinghack']:StartHack()
            if success then
                TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
                TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(vehicle))
                QBCore.Functions.Notify('You Got The Keys!', 'success')
                SetVehicleEngineOn(vehicle, false, false, true)
            else
                QBCore.Functions.Notify('You Failed To Get The Keys!', 'error')
                exports['qb-dispatch']:VehicleTheft(vehicle)
            end
            IsHotwiring = false
            StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
        end
    end
end

local function Hack()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle(pos)
    if vehicle ~= nil and vehicle ~= 0 then
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 2.5 then
            local vehLockStatus = GetVehicleDoorLockStatus(vehicle)
            if(vehLockStatus >= 0) then
                local authorized = isAuthorized(vehicle)
                if authorized then
                    return QBCore.Functions.Notify("You don't need high tech stuff to unlock this vehicle, go get a lockpick", 'error')
                end
                local dict = "amb@medic@standing@kneel@idle_a"
                local anim = "idle_c"
                loadAnimDict(dict)
                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 8.0, -1, 1, 0)
                local success = exports['boostinghack']:StartHack()
                if success then
                    TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
                    QBCore.Functions.Notify('You just unlocked the door', 'success')
                    SetVehicleDoorsLocked(vehicle, 1)
                    lockpicked = true
                    lockpickedPlate = QBCore.Functions.GetPlate(vehicle)
                else
                    exports['qb-dispatch']:VehicleTheft(vehicle)
                end
                StopAnimTask(PlayerPedId(), dict, anim, 1.0)
            end
        end
    end
end

local function Hotwire()
    if not HasVehicleKey then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, true)
        local authorized = isAuthorized(vehicle)
        if not authorized then
            return QBCore.Functions.Notify("You can't use lockpick for this type of vehicle", 'error')
        end
        IsHotwiring = true
        lockpickedPlate = nil
        local hotwireTime = math.random(20000, 40000)
        SetVehicleAlarm(vehicle, true)
        SetVehicleAlarmTimeLeft(vehicle, hotwireTime)
        exports['qb-dispatch']:VehicleTheft(vehicle)
        loadAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        TaskPlayAnim(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 16, 0, false, false, false)
        local finish = exports['qb-lock']:StartLockPickCircle(10, 20)
        if finish then
            lockpicked = false
            TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(vehicle))
            SetVehicleEngineOn(vehicle, false, false, true)
            QBCore.Functions.Notify('You got the keys!', 'success')
        else
            exports['qb-dispatch']:VehicleTheft(vehicle)
            QBCore.Functions.Notify('You Failed To Hotwire The Vehicle', 'error')
        end
        IsHotwiring = false
        StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
    end
end

local function RobVehicle(target)
    IsRobbing = true
    loadAnimDict('mp_am_hold_up')
    TaskPlayAnim(target, "mp_am_hold_up", "holdup_victim_20s", 8.0, -8.0, -1, 2, 0, false, false, false)
    QBCore.Functions.Progressbar("rob_keys", "Attempting Robbery..", 6000, false, true, {}, {}, {}, {}, function()
        local chance = math.random()
        if chance <= Config.RobberyChance then
            veh = GetVehiclePedIsUsing(target)
            TaskEveryoneLeaveVehicle(veh)
            Wait(500)
            ClearPedTasksImmediately(target)
            TaskReactAndFleePed(target, PlayerPedId())
            local plate = QBCore.Functions.GetPlate(GetVehiclePedIsIn(target, true))
            TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
            TriggerEvent('vehiclekeys:client:SetOwner', plate)
            QBCore.Functions.Notify('You Got The Keys!', 'success')
            Wait(10000)
            IsRobbing = false
        else
            PoliceCall()
            ClearPedTasks(target)
            TaskReactAndFleePed(target, PlayerPedId())
            TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
            QBCore.Functions.Notify('They Called The Cops!', 'error')
            Wait(10000)
            IsRobbing = false
        end
    end)
end

local function IsBlacklistedWeapon()
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    if weapon ~= nil then
        for _, v in pairs(Config.NoRobWeapons) do
            if weapon == GetHashKey(v) then
                return true
            end
        end
    end
    return false
end

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Events

RegisterNetEvent('lockpicks:UseLockpick', function(isAdvanced)
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) and lockpicked and not IsHotwiring and not HasVehicleKey then
        local veh = GetVehiclePedIsIn(ped)
        if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            SetVehicleEngineOn(veh, false, false, true)
            Hotwire()
        end
    else
        LockpickDoor(isAdvanced)
    end
end)

RegisterNetEvent('vehiclekeys:client:SetOwner', function(plate)
    local VehPlate = plate
    local CurrentVehPlate = QBCore.Functions.GetPlate(GetVehiclePedIsIn(PlayerPedId(), true))
    if VehPlate == nil then
        VehPlate = CurrentVehPlate
    end
    TriggerServerEvent('vehiclekeys:server:SetVehicleOwner', VehPlate)
    if IsPedInAnyVehicle(PlayerPedId()) and plate == CurrentVehPlate then
        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), true), true, false, true)
    end
    HasVehicleKey = true
end)

function getVehicleInDirection(coordFrom, coordTo)
    local offset = 0
    local rayHandle
    local vehicle
  
    for i = 0, 100 do
      rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0) 
      a, b, c, d, vehicle = GetRaycastResult(rayHandle)
      
      offset = offset - 1
  
      if vehicle ~= 0 then break end
    end
    
    local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
    
    if distance > 25 then vehicle = nil end
  
      return vehicle ~= nil and vehicle or 0
  end

RegisterNetEvent('vehiclekeys:client:GiveKeys', function(target)

    local coordA = GetEntityCoords(PlayerPedId(), 1)
    local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
    local latestveh = getVehicleInDirection(coordA, coordB)
    
    if latestveh == nil or not DoesEntityExist(latestveh) then 
        QBCore.Functions.Notify("Vehicle not found!", 'error')
        return
    end

    if #(GetEntityCoords(latestveh) - GetEntityCoords(PlayerPedId(), 0)) > 5 then
        QBCore.Functions.Notify("You are too far away from the vehicle!", 'error')
        return 
    end 
    
    t, distance = QBCore.Functions.GetClosestPlayer()
    if(distance ~= -1 and distance < 5) then

        TriggerServerEvent('vehiclekeys:server:GiveVehicleKeys', GetVehicleNumberPlateText(latestveh), GetPlayerServerId(t))
        TriggerEvent("debug", 'Keys: Give Vehicle Keys', 'success')
    else
        RLCore.Functions.Notify("No player near you!", 'error')
        TriggerEvent("debug", 'Keys: No Player Nearby', 'error')
    end
end)



RegisterNetEvent('vehiclekeys:client:ToggleEngine', function()
    local EngineOn = IsVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()))
    local veh = GetVehiclePedIsIn(PlayerPedId(), true)
    if HasVehicleKey then
        if EngineOn then
            SetVehicleEngineOn(veh, false, false, true)
        else
            SetVehicleEngineOn(veh, true, false, true)
        end
    end
end)



RegisterNetEvent('qb-vehiclekeys:client:useSecuritySystem', function ()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) and lockpicked and not IsHotwiring and not HasVehicleKey then
        local veh = GetVehiclePedIsIn(ped)
        if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            SetVehicleEngineOn(veh, false, false, true)
            HackVeh()
        end
    else
        Hack()
    end
end)

-- Command

RegisterKeyMapping('togglelocks', 'Toggle Vehicle Locks', 'keyboard', 'L')
RegisterCommand('togglelocks', function()
    LockVehicle()
end)


-- thread

CreateThread(function()
    while true do
        local sleep = 100
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local entering = GetVehiclePedIsTryingToEnter(ped)
        
            if entering ~= 0 and not Entity(entering).state.ignoreLocks then
                sleep = 2000
                local plate = QBCore.Functions.GetPlate(entering)
                QBCore.Functions.TriggerCallback('vehiclekeys:server:CheckOwnership', function(result)
                    if not result then -- if not player owned
                        local driver = GetPedInVehicleSeat(entering, -1)
                        if driver ~= 0 and not IsPedAPlayer(driver) then
                            if Config.Rob then
                                if IsEntityDead(driver) then
                                    TriggerEvent("vehiclekeys:client:SetOwner", plate)
                                    SetVehicleDoorsLocked(entering, 1)
                                    HasVehicleKey = true
                                else
                                    SetVehicleDoorsLocked(entering, 2)
                                end
                            else
                                TriggerEvent("vehiclekeys:client:SetOwner", plate)
                                SetVehicleDoorsLocked(entering, 1)
                                HasVehicleKey = true
                            end
                        else
                            QBCore.Functions.TriggerCallback('vehiclekeys:server:CheckHasKey', function(result)
                                if not lockpicked and lockpickedPlate ~= plate then
                                    if result == false then
                                        SetVehicleDoorsLocked(entering, 2)
                                        HasVehicleKey = false
                                    else 
                                        HasVehicleKey = true
                                    end
                                elseif lockpicked and lockpickedPlate == plate then
                                    if result == false then
                                        HasVehicleKey = false
                                    else 
                                        HasVehicleKey = true
                                    end
                                end
                            end, plate)
                        end
                    end
                end, plate)
            end
            if IsPedInAnyVehicle(ped, false) and lockpicked and not IsHotwiring and not HasVehicleKey then
                sleep = 5
                local veh = GetVehiclePedIsIn(ped)
                SetVehicleEngineOn(veh, false, false, true)
            end
            -- Comment out bellow if it has issue Treyy 😢
            if IsPedInAnyVehicle(ped, false) and not lockpicked and not IsHotwiring and not HasVehicleKey then
                sleep = 5
                local driver = GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1)
                if driver ~= 0 then
                    local veh = GetVehiclePedIsIn(ped)
                    SetVehicleEngineOn(veh, false, false, true)
                end
            end

            if Config.Rob then
                if not IsRobbing then
                    local playerid = PlayerId()
                    local aiming, target = GetEntityPlayerIsFreeAimingAt(playerid)
                    if aiming and (target ~= nil and target ~= 0) then
                        if DoesEntityExist(target) and not IsEntityDead(target) and not IsPedAPlayer(target) then
                            if IsPedInAnyVehicle(target, false) then
                                local targetveh = GetVehiclePedIsIn(target)
                                if GetPedInVehicleSeat(targetveh, -1) == target then
                                    if not IsBlacklistedWeapon() then
                                        local pos = GetEntityCoords(ped, true)
                                        local targetpos = GetEntityCoords(target, true)
                                        if #(pos - targetpos) < 5.0 then
                                            RobVehicle(target)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)