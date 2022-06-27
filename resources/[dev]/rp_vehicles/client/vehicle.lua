local stalling = nil

local function sendServerEventForPassengers(curVehicle, event, value)
	local player = PlayerPedId()
	for i=-1, GetVehicleMaxNumberOfPassengers(curVehicle) do
		local ped = GetPedInVehicleSeat(curVehicle, i)
		if ped ~= player and ped ~= 0 then
			TriggerServerEvent(event, GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)), value)
		end
	end
end

local function eject(veloc)
	local playerPed = Ped.handle
	local coords = GetEntityCoords(playerPed)
	SetEntityCoords(playerPed,coords)
	Citizen.Wait(1)
	SetPedToRagdoll(playerPed, 5511, 5511, 0, 0, 0, 0)
	SetEntityVelocity(playerPed, veloc.x*2,veloc.y*2,veloc.z*2)
	local ejectspeed = math.ceil(GetEntitySpeed(playerPed) * 8)
	SetEntityHealth(playerPed, (GetEntityHealth(playerPed) - ejectspeed) )
end

local function ejectionLUL(veloc, currentVehicle)
	local chance = math.random(60, 100)

	if VehicleData.seatbelt then
		chance = math.random(10, 100)
	end

	if chance > 70 and not VehicleData.harness then
		TriggerEvent("civilian:alertPolice",50.0,"carcrash",0)
		eject(veloc)
	end
	sendServerEventForPassengers(currentVehicle, 'rp_vehicles:server:ejectPassengers', veloc)
end

local wheels = {
	[0] = true,
	[1] = true,
}
local function DoRandomWheelDamage(vehicle, wheelIndex, damage)
if not DoesEntityExist(vehicle) then return end
	local tyre = wheelIndex-1
	if tyre > 1 then
		tyre = tyre + 2
	end
	local wheelHealth = GetVehicleWheelHealth(vehicle, wheelIndex-1)
	if wheels[tyre] then
		wheelHealth = GetVehicleWheelHealth(vehicle, tyre)
	end
	wheelHealth = wheelHealth - damage
	if wheelHealth < 0.0 then	
		SetVehicleTyreBurst(vehicle, tyre, true, 1000.0)
		wheelHealth = 0.0
	end
	SetVehicleWheelHealth(vehicle, tyre, wheelHealth)
end

AddEventHandler('baseevents:vehicleCrashed', function(CurrentVehicle, CurrentSeat, CurrentSpeed, PreviousSpeed, velocity, healthChange, heavyImpact, minorImpact)
	--print("Cur Vehicle: " .. CurrentVehicle .."\nCur Seat: "..CurrentSeat.."\nCur Speed: "..CurrentSpeed.."\nPrev Speed: "..PreviousSpeed.."\nVelocity: "..json.encode(velocity).."\nhealthChange: "..healthChange.."\nheavy crash: "..tostring(heavyImpact).."\nMinor Crash: ".. tostring(minorImpact))
	--print("\n\n")

	if not DoesEntityExist(CurrentVehicle) then return end

	local multiplier = 1
	if heavyImpact then
		multiplier = 2
		print("Heavy Impact!", PreviousSpeed * 0.75)
		local vehSpeed = (PreviousSpeed * 0.75)
		if vehSpeed > 23.5 and not VehicleData.seatbelt then
			ejectionLUL(velocity, CurrentVehicle)
		end

		if vehSpeed > 26.5 and VehicleData.seatbelt or (vehSpeed > 25.5 and VehicleData.seatbelt and math.random(1,5) >= 4) then
			ejectionLUL(velocity, CurrentVehicle)
		end
	end

	if minorImpact then
		print("Minor Impact!")
		local stallChance = math.random(1, 100)

		local degChance = math.random(1,100)

		if degChance > 75 then
			TriggerEvent('vehicle:randomDegredation', 3, 1)
		end

		if stallChance > 70 then
			if not stalling then
				SetVehicleEngineOn(CurrentVehicle, false, true, true)
				VehicleData.stalledVehicle = CurrentVehicle
				QBCore.Functions.Notify("Your engine has stalled!", "error")
				SetVehicleUndriveable(CurrentVehicle, true)
				stalling = true
				SetTimeout(math.random(3000, 6500), function()
					SetVehicleEngineOn(CurrentVehicle, true, true, true)
					SetVehicleUndriveable(CurrentVehicle, false)
					VehicleData.stalledVehicle = 0
					stalling = nil
				end)
			end
		end
	end

	if CurrentSeat ~= -1 then return end

	local engineHealth = GetVehicleEngineHealth(CurrentVehicle)
	local dmg = healthChange * multiplier
	engineHealth = engineHealth - dmg
	SetVehicleEngineHealth(CurrentVehicle, engineHealth)

	local speedDamage = (PreviousSpeed - CurrentSpeed) * 4
	if speedDamage < 5 then return end

	local wheels = GetVehicleNumberOfWheels(CurrentVehicle)

	for i = 1, wheels do
		DoRandomWheelDamage(CurrentVehicle, i, speedDamage)
	end
end)

RegisterNetEvent('rp_vehicles:client:ejectPassengers', function(pVelocity)
	local chance = math.random(60, 100)

	if VehicleData.seatbelt then
		chance = math.random(10, 100)
	end

	if chance > 70 then
		eject(pVelocity)
	end
end)

local threads = {
	driver = false,
	passenger = false
}
local function DriverThread()
	if threads.driver then return end
	threads.driver = true
	VehicleData.damagedEngine = false
	local currentVehicle = GetVehiclePedIsIn(Ped.handle, false)

	CreateThread(function()
		while threads.driver do
			Wait(3)

			local currentEngineHealth = GetVehicleEngineHealth(currentVehicle)
			local currentBodyHealth = GetVehicleBodyHealth(currentVehicle)

			if currentEngineHealth < 0.0 then
				SetVehicleEngineHealth(currentVehicle,0.0) --Stops the vehicle blowing up while someone is inside, to prevent dumb shit that might happen
			end

			if VehicleData.harness then
				DisableControlAction(0, 75, true)
			else
				EnableControlAction(0, 75, true)
			end

			if currentEngineHealth > 10.0 and (currentEngineHealth < 350.0 or currentBodyHealth < 350.0) and not VehicleData.damagedEngine then
				SetVehicleEngineHealth(currentVehicle, 0)
				SetVehicleUndriveable(currentVehicle, true)
				SetVehicleEngineOn(currentVehicle, false, true, true)
				if not VehicleData.damagedEngine then
					VehicleData.damagedEngine = true
				end
			end

			if VehicleData.damagedEngine and (currentEngineHealth > 350.0) then
				SetVehicleUndriveable(currentVehicle, false)
				VehicleData.damagedEngine = false
			end

			local roll = GetEntityRoll(currentVehicle)
			if IsEntityInAir(currentVehicle) and not IsThisModelABike(GetEntityModel(currentVehicle)) then
				DisableControlAction(0, 59)
				DisableControlAction(0, 60)
			end

			if ((roll > 75.0 or roll < -75.0) or not VehicleData.engine and not IsThisModelABike(GetEntityModel(currentVehicle))) then
				DisableControlAction(2,59,true)
				DisableControlAction(2,60,true)
			end
		end
	end)
end

AddEventHandler('baseevents:enteredVehicle', function(pVehicle, pSeat)
	if pSeat == -1 then
		DriverThread()
	end
end)

AddEventHandler('baseevents:leftVehicle', function(pVehicle, pSeat)
	if pSeat == -1 and threads.driver then
		threads.driver = false
	end
	VehicleData.damagedEngine = false
	VehicleData.seatbelt = false
	VehicleData.harness = false
	VehicleData.cruise = false
end)

AddEventHandler('baseevents:vehicleChangedSeat', function(pVehicle, pNewSeat, pOldSeat)
	VehicleData.damagedEngine = false

	if pNewSeat ~= -1 then
		threads.driver = false
	end

	if pNewSeat == -1 then
		DriverThread()
	end
end)