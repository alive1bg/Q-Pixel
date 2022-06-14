CreateThread(function()
	if Config.MLO == "gabz" then
		for k, v in pairs(Config.GabzChairs) do
			exports['qb-target']:AddBoxZone("UniChair"..k, v.location, v.width, v.depth, { name="UniChair"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "jim-vanillaunicorn:Chair", icon = "fas fa-chair", label = "Sit Down", loc = v.location, head = v.heading, seat = v.seat }, },
				  distance = v.distance
			})
		end
	elseif Config.MLO == "van" then
		for k, v in pairs(Config.VanChairs) do
			exports['qb-target']:AddBoxZone("UniChair"..k, v.location, v.width, v.depth, { name="UniChair"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "jim-vanillaunicorn:Chair", icon = "fas fa-chair", label = "Sit Down", loc = v.location, head = v.heading, seat = v.seat }, },
				  distance = v.distance
			})
		end	
	end
end)

RegisterNetEvent('jim-vanillaunicorn:Chair')
AddEventHandler('jim-vanillaunicorn:Chair', function(data)
	local ped = PlayerPedId()
	TaskStartScenarioAtPosition(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head, 0, 1, true)
	vseat = data.seat
end)

CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = true else sitting = false end
		if sitting then
			if IsControlJustReleased(0, 202) then
				ClearPedTasks(ped)
				
				if Config.MLO == "gabz" then
					if vseat == 1 then SetEntityCoords(ped, vector3(126.17, -1282.86, 29.27-0.5)) SetEntityHeading(ped, 300.0) end
					if vseat == 2 then SetEntityCoords(ped, vector3(126.99, -1284.28, 29.27-0.5)) SetEntityHeading(ped, 300.0) end
					if vseat == 3 then SetEntityCoords(ped, vector3(127.69, -1285.48, 29.27-0.5)) SetEntityHeading(ped, 300.0) end
					if vseat == 4 then SetEntityCoords(ped, vector3(128.34, -1286.61, 29.27-0.5)) SetEntityHeading(ped, 300.0) end
					if vseat == 5 then SetEntityCoords(ped, vector3(129.01, -1287.77, 29.27-0.5)) SetEntityHeading(ped, 300.0) end
					
					if vseat == 6 then SetEntityCoords(ped, vector3(94.65, -1292.76, 29.26-0.5)) SetEntityHeading(ped, 300.0) end
					
				elseif Config.MLO == "van" then
					if vseat == 1 then SetEntityCoords(ped, vector3(123.73, -1282.59, 29.28-0.5)) SetEntityHeading(ped, 210.0) end
					if vseat == 2 then SetEntityCoords(ped, vector3(124.63, -1286.36, 29.29-0.5)) SetEntityHeading(ped, 120.0) end
					if vseat == 3 then SetEntityCoords(ped, vector3(125.27, -1287.11, 29.29-0.5)) SetEntityHeading(ped, 210.0) end
					if vseat == 4 then SetEntityCoords(ped, vector3(126.55, -1287.89, 29.29-0.5)) SetEntityHeading(ped, 80.0) end
					
					if vseat == 5 then SetEntityCoords(ped, vector3(109.42, -1292.83, 28.26-0.5)) SetEntityHeading(ped, 30.0) end
					if vseat == 6 then SetEntityCoords(ped, vector3(110.38, -1292.28, 28.26-0.5)) SetEntityHeading(ped, 30.0) end
					if vseat == 7 then SetEntityCoords(ped, vector3(111.73, -1291.48, 28.26-0.5)) SetEntityHeading(ped, 30.0) end
					if vseat == 8 then SetEntityCoords(ped, vector3(94.65, -1292.76, 29.26-0.5)) SetEntityHeading(ped, 300.0) end

				end
				vseat = 0
			end
		end
		Wait(50)
	end
end)

Config.GabzChairs = {
	--BAR STOOLS
	{ location = vector3(126.39, -1282.71, 29.27+0.2), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 1 },
	{ location = vector3(127.23, -1284.14, 29.27+0.2), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 2 },
	{ location = vector3(127.89, -1285.33, 29.27+0.2), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 3 },
	{ location = vector3(128.57, -1286.48, 29.27+0.2), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 4 },
	{ location = vector3(129.22, -1287.62, 29.27+0.2), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 5 },
	--MAIN BOOTHS
	{ location = vector3(124.49, -1293.7, 29.27), heading = 120.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(124.99, -1294.55, 29.27), heading = 120.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(124.62, -1295.98, 29.29), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(123.75, -1296.48, 29.29), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(122.31, -1296.08, 29.27), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(121.82, -1295.23, 29.27), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
		
	{ location = vector3(121.09, -1295.67, 29.27), heading = 120.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(121.58, -1296.52, 29.27), heading = 120.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(121.24, -1297.95, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(120.36, -1298.45, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(118.92, -1298.05, 29.27), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(118.44, -1297.21, 29.27), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	--DANCEFLOOR
	{ location = vector3(123.42, -1289.31, 28.26), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(124.23, -1288.5, 28.26), heading = 75.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(123.96, -1287.38, 28.26), heading = 120.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(123.14, -1286.66, 28.26), heading = 165.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	
	{ location = vector3(121.72, -1286.38, 28.26), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(122.48, -1285.56, 28.26), heading = 75.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(122.25, -1284.46, 28.26), heading = 120.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(121.45, -1283.74, 28.26), heading = 165.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(120.36, -1283.98, 28.26), heading = 210.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	
	{ location = vector3(119.44, -1282.63, 28.26), heading = 100.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(119.05, -1281.76, 28.26), heading = 130.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(118.26, -1281.18, 28.26), heading = 160.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(117.33, -1281.01, 28.26), heading = 180.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(116.41, -1281.34, 28.26), heading = 210.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(115.75, -1282.07, 28.26), heading = 240.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(115.49, -1282.99, 28.26), heading = 270.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(115.73, -1283.97, 28.26), heading = 300.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	
	{ location = vector3(111.3, -1281.78, 28.26), heading = 229.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(112.11, -1281.24, 28.26), heading = 200.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(113.06, -1281.12, 28.26), heading = 170.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(113.98, -1281.51, 28.26), heading = 140.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(114.59, -1282.29, 28.26), heading = 110.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(114.78, -1283.21, 28.26), heading = 90.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(114.51, -1284.14, 28.26), heading = 60.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(113.87, -1284.83, 28.26), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	
	{ location = vector3(117.52, -1285.67, 28.26), heading = 125.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(117.87, -1286.57, 28.26), heading = 98.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(117.74, -1287.52, 28.26), heading = 70.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(117.17, -1288.33, 28.26), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(116.3, -1288.79, 28.26), heading = 10.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(115.32, -1288.73, 28.26), heading = 345.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	
	{ location = vector3(117.32, -1292.84, 28.31), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(116.22, -1293.14, 28.36), heading = 345.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(115.4, -1292.33, 28.26), heading = 300.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	--CENTER
	{ location = vector3(108.2, -1293.5, 28.26), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(109.9, -1292.53, 28.26), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(111.75, -1290.85, 28.26), heading = 70.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(111.99, -1288.48, 28.26), heading = 100.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(110.72, -1286.64, 28.26), heading = 145.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(108.48, -1286.0, 28.26), heading = 180.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(106.37, -1286.72, 28.26), heading = 205.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(104.72, -1287.6, 28.26), heading = 210.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	
	{ location = vector3(116.16, -1303.23, 29.29), heading = 120.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(116.38, -1304.3, 29.29), heading = 75.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(115.6, -1305.15, 29.29), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(113.81, -1306.22, 29.29), heading = 30.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(112.7, -1306.46, 29.29), heading = 345.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(111.86, -1305.69, 29.29), heading = 300.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(110.43, -1303.19, 29.29), heading = 300.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(110.17, -1302.06, 29.29), heading = 255.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(110.94, -1301.22, 29.29), heading = 210.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(111.8, -1300.72, 29.29), heading = 210.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(112.66, -1300.21, 29.29), heading = 210.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	
	{ location = vector3(98.85, -1290.32, 29.26), heading = 120.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(98.23, -1289.37, 29.26), heading = 120.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7 },
	{ location = vector3(95.14, -1293.57, 29.26), heading = 321.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7, seat = 6},
	
	
}

Config.VanChairs = {	
	--BAR
	{ location = vector3(125.05, -1282.64, 29.28), heading = 121.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 1 },
	{ location = vector3(123.39, -1283.58, 29.29), heading = 299.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 1 },
	{ location = vector3(124.96, -1284.63, 29.29), heading = 122.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(125.31, -1285.84, 29.29), heading = 75.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 2 },
	{ location = vector3(126.38, -1287.04, 29.28), heading = 131.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 3 },
	{ location = vector3(126.11, -1288.57, 29.29), heading = 33.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7, seat = 4 },

	--MAIN BOOTHS
	{ location = vector3(124.8, -1294.34, 29.27), heading = 120.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(124.44, -1295.68, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(123.72, -1296.11, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(122.38, -1295.72, 29.27), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
		
	{ location = vector3(121.55, -1296.23, 29.27), heading = 120.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(121.2, -1297.53, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(120.47, -1297.95, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(119.16, -1297.61, 29.27), heading = 300.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	
	--DOOR Guard
	{ location = vector3(118.0, -1296.22, 29.27), heading = 330.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	
	--BACK ROOM
	{ location = vector3(119.19, -1302.77, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(117.04, -1304.01, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(114.96, -1305.23, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(113.14, -1306.27, 29.27), heading = 30.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(110.54, -1301.69, 29.27), heading = 210.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(112.32, -1300.68, 29.27), heading = 210.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	{ location = vector3(114.21, -1299.59, 29.27), heading = 210.0, width = 0.6, depth = 0.6, minZ=28.29, maxZ=29.49, distance = 1.7 },
	
	--DANCEFLOOR
	{ location = vector3(123.72, -1288.85, 28.26), heading = 25.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(123.07, -1286.63, 28.26), heading = 112.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(122.19, -1285.17, 28.27), heading = 131.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(121.41, -1283.82, 28.28), heading = 130.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(119.87, -1283.71, 28.28), heading = 89.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(118.43, -1281.07, 28.27), heading = 143.0, width = 0.6, depth = 0.6, distance = 1.7 },
	--LEFT
	{ location = vector3(106.48, -1297.09, 28.26), heading = 300.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(109.34, -1295.45, 28.26), heading = 81.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(110.24, -1294.89, 28.26), heading = 297.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(113.05, -1293.3, 28.26), heading = 89.0, width = 0.6, depth = 0.6, distance = 1.7 },
	
	--CENTER LEFT
	{ location = vector3(109.11, -1292.4, 28.26), heading = 30.0, width = 0.6, depth = 0.6, distance = 1.7, seat = 5 },
	{ location = vector3(110.19, -1291.79, 28.26), heading = 30.0, width = 0.6, depth = 0.6, distance = 1.7, seat = 6 },
	{ location = vector3(111.45, -1291.08, 28.26), heading = 30.0, width = 0.6, depth = 0.6, distance = 1.7, seat = 7 },
	
	--CENTER MIDDLE
	{ location = vector3(116.89, -1288.53, 28.26), heading = 90.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(116.13, -1286.46, 28.26), heading = 112.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(115.1, -1284.65, 28.26), heading = 118.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(113.83, -1282.91, 28.27), heading = 142.0, width = 0.6, depth = 0.6, distance = 1.7 },
	
	--RIGHT
	{ location = vector3(101.07, -1286.3, 28.26), heading = 294.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(103.31, -1284.89, 28.26), heading = 208.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(104.79, -1284.2, 28.26), heading = 288.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(107.15, -1282.83, 28.26), heading = 165.0, width = 0.6, depth = 0.6, distance = 1.7 },
	
	--CENTER RIGHT
	{ location = vector3(104.87, -1287.78, 28.26), heading = 180.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(106.67, -1286.69, 28.26), heading = 211.0, width = 0.6, depth = 0.6, distance = 1.7 },
	{ location = vector3(108.34, -1285.69, 28.26), heading = 232.0, width = 0.6, depth = 0.6, distance = 1.7 },
	
	{ location = vector3(95.14, -1293.57, 29.26), heading = 321.0, width = 0.6, depth = 0.6, minZ=27.46, maxZ=28.86, distance = 1.7, seat = 8},
}