local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state['isLoggedIn']


local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}
inVeh = false
curVeh = 0
curSeat = nil

local LastVehicle = nil
local IsHotwiring = false
local IsSearching = false
local IsRobbing = false
local NeededAttempts = 0
local SucceededAttempts = 0
local FailedAttemps = 0
local AlertSend = false

local failedVehs = {}
local searchedVehs = {}
local failedVehsLockPick = {}

local myKeys = {}
local VehiclesWithoutKeys = {
	[`wheelchair`] = true
}
local Bicycles = {
    ["bmx"] = true,
    ["cruiser"] = true,
    ["tribike2"] = true,
    ["fixter"] = true,
    ["scorcher"] = true,
    ["tribike3"] = true,
    ["tribike"] = true
}

function IsPedOnAnyBicycle()
    local veh = GetVehiclePedIsIn(PlayerPedId(), true)
    local vehModel = GetEntityModel(veh)
    local vehDisplayText = GetDisplayNameFromVehicleModel(vehModel)

    if Bicycles[vehDisplayText:lower()] then return true end
end

local isThreadRunning = false
local isShowingText = false
local plate = nil
local vehModel = nil
local function RunVehicleLoop()
    local Ply = PlayerPedId()

    if inVeh and curSeat == -1 then
		if vehModel == nil then
			vehModel = GetEntityModel(curVeh)
		end

        if plate == nil then
            plate = GetVehicleNumberPlateText(curVeh)
        end
		local plate = QBCore.Shared.Trim(plate)
        if LastVehicle ~= curVeh then
            if myKeys[plate] then
                SetVehicleEngineOn(curVeh, true, false, true)
            else
                SetVehicleEngineOn(curVeh, false, false, true)
            end
            LastVehicle = curVeh
        end
        if not myKeys[plate] and IsPedOnAnyBicycle() then myKeys[plate] = true end
        
		if not myKeys[plate] and VehiclesWithoutKeys[vehModel] then
			myKeys[plate] = true
		end

        if not myKeys[plate] and not IsHotwiring and not IsSearching then
            SetVehicleEngineOn(curVeh, false, false, true)
            if not isShowingText then
                exports.rp_ui:ActionBox({action = 'show', title = nil, text = '[H] Hotwire / [G] Search', style = 'default'})
                isShowingText = true
            end
            if IsControlJustPressed(0, Keys["H"]) then
                Hotwire()
            end
            if IsControlJustPressed(0, Keys["G"]) then
                SearchVehicle()
            end
        elseif myKeys[plate] and isShowingText then
            exports.rp_ui:ActionBox({action = 'hide'})
            isShowingText = false
        end
    end
end

local BlackListedKeyModels = {
	[`stockade`] = true
}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        if not IsRobbing and isLoggedIn then
            if GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= nil and GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= 0 then
                local vehicle = GetVehiclePedIsTryingToEnter(PlayerPedId())
                local driver = GetPedInVehicleSeat(vehicle, -1)
                if driver ~= 0 and not IsPedAPlayer(driver) then
                    if IsEntityDead(driver) then
						if not BlackListedKeyModels[GetEntityModel(vehicle)] then
                        	IsRobbing = true
                        	QBCore.Functions.Progressbar("rob_keys", "Taking keys..", 3000, false, true, {}, {}, {}, {}, function() -- Done
                        	    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
                        	    TriggerEvent('rp_dispatch:carjacking')
                        	    TriggerEvent("rp_mdw:client:StolenTimer",GetVehicleNumberPlateText(vehicle))
                        	    IsRobbing = false
                        	end)
						end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)

        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and not IsEntityDead(ped) then
            Citizen.Wait(150)
            if IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and not IsEntityDead(ped) then
                if myKeys[GetVehiclePedIsTryingToEnter(PlayerPedId())] then
                    SetVehicleEngineOn(GetVehiclePedIsIn(ped, false), true, true, false)
                end
                if keepDoorOpen then
                    TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped, false), 256)
                else
                    --TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped, false), 0)
                    TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped, false), 256)
                end
            end
        end
    end
end)

RegisterNetEvent('vehiclekeys:client:SetOwner')
AddEventHandler('vehiclekeys:client:SetOwner', function(plate)
    local VehPlate = plate
    if VehPlate == nil then
        VehPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), true))
    end

    if not myKeys[VehPlate] then
        myKeys[VehPlate] = true
    end

    TriggerServerEvent('vehiclekeys:server:StoreKeys', VehPlate)
    --QBCore.Functions.Notify('You have received the keys to the vehicle', 'success', 3500)
end)

RegisterCommand('allkeys', function()
    TriggerServerEvent('vehiclekeys:server:fetchKeys')
end)

RegisterNetEvent('vehiclekeys:client:restoreKeys')
AddEventHandler('vehiclekeys:client:restoreKeys', function(ALLKEYS)
    myKeys = ALLKEYS
end)

RegisterNetEvent('vehiclekeys:client:GiveKeys')
AddEventHandler('vehiclekeys:client:GiveKeys', function()
    local coordA = GetEntityCoords(PlayerPedId(), true)
	local veh = QBCore.Functions.GetVehicleInFront()

    if veh == 0 then
        veh = GetVehiclePedIsIn(PlayerPedId(), true)
    end

    local plate = GetVehicleNumberPlateText(veh)
    local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer(GetEntityCoords(PlayerPedId()))
    if closestPlayer ~= -1 and closestDistance < 1.5 then
        if myKeys[plate] then
            TriggerServerEvent('vehiclekeys:server:GiveVehicleKeys', GetPlayerServerId(closestPlayer), plate)
        else
            QBCore.Functions.Notify("You don\'t have keys.", "error")
        end
    end
end)

RegisterNetEvent('vehiclekeys:client:ToggleEngine')
AddEventHandler('vehiclekeys:client:ToggleEngine', function()
    local EngineOn = IsVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()))
    local veh = GetVehiclePedIsIn(PlayerPedId(), true)
    local plate = GetVehicleNumberPlateText(veh)
    if myKeys[plate] then
        if EngineOn then
            SetVehicleEngineOn(veh, false, false, true)
        else
            SetVehicleEngineOn(veh, true, false, true)
        end
    end
end)

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function(isAdvanced)
    if (IsPedInAnyVehicle(PlayerPedId())) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), true)
        local plate = GetVehicleNumberPlateText(veh)
        if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then ---Driver seat
            if not myKeys[plate] then
                LockpickIgnition(isAdvanced)
            end
        end
    else
        LockpickDoor(isAdvanced)
    end
end)

function RobVehicle(target)
    IsRobbing = true
    Citizen.CreateThread(function()
        while IsRobbing do
            local RandWait = math.random(10000, 15000)
            loadAnimDict("random@mugging3")

            TaskLeaveVehicle(target, GetVehiclePedIsIn(target, true), 256)
            Citizen.Wait(1000)
            ClearPedTasksImmediately(target)

            TaskStandStill(target, RandWait)
            TaskHandsUp(target, RandWait, PlayerPedId(), 0, false)

            Citizen.Wait(RandWait)

            --TaskReactAndFleePed(target, PlayerPedId())
            IsRobbing = false
        end
    end)
end

function LockVehicle()
    local coordA = GetEntityCoords(PlayerPedId(), true)
    local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 255.0, 0.0)
    local veh = GetClosestVehicleInDirection(coordA, coordB)
    local pos = GetEntityCoords(PlayerPedId(), true)
    if IsPedInAnyVehicle(PlayerPedId()) then
        veh = GetVehiclePedIsIn(PlayerPedId())
    end
    local plate = GetVehicleNumberPlateText(veh)
    local vehpos = GetEntityCoords(veh, false)
    if veh ~= nil and #(vector3(pos.x, pos.y, pos.z) - vector3(vehpos.x, vehpos.y, vehpos.z)) < 7.5 then
    --if veh ~= nil and GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 7.5 then

        if myKeys[plate] then
            local vehLockStatus = GetVehicleDoorLockStatus(veh)
            loadAnimDict("anim@mp_player_intmenu@key_fob@")
            TaskPlayAnim(PlayerPedId(), 'anim@mp_player_intmenu@key_fob@', 'fob_click' ,3.0, 3.0, -1, 49, 0, false, false, false)
            if vehLockStatus == 1 or vehLockStatus == 0 then
                TriggerServerEvent('vehiclekeys:server:LockVehicle', VehToNet(veh), 2)
                --exports.rp_core:SyncedExecution('SetVehicleDoorsLocked', veh, 2)
                Citizen.Wait(750)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3, "lock", 0.3)
                QBCore.Functions.Notify("Vehicle locked!")
            else
                --exports.rp_core:SyncedExecution('SetVehicleDoorsLocked', veh, 1)
                TriggerServerEvent('vehiclekeys:server:LockVehicle', VehToNet(veh), 1)
                Citizen.Wait(750)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3, "unlock", 0.3)
                QBCore.Functions.Notify("Vehicle unlocked!")
            end

            if not IsPedInAnyVehicle(PlayerPedId()) then
                SetVehicleInteriorlight(veh, true)
                SetVehicleIndicatorLights(veh, 0, true)
                SetVehicleIndicatorLights(veh, 1, true)
                Citizen.Wait(450)
                SetVehicleIndicatorLights(veh, 0, false)
                SetVehicleIndicatorLights(veh, 1, false)
                Citizen.Wait(450)
                SetVehicleInteriorlight(veh, true)
                SetVehicleIndicatorLights(veh, 0, true)
                SetVehicleIndicatorLights(veh, 1, true)
                Citizen.Wait(450)
                SetVehicleInteriorlight(veh, false)
                SetVehicleIndicatorLights(veh, 0, false)
                SetVehicleIndicatorLights(veh, 1, false)
            end
        else
            QBCore.Functions.Notify('You don\'t have the keys to this vehicle..', 'error')
        end
    end
end

local openingDoor = false
function LockpickDoor(isAdvanced)
    local targetVehicle = QBCore.Functions.GetVehicleInFront()
    if targetVehicle ~= 0 then
        local vehpos = GetEntityCoords(targetVehicle)
		if #(GetEntityCoords(PlayerPedId()) - vehpos) < 10.0 then
			local pos = GetEntityCoords(PlayerPedId())
			local vehLockStatus = GetVehicleDoorLockStatus(targetVehicle)
			if vehLockStatus > 1 then
				local Plate = GetVehicleNumberPlateText(targetVehicle)
	
				if string.find(Plate, "CARSALE") then
					QBCore.Functions.Notify('A security camera is watching you.', 'error')
					return
				end
	
				local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
				local leftfront = GetOffsetFromEntityInWorldCoords(targetVehicle, d1["x"]-0.25,0.25,0.0)
	
				local count = 5000
				local dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
				while dist > 2.0 and count > 0 do
					dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
					Citizen.Wait(1)
					count = count - 1
					QBCore.Functions.DrawText3D(leftfront["x"],leftfront["y"],leftfront["z"],"Move here to lockpick.")
				end
	
				if dist > 2.0 then
					return
				end
	
				local lockpickTime = math.random(15000, 30000)
				if isAdvanced then
					lockpickTime = math.ceil(lockpickTime*0.5)
				end
	
				LockpickDoorAnim(lockpickTime)
				PoliceCall()
				IsHotwiring = true
				SetVehicleAlarm(targetVehicle, true)
				SetVehicleAlarmTimeLeft(targetVehicle, lockpickTime)
				QBCore.Functions.Progressbar("lockpick_vehicledoor", "Break open the door..", lockpickTime, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
					openingDoor = false
					StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
					IsHotwiring = false
					if math.random(1, 100) <= 90 then
						QBCore.Functions.Notify("Door open!")
						TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "unlock", 0.3)
						exports.rp_core:SyncedExecution('SetVehicleDoorsLocked', targetVehicle, 1)
					else
						QBCore.Functions.Notify("Failed!", "error")
					end
				end, function() -- Cancel
					openingDoor = false
					StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
					QBCore.Functions.Notify("Failed!", "error")
					IsHotwiring = false
				end)
			end
		end
    end
end

function LockpickDoorAnim(time)
    time = time / 1000
    loadAnimDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1000)
            time = time - 1
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            end
        end
    end)
end

function LockpickIgnition(isAdvanced)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    local plate = GetVehicleNumberPlateText(vehicle)

    if not myKeys[plate] then 
        --if failedVehsLockPick[plate] then
        --    QBCore.Functions.Notify("The ignition on this vehicle is broke.", "error", 5000)
        --    return
        --end

        if IsHotwiring then return end
        if vehicle ~= nil and vehicle ~= 0 then
            if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
                if not IsHotwiring then
                    IsHotwiring = true
                    PoliceCall()
                    local dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
                    local anim = "machinic_loop_mechandplayer"
    
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do
                        RequestAnimDict(dict)
                        Citizen.Wait(100)
                    end

                    local picking = exports["reload-skillbar"]:taskBar(8000,math.random(5,15))
                    if picking ~= 100 then --failed
                        StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                        SetVehicleEngineOn(vehicle, false, false, true)
                        QBCore.Functions.Notify("Lockpicking failed!", "error", 2500)
                        IsHotwiring = false
                        if math.random(1,10) >= 8 then
                            TriggerServerEvent('QBCore:Server:RemoveItem', "lockpick", 1)
                            local itemInfo = QBCore.Shared.Items["lockpick"]
                            if isAdvanced then
                                itemInfo = QBCore.Shared.Items["advancedlockpick"]
                            end
                            TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
							TriggerServerEvent("QBCore:Server:RemoveItem", itemInfo.name, 1)
                            QBCore.Functions.Notify("You broke your lockpick!", "error", 5000)
                        end
                        failedVehsLockPick[plate] = true
                        return
                    end
                    StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                    QBCore.Functions.Notify("Lockpicking succeeded!", "success", 2500)
                    TriggerEvent("vehiclekeys:client:SetOwner", plate)
                    SetVehicleEngineOn(vehicle, true, false, true)
                    IsHotwiring = false
                    isThreadRunning = false
                end
            end
        end
    end
end

local HotwiringAnim = false

RegisterNetEvent('animation:lockpick')
AddEventHandler('animation:lockpick', function(disable)
    local lPed = PlayerPedId()
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end
    if disable ~= nil then
        if not disable then
            lockpicking = false
            return
        else
            lockpicking = true
        end
    end
    while lockpicking do

        if not IsEntityPlayingAnim(lPed, "mini@repair", "fixing_a_player", 3) then
            ClearPedSecondaryTask(lPed)
            TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end
    IsHotwiring = false
    print("clear tasks")
    ClearPedTasks(lPed)
end)

function Hotwire()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    local plate = GetVehicleNumberPlateText(vehicle)
    if not myKeys[plate] then 

        --if failedVehs[plate] then QBCore.Functions.Notify("You have already failed this hotwire", "error") return end

        IsHotwiring = true
        if (math.random(1,10) > 7) then
            local hotwireTime = math.random(20000, 40000)
            SetVehicleAlarm(vehicle, true)
            SetVehicleAlarmTimeLeft(vehicle, hotwireTime)
        end

        PoliceCall()

        TriggerEvent('animation:lockpick', true)
        HotwiringAnim = true
        local picking = exports["reload-skillbar"]:taskBar(27500,math.random(5,15))
        if picking ~= 100 then
            failedVehs[plate] = true
            TriggerEvent('animation:lockpick', false)
            return
        end
        TriggerEvent('animation:lockpick', false)
        local chance = math.random(0, 100)
        if chance >= 45 then
            QBCore.Functions.Notify("Hotwire succeeded!")
            SetVehicleEngineOn(vehicle, true, false, true)
            TriggerEvent("vehiclekeys:client:SetOwner", plate)
            isThreadRunning = false
        else
            failedVehs[plate] = true
            SetVehicleEngineOn(vehicle, false, false, true)
            QBCore.Functions.Notify("Hotwire failed!", "error")
        end
        IsHotwiring = false
    end
end


function SearchVehicle()
    if not searchedVehs[GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))] then 
        local frontSeatsSearched = false
        TriggerEvent('animation:lockpick', true)
        searchedVehs[GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))] = true
        local FoundKeys = false

        QBCore.Functions.Progressbar("front_seats_search", "Searching frontseat...", 6000, false, true, {}, {}, {}, {}, function() -- Done
            local luck = math.random(0,100)
            if luck >= 75 then
                FoundKeys = true
                RunSearchBar(1)
            end
            
            frontSeatsSearched = true

            if frontSeatsSearched and not FoundKeys then
                RunSearchBar(2)
            end
        end, function()
            TriggerEvent('animation:lockpick', false)
            IsSearching = false
        end)
    else
        QBCore.Functions.Notify("You have already searched this vehicle", "error")
    end
end

function RunSearchBar(value)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        IsSearching = false
        TriggerEvent('animation:lockpick', false)
        return
    end

    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    local plate = GetVehicleNumberPlateText(vehicle)

    if value == 1 then
        QBCore.Functions.Progressbar("search_keys_found", "Found keys...", 3000, false, true, {}, {}, {}, {}, function() -- Done
            SetVehicleEngineOn(GetVehiclePedIsUsing(PlayerPedId()),true,false,false)
            TriggerEvent('vehiclekeys:client:SetOwner', plate)
            TriggerEvent('animation:lockpick', false)
            isThreadRunning = false
        end, function()
            TriggerEvent('animation:lockpick', false)
            IsSearching = false
        end)
    elseif value == 2 then
        QBCore.Functions.Progressbar("back_seats_search", "Searching backseat...", 6000, false, false, {}, {}, {}, {}, function() -- Done
            local luck = math.random(0,100)       
            TriggerEvent('animation:lockpick', false)
            IsSearching = false
        end, function()
            TriggerEvent('animation:lockpick', false)
            IsSearching = false
        end)
    end
end

function PoliceCall()
    if not AlertSend then
        local pos = GetEntityCoords(PlayerPedId())
        local chance = 90
        if GetClockHours() >= 1 and GetClockHours() <= 6 then
            chance = 50
        end
        if math.random(1, 100) <= chance then
                if IsPedInAnyVehicle(PlayerPedId()) then
                    TriggerEvent('rp_dispatch:carjacking')
                else
                    local vehicle = QBCore.Functions.GetClosestVehicle()
                    TriggerEvent('wf-alerts:civilian:notify',15.0,"lockpick",vehicle)
                end
        end
        AlertSend = true
        SetTimeout(2 * (60 * 1000), function()
            AlertSend = false
        end)
    end
end

function GetClosestVehicleInDirection(coordFrom, coordTo)
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
	
	if distance > 250 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function GetNearbyPed()
	local retval = nil
	local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
	local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
	if not IsEntityDead(closestPed) and closestDistance < 30.0 then
		retval = closestPed
	end
	return retval
end

function IsBlacklistedWeapon()
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

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end

Citizen.CreateThread(function()
    RegisterKeyMapping("+LockVehicle", "[Vehicle] Lock Vehicle", "keyboard", "L") -- Register Key bind in menu
    RegisterCommand('+LockVehicle', LockVehicle, false)
    RegisterCommand('-LockVehicle', function() end, false)
    TriggerEvent('chat:removeSuggestion', "/+LockVehicle")
    TriggerEvent('chat:removeSuggestion', "/-LockVehicle")
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        RunVehicleLoop()
    end
end)

AddEventHandler('baseevents:enteredVehicle', function(currentVehicle, currentSeat)
	inVeh = true
	curVeh = currentVehicle
    curSeat = currentSeat
end)

AddEventHandler('baseevents:vehicleChangedSeat', function(currentVehicle, currentSeat)
    inVeh = true
	curVeh = currentVehicle
    curSeat = currentSeat
    if curSeat ~= -1 then
        exports.rp_ui:ActionBox({action = 'hide'})
        isShowingText = false
    end
end)

AddEventHandler('baseevents:leftVehicle', function()
    isThreadRunning = false
	inVeh = false
    curVeh = 0
    curSeat = nil
    exports.rp_ui:ActionBox({action = 'hide'})
    isShowingText = false
    plate = nil
	vehModel = nil
end)