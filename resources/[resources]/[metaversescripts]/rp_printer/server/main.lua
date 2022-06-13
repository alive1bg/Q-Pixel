QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- Code

QBCore.Functions.CreateUseableItem("printerdocument", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-printer:client:UseDocument', source, item)
end)

RegisterServerEvent('qb-printer:server:CreateDocument')
AddEventHandler('qb-printer:server:CreateDocument', function(url)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local amount = 1
    if Player ~= nil then
		if amount > 0 then
            info = {}
			info.url = url
            Player.Functions.AddItem("printerdocument", 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["printerdocument"], "add",amount)
        end
    end
end)