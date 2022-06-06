Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = true -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 1.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)

Config.ChangeColor = true -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(19, 28, 74)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(219 58 58)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(27 195 63)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked

Config.Consumables = { ['lockpick'] = 1, ['paperclip'] = 1 } -- The items will get removed once used on a door that has the item on it

Config.DoorList = {
	-- First Pacific Door opened with lockpick ----          1
	{
		objName = 'hei_v_ilev_bk_gate_pris',
		objCoords  = vec3(257.41, 220.25, 106.4),
		textCoords = vec3(257.41, 220.25, 106.4),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	--- door1 for pacific opened with security card B ----          2
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vec3(261.83, 221.39, 106.41),
		textCoords = vec3(261.83, 221.39, 106.41),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	--door2 for pacific opened right near the vault door ----          3
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(252.98, 220.65, 101.8),
		textCoords = vec3(252.98, 220.65, 101.8),
		authorizedJobs = { 'police' },
		objYaw = 160.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- door3 for pacific opened with thermite after passing the door near vault
	{
		objName = 'hei_v_ilev_bk_safegate_pris', ----          4
		objCoords  = vec3(261.68, 215.62, 101.81),
		textCoords = vec3(261.68, 215.62, 101.81),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- TOP Pacific Door On Catwalk
	{
		objName = 'v_ilev_bk_door',
		objCoords  = vec3(265.19, 217.84, 110.28), ----          5
		textCoords = vec3(265.19, 217.84, 110.28),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	{ -- lower vault double door
		textCoords = vec3(273.1413, 230.5395, 96.68),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_obank_door',
				objYaw = -90.0,
				objCoords = vec3(273.1413, 230.5395, 96.68) ----      6
			},

			{
				objName = 'gabz_obank_door',
				objYaw = -90.0,
				objCoords = vec3(272.255, 228.0946, 96.68) ----  6      
			}
		}
	},
	{ -- lower vault ending
		objName = 'ch_prop_ch_vault_slide_door_lrg', ----    7
		objCoords  = vec3(288.2115, 222.5038, 96.68),
		textCoords = vec3(288.2115, 222.5038, 96.68),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- Prison Door 1
	{
		objName = 'prop_gate_prison_01', ----    8
		objCoords  = vec3(1844.9, 2604.8, 44.6),
		textCoords = vec3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 13
	},
	-- Prison Door 2
	{
		objName = 'prop_gate_prison_01', ----    9
		objCoords  = vec3(1818.5, 2604.8, 44.6),
		textCoords = vec3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 13
	},
	-- Prison Door 3
	{
		objName = 'prop_gate_prison_01', -- ----    10
		objCoords = vec3(1799.237, 2616.303, 44.6),
		textCoords = vec3(1795.941, 2616.969, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 10
	},
		-- Fleeca Door opened with lockpick
		{
			objName = 'v_ilev_gb_vaubar', -- 11
			objCoords  = vec3(314.61, -285.82, 54.49),
			textCoords = vec3(313.3, -285.45, 54.49),
			authorizedJobs = { 'police' },
			locked = true,
			pickable = true,
			distance = 1.5
		},
		-- Fleeca Door opened with lockpick
		{
			objName = 'v_ilev_gb_vaubar', ----    12
			objCoords  = vec3(148.96, -1047.12, 29.7),
			textCoords = vec3(148.96, -1047.12, 29.7),
			authorizedJobs = { 'police' },
			locked = true,
			pickable = true,
			distance = 1.5
		},
		-- Fleeca Door opened with lockpick
		{
			objName = 'v_ilev_gb_vaubar', ----    13
			objCoords  = vec3(-351.7, -56.28, 49.38),
			textCoords = vec3(-351.7, -56.28, 49.38),
			authorizedJobs = { 'police' },
			locked = true,
			pickable = true,
			distance = 1.5
		},
		-- Fleeca Door opened with lockpick
		{
			objName = 'v_ilev_gb_vaubar', ----    14
			objCoords  = vec3(-1208.12, -335.586, 37.759),
			textCoords = vec3(-1208.12, -335.586, 37.759),
			authorizedJobs = { 'police' },
			locked = true,
			pickable = true,
			distance = 1.5
		},
		-- Fleeca Door opened with lockpick
		{
			objName = 'v_ilev_gb_vaubar', ----    15
			objCoords  = vec3(-2956.18, 483.96, 16.02),
			textCoords = vec3(-2956.18, 483.96, 16.02),
			authorizedJobs = { 'police' },
			locked = true,
			pickable = true,
			distance = 1.5
		},
	{ -- vangelico doors
		textCoords = vec3(273.1413, 230.5395, 96.68),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'p_jewel_door_l',
				objYaw = 306.00003051758,
				objCoords = vec3(-631.955384, -236.333268, 38.206532) ----  16    
			},

			{
				objName = 'p_jewel_door_r1',
				objYaw = 306.00003051758,
				objCoords = vec3(-630.426514, -238.437546, 38.206532) ----   16     
			}
		}
	},

	------------------------------------------Always add new doors below this line for your bank robberies to work!!!---------------------------------
}