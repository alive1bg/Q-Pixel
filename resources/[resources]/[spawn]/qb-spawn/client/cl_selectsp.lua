local QBCore = exports['qb-core']:GetCoreObject()
local isJudge = false
local isPolice = false
local isTow = false
local isTaxi = false
local isMedic = false
local isRealestate = false
local isDead = false
local myJob = "Unemployed"
local onDuty = false
local isJailed = 0

AddEventHandler('onResourceStart', function(resource)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    onDuty = PlayerJob.onduty
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    onDuty = PlayerJob.onduty
	if PlayerData.metadata["injail"] > 0 then
		isJailed = 1
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)



Spawn.defaultSpawns = {
	[1] =  { ["pos"] = vector4(272.16, 185.44, 104.67, 320.57), ['info'] = ' Vinewood Blvd Taxi Stand'},
	[2] =  { ["pos"] = vector4(-1833.96, -1223.5, 13.02, 310.63), ['info'] = ' The Boardwalk'},
	[3] =  { ["pos"] = vector4(145.62, 6563.19, 32.0, 42.83), ['info'] = ' Paleto Gas Station'},
	[4] =  { ["pos"] = vector4(-214.24, 6178.87, 31.17, 40.11), ['info'] = ' Paleto Bus Stop'},
	[5] =  { ["pos"] = vector4(1122.11, 2667.24, 38.04, 180.39), ['info'] = ' Harmony Motel'},
	[6] =  { ["pos"] = vector4(453.29, -662.23, 28.01, 5.73), ['info'] = ' LS Bus Station'},
	[7] =  { ["pos"] = vector4(-1266.53, 273.86, 64.66, 28.52), ['info'] = ' The Richman Hotel'},
}

Spawn.motel = {
	[1] = { ["pos"] = vector4(-270.13,-957.28,31.23, 166.11), ['info'] = ' Apartments 1'},
	--[2] = { ["pos"] = vector4(-1236.27,-860.84,12.91,213.56), ['info'] = ' Apartments 2'},
	--[3] = { ["pos"] = vector4(173.96, -631.29, 47.08, 303.12), ['info'] = ' Apartments 3'}
}


Spawn.housingCoords = nil
Spawn.isNew = false

Spawn.tempHousing = {}
Spawn.defaultApartmentSpawn = {}

RegisterNetEvent('qb-houses:client:setHouseConfig', function(houseConfig)
    Spawn.housingCoords = houseConfig
end)

RegisterNetEvent('spawn:clientSpawnData', function(spawnData)
	print(isJailed)
	Login.Selected = false
	Login.CurrentPedInfo = nil
	Login.CurrentPed = nil
	Login.CreatedPeds = {}

	Login.SetTestCam()
	DoScreenFadeIn(1)

	TriggerEvent('qb-weathersync:client:DisableSync')

	if spawnData.hospital.illness == "dead" or spawnData.hospital.illness == "icu" then
		return
	end

	if isJailed >= 1 then
		print("OLA")
		Spawn.overwriteSpawn(spawnData.overwrites)
		return
	end
	
	if spawnData.overwrites ~= nil then
		if isJailed >= 1 then
			print("OLA")
			Spawn.overwriteSpawn(spawnData.overwrites)
		elseif spawnData.overwrites == "new" then
			Spawn.isNew = true
			Spawn.selectedSpawn(' Apartments 1')
			TriggerEvent("backitems:start") 
		end
		return
	end

	SendNUIMessage({
		showSpawnMenu = true,
	})

	local currentSpawns = Spawn.shallowCopy(Spawn.defaultSpawns)
	local currentCheckList = {}

	currentSpawns[#currentSpawns + 1] = Spawn.getDevSpawn()
	currentSpawns[#currentSpawns + 1] = Spawn.getRoosterSpawn()
	currentSpawns[#currentSpawns + 1] = Spawn.lastPos()
	currentSpawns[#currentSpawns + 1] = Spawn.motel[1]
	Spawn.defaultApartmentSpawn = spawnData.motelRoom
	Spawn.tempHousing = {}

	

	for k,v in pairs(spawnData.houses) do
		local data = Spawn.createDefaultData(k)
		currentSpawns[#currentSpawns + 1] = data
		Spawn.tempHousing[#Spawn.tempHousing+1] = data
		currentCheckList[k] = true
	end

	for k,v in pairs(spawnData.keys) do
		if not currentCheckList[k] then
			currentSpawns[#currentSpawns + 1] = Spawn.createDefaultData(k)
		end
	end

	-- fuck json , makes me only send the info of the table :( , json does not support vector4 kek
	local infoTable = {}
	for i=1,#currentSpawns do
		local spawn = currentSpawns[i]
		print("Setting spawn points")
		infoTable[i] = {["info"] = spawn.info,["posX"] = spawn.pos.x,["posY"] = spawn.pos.y,["checkS"] = i}
	end


	local fav = exports["storage"]:tryGet("string","npfavorite")
	local fav = nil
	if fav == nil then fav = "" end

	local fonund = false
	for k,v in pairs(currentSpawns) do
		if fav == v.info then fonund = true end
	end

	if not fonund then fav = "" end

	Wait(200)
	SetNuiFocus(true,true)
	SendNUIMessage({
		updateSpawnMenu = true,
		spawns = infoTable,
		fav = fav
	})

	Spawn.housingCoords = nil
end)



function round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

function Login.SetTestCam()
	--LoginSafe.Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	local camCoords = {-3968.85, 2015.93,502.22 }
	SetEntityCoordsNoOffset(PlayerPedId(), vector3(-3971.05, 2015.65, 500.92 ), false, false, false, false)
	SetCamRot(LoginSafe.Cam, -90.0, 0.0, 250.0, 2)
	SetCamCoord(LoginSafe.Cam, camCoords[1], camCoords[2], camCoords[3])
	StopCamShaking(LoginSafe.Cam, true)
	SetCamFov(LoginSafe.Cam, 50.0)
	SetCamActive(LoginSafe.Cam, true)
	RenderScriptCams(true, false, 0, true, true)
end

function Spawn.getDevSpawn()
	local spawn = nil


	-- local devspawn = exports["storage"]:tryGet("vector4","devspawn")
	-- if devspawn then
	-- 	spawn = { ["pos"] = devspawn, ['info'] = 'Dev Spawn'}
	-- end

	return spawn
end 

function Spawn.lastPos()
	local spawn = nil

	QBCore.Functions.GetPlayerData(function(PlayerData)
		spawn = { ["pos"] = vector4(PlayerData.position.x, PlayerData.position.y, PlayerData.position.z, 31.532089), ['info'] = 'Last Location'}
	end)

	return spawn
end


function Spawn.getRoosterSpawn()
	local spawn = nil

	if PlayerJob.name == 'police' then
		spawn = { ["pos"] = vector4(451.76196, -983.7982, 30.689517, 271.5689), ['info'] = ' MRPD'} 
	end
	if PlayerJob.name == 'ambulance' then
		spawn = { ["pos"] = vector4(305.95043, -600.2199, 43.284053, 332.30572), ['info'] = ' Pillbox Medical'} --COORDS NEED CHANGING
	end
	if PlayerJob.name == 'tow' then
		spawn = { ["pos"] = vector4(-184.6686, -1163.749, 23.671413, 90.724411), ['info'] = ' Impound Yard'} --COORDS NEED CHANGING
	end
	if PlayerJob.name == 'taxi' then
		spawn = { ["pos"] = vector4(895.64343, -179.1653, 74.700309, 330.78356), ['info'] = ' TaxiCab Co'} --COORDS NEED CHANGING
	end
	if PlayerJob.name == 'realestate' then
		spawn = { ["pos"] = vector4(-720.8521, 270.57437, 84.649864, 31.532089), ['info'] = ' Real Estate Office'} --COORDS NEED CHANGING
	end

	return spawn
end

function Spawn.createDefaultData(housing_id)
	local defaultData = nil

	if Spawn.housingCoords == nil or Spawn.housingCoords[housing_id] == nil then return end
	-- if Spawn.housingCoords[housing_id].assigned then return end

	local housing = Spawn.housingCoords[housing_id]
	local pos = vector4(housing.coords.enter.x, housing.coords.enter.y, housing.coords.enter.z, housing.coords.enter.h)
	defaultData = {["pos"] = pos, ["info"] = housing_id}

	return defaultData
end

function Spawn.selectedSpawn(spawnInfo)

	if spawnInfo == nil or spawnInfo == "" or type(spawnInfo) ~= "string" then
		return
	end

	Login.DeleteCamera()
	SetNuiFocus(false,false)
	TriggerEvent("inSpawn",false)
	local apartment = Spawn.obtainApartmentType(spawnInfo)
	if apartment then
		DoScreenFadeOut(2)
		TriggerServerEvent("apartments:server:CreateApartment", 'apartment1', 'Alta Street', Spawn.isNew)
	else
		local pos = Spawn.obtainWorldSpawnPos(spawnInfo)
		if pos then
			SetEntityCoords(PlayerPedId(),pos.x,pos.y,pos.z)
			SetEntityHeading(PlayerPedId(),pos.w)

			doCamera(pos.x,pos.y,pos.z)
			DoScreenFadeOut(2)

			Login.DeleteCamera()

			Wait(200)

			TriggerEvent('qb-weathersync:client:EnableSync')

			DoScreenFadeIn(2500)
			TriggerEvent("cn-spawn:characterSpawned")
		else

			local pos = Spawn.obtainHousingPos(spawnInfo)
			if pos then

				doCamera(pos.x,pos.y,pos.z)
				DoScreenFadeOut(2)

				Login.DeleteCamera()
				SetEntityCoords(PlayerPedId(),pos.x,pos.y,pos.z)
				SetEntityHeading(PlayerPedId(),pos.w)
				Wait(200)

				DoScreenFadeIn(2500)
				Login.characterSpawned()
				TriggerEvent("housing:playerSpawned",spawnInfo)
			end
		end
 	end
	isNear = false
 	Spawn.tempHousing  = {}
end


function Spawn.overwriteSpawn(overwrite)
	local pos = vector4(1770.2215, 2480.3691, 45.816719, 27.488483) -- default prison
	

	if overwrite == "maxsec" then
		pos = vector4(1690.75,2593.14,45.61,178.75)
	elseif overwrite == "rehab" then
		pos = vector4(-1475.86,884.47,182.93,93.0)
	end

	SetEntityCoords(PlayerPedId(),pos.x,pos.y,pos.z)
	SetEntityHeading(PlayerPedId(),pos.w)

	Login.DeleteCamera()
	SetNuiFocus(false,false)
 	--doCamera(pos.x,pos.y,pos.z)
 	Wait(300)
	DoScreenFadeOut(5)
	--Login.DeleteCamera()

	TriggerServerEvent("jail:characterFullySpawend")
	Wait(200)

	DoScreenFadeIn(2500)
	Login.characterSpawned()
end

cam = 0
function doCamera(x,y,z)

	DoScreenFadeOut(1)
	if(not DoesCamExist(cam)) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end

	i = 3200
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	SetCamActive(cam,  true)
	RenderScriptCams(true,  false,  0,  true,  true)
	DoScreenFadeIn(1500)
	local camAngle = -90.0
	while i > 1 do
		local factor = i / 50
		if i < 1 then i = 1 end
		i = i - factor
		SetCamCoord(cam, x,y,z+i)
		if i < 1200 then
			DoScreenFadeIn(600)
		end
		if i < 90.0 then
			camAngle = i - i - i
		end
		SetCamRot(cam, camAngle, 0.0, 0.0)
		Wait(2/i)
	end
end

RegisterNetEvent("QBCore:Client:OnJobUpdate") -- dont edit this unless you don't use qb-core
AddEventHandler("QBCore:Client:OnJobUpdate", function(jobInfo)
    myJob = jobInfo.name
    if isMedic and myJob ~= "ambulance" then isMedic = false end
    if isRealestate and myJob ~= "realestate" then isRealestate = false end
    if isPolice and myJob ~= "police" then isPolice = false end
    if isTow and myJob ~= "tow" then isTow = false end
    if isTaxi and myJob ~= "taxi" then isTaxi = false end
    if isTuner and myJob ~= "tuner" then isTuner = false end
    if myJob == "police" then isPolice = true end
    if myJob == "tow" then isTow = true end
    if myJob == "taxi" then isTaxi = true end
    if myJob == "tuner" then isTuner = true end
    if myJob == "ambulance" then isMedic = true end
    if myJob == "realestate" then isRealestate = true end
end)

RegisterNetEvent('QBCore:Client:SetDuty') -- dont edit this unless you don't use qb-core
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    myJob = QBCore.Functions.GetPlayerData().job.name
    if isMedic and myJob ~= "ambulance" then isMedic = false end
    if isRealestate and myJob ~= "realestate" then isRealestate = false end
    if isPolice and myJob ~= "police" then isPolice = false end
    if isTuner and myJob ~= "tuner" then isTuner = false end
    if myJob == "police" then isPolice = true onDuty = duty end
    if myJob == "ambulance" then isMedic = true onDuty = duty end
    if myJob == "realestate" then isRealestate = true onDuty = duty end
    if myJob == "tuner" then isTuner = true onDuty = duty end
end)