local QBCore = exports['qb-core']:GetCoreObject()

gsrData = {}



QBCore.Commands.Add("gsr", "Gunshot test", {}, false, function(source, args,user)
    local Source = source
    local Player = QBCore.Functions.GetPlayer(Source)
    local number = tonumber(args[1])
    if args[1] ~= nil then 
        if Player.PlayerData.job.name == 'police' or Player.PlayerData.job.name == 'bcso' or Player.PlayerData.job.name == 'sast' or Player.PlayerData.job.name == 'police4' or Player.PlayerData.job.name == 'police5' or Player.PlayerData.job.name == 'police6' or Player.PlayerData.job.name == 'police7' or Player.PlayerData.job.name == 'police8' or Player.PlayerData.job.name == 'ems' or Player.PlayerData.job.name == 'ems1' or Player.PlayerData.job.name == 'ems2' or Player.PlayerData.job.name == 'ems3' then        	
            local identifier = GetPlayerIdentifiers(number)[1]
        	if identifier ~= nil then
            	gsrcheck(source, identifier)
        	end
    	else
            TriggerClientEvent('QBCore:Notify', Source, 'You must be a cop to use the GSR test.', 'error')
    	end
	else
        TriggerClientEvent('QBCore:Notify', Source, 'Correct Usage Is: /gsr (player id)', 'error')
	end
end)

AddEventHandler('playerDropped', function(source)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    if gsrData[identifier] ~= nil then
        gsrData[identifier] = nil
    end
end)

RegisterNetEvent("GSR:Remove")
AddEventHandler("GSR:Remove", function()
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    if gsrData[identifier] ~= nil then
        gsrData[identifier] = nil
    end
end)

RegisterServerEvent('GSR:SetGSR')
AddEventHandler('GSR:SetGSR', function()
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    gsrData[identifier] = os.time(os.date("!*t")) + Config.gsrTime
end)



function gsrcheck(source, identifier)
    local Source = source
    local identifier = identifier
    local Player = QBCore.Functions.GetPlayer(src)
	if Config.UseCharName then
		
		Wait(100)
		local fullName = Player.PlayerData.charinfo.firstname .. "_" .. Player.PlayerData.charinfo.lastname
		if gsrData[identifier] ~= nil then
            TriggerClientEvent('QBCore:Notify', Source, 'Test for '..fullName..' comes back POSITIVE (Has Shot)')
    	else
            TriggerClientEvent('QBCore:Notify', Source, 'Test for '..fullName..' comes back NEGATIVE (Has Not Shot)', 'error')
    	end
	else
    	if gsrData[identifier] ~= nil then
            TriggerClientEvent('QBCore:Notify', Source, 'Test comes back POSITIVE (Has Shot)')
    	else
            TriggerClientEvent('QBCore:Notify', Source, 'Test comes back NEGATIVE (Has Not Shot)', 'error')
    	end
	end
end

RegisterServerEvent('GSR:Status2')
AddEventHandler('GSR:Status2', function(playerid)
    local Source = source
    local identifier = GetPlayerIdentifiers(playerid)[1]
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.UseCharName then
		
		Wait(100)
		local fullName = Player.PlayerData.charinfo.firstname .. "_" .. Player.PlayerData.charinfo.lastname
		if gsrData[identifier] ~= nil then
            TriggerClientEvent('QBCore:Notify', Source, 'Test for '..fullName..' comes back POSITIVE (Has Shot)')
    	else
            TriggerClientEvent('QBCore:Notify', Source, 'Test for '..fullName..' comes back NEGATIVE (Has Not Shot)', 'error')
    	end
	else
    	if gsrData[identifier] ~= nil then
            TriggerClientEvent('QBCore:Notify', Source, 'Test comes back POSITIVE (Has Shot)')
    	else
            TriggerClientEvent('QBCore:Notify', Source, 'Test comes back NEGATIVE (Has Not Shot)', 'error')
    	end
	end
end)

QBCore.Functions.CreateCallback('GSR:Status', function(source, cb)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    if gsrData[identifier] ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

function removeGSR()
    for k, v in pairs(gsrData) do
        if v <= os.time(os.date("!*t")) then
            gsrData[k] = nil
        end
    end
end

function gsrTimer()
    removeGSR()
    SetTimeout(Config.gsrAutoRemove, gsrTimer)
end

gsrTimer()