Citizen.CreateThread(function()
	for k, v in pairs(Chairs) do
		exports['qb-target']:AddBoxZone("uWuChairs"..k, v.location, v.width, v.height, { name="uWuChairs"..k, heading = v.heading, debugPoly = false, minZ = v.minZ, maxZ = v.maxZ, }, 
			{ options = { { event = "qb-uwu:Chair", icon = "fas fa-chair", label = "Sit Down", loc = v.location, head = v.heading }, },
			  distance = v.distance
		})
	end
end)

RegisterNetEvent('qb-uwu:Chair')
AddEventHandler('qb-uwu:Chair', function(data)
	local ped = PlayerPedId()
	TaskStartScenarioAtPosition(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head, 0, 1, true)
end)

Chairs = {
	--Downstairs--
	--Booth1
	{ location = vector3(-573.04, -1058.81, 22.5), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.92, -1058.82, 22.5), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.06, -1060.7, 22.5), heading = 0.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.91, -1060.72, 22.5), heading = 0.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	--Booth2
	{ location = vector3(-572.98, -1062.46, 22.5), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.84, -1062.45, 22.5), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.05, -1064.37, 22.5), heading = 0.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.89, -1064.37, 22.5), heading = 0.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	--Booth3
	{ location = vector3(-573.0, -1066.11, 22.5), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.9, -1066.1, 22.5), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.07, -1068.03, 22.5), heading = 0.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-573.87, -1068.01, 22.5), heading = 0.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	--Fireside
	{ location = vector3(-580.84, -1051.22, 22.35), heading = 277.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-579.78, -1052.51, 22.35), heading = 329.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-577.61, -1052.6, 22.35), heading = 35.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	{ location = vector3(-576.86, -1051.03, 22.35), heading = 108.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 2.7 },
	--Center
	{ location = vector3(-579.72, -1062.12, 22.35), heading = 0.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-580.7, -1062.55, 22.35), heading = 45.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-581.02, -1063.46, 22.35), heading = 90.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-580.64, -1064.45, 22.35), heading = 135.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-579.71, -1064.79, 22.35), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-578.67, -1064.47, 22.35), heading = 225.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-578.33, -1063.39, 22.35), heading = 270.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-578.76, -1062.34, 22.35), heading = 315.75, width = 0.6, height = 0.6, minZ = 21.0, maxZ = 22.45, distance = 1.7 },
	--Stools
	{ location = vector3(-586.18, -1064.68, 22.6), heading = 90.75, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-586.17, -1065.69, 22.6), heading = 90.75, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-586.15, -1066.68, 22.6), heading = 90.75, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-586.17, -1067.69, 22.6), heading = 90.75, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	--Boss sofa
	{ location = vector3(-591.21, -1049.06, 22.35), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-589.95, -1049.06, 22.35), heading = 180.75, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	--Boss Room1
	{ location = vector3(-598.44, -1050.99, 22.35), heading = 270.0, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-598.45, -1050.1, 22.35), heading = 270.0, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	{ location = vector3(-596.26, -1053.52, 22.35), heading = 0, width = 0.6, height = 0.6, minZ = 21.45, maxZ = 22.45, distance = 1.7 },
	--Upstairs
	--Sofa1
	{ location = vector3(-573.72, -1052.29, 26.61), heading = 270.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-573.73, -1053.45, 26.61), heading = 270.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	--Corner Sofa
	{ location = vector3(-569.68, -1066.56, 26.62), heading = 90.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-569.7, -1068.13, 26.62), heading = 90.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-570.97, -1069.42, 26.62), heading = 0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-572.61, -1069.4, 26.62), heading = 0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	--Boss Room 2
	{ location = vector3(-577.09, -1065.14, 26.61), heading = 165.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-578.82, -1065.24, 26.61), heading = 200.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-578.24, -1067.83, 26.61), heading = 0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	--Boss Room 3
	{ location = vector3(-577.0, -1062.6, 26.61), heading = 0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-579.1, -1061.28, 26.61), heading = 270.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-577.39, -1057.87, 26.61), heading = 180.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
	{ location = vector3(-578.59, -1057.9, 26.61), heading = 180.0, width = 0.6, height = 0.6, minZ=25.61, maxZ=27.0, distance = 1.7 },
}
