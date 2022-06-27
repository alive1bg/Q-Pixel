DecorRegister(2, "jobVehicle")


ModdedVehicles = {}
veh = {
    myVeh = nil,
    mySeat = nil,
    runningLoop = false,
	clutchLoop = false,
    vehStatus = {},
    DrivingDistance = -1,
    degHealth = 
	{}
}
local tick = 0
local rTick = 0
local previousvehiclepos = nil
local CheckDone = false

function round(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces>0 then
      local mult = 10^numDecimalPlaces
      return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end

function GetDamageMultiplier(meters)
    local check = round(meters / 100, -2)
    local retval = nil
    for k, v in pairs(Config.MinimalMetersForDamage) do
        if check >= v.min and check <= v.max then
            retval = k
            break
        elseif check >= Config.MinimalMetersForDamage[#Config.MinimalMetersForDamage].min then
            retval = #Config.MinimalMetersForDamage
            break
        end
    end
    return retval
end

function fuelInjector(currentVehicle,wait)
	SetVehicleEngineOn(currentVehicle,0,0,1)
	SetVehicleUndriveable(currentVehicle,true)
	Citizen.Wait(wait)
	SetVehicleEngineOn(currentVehicle,1,0,1)
	SetVehicleUndriveable(currentVehicle,false)
end

function electronics(currentVehicle)
	local radioStations = {"RADIO_01_CLASS_ROCK","RADIO_02_POP","RADIO_03_HIPHOP_NEW","RADIO_04_PUNK","RADIO_05_TALK_01","RADIO_06_COUNTRY","RADIO_07_DANCE_01","RADIO_08_MEXICAN","RADIO_09_HIPHOP_OLD",
	"RADIO_12_REGGAE","RADIO_13_JAZZ","RADIO_14_DANCE_02","RADIO_15_MOTOWN","RADIO_20_THELAB","RADIO_16_SILVERLAKE","RADIO_17_FUNK","RADIO_18_90S_ROCK"}
	SetVehicleLights(currentVehicle,1)
	local radioRand = math.random(1,18)
	SetVehRadioStation(currentVehicle,radioStations[radioRand])
	Citizen.Wait(600)
	SetVehicleLights(currentVehicle,0)
end

AddEventHandler('vehicle:checkDegredation', function(tick)
    degHealth = DegredationArray()
	local engine = GetIsVehicleEngineRunning(veh.myVeh)
	if not engine then return end
    if GetVehicleClass(veh.myVeh) ~= 13 and GetVehicleClass(veh.myVeh) ~= 21 and GetVehicleClass(veh.myVeh) ~= 16 and GetVehicleClass(veh.myVeh) ~= 15 and GetVehicleClass(veh.myVeh) ~= 14 then
        --if next(veh.vehStatus) == nil then return end
        if degHealth.radiator <= 35 and tick >= 15 then
            local engineHealth = GetVehicleEngineHealth(veh.myVeh)
            if degHealth.radiator <= 35 and degHealth.radiator >= 20 then
                if engineHealth <= 1000 and engineHealth >= 700 then
                    SetVehicleEngineHealth(veh.myVeh, engineHealth-10)
                end
            elseif degHealth.radiator <= 19 and degHealth.radiator >= 10 then
                if engineHealth <= 1000 and engineHealth >= 500 then
                    SetVehicleEngineHealth(veh.myVeh, engineHealth-20)
                end
            elseif degHealth.radiator <= 9 and degHealth.radiator >= 0 then
                if engineHealth <= 1000 and engineHealth >= 200 then
                    SetVehicleEngineHealth(veh.myVeh, engineHealth-30)
                end
            end
        end

        if degHealth.axle <= 35 and tick >= 15 then
            --print("axle "..degHealth.axle)
            local Chance = math.random(1,100)
            if degHealth.axle <= 35 and degHealth.axle >= 20 and Chance > 90 then
                for i=0,360 do					
                    SetVehicleSteeringScale(veh.myVeh,i)
                    Citizen.Wait(5)
                end
            elseif degHealth.axle <= 19 and degHealth.axle >= 10 and Chance > 70 then
                for i=0,360 do	
                    Citizen.Wait(10)
                    SetVehicleSteeringScale(veh.myVeh,i)
                end
            elseif degHealth.axle <= 9 and degHealth.axle >= 0 and Chance > 50 then
                for i=0,360 do
                    Citizen.Wait(15)
                    SetVehicleSteeringScale(veh.myVeh,i)
                end
            end
        end

		
		if degHealth.electronics <= 35 and tick >= 15 then
			--print("elec "..degHealth.electronics)
			local Chance = math.random(1,100)
			if degHealth.electronics <= 35 and degHealth.electronics >= 20 and Chance > 90 then
				for i=0,10 do
					Citizen.Wait(50)
					electronics(veh.myVeh)
				end
			elseif degHealth.electronics <= 19 and degHealth.electronics >= 10 and Chance > 70 then
				for i=0,10 do
					Citizen.Wait(100)
					electronics(veh.myVeh)
				end
			elseif degHealth.electronics <= 9 and degHealth.electronics >= 0 and Chance > 50 then
				for i=0,10 do
					Citizen.Wait(200)
					electronics(veh.myVeh)
				end
			end
		end

        if degHealth.brakes <= 35 and tick >= 15 then
            --print("breaks "..degHealth.breaks)
            local Chance = math.random(1,100)
            if degHealth.brakes<= 35 and degHealth.brakes>= 20 and Chance > 90 then
                    SetVehicleHandbrake(veh.myVeh,true)
                    Citizen.Wait(1000)
                    SetVehicleHandbrake(veh.myVeh,false)
            elseif degHealth.brakes<= 19 and degHealth.brakes>= 10 and Chance > 70 then
                    SetVehicleHandbrake(veh.myVeh,true)
                    Citizen.Wait(4500)
                    SetVehicleHandbrake(veh.myVeh,false)
            elseif degHealth.brakes<= 9 and degHealth.brakes>= 0 and Chance > 50 then
                    SetVehicleHandbrake(veh.myVeh,true)
                    Citizen.Wait(7000)
                    SetVehicleHandbrake(veh.myVeh,false)
            end
        else
            SetVehicleHandbrake(veh.myVeh,false)
        end

        if degHealth.clutch <= 35 and tick >= 15 then
            --print("Clutch "..degHealth.clutch)
            local Chance = math.random(1,100)
            if degHealth.clutch <= 35 and degHealth.clutch >= 20 and Chance > 90 then
                    SetVehicleHandbrake(veh.myVeh,true)
                    fuelInjector(veh.myVeh,50)
                    for i=1,360 do
                        SetVehicleSteeringScale(veh.myVeh,i)
                        Citizen.Wait(5)
                    end
                    Citizen.Wait(2000)
                    SetVehicleHandbrake(veh.myVeh,false)
            elseif degHealth.clutch <= 19 and degHealth.clutch >= 10 and Chance > 70 then
                    SetVehicleHandbrake(veh.myVeh,true)
                    fuelInjector(veh.myVeh,100)
                    for i=1,360 do
                        SetVehicleSteeringScale(veh.myVeh,i)
                        Citizen.Wait(5)
                    end
                    Citizen.Wait(5000)
                    SetVehicleHandbrake(veh.myVeh,false)
            elseif degHealth.clutch <= 9 and degHealth.clutch >= 0 and Chance > 50 then
                    SetVehicleHandbrake(veh.myVeh,true)
                    fuelInjector(veh.myVeh,200)
                    for i=1,360 do
                        SetVehicleSteeringScale(veh.myVeh,i)
                        Citizen.Wait(5)
                    end
                    Citizen.Wait(7000)
                    SetVehicleHandbrake(veh.myVeh,false)
            end
        end
        local chance = math.random(40,100)
        if degHealth.fuel <= 80 and (chance >= 81 and chance <= 100) then
            local fuel = exports['LegacyFuel']:GetFuel(veh.myVeh)
            if degHealth.fuel <= 80 and degHealth.fuel >= 60 then
                exports['LegacyFuel']:SetFuel(veh.myVeh, fuel - 2.0)
            elseif degHealth.fuel <= 59 and degHealth.fuel >= 40 then
                exports['LegacyFuel']:SetFuel(veh.myVeh, fuel - 4.0)
            elseif degHealth.fuel <= 39 and degHealth.fuel >= 20 then
                exports['LegacyFuel']:SetFuel(veh.myVeh, fuel - 6.0)
            elseif degHealth.fuel <= 19 and degHealth.fuel >= 6 then
                exports['LegacyFuel']:SetFuel(veh.myVeh, fuel - 8.0)
            else
                exports['LegacyFuel']:SetFuel(veh.myVeh, fuel - 10.0)
            end
        end
    end
end)

RegisterNetEvent('rp_vehicletuning:client:setStatus')
AddEventHandler('rp_vehicletuning:client:setStatus', function(NEWSTATUS)
    if veh.myVeh ~= nil then
        veh.vehStatus = NEWSTATUS
    end
end)

AddEventHandler('vehicle:updateDegredation', function()
    TriggerServerEvent('vehiclemod:server:updateDegredation', GetVehicleNumberPlateText(veh.myVeh), veh.vehStatus)
end)

AddEventHandler("vehicle:randomDegredation", function(upperLimit, spinAmount)
    if not GetIsVehicleEngineRunning(veh.myVeh) then return end
    degHealth = DegredationArray()
	local plate = GetVehicleNumberPlateText(veh.myVeh)
	local br = degHealth.brakes
	local ax = degHealth.axle
	local rad = degHealth.radiator
	local elec = degHealth.electronics
	local cl = degHealth.clutch
	local fi = degHealth.fuel
	for i=1,spinAmount do
		local chance =  math.random(0,60)
		if chance <= 10 and chance >= 0 then
            veh.vehStatus.brakes = br - math.random(0,upperLimit)
		elseif chance <= 20 and chance >= 11 then
            veh.vehStatus.axle = ax - math.random(0,upperLimit)
		elseif chance <= 30 and chance >= 21 then
            veh.vehStatus.radiator = rad - math.random(0,upperLimit)
		elseif chance <= 40 and chance >= 31 then
            veh.vehStatus.clutch = cl - math.random(0,upperLimit)
		elseif chance <= 50 and chance >= 41 then
            veh.vehStatus.fuel = fi - math.random(0,upperLimit)
		elseif chance <= 60 and chance >= 51 then
			veh.vehStatus.electronics = veh.vehStatus.electronics - math.random(0, upperLimit)
		end
	end

    if br < 0 then veh.vehStatus.brakes = 0 end
	if ax < 0 then veh.vehStatus.axle = 0 end
	if rad < 0 then veh.vehStatus.radiator = 0 end
	if cl < 0 then veh.vehStatus.clutch = 0 end
	if elec < 0 then veh.vehStatus.electronics = 0 end
	if fi < 0 then veh.vehStatus.fuel = 0 end
	veh.vehStatus.engine = GetVehicleEngineHealth(veh.myVeh)
	veh.vehStatus.body = GetVehicleBodyHealth(veh.myVeh)
	TriggerEvent('vehicle:updateDegredation')
end)

RegisterNetEvent('rp_vehicletuning:client:RepairPart') --TO REPLACE "qb-vehicletuning:client:RepaireeePart"
AddEventHandler('rp_vehicletuning:client:RepairPart', function(NID, part)
    local veh = NetToVeh(NID)

    if part == "engine" then
        exports.rp_core:SyncedExecution('SetVehicleEngineHealth', veh, Config.MaxStatusValues[part])
    elseif part == "body" then
        exports.rp_core:SyncedExecution('SetVehicleBodyHealth', veh, Config.MaxStatusValues[part])
        exports.rp_core:SyncedExecution('SetVehicleFixed', veh)
    end
    QBCore.Functions.Notify("The "..Config.ValuesLabels[part].." is repaired!")
end)

function toggleTurning(pVehicle, pToggle, pDefaultHandlingValue)
	if pVehicle ~= 0 then
	  SetVehicleHandlingFloat(pVehicle, 'CHandlingData', 'fSteeringLock', (pToggle and pDefaultHandlingValue or (pDefaultHandlingValue / 4)))
	end
end

function getVehicleHandling(pVehicleIdentifier, pHandling)
	if pVehicleIdentifier and pHandling then
	  if ModdedVehicles[pVehicleIdentifier] ~= nil and ModdedVehicles[pVehicleIdentifier][pHandling] ~= nil then
		return true, ModdedVehicles[pVehicleIdentifier][pHandling]
	  else
		return false, GetVehicleHandlingFloat(pVehicleIdentifier, 'CHandlingData', pHandling)
	  end
	end
end

function setVehicleHandling(pVehicleIdentifier, pHandling, pFactor)
	local isModified, fValue = getVehicleHandling(pVehicleIdentifier, pHandling)
	if not isModified then
	  fValue = (fValue * pFactor)
	end
	ModdedVehicles[pVehicleIdentifier][pHandling] = fValue
	SetVehicleHandlingFloat(pVehicleIdentifier, 'CHandlingData', pHandling, fValue)
end

local function CheckVehicleTuning()
	local vehicleIdentifier = veh.myVeh
    if not IsThisModelABicycle(GetEntityModel(veh.myVeh)) then
		SetVehiclePetrolTankHealth(veh.myVeh, 4000.0)
		SetVehicleHandlingFloat(veh.myVeh, 'CHandlingData', 'fWeaponDamageMult', 5.500000)

		local isModified, fSteeringLock = getVehicleHandling(veh.myVeh, 'fSteeringLock')
		if not isModified then
		  fSteeringLock = math.ceil((fSteeringLock * 0.6)) + 0.1
		end

		if not ModdedVehicles[vehicleIdentifier] then ModdedVehicles[vehicleIdentifier] = {} end 
		ModdedVehicles[vehicleIdentifier]['fSteeringLock'] = fSteeringLock
		SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fSteeringLock', fSteeringLock)

		if IsThisModelABike(GetEntityModel(vehicleIdentifier)) then
			setVehicleHandling(vehicleIdentifier, 'fTractionCurveMin', 0.6)
			setVehicleHandling(vehicleIdentifier, 'fTractionCurveMax', 0.6)
			setVehicleHandling(vehicleIdentifier, 'fInitialDriveForce', 2.2)
			setVehicleHandling(vehicleIdentifier, 'fBrakeForce', 1.4)
			SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fSuspensionReboundDamp', 5.000000)
			SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fSuspensionCompDamp', 5.000000)
			SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fSuspensionForce', 22.000000)
			SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fCollisionDamageMult', 1.150000)
			SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fEngineDamageMult', 0.120000)
		else
		  --  setVehicleHandling(vehicleIdentifier, pCurrentVehicle, 'fTractionCurveMin', 1.0)
		  --  setVehicleHandling(vehicleIdentifier, pCurrentVehicle, 'fBrakeForce', 0.5)
			SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fEngineDamageMult', 0.250000)
			SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fCollisionDamageMult', 1.000000)
			-- test lower deformation for weird driving on cop / some race cars after minor crashes
			SetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fDeformationDamageMult', 0.400000)
		end

		ModdedVehicles[vehicleIdentifier].fInitialDriveMaxFlatVel = GetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fInitialDriveMaxFlatVel')
		ModdedVehicles[vehicleIdentifier].fTractionLossMult = GetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fTractionLossMult')
		ModdedVehicles[vehicleIdentifier].fLowSpeedTractionLossMult = GetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fLowSpeedTractionLossMult')
		ModdedVehicles[vehicleIdentifier].fDriveBiasFront = GetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fDriveBiasFront')
		ModdedVehicles[vehicleIdentifier].fDriveInertia = GetVehicleHandlingFloat(vehicleIdentifier, 'CHandlingData', 'fDriveInertia')
    end
end

local function RunDamageLoop(new)
    local needsCreating = new
    if type(new) == "table" then
        print("APPLYING DEGEN (Plate: "..GetVehicleNumberPlateText(veh.myVeh)..")", new.engine,new.body)
        exports.rp_core:SyncedExecution('SetVehicleEngineHealth', veh.myVeh, new.engine)
        exports.rp_core:SyncedExecution('SetVehicleBodyHealth', veh.myVeh, new.body)
        veh.vehStatus = new
        needsCreating = false
    end

    if needsCreating then
		local miscOptions = {}
		if DecorGetBool(veh.myVeh, 'jobVehicle') then
			miscOptions.jobVehicle = true
		end
        TriggerServerEvent('vehiclemod:server:CreateDegredation', GetVehicleNumberPlateText(veh.myVeh), miscOptions)
        needsCreating = false
    end

    if veh.runningLoop == true then return end
    if not IsThisModelABicycle(GetEntityModel(veh.myVeh)) then
        veh.runningLoop = true
        while veh.runningLoop do
            if veh.myVeh ~= nil then
                local myPlate = GetVehicleNumberPlateText(veh.myVeh)
                --local windows = {}
                tick = tick + 1
                rTick = rTick + 1

				if (tick % 2 == 0) then
					local wheels = {}
                    local doors = {}
                    local dirt = 0
                    local engineHealth = GetVehicleEngineHealth(veh.myVeh)
                    local bodyHealth = GetVehicleBodyHealth(veh.myVeh)
                    for i = 0, 8 do
                        if IsVehicleTyreBurst(veh.myVeh, i, false) or IsVehicleTyreBurst(veh.myVeh, i, true) then 
                            wheels[i+1] = {["wheelID"] = i, ["isBurst"] = true}
                        else
                            wheels[i+1] = {["wheelID"] = i, ["isBurst"] = false}
                        end
                    end
    
                    for i = 0, GetNumberOfVehicleDoors(veh.myVeh) do
                        if IsVehicleDoorDamaged(veh.myVeh, i) then
                            doors[i+1] = {["doorID"] = i, ["isBroken"] = true}
                        else
                            doors[i+1] = {["doorID"] = i, ["isBroken"] = false}
                        end
                    end
                    dirt = GetVehicleDirtLevel(veh.myVeh)
                    TriggerServerEvent("vehiclemod:server:updatePart", myPlate, engineHealth, bodyHealth, wheels, doors, dirt)
				end

                if tick >= 15 then
                    TriggerEvent('vehicle:checkDegredation', tick)
                    tick = 0
                end

                if rTick >= 60 then
                    TriggerEvent('vehicle:randomDegredation', 1, 3)
                    rTick = 0
                end

                if veh.DrivingDistance == -1 then
                    QBCore.Functions.TriggerCallback('rp_vehicletuning:server:IsVehicleOwned', function(IsOwned)
                        if IsOwned ~= false then
                            veh.DrivingDistance = IsOwned
                        else
                            veh.DrivingDistance = math.random(111111, 999999)
                        end
                    end, myPlate)
                end

                if veh.DrivingDistance ~= -1 then
                    local pos = GetEntityCoords(PlayerPedId())
                    if previousvehiclepos ~= nil then
                        local Distance = GetDistanceBetweenCoords(pos, previousvehiclepos, true)
                        veh.DrivingDistance = veh.DrivingDistance + ((Distance / 100) * 325)
                        TriggerServerEvent('qb-vehicletuning:server:UpdateDrivingDistance', veh.DrivingDistance, myPlate)
                        TriggerServerEvent('qb-vehicletuning:server:UpdateVehicleFuel', exports.LegacyFuel:GetFuel(veh.myVeh), myPlate)
                    end
                    previousvehiclepos = pos
                end
            end
            Citizen.Wait(1000)
        end
    end
end

local function CheckStatus()
    local myPlate = GetVehicleNumberPlateText(veh.myVeh)
    QBCore.Functions.TriggerCallback('rp_vehicletuning:server:GetStatus', function(exists)
        if exists then
            RunDamageLoop(exists)
        else
            RunDamageLoop(true)
        end
    end, myPlate)
end

local
function DoubleClutch()
	if veh.clutchLoop then return end
	veh.clutchLoop = true
	while veh.clutchLoop do
			if GetVehicleCurrentGear(veh.myVeh) < 3 and GetVehicleCurrentRpm(veh.myVeh) == 1.0 and math.ceil(GetEntitySpeed(veh.myVeh) * 2.236936) > 50 then
				while GetVehicleCurrentRpm(veh.myVeh) > 0.6 do
					SetVehicleCurrentRpm(veh.myVeh, 0.3)
					Citizen.Wait(1)
				end
			end
		Citizen.Wait(800)
	end
end

--[[ENTERING/SWITCHING/EXITING VEHICLE]]
AddEventHandler('baseevents:enteredVehicle', function(curVehicle, curSeat, dogshit, VehNID)
    veh.myVeh = curVehicle
    veh.mySeat = curSeat

    if GetVehicleClass(veh.myVeh) == 15 or GetVehicleClass(veh.myVeh) == 16 then
        SetAudioSubmixEffectParamInt(0, 0, `enabled`, 1)
    end

    if veh.mySeat == -1 then
        CheckVehicleTuning()
        CheckStatus()
		DoubleClutch()
    end
end)

AddEventHandler('baseevents:vehicleChangedSeat', function(curVehicle, curSeat, dogshit, VehNID)
    veh.mySeat = curSeat

    if veh.mySeat == -1 then
        CheckVehicleTuning()
        CheckStatus()
		DoubleClutch()
    else
        veh.runningLoop = false
		veh.clutchLoop = false
        veh.DrivingDistance = -1
        previousvehiclepos = nil
        tick = 0
        rTick = 0
    end
end)

AddEventHandler('baseevents:leftVehicle', function()
    veh.myVeh = nil
    veh.mySeat = nil
    veh.runningLoop = false
	veh.clutchLoop = false
    veh.DrivingDistance = -1
    previousvehiclepos = nil
    tick = 0
    rTick = 0
    SetAudioSubmixEffectParamInt(0, 0, `enabled`, 0)
end)

RegisterNetEvent('rp_vehicles:client:tuningBody', function(bodyHealth)
	local veh = QBCore.Functions.GetVehicleInFront()

	NetworkRequestControlOfEntity(veh)

	repeat
		Wait(10)
		NetworkRequestControlOfEntity(veh)
	until NetworkHasControlOfEntity(veh)

	exports.rp_core:SyncedExecution('SetVehicleBodyHealth', bodyHealth)
	exports.rp_core:SyncedExecution('SetVehicleFixed', veh)
end)

function DegredationArray()
    local temp = veh.vehStatus
    if next(temp) ~= nil then
        --{"radiator":100,"fuel":100,"clutch":100,"axle":100,"brakes":100}
        local degHealth = {
			["brakes"] = 0,-- has neg effect
			["axle"] = 0,	-- has neg effect
			["radiator"] = 0, -- has neg effect
			["clutch"] = 0,	-- has neg effect
            ["fuel"] = 0, -- has neg effect
			["electronics"] = 0 -- has neg effect
		}

        for i,v in pairs(temp) do
            if degHealth[i] then
                degHealth[i] = tonumber(v)
            end
        end
        return degHealth
    end
end

function string:split(delimiter)
    local result = { }
    local from  = 1
    local delim_from, delim_to = string.find( self, delimiter, from  )
    while delim_from do
      table.insert( result, string.sub( self, from , delim_from-1 ) )
      from  = delim_to + 1
      delim_from, delim_to = string.find( self, delimiter, from  )
    end
    table.insert( result, string.sub( self, from  ) )
    return result
end