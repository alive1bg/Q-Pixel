local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('rl-hud:CheckMoney', function(source, cb, cost)
	local retval = false
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player ~= nil and Player['PlayerData']['money']['cash'] >= cost then 
        Player.Functions.RemoveMoney('cash', cost)
		retval = true
	end
	
	cb(retval)
end)