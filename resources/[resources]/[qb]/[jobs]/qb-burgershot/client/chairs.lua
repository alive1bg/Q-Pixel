local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	for k, v in pairs(Chairs) do
		exports['qb-target']:AddBoxZone("BurgerChair"..k, v.location, v.width, v.height, { name="BurgerChair"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
			{ options = { { event = "qb-burgershot:Chair", icon = "fas fa-chair", label = "Sit Down", loc = v.location, head = v.heading, seat = v.seat }, },
			  distance = v.distance
		})
	end
end)

RegisterNetEvent('qb-burgershot:Chair')
AddEventHandler('qb-burgershot:Chair', function(data)
	local canSit = true
	local sitting = false
	for k, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", "Someone is already sitting there..") canSit = false end
	end
	if canSit then
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head, 0, 1, true)
		burgerseat = data.seat
		sitting = true
	end
	while sitting do
		local ped = PlayerPedId()
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)

				if burgerseat == 1 then SetEntityCoords(ped, vector3(-575.37, -1059.79, 22.34-0.5)) SetEntityHeading(ped, 90.0) end
				if burgerseat == 2 then SetEntityCoords(ped, vector3(-575.34, -1063.39, 22.34-0.5)) SetEntityHeading(ped, 90.0) end
				if burgerseat == 3 then SetEntityCoords(ped, vector3(-575.49, -1067.04, 22.34-0.5)) SetEntityHeading(ped, 90.0) end
				
				if burgerseat == 4 then SetEntityCoords(ped, vector3(-585.72, -1064.75, 22.34)) SetEntityHeading(ped, 270.0) end
				if burgerseat == 5 then SetEntityCoords(ped, vector3(-585.75, -1065.69, 22.34)) SetEntityHeading(ped, 270.0) end
				if burgerseat == 6 then SetEntityCoords(ped, vector3(-585.84, -1066.7, 22.34)) SetEntityHeading(ped, 270.0) end
				if burgerseat == 7 then SetEntityCoords(ped, vector3(-585.79, -1067.64, 22.34)) SetEntityHeading(ped, 270.0) end
				burgerseat = 0
				sitting = false
			end
		end
		Wait(7)
	end
end)

Chairs = {
	--Downstairs--
	--Booth1
	{ location = vector3(-1187.292, -895.4665, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1187.84, -894.6514, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1185.705, -894.4394, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1186.132, -893.6822, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth2
	{ location = vector3(-1189.293, -892.2004, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1189.694, -891.5907, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1189.43, -890.7778, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1188.789, -890.2667, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1187.801, -890.3801, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1187.414, -890.9937, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth6
	{ location = vector3(-1193.077, -886.6659, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1192.702, -887.2215, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1191.705, -887.3157, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1191.069, -886.8379, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1190.848, -885.8098, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1191.235, -885.2114, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth7
	{ location = vector3(-1188.03, -881.7108, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1187.15, -881.103, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1185.849, -882.8796, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1186.63, -883.4331, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth8
	{ location = vector3(-1184.079, -887.3915, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1183.337, -886.8726, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1182.812, -889.2396, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1181.965, -888.7003, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth9
	{ location = vector3(-1181.27, -889.6584, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1180.902, -890.2055, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1181.006, -891.345, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1181.614, -891.7982, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth10
	{ location = vector3(-1189.416, -879.3272, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1189.945, -879.6843, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1187.846, -880.1533, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1188.271, -879.4461, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth3
	{ location = vector3(-1185.366, -893.1474, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 3 },
	{ location = vector3(-1184.822, -893.8714, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 3 },
	{ location = vector3(-1183.442, -892.8909, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 3 },
	{ location = vector3(-1183.909, -892.1188, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 3 },
	--Booth4
	{ location = vector3(-1193.026, -881.8265, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1192.463, -882.6757, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1191.565, -880.7641, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1190.984, -881.6259, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth5
	{ location = vector3(-1194.952, -884.2696, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1195.492, -883.5351, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1193.296, -883.0477, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1193.87, -882.3423, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	--Booth11
	{ location = vector3(-1190.781, -897.2166, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1191.202, -896.5492, 13.984961), heading = 300.75, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1189.727, -897.2765, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1189.157, -896.88, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },

	--Chairs
	{ location = vector3(-1193.854, -887.4472, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1192.936, -888.7576, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1191.261, -891.3212, 13.984961), heading = 216.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1190.374, -892.6414, 13.984961), heading = 32.25479, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },

	{ location = vector3(-1177.38, -895.773, 13.984961), heading = 123.92086, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1179.859, -896.4959, 13.984961), heading = 294.97341, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1178.942, -897.5387, 13.984961), heading = 326.9508, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1183.282, -898.8117, 13.984961), heading = 109.06142, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },

	{ location = vector3(-1188.501, -900.6335, 13.984961), heading = 287.00253, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1187.874, -901.6324, 13.984961), heading = 311.02075, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },
	{ location = vector3(-1183.282, -898.8117, 13.984961), heading = 109.06142, width = 0.6, height = 0.6, minZ = 12.0, maxZ = 14.45, distance = 2.7, seat = 1 },




		--Pizzabooth1
		{ location = vector3(808.42987, -755.4254, 26.772507), heading = 94.716819, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(808.42139, -754.505, 26.772507), heading = 94.716819, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(806.92359, -755.3997, 26.772507), heading = 273.76696, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(806.92301, -754.5164, 26.772507), heading = 273.76696, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET


		--Pizzabooth2
		{ location = vector3(806.3988, -754.4807, 26.772507), heading = 94.716819, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(806.33008, -755.4515, 26.772507), heading = 94.716819, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(804.87811, -755.4301, 26.772507), heading = 273.76696, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(804.90328, -754.5477, 26.772507), heading = 273.76696, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		--Pizzabooth3
		{ location = vector3(804.25576, -755.4231, 26.772507), heading = 94.716819, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(804.27932, -754.4458, 26.772507), heading = 94.716819, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(802.73935, -755.418, 26.772507), heading = 273.76696, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(802.73978, -754.4495, 26.772507), heading = 273.76696, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		--Pizzabooth4
		{ location = vector3(802.18062, -755.4407, 26.772507), heading = 94.716819, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(802.1805, -754.479, 26.772507), heading = 94.716819, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(800.63846, -755.392, 26.772507), heading = 273.76696, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(800.63657, -754.4885, 26.772507), heading = 273.76696, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		-- Chairs
		{ location = vector3(806.08032, -751.5336, 26.772507), heading = 276.40188, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(808.00091, -751.5676, 26.772507), heading = 84.47837, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		{ location = vector3(802.14849, -751.5399, 26.772507), heading = 276.40188, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(804.06591, -751.5977, 26.772507), heading = 84.47837, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		{ location = vector3(798.13781, -751.5747, 26.772507), heading = 273.0917, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(800.06091, -751.5185, 26.772507), heading = 88.046676, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		{ location = vector3(797.05169, -748.7944, 26.772507), heading = 266.50964, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(798.97753, -748.8673, 26.772507), heading = 97.537544, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		{ location = vector3(795.16021, -752.5601, 26.772507), heading = 355.96209, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(795.12274, -750.5599, 26.772507), heading = 207.37258, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		{ location = vector3(799.5191, -756.0014, 26.772507), heading = 6.480411, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(799.56646, -754.1499, 26.772507), heading = 159.53858, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		--Pizzabooth5
		{ location = vector3(799.29766, -756.84, 26.772507), heading = 179.52703, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(799.35339, -758.4081, 26.772507), heading = 358.90454, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		--Pizzabooth6
		{ location = vector3(799.35809, -758.9675, 26.772507), heading = 179.52703, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(799.43524, -760.5306, 26.772507), heading = 358.90454, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		--Upper Pizza Floor
		{ location = vector3(797.87976, -750.4398, 31.276836), heading = 183.32144, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(798.5639, -752.7286, 31.276836), heading = 35.720985, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(797.2702, -752.7401, 31.276836), heading = 352.00695, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET

		{ location = vector3(802.49509, -749.251, 31.276836), heading = 159.44061, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET

		{ location = vector3(800.89007, -757.385, 31.276836), heading = 353.82998, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(802.20977, -757.4119, 31.276836), heading = 13.117086, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(803.26678, -756.3433, 31.276836), heading = 94.371086, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET

		{ location = vector3(803.96833, -758.879, 31.276836), heading = 271.47305, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(803.9213, -759.6455, 31.276836), heading = 268.80603, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(803.89951, -760.5304, 31.276836), heading = 273.7189, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(805.54894, -758.8546, 31.276836), heading = 91.925056, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(805.55467, -759.6331, 31.276836), heading = 90.351524, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(805.54222, -760.5924, 31.276836), heading = 72.337287, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(804.80755, -761.4925, 31.276836), heading = 12.938171, width = 0.6, height = 0.6, minZ = 30.5, maxZ = 31.35, distance = 2.7 }, -- PIZZATHIS PRESET
		
		{ location = vector3(809.75494, -759.6372, 22.240894), heading = 352.91308, width = 0.6, height = 0.6, minZ = 21.5, maxZ = 22.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(808.65191, -758.5322, 22.240894), heading = 269.91366, width = 0.6, height = 0.6, minZ = 21.5, maxZ = 22.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(809.71221, -757.3322, 22.240894), heading = 166.09767, width = 0.6, height = 0.6, minZ = 21.5, maxZ = 22.85, distance = 2.7 }, -- PIZZATHIS PRESET

		--Outside PizzaThis
		{ location = vector3(811.37176, -741.2505, 26.772507), heading = 104.23078, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(808.78784, -741.2775, 26.772507), heading = 255.84796, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(805.85052, -741.3324, 26.772507), heading = 109.34544, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(803.23199, -741.3682, 26.772507), heading = 267.57522, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(799.49578, -741.2731, 26.772507), heading = 109.34544, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(796.88592, -741.3471, 26.772507), heading = 267.57522, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(799.16491, -747.1423, 26.772507), heading = 80.15937, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(796.68743, -747.1638, 26.772507), heading = 278.31713, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(812.28375, -747.09, 26.772507), heading = 88.83007, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET
		{ location = vector3(809.72949, -747.1542, 26.772507), heading = 291.13958, width = 0.6, height = 0.6, minZ = 25.5, maxZ = 27.85, distance = 2.7 }, -- PIZZATHIS PRESET

		-- City Hall
		{ location = vector3(-522.2368, -196.1008, 38.282548), heading = 299.5129, width = 0.6, height = 0.6, minZ = 37.0, maxZ = 38.95, distance = 2.7, seat = 1 },
		{ location = vector3(-517.9857, -175.1397, 38.606936), heading = 119.6546, width = 0.6, height = 0.6, minZ = 37.0, maxZ = 38.95, distance = 2.7, seat = 1 },
		{ location = vector3(-516.1748, -177.7352, 38.372512), heading = 119.6546, width = 0.6, height = 0.6, minZ = 37.0, maxZ = 38.95, distance = 2.7, seat = 1 },
		{ location = vector3(-519.1882, -172.3561, 38.377825), heading = 119.6546, width = 0.6, height = 0.6, minZ = 37.0, maxZ = 38.95, distance = 2.7, seat = 1 },

		{ location = vector3(-524.3226, -181.7953, 38.186114), heading = 309.04379, width = 0.6, height = 0.6, minZ = 37.0, maxZ = 38.95, distance = 2.7, seat = 1 },
		{ location = vector3(-524.9518, -180.8383, 38.186114), heading = 280.3283, width = 0.6, height = 0.6, minZ = 37.0, maxZ = 38.95, distance = 2.7, seat = 1 },
		{ location = vector3(-526.8574, -177.4746, 38.186114), heading = 297.18069, width = 0.6, height = 0.6, minZ = 37.0, maxZ = 38.95, distance = 2.7, seat = 1 },
		{ location = vector3(-526.261, -178.3297, 38.186114), heading = 307.46578, width = 0.6, height = 0.6, minZ = 37.0, maxZ = 38.95, distance = 2.7, seat = 1 },

    -- MRPD
	{ location = vector3(447.85024, -987.5761, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(447.85024, -988.4407, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(445.63308, -987.5766, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(445.63303, -988.5, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(443.4823, -988.4331, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(443.493, -987.4812, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },

	{ location = vector3(447.85024, -983.8584, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(447.85024, -982.9434, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(445.63303, -983.0178, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(445.63303, -983.911, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(443.493, -983.9215, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
	{ location = vector3(443.493, -982.9488, 34.995832), heading = 86.0, width = 0.6, height = 0.6, minZ = 34.0, maxZ = 35.95, distance = 2.7, seat = 1 },
}
