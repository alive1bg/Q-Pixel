local VehicleStatus = {}
local VehicleDrivingDistance = {}

local degHealth = {
    ["brakes"] = 100,-- has neg effect
    ["axle"] = 100,	-- has neg effect
    ["radiator"] = 100, -- has neg effect
    ["clutch"] = 100,	-- has neg effect
    ["fuel"] = 100, -- has neg effect
	["electronics"] = 100 --has neg effect
}

local function CreateArray(action)
    local temp = degHealth

    if action == "perfect" then return temp end

    for k,v in pairs(temp) do
        if math.random(1,30) >= 20 then
            temp[k] = math.random(50,60)
        else
            temp[k] = math.random(60,70)
        end
    end
    return temp
end

QBCore.Functions.CreateCallback('qb-vehicletuning:server:GetDrivingDistances', function(source, cb)
    cb(VehicleDrivingDistance)
end)

RegisterServerEvent('qb-vehicletuning:server:UpdateDrivingDistance', function(amount, plate)
    if plate == nil then return end
    exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `plate` = @plate OR `fakeplate` = @plate", {['@plate'] = plate}, function(result)
        if result[1] ~= nil then
            exports.oxmysql:query("UPDATE `character_vehicles` SET `drivingdistance` = @amount WHERE `plate` = @plate", {['@amount'] = amount, ['@plate'] = result[1].plate})
        end
    end)
end)

RegisterServerEvent('qb-vehicletuning:server:UpdateVehicleFuel', function(amount, plate)
    if plate == nil then return end
    exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `fakeplate` = ? OR `plate` = ?", {plate, plate}, function(results)
        if results[1] ~= nil then
            exports.oxmysql:query("UPDATE `character_vehicles` SET `fuel` = @fuel WHERE `plate` = @plate", {['@fuel'] = amount, ['@plate'] = results[1].plate})
        end
    end)
end)

QBCore.Functions.CreateCallback('rp_vehicletuning:server:IsVehicleOwned', function(source, cb, plate)
    local retval = false
    exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `fakeplate` = ? OR `plate` = ?", {plate, plate}, function(results)
        if results[1] ~= nil then
            retval = results[1].drivingdistance
        end
        cb(retval)
        return
    end)
end)

RegisterServerEvent("vehiclemod:server:updatePart", function(plate, engineHealth, bodyHealth, wheels, doors, dirt)
    local src = source
    --print(engineHealth, bodyHealth, wheels, doors, dirt)
    if (plate == nil or plate == "") then return end
    exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `fakeplate` = ? OR `plate` = ?", {plate, plate}, function(results)
        if results[1] then
            local oldStatus = json.decode(results[1].status)
            oldStatus.engine = engineHealth
            oldStatus.body = bodyHealth
            oldStatus.StoredDamage.doors = doors
            oldStatus.StoredDamage.wheels = wheels
            oldStatus.dirt = dirt
            exports.oxmysql:query("UPDATE `character_vehicles` SET `status` = @newStatus WHERE `plate` = @plate", {['@newStatus'] = json.encode(oldStatus), ['@plate'] = results[1].plate})
        end
    end)
end)

--[[
    ["brakes"] = 0,-- has neg effect
	["axle"] = 0,	-- has neg effect
	["radiator"] = 0, -- has neg effect
	["clutch"] = 0,	-- has neg effect
    ["fuel"] = 0 -- has neg effect
]]

RegisterServerEvent('rp_vehicletuning:server:SetPartLevel', function(plate, data, extraData)
    local src = source
    exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `fakeplate` = ? OR `plate` = ?", {plate, plate}, function(results)
        if results[1] ~= nil then
            local oldResults = json.decode(results[1].status)
            if data.isEngine then
                oldResults["engine"] = extraData ~= nil and extraData.engine or Config.MaxStatusValues["engine"]
            end
            if data.isBody then
                oldResults["body"] = extraData ~= nil and extraData.body or Config.MaxStatusValues["body"]
            end
            if data.isWheels then
                for k,v in pairs(oldResults.StoredDamage.wheels) do
                    oldResults.StoredDamage.wheels[k]["isBurst"] = false
                end
            end
            if data.isBrakes then
                oldResults["brakes"] = Config.MaxStatusValues["brakes"]
            end
            if data.isAxle then
                oldResults["axle"] = Config.MaxStatusValues["axle"]
            end
            if data.isRadiator then
                oldResults["radiator"] = Config.MaxStatusValues["radiator"]
            end
            if data.isClutch then
                oldResults["clutch"] = Config.MaxStatusValues["clutch"]
            end
            if data.isFuel then
                oldResults["fuel"] = Config.MaxStatusValues["fuel"]
            end

			if data.isElectronics then
				oldResults["electronics"] = Config.MaxStatusValues["electronics"]
			end
			
            exports.oxmysql:query("UPDATE `character_vehicles` SET `status` = @newStatus WHERE `plate` = @plate", {['@newStatus'] = json.encode(oldResults), ['@plate'] = results[1].plate})
        end
    end)
end)

--{"StoredDamage":{"doors":[{"doorID":0,"isBroken":false},{"doorID":1,"isBroken":false},{"doorID":2,"isBroken":false},{"doorID":3,"isBroken":false}],"wheels":[{"isBurst":false,"wheelID":0},{"isBurst":false,"wheelID":1},{"isBurst":false,"wheelID":2},{"isBurst":false,"wheelID":3},{"isBurst":false,"wheelID":4},{"isBurst":false,"wheelID":5},{"isBurst":false,"wheelID":6},{"isBurst":false,"wheelID":7},{"isBurst":false,"wheelID":8}]},"dirt":0.0,"engine":1000.0,"body":1000.0,"axle":100,"clutch":100,"brakes":100,"fuel":100,"radiator":100,"electronics":100}
RegisterServerEvent("vehiclemod:server:fixEverything", function(plate)
    exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `fakeplate` = ? OR `plate` = ?", {plate, plate}, function(results)
        if results[1] ~= nil then
            local oldResults = json.decode(results[1].status)
            oldResults["engine"] = 1000.0
            oldResults["body"] = 1000.0
            oldResults["axle"] = 100
            oldResults["clutch"] = 100
            oldResults["brakes"] = 100
            oldResults["fuel"] = 100
            oldResults["radiator"] = 100
			oldResults["electronics"] = 100
            oldResults["dirt"] = 0
            exports.oxmysql:query("UPDATE `character_vehicles` SET `status` = @newStatus WHERE `plate` = @plate", {['@newStatus'] = json.encode(oldResults), ['@plate'] = results[1].plate})
            TriggerClientEvent('rp_vehicletuning:client:setStatus', src, oldResults)
        end
    end)
end)

RegisterNetEvent('vehiclemod:server:updateDegredation', function(plate, degHealth)
    local src = source
    exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `fakeplate` = ? OR `plate` = ?", {plate, plate}, function(results)
        if results[1] ~= nil then
            local oldResults = json.decode(results[1].status)
            for k,v in pairs(degHealth) do
                if k ~= "StoredDamage" then
                    oldResults[k] = v
                end
            end
            exports.oxmysql:query("UPDATE `character_vehicles` SET `status` = @newStatus WHERE `plate` = @plate", {['@newStatus'] = json.encode(oldResults), ['@plate'] = results[1].plate})
            TriggerClientEvent('rp_vehicletuning:client:setStatus', src, oldResults)
        else
            VehicleStatus[plate] = degHealth
            TriggerClientEvent('rp_vehicletuning:client:setStatus', src, VehicleStatus[plate])
        end
    end)
end)

RegisterNetEvent('vehiclemod:server:CreateDegredation', function(plate, miscData)
    local src = source

	local hasRealPlate = exports.rp_fakeplate:hasFakePlate(plate)

	if hasRealPlate then
		plate = hasRealPlate
	end

    if not VehicleStatus[plate] then 
        if miscData.jobVehicle then
			VehicleStatus[plate] = CreateArray('perfect')
			TriggerClientEvent('rp_vehicletuning:client:setStatus', src, VehicleStatus[plate])
			return
        end
        VehicleStatus[plate] = CreateArray()
    end

    TriggerClientEvent('rp_vehicletuning:client:setStatus', src, VehicleStatus[plate])
end)

function IsVehicleOwned(plate)
    local retval = false
    QBCore.Functions.ExecuteSql(true, "SELECT * FROM `character_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] ~= nil then
            retval = true
        end
    end)
    return retval
end

exports('GetVehicleStatus', function(plate)
    local retval = nil
	local result = exports.oxmysql:query_async('SELECT `status`, `drivingdistance` FROM `character_vehicles` WHERE `plate` = ? or `fakeplate` = ?', {plate, plate})
	if result[1] ~= nil then
		retval = {status = json.decode(result[1].status), mileage = result[1].drivingdistance}
		goto return_values
	elseif VehicleStatus[plate] then
		retval = {status = VehicleStatus[plate], mileage = 'unknown'}
		goto return_values
	end

	::return_values::
    return retval
end)

QBCore.Commands.Add("setvehiclestatus", "Set vehicle status", {{name="part", help="Type of status you want to edit"}, {name="amount", help="Level of status"}}, true, function(source, args)
    local part = args[1]:lower()
    local level = tonumber(args[2])
    TriggerClientEvent("vehiclemod:client:setPartLevel", source, part, level)
end, "god")

QBCore.Functions.CreateCallback('rp_vehicletuning:server:GetStatus', function(source, cb, plate)
    local retval = false
    exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `fakeplate` = ? OR `plate` = ?", {plate, plate}, function(result)
        if result[1] ~= nil then
            retval = json.decode(result[1].status)
            cb(retval)
            return
        else
            cb(retval)
            return
        end
    end)
end)

RegisterNetEvent('rp_vehicles:server:tuning:FullReset', function(plate)
    local src = source
    VehicleStatus[plate] = CreateArray('perfect')
    TriggerClientEvent('rp_vehicletuning:client:setStatus', src, VehicleStatus[plate])
end)






local maxValues = {
    ["brakes"] = 100,
    ["axle"] = 100,
    ["radiator"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
	["electronics"] = 100,
	["engine"] = 1000.0,
	["body"] = 1000.0
}

RegisterNetEvent('rp_vehicles:server:updateTuning', function(plate, objToRepair, newAmount, pSrc)
	exports.oxmysql:query("SELECT * FROM `character_vehicles` WHERE `fakeplate` = ? OR `plate` = ?", {plate, plate}, function(result)
		if result[1] ~= nil then
			local vehStatus = json.decode(result[1].status)
			local repairData = vehStatus[objToRepair]
			repairData = repairData + newAmount

			if math.floor(repairData) > maxValues[objToRepair] then
				repairData = maxValues[objToRepair]
			end

			vehStatus[objToRepair] = repairData
			exports.oxmysql:query("UPDATE `character_vehicles` SET `status` = @newStatus WHERE `plate` = @plate", {['@newStatus'] = json.encode(vehStatus), ['@plate'] = result[1].plate})
			if (objToRepair == "body") then
				TriggerClientEvent('rp_vehicles:client:tuningBody', pSrc, vehStatus[objToRepair])
			end
		else
			if VehicleStatus[plate] ~= nil then
				local vehStatus = VehicleStatus[plate]
				local repairData = vehStatus[objToRepair]
				repairData = repairData + newAmount
	
				if math.floor(repairData) > maxValues[objToRepair] then
					repairData = maxValues[objToRepair]
				end

				VehicleStatus[plate][objToRepair] = repairData
				if (objToRepair == "body") then
					TriggerClientEvent('rp_vehicles:client:tuningBody', pSrc, VehicleStatus[plate][objToRepair])
				end
			end
		end
	end)
end)