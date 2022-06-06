local QBCore = exports['qb-core']:GetCoreObject()

local paletoheistreset = 7200

local zamanfalan = false
local bankalar = {
    ['KasabaBanka'] = 0,
	['KasabaBanka1'] = false,
}


QBCore.Functions.CreateUseableItem("bluelaptop", function(source)
    TriggerClientEvent("soygunbaslatma", source)
end)


RegisterServerEvent('jd-bankasoygunu:server:kapi-ac')
AddEventHandler('jd-bankasoygunu:server:kapi-ac', function(banka, tip)
	TriggerClientEvent("jd-bankasoygunu:kapi-kilit", -1, banka, tip, false)
	bankalar["KasabaBanka1"] = true 
end)

RegisterServerEvent('jd-paleto:serverkapi')
AddEventHandler('jd-paleto:serverkapi', function(source)
	TriggerClientEvent("kapilarresetle", -1)
end)


QBCore.Functions.CreateCallback('jd-base:polis-sayi', function(source, cb)
    cb(getJobCount("police"))
end)

function getJobCount(jobName)
    local sayi = 0
    local xPlayers = QBCore.Functions.GetPlayers()
	for i=1, #xPlayers, 1 do
        local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
        if jobName == "mechanic" then
            if xPlayer.PlayerData.job.onduty and (xPlayer.PlayerData.job.name == "mechanic" or xPlayer.PlayerData.job.name == "mechanic_illegal1" or xPlayer.PlayerData.job.name == "mechanic_illegal2" or xPlayer.PlayerData.job.name == "mechanic_hayes" or xPlayer.PlayerData.job.name == "mechanic_bennys") then
                sayi = sayi + 1
            end
        else
            if xPlayer.PlayerData.job.name == jobName and xPlayer.PlayerData.job.onduty then
                sayi = sayi + 1
            end
        end
    end
    return sayi
end

RegisterServerEvent('jd-BankaSoygunu:set-cd-kasaba')
AddEventHandler('jd-BankaSoygunu:set-cd-kasaba', function()
	bankalar["KasabaBanka"] = os.time()
	zamanfalan = true
end)

QBCore.Functions.CreateCallback('jd-banka-soygunu:banka-kontrol', function(source, cb, banka, num)
		if bankalar["KasabaBanka"] then
			if os.time() - bankalar[banka] < paletoheistreset and bankalar[banka] ~= 0 then 
				cb(true)
			else
				cb(false)
			end
		end
end)

RegisterServerEvent('jd-paleto:itemsil')
AddEventHandler('jd-paleto:itemsil', function(item)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	xPlayer.Functions.RemoveItem(item, 1)
end)

RegisterServerEvent('jd-BankaSoygunu:ParaVerServer')
AddEventHandler('jd-BankaSoygunu:ParaVerServer', function(money)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	local para = money
	TriggerEvent('QBCore:Server:AddItem', 'markedbills', math.random(120, 190))
    TriggerClientEvent('inventory:client:ItemBox', QBCore.Shared.Items['markedbills'], 'add')
	--TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, para ..'$ Added')
	QBCore.Functions.Notify("Success! Go get that shit cleaned", 'success')
end)

CreateThread(function() 
    while true do
		if zamanfalan then
            print(os.time() - bankalar["KasabaBanka"])
			if os.time() - bankalar["KasabaBanka"] > paletoheistreset then
				TriggerEvent("server-update", "paleto", "Available")
                TriggerClientEvent("jd-paleto:kapilarkapansin", -1)
                zamanfalan = false
			end
		end
        Wait(10000)
    end
	Wait(10000)
end)