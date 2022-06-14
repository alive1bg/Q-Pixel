local QBCore = exports['qb-core']:GetCoreObject()

local beanseat = 0
local sitting = false

CreateThread(function()
	if Config.Gabz then
		for k, v in pairs(Config.GabzChairs) do
			exports['qb-target']:AddBoxZone("BeanChair"..k, v.location, v.width, v.depth, { name="BeanChair"..k, heading = v.heading, debugPoly=Config.Debug, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "qb-beanmachine:Chair", icon = "fas fa-chair", label = "Sit Down", loc = v.location, head = v.heading, seat = v.seat }, }, distance = v.distance })
		end
	end
	if Config.UncleJust then
		for k, v in pairs(Config.UncleChairs) do
			exports['qb-target']:AddBoxZone("UBeanChair"..k, v.location, v.width, v.depth, { name="UBeanChair"..k, heading = v.heading, debugPoly=Config.Debug, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "qb-beanmachine:Chair", icon = "fas fa-chair", label = "Sit Down", loc = v.location, head = v.heading, seat = v.seat }, }, distance = v.distance })
		end
	end	
end)

RegisterNetEvent('qb-beanmachine:Chair', function(data)
	local canSit = true
	local sitting = false
	for k, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", "Someone is already sitting there..") canSit = false end
	end
	if canSit then
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head, 0, 1, true)
		beanseat = data.seat
		sitting = true
	end
	while sitting do
		local ped = PlayerPedId()
		if sitting then 
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				--GABZ
				if beanseat == 1 then SetEntityCoords(ped, vector3(124.7, -1031.93, 29.28-0.5)) end
				if beanseat == 2 then SetEntityCoords(ped, vector3(122.79, -1031.92, 29.28-0.5)) end
				if beanseat == 3 then SetEntityCoords(ped, vector3(121.61, -1033.26, 29.28-0.5)) end
				if beanseat == 4 then SetEntityCoords(ped, vector3(121.31, -1034.31, 29.28-0.5)) end
				if beanseat == 5 then SetEntityCoords(ped, vector3(118.58, -1041.51, 29.28-0.5)) end
				if beanseat == 6 then SetEntityCoords(ped, vector3(118.33, -1042.5, 29.28-0.5)) end
				if beanseat == 7 then SetEntityCoords(ped, vector3(118.27, -1044.17, 29.28-0.5)) end
				if beanseat == 8 then SetEntityCoords(ped, vector3(119.69, -1045.51, 29.28-0.5)) end
				if beanseat == 9 then SetEntityCoords(ped, vector3(121.35, -1048.28, 29.28-0.5)) end
				if beanseat == 10 then SetEntityCoords(ped, vector3(123.35, -1029.11, 29.28-0.5)) end
				if beanseat == 11 then SetEntityCoords(ped, vector3(125.21, -1029.64, 29.28-0.5)) end
				
				--UNCLEJUST
				if beanseat == 12 then SetEntityCoords(ped, vector3(-633.09, 234.73, 81.88-0.5)) end
				if beanseat == 13 then SetEntityCoords(ped, vector3(-633.33, 235.65, 81.88-0.5)) end
				if beanseat == 14 then SetEntityCoords(ped, vector3(-633.18, 236.42, 81.88-0.5)) end
				
				if beanseat == 15 then SetEntityCoords(ped, vector3(-623.28, 234.17, 86.33-0.5)) end
				if beanseat == 16 then SetEntityCoords(ped, vector3(-625.67, 233.94, 86.33-0.5)) end
				if beanseat == 17 then SetEntityCoords(ped, vector3(-626.22, 231.48, 86.33-0.5)) end
				
				if beanseat == 18 then SetEntityCoords(ped, vector3(-628.8, 231.53, 86.33-0.5)) end
				if beanseat == 19 then SetEntityCoords(ped, vector3(-629.37, 229.13, 86.33-0.5)) end
				
				if beanseat == 20 then SetEntityCoords(ped, vector3(-624.06, 237.63, 86.33-0.5)) end
				if beanseat == 21 then SetEntityCoords(ped, vector3(-624.83, 235.34, 86.33-0.5)) end
				if beanseat == 22 then SetEntityCoords(ped, vector3(-627.37, 235.66, 86.33-0.5)) end
				
				if beanseat == 23 then SetEntityCoords(ped, vector3(-632.88, 231.85, 86.33-0.5)) end
				if beanseat == 24 then SetEntityCoords(ped, vector3(-632.9, 230.19, 86.33-0.5)) end
				if beanseat == 25 then SetEntityCoords(ped, vector3(-634.17, 229.69, 86.33-0.5)) end
				
				if beanseat == 26 then SetEntityCoords(ped, vector3(-632.73, 227.6, 86.33-0.5)) end
				if beanseat == 27 then SetEntityCoords(ped, vector3(-634.97, 226.02, 86.33-0.5)) end
				
				if beanseat == 28 then SetEntityCoords(ped, vector3(-634.29, 224.31, 86.33-0.5)) end
				if beanseat == 29 then SetEntityCoords(ped, vector3(-634.99, 223.01, 86.33-0.5)) end
				
				if beanseat == 30 then SetEntityCoords(ped, vector3(-635.86, 231.68, 86.07-0.5)) end
				if beanseat == 31 then SetEntityCoords(ped, vector3(-635.83, 233.58, 86.06-0.5)) end
				
				if beanseat == 32 then SetEntityCoords(ped, vector3(-633.6, 236.49, 86.06-0.5)) end
				if beanseat == 33 then SetEntityCoords(ped, vector3(-633.11, 238.64, 86.06-0.5)) end
				
				if beanseat == 34 then SetEntityCoords(ped, vector3(-630.85, 239.81, 86.05-0.5)) end
				if beanseat == 35 then SetEntityCoords(ped, vector3(-629.39, 240.55, 86.05-0.5)) end
				
				if beanseat == 36 then SetEntityCoords(ped, vector3(-626.88, 241.24, 86.03-0.5)) end
				if beanseat == 37 then SetEntityCoords(ped, vector3(-625.29, 241.79, 86.01-0.5)) end
				
				if beanseat == 38 then SetEntityCoords(ped, vector3(-622.11, 241.57, 86.01-0.5)) end
				if beanseat == 39 then SetEntityCoords(ped, vector3(-620.5, 241.43, 86.01-0.5)) end
				
				if beanseat == 40 then SetEntityCoords(ped, vector3(-624.4, 239.71, 86.01-0.5)) end
				if beanseat == 41 then SetEntityCoords(ped, vector3(-626.01, 238.73, 86.02-0.5)) end
				
				if beanseat == 42 then SetEntityCoords(ped, vector3(-628.09, 237.79, 86.03-0.5)) end
				if beanseat == 43 then SetEntityCoords(ped, vector3(-629.75, 236.94, 86.03-0.5)) end
				
				if beanseat == 44 then SetEntityCoords(ped, vector3(-628.61, 227.59, 81.88-0.5)) end
				if beanseat == 45 then SetEntityCoords(ped, vector3(-628.31, 225.18, 81.88-0.5)) end
				
				beanseat = 0
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

Config.GabzChairs = {
	--STOOLS
	{ location = vector3(124.5, -1032.41, 29.27+0.3), heading = 160.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 1 },
	{ location = vector3(122.95, -1032.34, 29.28+0.3), heading = 205.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 2 },
	{ location = vector3(122.19, -1033.4, 29.28+0.3), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 3 },
	{ location = vector3(121.76, -1034.44, 29.28+0.3), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 4 },
	{ location = vector3(119.12, -1041.75, 29.28+0.3), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 5 },
	{ location = vector3(118.74, -1042.75, 29.28+0.3), heading = 235.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 6 },
	{ location = vector3(118.71, -1044.01, 29.28+0.3), heading = 295.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 7 },
	{ location = vector3(119.9, -1044.98, 29.28+0.3), heading = 340.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 8 },
	{ location = vector3(122.45, -1046.87, 29.28+0.3), heading = 86.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, },
	{ location = vector3(121.74, -1048.66, 29.28+0.3), heading = 18.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 9 },
	
	{ location = vector3(117.91, -1047.8, 29.28+0.3), heading = 18.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, },
	{ location = vector3(116.28, -1047.11, 29.28+0.3), heading = 317.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, },
	{ location = vector3(125.15, -1029.07, 29.28+0.3), heading = 118.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 10 },
	{ location = vector3(123.61, -1028.61, 29.28+0.3), heading = 188.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7, seat = 11 },
	
	--SEATING
	{ location = vector3(120.67, -1027.8, 29.28), heading = 165.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(119.02, -1028.51, 29.28), heading = 245.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(119.15, -1031.58, 29.28), heading = 175.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.74, -1032.55, 29.28), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.39, -1033.47, 29.28), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.04, -1034.42, 29.28), heading = 250.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.66, -1035.97, 29.28), heading = 335.0, width = 0.6, depth = 0.6, minZ=28.59, maxZ=29.49, distance = 1.7 },
	
	{ location = vector3(113.5, -1044.37, 28.92), heading = 265.0, width = 0.6, depth = 0.6, minZ=28.09, maxZ=29.09, distance = 1.7 },
	{ location = vector3(114.34, -1045.99, 28.92), heading = 325.0, width = 0.6, depth = 0.6, minZ=28.09, maxZ=29.09, distance = 1.7 },
}
Config.UncleChairs = {
	--STOOLS
	{ location = vector3(-633.64, 234.67, 81.88+0.2), heading = 92.0, width = 0.6, depth = 0.6, minZ=80.88, maxZ=81.98, distance = 1.7, seat = 12 },
	{ location = vector3(-633.75, 235.63, 81.88+0.2), heading = 92.0, width = 0.6, depth = 0.6, minZ=80.88, maxZ=81.98, distance = 1.7, seat = 13 },
	{ location = vector3(-634.03, 236.75, 81.88+0.2), heading = 182.0, width = 0.6, depth = 0.6, minZ=80.88, maxZ=81.98, distance = 1.7, seat = 14 },
	
	--Downstairs
	{ location = vector3(-631.62, 236.27, 81.88), heading = 275.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-628.6, 236.73, 81.88), heading = 95.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-626.22, 235.22, 81.88), heading = 300.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-624.47, 234.09, 81.88), heading = 355.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-622.67, 235.11, 81.88), heading = 55.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-626.85, 229.71, 81.88), heading = 0.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-625.7, 229.69, 81.88), heading = 0.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-624.6, 231.15, 81.88), heading = 90.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-618.61, 232.89, 81.88), heading = 145.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	{ location = vector3(-620.51, 230.18, 81.88), heading = 320.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7 },
	
	--Upstairs
	{ location = vector3(-623.7, 233.62, 86.33), heading = 130.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 15 },
	{ location = vector3(-625.21, 233.45, 86.33), heading = 220.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 16 },
	{ location = vector3(-625.64, 232.02, 86.33), heading = 310.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 17 },
	
	{ location = vector3(-626.82, 231.09, 86.33), heading = 130.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 17 },
	{ location = vector3(-628.39, 230.97, 86.33), heading = 220.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 18 },
	{ location = vector3(-628.82, 229.51, 86.33), heading = 310.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 19 },

	{ location = vector3(-624.59, 237.18, 86.33), heading = 120.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 20 },
	{ location = vector3(-625.31, 235.85, 86.33), heading = 30.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 21 },
	{ location = vector3(-626.81, 236.01, 86.33), heading = 300.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 22 },	
	
	{ location = vector3(-633.4, 232.16, 86.33), heading = 150.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 23 },
	{ location = vector3(-633.4, 230.55, 86.33), heading = 60.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 24 },
	{ location = vector3(-634.76, 229.97, 86.33), heading = 330.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 25 },
	
	{ location = vector3(-633.4, 227.58, 86.33), heading = 85.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 26 },
	{ location = vector3(-634.7, 226.83, 86.33), heading = 355.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 27 },
	{ location = vector3(-635.75, 227.74, 86.33), heading = 265.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 27 },
	
	{ location = vector3(-635.67, 225.62, 86.33), heading = 180.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 27 },
	{ location = vector3(-634.9, 224.33, 86.33), heading = 90.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 28 },
	{ location = vector3(-635.68, 223.1, 86.33), heading = 0.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 29 },
	
	{ location = vector3(-633.07, 222.61, 86.33), heading = 0.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7 },
	{ location = vector3(-631.93, 222.61, 86.33), heading = 0.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7 },
	{ location = vector3(-630.54, 223.7, 86.33), heading = 75.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7 },
	{ location = vector3(-630.29, 224.82, 86.33), heading = 75.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7 },
	--UPPER BALCONY
	{ location = vector3(-636.72, 231.8, 86.08), heading = 4.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 30 },
	{ location = vector3(-636.77, 233.65, 86.06), heading = 184.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 31},
	
	{ location = vector3(-634.11, 237.08, 86.06), heading = 300.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 32 },
	{ location = vector3(-632.86, 236.82, 86.06), heading = 30.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 32 },
	{ location = vector3(-632.59, 238.04, 86.05), heading = 120.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 33 },
	{ location = vector3(-633.83, 238.35, 86.06), heading = 210.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 33 },	
	
	{ location = vector3(-630.14, 240.02, 86.04), heading = 15.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 34 },
	{ location = vector3(-631.28, 240.54, 86.05), heading = 285.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 34 },
	{ location = vector3(-629.63, 241.17, 86.04), heading = 105.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 35 },
	
	{ location = vector3(-627.25, 241.95, 86.04), heading = 285.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 36 },
	{ location = vector3(-626.05, 241.39, 86.03), heading = 15.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 36 },
	{ location = vector3(-625.36, 242.58, 86.01), heading = 105.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 37 },
	
	{ location = vector3(-622.15, 242.37, 86.01), heading = 260.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 38 },
	{ location = vector3(-621.37, 241.42, 86.01), heading = 350.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 38 },
	{ location = vector3(-620.39, 242.2, 86.01), heading = 80.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 39 },
	
	{ location = vector3(-624.04, 238.96, 86.01), heading = 120.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 40 },
	{ location = vector3(-625.59, 238.09, 86.02), heading = 300.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 41 },
	
	{ location = vector3(-627.76, 237.1, 86.03), heading = 120.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 42 },
	{ location = vector3(-629.32, 236.25, 86.04), heading = 300.0, width = 0.6, depth = 0.6, minZ=85.28, maxZ=86.55, distance = 1.7, seat = 43 },
	
	{ location = vector3(-627.61, 227.61, 81.88), heading = 180.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7, seat = 44 },
	{ location = vector3(-628.46, 226.75, 81.88), heading = 270.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7, seat = 44 },
	{ location = vector3(-628.45, 225.91, 81.88), heading = 270.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7, seat = 45 },
	{ location = vector3(-627.53, 224.93, 81.88), heading = 0.0, width = 0.6, depth = 0.6, minZ=80.68, maxZ=81.98, distance = 1.7, seat = 45 },
}

AddEventHandler('onResourceStop', function(r) 
	if r == GetCurrentResourceName() then 
		for k, v in pairs(Config.GabzChairs) do 
			exports['qb-target']:RemoveZone("BeanChair"..k) 
		end 		
		for k, v in pairs(Config.UncleChairs) do 
			exports['qb-target']:RemoveZone("UBeanChair"..k) 
		end 
	end 
end)