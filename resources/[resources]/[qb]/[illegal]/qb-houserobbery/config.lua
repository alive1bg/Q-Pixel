Config = {}
Config.Framework = 'QBCORE' -- Available Frameworks: 'ESX', 'QBCORE', 'VRP' (by dunko), 'OTHER'.
Config.CoordsWait = math.random(1,2) -- Time before you receive the house coords (1 - 2 minutes).
Config.Night = {20, 4} -- Players can rob only from 20:00 to 04:00, interiors doesn't look good with day light.
Config.Lockpick = true -- Use lockpick item for door?.
Config.LockpickName = 'lockpick' -- The lockpick item.
Config.PoliceRaid = true -- Police can Raid houses?.
Config.PoliceJobName = 'police' -- Your Police job name.
Config.RandomPoliceCall = true -- Small chance to call cops when players uses the lockpick on door.
Config.PoliceRaidWithCommand = true -- Set false if you don't want a Police command to raid houses.
Config.PoliceRaidCommand = 'raid' -- Command por Police to raid the houses.
Config.CdTime = 1 -- 1 = 30 minutes, 2 = 60 minutes, 3 = 90 minutes.... Personal cooldown time for players before they can rob another house.
Config.SpawnSafe = true -- Random chance to spawn a safe.
Config.SafeRewards = { -- It will pick a random combination from this table. type = 'item' or 'cash'
	[1] = {
		{type = 'item', itemName = 'water', itemQty = math.random(1,2)},
		{type = 'item', itemName = 'bread', itemQty = math.random(1,2)},
	},
	[2] = {
		{type = 'cash', itemName = 'cash', itemQty = math.random(1000,2000)},
	},
	[3] = {
		{type = 'item', itemName = 'rolex', itemQty = 1},
	}
}

Config.ItemsReward = { -- It will pick a random combination from this table.
	[1] = {
		{type = 'item', itemName = 'water', itemQty = math.random(1,2)},
		{type = 'item', itemName = 'bread', itemQty = math.random(1,2)},
		{type = 'item', itemName = 'water', itemQty = math.random(1,2)},
	},
	
	[2] = {
		{type = 'cash', itemName = 'cash', itemQty = math.random(100,200)},
	},
	
	[3] = {
		{type = 'cash', itemName = 'cash', itemQty = math.random(100,200)},
		{type = 'item', itemName = 'water', itemQty = 1},
	},
}

Config.Lang = {
	['knock'] = 'Press ~r~[E]~w~ to knock the door',
	['search'] = 'Press ~r~[E]~w~ to search',
	['enter'] = 'Press ~r~[H]~w~ to enter',
	['exit'] = 'Press ~r~[H]~w~ to exit',
	['getjob'] = 'Get a job',
	['waitcall'] = 'The boss is gonna assign you a house, wait for his call.',
	['jobwait'] = 'Wait until the boss assigns you a house',
	['assigned'] = 'The boss sent you the house coords, rob the house during night',
	['wait'] = 'Chill, the boss is looking for a house',
	['cooldown'] = 'No available jobs for you, come back later',
	['alarm'] = 'Alarm triggered',
	['lockpick'] = 'You need a lockpick',
	['wrong_veh'] = "You can't use this vehicle",
	['putinveh'] = 'Press ~r~[E]~w~ to put in vehicle',
	['police_alert'] = 'House robbery in progress',
	['safe_left'] = '~r~[E]~w~ Turn left ',
	['safe_right'] = ' ~r~[F]~w~ Turn right ',
	['safe_confirm'] = ' ~r~[H]~w~ Confirm',
	['money_found'] = 'You found $'
}

RegisterNetEvent('av_houserobbery:notification')
AddEventHandler('av_houserobbery:notification', function(msg)
	QBCore.Functions.Notify(msg)
	
end)

Config.Casas = { -- Houses entry and model
	{x = 31.492990493774, y = 6596.619140625, z = 32.81018447876, modelo = 'MidApt'},
	{x = 11.572845458984, y = 6578.3662109375, z = 33.060623168945, modelo = 'MidApt'},
	{x = -15.09232711792, y = 6557.7416992188, z = 33.240436553955, modelo = 'MidApt'},
	{x = -41.538372039795, y = 6637.4028320312, z = 31.08752822876, modelo = 'MidApt'},
	{x = -9.6467323303223, y = 6654.1987304688, z = 31.712518692017, modelo = 'MidApt'},
	{x = 1.7621871232986, y = 6612.5390625, z = 32.109931945801, modelo = 'MidApt'},
	{x = -26.635080337524, y = 6597.27734375, z = 31.860597610474, modelo = 'MidApt'},
	{x = 35.366596221924, y = 6662.84765625, z = 32.190341949463, modelo = 'MidApt'},
	{x = -356.76190185547, y = 6207.3330078125, z = 31.91400718689, modelo = 'MidApt'},
	{x = -374.45736694336, y = 6191.0849609375, z = 31.72954750061, modelo = 'MidApt'},
	{x = -245.86965942383, y = 6414.3569335938, z = 31.460599899292, modelo = 'MidApt'},
	{x = 495.17916870117, y = -1823.2989501953, z = 28.869707107544, modelo = 'MidApt'},
	{x = 489.60406494141, y = -1714.0977783203, z = 29.706550598145, modelo = 'MidApt'},
	{x = 500.58831787109, y = -1697.1359863281, z = 29.787733078003, modelo = 'MidApt'},
	{x = 419.07574462891, y = -1735.4970703125, z = 29.607694625854, modelo = 'MidApt'},
	{x = 431.14743041992, y = -1725.3588867188, z = 29.601457595825, modelo = 'MidApt'},
	{x = 443.34533691406, y = -1707.3347167969, z = 29.70036315918, modelo = 'MidApt'},
	{x = 368.80645751953, y = -1895.8767089844, z = 25.178525924683, modelo = 'MidApt'},
	{x = 385.10110473633, y = -1881.580078125, z = 26.031482696533, modelo = 'MidApt'},
	{x = 399.43417358398, y = -1865.1263427734, z = 26.715923309326, modelo = 'MidApt'},
	{x = 412.32699584961, y = -1856.2395019531, z = 27.323152542114, modelo = 'MidApt'},
	{x = 427.44403076172, y = -1842.3278808594, z = 28.462642669678, modelo = 'MidApt'},
	{x = 312.01104736328, y = -1956.1602783203, z = 24.625070571899, modelo = 'MidApt'},
	{x = 324.36328125, y = -1937.5997314453, z = 25.018976211548, modelo = 'MidApt'},
	{x = 295.92004394531, y = -1971.8889160156, z = 22.80372428894, modelo = 'MidApt'},
	{x = 291.58758544922, y = -1980.515625, z = 21.600521087646, modelo = 'MidApt'},
	{x = 279.71060180664, y = -1993.9146728516, z = 20.805452346802, modelo = 'MidApt'},
	{x = 256.4538269043, y = -2023.3701171875, z = 19.266801834106, modelo = 'MidApt'},
	{x = 236.01176452637, y = -2046.3182373047, z = 18.379932403564, modelo = 'MidApt'},
	{x = 148.76959228516, y = -1904.4891357422, z = 23.517498016357, modelo = 'MidApt'},
	{x = 128.07450866699, y = -1897.0458984375, z = 23.674228668213, modelo = 'MidApt'},
	{x = 115.33438110352, y = -1887.7604980469, z = 23.927993774414, modelo = 'MidApt'},
	{x = 103.993019104, y = -1885.2415771484, z = 24.304039001465, modelo = 'MidApt'},
	{x = 216.33517456055, y = 620.27862548828, z = 187.75686645508, modelo = 'MidApt'},
	{x = -912.25305175781, y = 777.16571044922, z = 187.01055908203, modelo = 'MidApt'},
	{x = -762.17169189453, y = 430.80480957031, z = 100.17984771729, modelo = 'HighEnd'},
	{x = -679.01800537109, y = 512.04656982422, z = 113.52597808838, modelo = 'HighEnd'},
	{x = -640.71325683594, y = 520.20758056641, z = 110.06629943848, modelo = 'HighEnd'},
	{x = -595.52197265625, y = 530.25726318359, z = 108.06629943848, modelo = 'HighEnd'},
	{x = -526.93499755859, y = 517.22058105469, z = 113.1662979126, modelo = 'HighEnd'},
	{x = -459.220703125, y = 536.86401367188, z = 121.36630249023, modelo = 'HighEnd'},
	{x = -417.94924926758, y = 569.06427001953, z = 125.1662979126, modelo = 'HighEnd'},
	{x = -311.78060913086, y = 474.95440673828, z = 111.96630096436, modelo = 'HighEnd'},
	{x = -304.98672485352, y = 431.05224609375, z = 110.6662979126, modelo = 'HighEnd'},
	{x = -72.793998718262, y = 428.53192138672, z = 113.36630249023, modelo = 'HighEnd'},
	{x = -66.838043212891, y = 490.05136108398, z = 144.86483764648, modelo = 'HighEnd'},
	{x = -110.07062530518, y = 501.92742919922, z = 143.45491027832, modelo = 'HighEnd'},
	{x = -174.52659606934, y = 502.4521484375, z = 137.42042541504, modelo = 'HighEnd'},
	{x = -230.21437072754, y = 487.83517456055, z = 128.76806640625, modelo = 'HighEnd'},
	{x = -907.65112304688, y = 544.91998291016, z = 100.36024475098, modelo = 'HighEnd'},
	{x = -904.60345458984, y = 588.14251708984, z = 101.12745666504, modelo = 'HighEnd'},
	{x = -974.55877685547, y = 581.84942626953, z = 103.14652252197, modelo = 'HighEnd'},
	{x = -1022.719909668, y = 586.90777587891, z = 103.4294052124, modelo = 'HighEnd'},
	{x = -1107.4542236328, y = 594.22204589844, z = 104.45043945312, modelo = 'HighEnd'},
	{x = -1125.4201660156, y = 548.62109375, z = 102.56945037842, modelo = 'HighEnd'},
	{x = -1146.5546875, y = 545.87408447266, z = 101.89562988281, modelo = 'HighEnd'},
	{x = -595.67047119141, y = 393.24130249023, z = 101.88217926025, modelo = 'HighEnd'},
	{x = 84.95435333252, y = 561.70123291016, z = 182.73361206055, modelo = 'HighEnd'},
	{x = 232.20700073242, y = 672.14221191406, z = 189.97434997559, modelo = 'HighEnd'},
}