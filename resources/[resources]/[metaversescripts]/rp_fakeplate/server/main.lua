local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

local FakePlates = {}

QBCore.Functions.CreateUseableItem("screwdriverset", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-fakeplate:client:RemovePlate", source)
    end
end)

QBCore.Functions.CreateUseableItem("license_plate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-fakeplate:client:ChangePlate", source)
    end
end)

RegisterServerEvent('qb-fakeplate:server:updatePlate')
AddEventHandler('qb-fakeplate:server:updatePlate', function(realplate, fakeplate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    if fakeplate == nil then fakeplate = "" end

    exports.oxmysql:query('UPDATE `player_vehicles` SET `fakeplate` = @fakeplate WHERE `plate` = @plate', {['@plate'] = realplate, ['@fakeplate'] = fakeplate})
end)

QBCore.Functions.CreateCallback("fakeplate:server:GeneratePlate", function(source, cb, realplate)
    local src = source
    local plate = GeneratePlate()
    if plate ~= nil then
        --exports.oxmysql:query('UPDATE `player_vehicles` SET `fakeplate` = @fakeplate WHERE `plate` = @plate', {['@fakeplate'] = plate, ['@plate'] = realplate})
		FakePlates[plate] = realplate
        cb(plate)
    else
        cb(nil)
    end
end)

QBCore.Functions.CreateCallback("qb-fakeplate:server:getRealPlate", function(source, cb, plate)
    local src = source
    local goodplate = plate
     QBCore.Functions.ExecuteSql(true, "SELECT * FROM `player_vehicles` WHERE `fakeplate` = '"..plate.."'", function(result)
        if result[1].plate ~= nil then
            goodplate = result[1].plate
			FakePlates[plate] = nil
			cb(goodplate)
        end
    end)
end)

QBCore.Functions.CreateCallback("fakeplate:server:GetOwnedVehicles", function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:query('SELECT * FROM `player_vehicles` WHERE cid = @citizenid', {['@citizenid'] = pData.PlayerData.citizenid}, function(result)
        if result[1] ~= nil then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

function GetRealPlate(plate)
    local goodplate = plate
     QBCore.Functions.ExecuteSql(true, "SELECT * FROM `player_vehicles` WHERE `fakeplate` = '"..plate.."'", function(result)
        if result[1].plate ~= nil then
           return result[1].plate
        end
    end)
end

function GeneratePlate()
    local plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    QBCore.Functions.ExecuteSql(true, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] ~= nil then
            GeneratePlate() --Found a duplicate, Generate another plate number
        end
        return plate
    end)
    return plate:upper()
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

exports('hasFakePlate', function(plate)
	if FakePlates[plate] then
		return FakePlates[plate]
	end
end)
