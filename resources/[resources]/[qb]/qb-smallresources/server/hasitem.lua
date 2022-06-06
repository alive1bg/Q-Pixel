QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('robbery:server:hasTV', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local hasPackage = Player.Functions.GetItemByName("stolentv")
 
	if hasPackage ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('robbery:server:hasSafe', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local hasPackage = Player.Functions.GetItemByName("safe")
 
	if hasPackage ~= nil then
        cb(true)
    else
        cb(false)
    end
end)