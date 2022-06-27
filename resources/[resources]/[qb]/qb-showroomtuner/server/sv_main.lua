local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("qb-showroomtuner:purchaseVehicle", function(source, cb, model, price, amount)
	local src = source;
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local cash = xPlayer.PlayerData.money["cash"]
	local plate = GeneratePlate()
	if 999999 >= price  then
         xPlayer.Functions.RemoveMoney('cash', price)
		PurchaseCar(src, model, plate)
		cb(true, model)
		return
	else
		if tonumber(cash[2].money) >= price  then
        	xPlayer.Functions.RemoveMoney('cash', price)
			PurchaseCar(src, model)
			cb(true, model)
			return
    	end
	end;
end)

function PurchaseCar(source, model, plate)
	local src = source
    local model = model
    local hashkey = GetHashKey(model)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local cid = xPlayer.PlayerData.citizenid
    local plate = GeneratePlate()
	local garage = "aptgarage"
	exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, garage, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
		xPlayer.PlayerData.license,
		cid,
		model,
		garage,
		hashkey,
		'{}',
		plate,
		0
	})
	TriggerClientEvent('qb-showroomtuner:client:buyShowroomVehicle', src, model, plate)
	TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your purchase!', 'success')
end

function GeneratePlate()
    local plate = math.random(0, 99)..""..GetRandomLetter(3)..""..math.random(0, 999)
    local result = exports.oxmysql:scalarSync('SELECT plate FROM player_vehicles WHERE plate=@plate', {['@plate'] = plate})
    if result then
        plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    end
    return plate:upper()
end

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GetRandomLetter(length)
	Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end