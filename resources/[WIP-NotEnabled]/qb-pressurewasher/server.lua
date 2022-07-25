local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('pwasher:pay')
AddEventHandler('pwasher:pay', function(price)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local amount = math.floor(price + 0.5)

	if price > 0 then
		xPlayer.Functions.RemoveMoney('cash', amount)
	end
end)