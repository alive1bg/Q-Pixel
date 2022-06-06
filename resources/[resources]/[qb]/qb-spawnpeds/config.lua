Config = {}

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 25.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
-- Hunting Stores --
	{
		model = `ig_hunter`,
		coords = vector4(-679.8, 5838.92, 17.33, 219.98),
		gender = 'male',
		scenario = 'WORLD_HUMAN_CLIPBOARD'
	},
	-- South Side
	{
		model = `mp_m_waremech_01`,
		coords = vector4(45.54233, -1748.56, 29.586, 48.71),
		gender = 'male',
		scenario = 'WORLD_HUMAN_CLIPBOARD'
	},
	-- LS Freeway
	{
		model = `mp_m_waremech_01`,
		coords = vector4(2748.02, 3473.83, 55.67, 226.21),
		gender = 'male',
		scenario = 'WORLD_HUMAN_CLIPBOARD'
	},
	-- Paleto
	{
		model = `mp_m_waremech_01`,
		coords = vector4(-421.83, 6136.09, 31.87, 205.39),
		gender = 'male',
		scenario = 'WORLD_HUMAN_CLIPBOARD'
	},
	-- 24/7 Shops --

	-- Grove Street
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(24.5, -1346.63, 29.5, 273.18),
		gender = 'male',
	},
	-- South Side
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-46.86, -1758.22, 29.42, 45.15),
		gender = 'male'
	},
	-- Little Soul
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-706.02, -913.9, 19.22, 86.17),
		gender = 'male'
	},
	-- Carrson Ave
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(372.6, 327.06, 103.57, 258.49),
		gender = 'male'
	},
	-- North Rockford
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1819.96, 794.04, 138.09, 126.36),
		gender = 'male'
	},
	-- Great Ocean South
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3039.89, 584.21, 7.91, 16.15),
		gender = 'male'
	},
	-- Barbareno Road
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3243.19, 999.94, 12.83, 352.25),
		gender = 'male'
	},
	-- Mirror Park
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1164.72, -323.04, 69.21, 93.92),
		gender = 'male'
	},
	-- Route 68
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(549.24, 2670.37, 42.16, 94.15),
		gender = 'male'
	},
	-- Sandy
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1959.72, 3740.68, 32.34, 297.43),
		gender = 'male'
	},
	-- Grape Seed
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1697.8, 4923.14, 42.06, 321.33),
		gender = 'male'
	},
	-- Great Ocean North
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1728.33, 6416.21, 35.04, 241.78),
		gender = 'male'
	},
	-- Pier Coral Shop
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1686.43, -1072.73, 13.15, 51.2),
		gender = 'male'
	},
	-- Coffee
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-633.81, 237.65, 81.9, 3.18),
		gender = 'male'
	},
	-- Robs Liquor Vespucci beeach
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1221.76, -908.42, 12.33, 29.95),
		gender = 'male'
	},
	--Robs Liquor  Vespucci Blvd
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1134.28, -983.13, 46.42, 271.72),
		gender = 'male'
	},
	-- Galaxy Nightclub
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(351.35, 286.65, 91.19, 166.01),
		gender = 'male'
	},
	-- Galaxy Nightclub 2
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(358.3, 281.68, 94.19, 251.33),
		gender = 'male'
	},
	-- Coffee Weed Shop
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(247.17, 371.94, 105.74, 152.58),
		gender = 'male'
	},
	--Robs Liquor  Grapeseed
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1165.25, 2710.89, 38.16, 176.55),
		gender = 'male'
	},
	--Robs Liquor Prosperity
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1486.74, -377.58, 40.16, 129.07),
		gender = 'male'
	},
	-- Ammunation 1
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-659.09, -939.46, 21.83, 89.94),
		gender = 'male'
	},
	-- Ammunation 2
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(2564.75, 298.44, 108.73, 278.42),
		gender = 'male'
	},
	-- Ammunation 3
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-326.26, 6081.35, 31.45, 140.12),
		gender = 'male'
	},
	-- Ammunation 4
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(17.82, -1107.84, 29.8, 155.52),
		gender = 'male'
	},
	-- Ammunation 5
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(247.31, -51.48, 69.94, 348.96),
		gender = 'male'
	},
	-- Ammunation 6
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1697.73, 3757.61, 34.71, 141.28),
		gender = 'male'
	},
	-- Ammunation 7
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1112.72, 2697.41, 18.55, 145.98),
		gender = 'male'
	},
	-- Ammunation 8
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(813.71, -2155.24, 29.62, 0.06),
		gender = 'male'
	},
	-- Ammunation 9
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(841.18, -1028.93, 28.19, 290.22),
		gender = 'male'
	},
	-- Dons Country
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(160.19, 6641.89, 31.71, 223.86),
		gender = 'male'
	},
	-- Leisure Shop Buttfuck No where
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1505.66, 1511.57, 115.29, 262.74),
		gender = 'male'
	},
	-- Robs Liquor Great Ocean 1
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-2966.36, 390.88, 15.04, 85.12),
		gender = 'male'
	},
	-- Ls Freeway
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(2677.32, 3279.69, 55.24, 323.82),
		gender = 'male'
	},

	-------------------- Clothing SHops
	--[[{
		model = `a_f_y_bevhills_02`,
		coords = vector4(73.98, -1392.2, 29.38, 270.83),
		gender = 'male'
	},
	-- Barber Shops
	{
		model = `s_f_m_fembarber`, -- Model name as a hash.
		coords = vector4(-34.42, -151.15, 57.09, 180.0), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'female' -- The gender of the ped, used for the CreatePed native.
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(-279.89, 6227.61, 31.71, 50.0), -- Paleto Bay
		gender = 'female'
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(1933.71, 3730.42, 32.85, 210.0), -- Sandy Shores
		gender = 'female'
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(-817.19, -183.30, 37.57, 130.0), -- Mad Wayne Thunder Drive
		gender = 'female'
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(-1283.62, -1119.24, 7.00, 110.0), -- Magellan Ave
		gender = 'female'
	},

	{
		model = `s_f_m_fembarber`,
		coords = vector4(137.61, -1709.78, 29.30, 320.0), -- Carson Ave
		gender = 'female'
	},

	-- Clothing Stores
	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(1.20, 6508.53, 31.88, 330.0), -- Paleto Bay
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(1695.00, 4817.49, 42.06, 360.0), -- Grapeseed
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(-709.06, -151.46, 37.42, 120.0), -- Portola Drive
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(-1448.41, -237.54, 49.81, 60.0), -- Cougar Ave
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(-165.24, -303.62, 39.73, 260.0), -- Las Lagunas Blvd
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(-1194.10, -767.09, 17.32, 220.0), -- North Rockford Drive
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(425.88, -811.50, 29.49, 20.0), -- Sinner Street
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(-818.20, -1070.43, 11.33, 120.0), -- South Rockford Drive
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(75.20, -1387.62, 29.38, 210.0), -- Innocence Blvd
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(613.04, 2762.49, 42.09, 280.0), -- Grapeseed
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(1201.97, 2710.80, 38.22, 100.0), -- Harmony
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(-1097.96, 2714.62, 19.11, 140.0), -- Route 68
		gender = 'female'
	},

	{
		model = `a_f_y_bevhills_02`,
		coords = vector4(-3169.38, 1043.18, 20.86, 50.0), -- Great Ocean Highway
		gender = 'female'
	},]]
	
	--------- BANK PEDS
	{
		model = `ig_bankman`,
		coords = vector4(241.44, 227.19, 106.29, 170.43),
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`,
		coords = vector4(313.84, -280.58, 54.16, 338.31), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(149.46, -1042.09, 29.37, 335.43), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(-351.23, -51.28, 49.04, 341.73), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(-1211.9, -331.9, 37.78, 20.07), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(-2961.14, 483.09, 15.7, 83.84), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(1174.8, 2708.2, 38.09, 178.52), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(-112.22, 6471.01, 31.63, 134.18), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `cs_lifeinvad_01`, -- Arcade
		coords = vector4(-1190.35, -774.64, 17.33, 36.92), 
		gender = 'male'
	},
	{
		model = `cs_lifeinvad_01`, -- Arcade
		coords = vector4(120.16, -220.06, 54.56, 249.76), 
		gender = 'male'
	},
	-- casino wheel ped
	{
		model = `S_F_Y_Casino_01`, -- wheelspin
		coords = vector4(987.95, 42.32, 71.27, 248.82), 		
		gender = 'female'
	},
}
