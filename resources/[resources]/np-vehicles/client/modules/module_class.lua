local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state['isLoggedIn']

local Classes = {
	[180] = "S",
	[175] = "A",
	[170] = "B",
	[165] = "C",
	[160] = "D"
}
local function getClass(pVehicle)
	local isMotorCycle = IsThisModelABike(GetEntityModel(pVehicle))
	local isModified, fInitialDriveMaxFlatVel = getVehicleHandling(pVehicle, "fInitialDriveMaxFlatVel")
	local isModified, fInitialDriveForce = getVehicleHandling(pVehicle, "fInitialDriveForce")
	local isModified, fDriveBiasFront = getVehicleHandling(pVehicle, "fDriveBiasFront")
	local isModified, fInitialDragCoeff = getVehicleHandling(pVehicle, "fInitialDragCoeff")
	local isModified, fTractionCurveMax = getVehicleHandling(pVehicle, "fTractionCurveMax")
	local isModified, fTractionCurveMin = getVehicleHandling(pVehicle, "fTractionCurveMin")
	local isModified, fSuspensionReboundDamp = getVehicleHandling(pVehicle, "fSuspensionReboundDamp")
	local isModified, fBrakeForce = getVehicleHandling(pVehicle, "fBrakeForce")
	local force = fInitialDriveForce
	local handling = (fTractionCurveMax + fSuspensionReboundDamp) * fTractionCurveMin
	local braking = ((fTractionCurveMin / fInitialDragCoeff) * fBrakeForce) * 7
	local accel = (fInitialDriveMaxFlatVel * force) / 10
	local speed = ((fInitialDriveMaxFlatVel / fInitialDragCoeff) * (fTractionCurveMax + fTractionCurveMin)) / 40
	local perfRating = ((accel * 5) + speed + handling + braking) * 15
	local vehClass = "F"

	if isMotorCycle then
		return "M"
	end

	if perfRating > 900 then
		vehClass = "X"
	elseif perfRating > 700 then
		vehClass = "S"
	elseif perfRating > 550 then
		vehClass = "A"
	elseif perfRating > 400 then
		vehClass = "B"
	elseif perfRating > 325 then
		vehClass = "C"
	else
		vehClass = "D"
	end

	return vehClass
end

local function getClassByPlate(pVehicle)
	--do some code here, probably need to call on server and check all vehicles
	QBCore.Functions.TriggerCallback('np_vehicles:server:fetchClass', function(twat)
	end)
end

-- CreateThread(function()
-- 	Wait(5000)
-- 	getClass()
-- end)

exports('getClass', getClass)
exports('getClassByPlate', getClassByPlate)