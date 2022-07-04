QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()

local basicBeklemeCd = 7200 
local hardBeklemeCd = 7200 

local shops = {
    [1] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [2] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [3] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [4] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [5] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [6] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [7] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [8] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [9] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [10] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [11] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [12] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
	[13] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
	[14] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [15] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
	[16] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
    [17] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
	[18] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
	[19] = {
		["son_basic_cd"] = 0,
        ["son_advanced_cd"] = 0,
    },
}

QBCore.Functions.CreateCallback('jd-shoprobbery:serversidecooldown', function(source, cb, marketNo, tip)
    if marketNo ~= nil then
        if tip == "basic" and (os.time() - shops[marketNo]["son_basic_cd"]) > basicBeklemeCd then
            cb(true)
        elseif tip == "hard" and (os.time() - shops[marketNo]["son_advanced_cd"]) > hardBeklemeCd then
            cb(true)
        else
            TriggerClientEvent("QBCore:Notify", source, "This place is already robbed!")
            cb(false)
        end   
   -- else
        -- Drop the ban code here to catch cheaters :D 
       -- TriggerClientEvent('QBCore:Notify', src, ('Theres no safe here are u stupid or what :D'), 'success', 5000)
    end
end)

RegisterServerEvent("jd-shoprobbery:givereward")
AddEventHandler("jd-shoprobbery:givereward", function(tip, kasaNo)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if tip == "basic" and (os.time() - shops[kasaNo]["son_basic_cd"]) > basicBeklemeCd then
        local random = math.random(500, 650)
        xPlayer.Functions.AddMoney('cash', random)
        TriggerClientEvent("QBCore:Notify", source, 'You Found $' .. random .. '')
        shops[kasaNo]["son_basic_cd"] = os.time()
    elseif tip == "hard" and (os.time() - shops[kasaNo]["son_advanced_cd"]) > hardBeklemeCd then
        local random1 = math.random(4000, 6000)
        xPlayer.Functions.AddMoney('cash', random1)
        TriggerClientEvent("QBCore:Notify", source, 'You Found $' .. random1 .. '')
        shops[kasaNo]["son_advanced_cd"] = os.time()
    else
        TriggerClientEvent("QBCore:Notify", source, "You didnt find anything!")
    end
end)