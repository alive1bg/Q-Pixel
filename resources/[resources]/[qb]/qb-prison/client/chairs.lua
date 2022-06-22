CreateThread(function()
		for k, v in pairs(Config.PrisonChairs) do
			exports['qb-target']:AddBoxZone("BurgerChair"..k, v.location, v.width, v.height, { name="BurgerChair"..k, heading = v.heading, debugPoly = false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "jim-burgershot:Chair", icon = "fas fa-chair", label = "Sit Down", loc = v.location, head = v.heading, seat = v.seat }, },
				  distance = v.distance
			})
		end
end)

RegisterNetEvent('jim-burgershot:Chair')
AddEventHandler('jim-burgershot:Chair', function(data)
	local ped = PlayerPedId()
	TaskStartScenarioAtPosition(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head, 0, 1, true)
	bseat = data.seat
end)

CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = true else sitting = false  end
		if sitting then
			if IsControlJustReleased(0, 202) then
				ClearPedTasks(ped)
				if bseat == 1 then SetEntityCoords(ped, vector3(1786.07, 2548.28, 45.67)) end
				
				if bseat == 2 then SetEntityCoords(ped, vector3(1786.78, 2548.29, 45.67)) end
				
				if bseat == 3 then SetEntityCoords(ped, vector3(1787.48, 2548.22, 45.67)) end
				
				if bseat == 4 then SetEntityCoords(ped, vector3(1788.16, 2548.27, 45.67)) end
				
				if bseat == 5 then SetEntityCoords(ped, vector3(1786.02, 2546.34, 45.67)) end
				if bseat == 6 then SetEntityCoords(ped, vector3(1788.21, 2546.39, 45.67)) end
				if bseat == 7 then SetEntityCoords(ped, vector3(1788.17, 2549.96, 45.67)) end
				if bseat == 8 then SetEntityCoords(ped, vector3(1787.46, 2549.95, 45.67)) end
				if bseat == 9 then SetEntityCoords(ped, vector3(1786.78, 2549.91, 45.67)) end
				if bseat == 10 then SetEntityCoords(ped, vector3(1788.22, 2551.82, 45.67)) end
				if bseat == 11 then SetEntityCoords(ped, vector3(1788.14, 2553.55, 45.67)) end
				if bseat == 12 then SetEntityCoords(ped, vector3(1787.5, 2553.49, 45.67)) end
				if bseat == 13 then SetEntityCoords(ped, vector3(1786.74, 2553.52, 45.67)) end
				if bseat == 14 then SetEntityCoords(ped, vector3(1786.09, 2553.51, 45.67)) end
				if bseat == 15 then SetEntityCoords(ped, vector3(1786.07, 2555.36, 45.67)) end
				if bseat == 16 then SetEntityCoords(ped, vector3(1786.78, 2555.42, 45.67)) end
				
				if bseat == 17 then SetEntityCoords(ped, vector3(1787.55, 2555.39, 45.67)) end
				if bseat == 18 then SetEntityCoords(ped, vector3(1788.13, 2555.41, 45.67)) end
				
				if bseat == 19 then SetEntityCoords(ped, vector3(1782.31, 2546.4, 45.67)) end
				
				if bseat == 20 then SetEntityCoords(ped, vector3(1781.6, 2546.39, 45.67)) end
				if bseat == 21 then SetEntityCoords(ped, vector3(1780.96, 2546.37, 45.67)) end
				
				if bseat == 22 then SetEntityCoords(ped, vector3(1780.26, 2546.37, 45.67)) end
				if bseat == 23 then SetEntityCoords(ped, vector3(1780.23, 2548.19, 45.67)) end
				
				if bseat == 24 then SetEntityCoords(ped, vector3(1781.02, 2548.2, 45.67)) end
				if bseat == 25 then SetEntityCoords(ped, vector3(1781.68, 2548.21, 45.67)) end
				if bseat == 26 then SetEntityCoords(ped, vector3(1782.36, 2548.26, 45.67)) end
				if bseat == 27 then SetEntityCoords(ped, vector3(1780.26, 2549.87, 45.67)) end
				if bseat == 28 then SetEntityCoords(ped, vector3(1780.95, 2549.9, 45.67)) end
				if bseat == 29 then SetEntityCoords(ped, vector3(1781.74, 2549.91, 45.67)) end
				if bseat == 30 then SetEntityCoords(ped, vector3(1782.35, 2549.95, 45.67)) end
				if bseat == 31 then SetEntityCoords(ped, vector3(1780.28, 2551.8, 45.67)) end
				if bseat == 32 then SetEntityCoords(ped, vector3(1781.02, 2551.82, 45.67)) end
				if bseat == 33 then SetEntityCoords(ped, vector3(1781.7, 2551.81, 45.67)) end
				if bseat == 34 then SetEntityCoords(ped, vector3(1782.36, 2551.8, 45.67)) end
				if bseat == 35 then SetEntityCoords(ped, vector3(1780.29, 2553.48, 45.67)) end
				if bseat == 36 then SetEntityCoords(ped, vector3(1780.98, 2553.56, 45.67)) end
				if bseat == 37 then SetEntityCoords(ped, vector3(1782.32, 2553.49, 45.67)) end
				if bseat == 38 then SetEntityCoords(ped, vector3(1780.23, 2555.4, 45.67)) end
				if bseat == 39 then SetEntityCoords(ped, vector3(1781.02, 2555.42, 45.67)) end
				if bseat == 40 then SetEntityCoords(ped, vector3(1782.29, 2555.39, 45.67)) end
				if bseat == 41 then SetEntityCoords(ped, vector3(1781.64, 2555.37, 45.67)) end
				if bseat == 42 then SetEntityCoords(ped, vector3(1781.67, 2553.58, 45.67)) end
				bseat = 0
			end
		end
		Wait(7)
	end
end)

Config.PrisonChairs = {
	{ location = vector3(1786.07, 2548.28, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 1},
	{ location = vector3(1786.78, 2548.29, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 2 },
	{ location = vector3(1787.48, 2548.22, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 3 },
	{ location = vector3(1788.16, 2548.27, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 4 },
	{ location = vector3(1786.02, 2546.34, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 5 },
	{ location = vector3(1788.21, 2546.39, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 6 },
	{ location = vector3(1788.17, 2549.96, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 7 },
	{ location = vector3(1787.46, 2549.95, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 8 },
	{ location = vector3(1786.78, 2549.91, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 9 },
	{ location = vector3(1788.22, 2551.82, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 10 },
	{ location = vector3(1788.14, 2553.55, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 11 },
	{ location = vector3(1787.5, 2553.49, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 12 },
	{ location = vector3(1786.74, 2553.52, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 13 },
	{ location = vector3(1786.09, 2553.51, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 14 },
	{ location = vector3(1786.07, 2555.36, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 15 },
	{ location = vector3(1786.78, 2555.42, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 16 },
	{ location = vector3(1787.55, 2555.39, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 17 },
	{ location = vector3(1788.13, 2555.41, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 18 },
	{ location = vector3(1782.31, 2546.4, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 19 },
	{ location = vector3(1781.6, 2546.39, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 20 },
	{ location = vector3(1780.96, 2546.37, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 21 },
	{ location = vector3(1780.26, 2546.37, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 22 },
	{ location = vector3(1780.23, 2548.19, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 23 },
	{ location = vector3(1781.02, 2548.2, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 24 },
	{ location = vector3(1781.68, 2548.21, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 25 },
	{ location = vector3(1782.36, 2548.26, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 26 },
	{ location = vector3(1780.26, 2549.87, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 27 },
	{ location = vector3(1780.95, 2549.9, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 28 },
	{ location = vector3(1781.74, 2549.91, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 29 },
	{ location = vector3(1782.35, 2549.95, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 30 },
	{ location = vector3(1780.28, 2551.8, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 31 },
	{ location = vector3(1781.02, 2551.82, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 32 },
	{ location = vector3(1781.7, 2551.81, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 33 },
	{ location = vector3(1782.36, 2551.8, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 34 },
	{ location = vector3(1780.29, 2553.48, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 35 },
	{ location = vector3(1780.98, 2553.56, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 36 },
	{ location = vector3(1782.32, 2553.49, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 37 },
	{ location = vector3(1780.23, 2555.4, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 38 },
	{ location = vector3(1781.02, 2555.42, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 39 },
	{ location = vector3(1782.29, 2555.39, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 40 },
	{ location = vector3(1781.64, 2555.37, 45.67), heading = 190.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 41 },
	{ location = vector3(1781.67, 2553.58, 45.67), heading = 0.0, width = 0.4, height = 0.4, minZ = 45.02, maxZ = 45.22, distance = 1.7, seat = 42 },
	
}
