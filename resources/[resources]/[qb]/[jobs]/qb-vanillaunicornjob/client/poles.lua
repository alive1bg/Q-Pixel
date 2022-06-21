Citizen.CreateThread(function()
	if Config.MLO == "gabz" then
		for k, v in pairs(Config.GabzPoles) do
			exports['qb-target']:AddBoxZone("UniDance"..k, v.location, v.width, v.height, { name="UniDance"..k, heading = v.heading, debugPoly = false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "jim-vanillaunicorn:Dance", icon = "fas fa-chair", label = "Dance", job = "vanilla", loc = v.location, head = v.heading, pole = v.pole }, },
				  distance = v.distance
			})
		end
		for k, v in pairs(Config.GabzDance) do
			exports['qb-target']:AddBoxZone("UniPvtDance"..k, v.location, v.width, v.height, { name="UniPvtDance"..k, heading = v.heading, debugPoly = false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "jim-vanillaunicorn:PvtDance", icon = "fas fa-chair", label = "Dance", job = "vanilla", loc = v.location, head = v.heading }, },
				  distance = v.distance
			})
		end	
	elseif Config.MLO == "van" then
		for k, v in pairs(Config.VanPoles) do
			exports['qb-target']:AddBoxZone("UniDance"..k, v.location, v.width, v.height, { name="UniDance"..k, heading = v.heading, debugPoly = false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "jim-vanillaunicorn:Dance", icon = "fas fa-chair", label = "Dance", job = "vanilla", loc = v.location, head = v.heading, pole = v.pole }, },
				  distance = v.distance
			})
		end		
		for k, v in pairs(Config.VanDance) do
			exports['qb-target']:AddBoxZone("UniPvtDance"..k, v.location, v.width, v.height, { name="UniPvtDance"..k, heading = v.heading, debugPoly = false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "jim-vanillaunicorn:PvtDance", icon = "fas fa-chair", label = "Dance", job = "vanilla", loc = v.location, head = v.heading }, },
				  distance = v.distance
			})
		end	
	end
end)

LoadDict = function(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(5)
        RequestAnimDict(Dict)
    end
end

RegisterNetEvent('jim-vanillaunicorn:Dance')
AddEventHandler('jim-vanillaunicorn:Dance', function(data)
	local ped = PlayerPedId()
	LoadDict('mini@strip_club@pole_dance@pole_dance'..data.pole)
	local scene = NetworkCreateSynchronisedScene(vector3(data.loc.x, data.loc.y, data.loc.z+1), vector3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, 'mini@strip_club@pole_dance@pole_dance' .. data.pole, 'pd_dance_0' .. data.pole, 1.5, -4.0, 1, 1, 1148846080, 0)
    NetworkStartSynchronisedScene(scene)
end)

RegisterNetEvent('jim-vanillaunicorn:PvtDance')
AddEventHandler('jim-vanillaunicorn:PvtDance', function(data)
	local ped = PlayerPedId()
	dancenumber = math.random(1,2)
	LoadDict('mini@strip_club@private_dance@part'..dancenumber)
	local scene = NetworkCreateSynchronisedScene(vector3(data.loc.x, data.loc.y, data.loc.z+1), vector3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, 'mini@strip_club@private_dance@part'..dancenumber, 'priv_dance_p'..dancenumber, 1.5, -4.0, 1, 1, 1148846080, 0)
	SetEntityHeading(ped, data.head)
    NetworkStartSynchronisedScene(scene)
end)

Citizen.CreateThread(function()
	while true do
	local ped = PlayerPedId()
	if IsEntityPlayingAnim(ped, "mini@strip_club@pole_dance@pole_dance1", "pd_dance_01", 3) or IsEntityPlayingAnim(ped, "mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", 3) or IsEntityPlayingAnim(ped, "mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", 3) then dancing = true else dancing = false end
	if IsEntityPlayingAnim(ped, "mini@strip_club@private_dance@part1", "priv_dance_p1", 3) or IsEntityPlayingAnim(ped, "mini@strip_club@private_dance@part2", "priv_dance_p2", 3) or IsEntityPlayingAnim(ped, "mini@strip_club@private_dance@part3", "priv_dance_p3", 3) then pdancing = true else pdancing = false end
		if dancing or pdancing then if IsControlJustReleased(0, 202) then ClearPedTasks(ped) end end
		Wait(50)
	end
end)

Config.GabzPoles = {
	{ location = vector3(104.76, -1294.18, 28.25), heading = 30.0, width = 0.7, height = 0.7, minZ = 28.00, maxZ = 32.85, distance = 3.0, pole = 1 },
	{ location = vector3(108.83, -1289.02, 28.25), heading = 30.0, width = 0.7, height = 0.7, minZ = 28.00, maxZ = 32.85, distance = 3.0, pole = 2 },
	{ location = vector3(102.22, -1289.87, 28.25), heading = 30.0, width = 0.7, height = 0.7, minZ = 28.00, maxZ = 32.85, distance = 3.0, pole = 3 },
}
Config.GabzDance = {
	{ location = vector3(123.37, -1294.8, 29.69-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 28.29, maxZ= 29.49, distance = 1.7 },
	{ location = vector3(120.0, -1296.83, 29.73-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 28.29, maxZ= 29.49, distance = 1.7 },
	
	{ location = vector3(113.68, -1299.87, 29.69-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 28.29, maxZ= 29.49, distance = 1.7 },
	{ location = vector3(111.23, -1304.38, 29.69-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 28.29, maxZ= 29.49, distance = 1.7 },
	{ location = vector3(114.61, -1305.55, 29.77-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 28.29, maxZ= 29.49, distance = 1.7 },
	{ location = vector3(113.37, -1303.06, 29.89-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 28.29, maxZ= 29.49, distance = 1.7 },
	
	{ location = vector3(112.83, -1283.06, 28.88-1), heading = 270.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(117.53, -1283.03, 28.9-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(120.99, -1285.14, 28.68-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(121.97, -1286.96, 28.76-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(116.63, -1291.47, 28.68-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(115.89, -1286.76, 28.88-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
}

Config.VanPoles = {
	{ location = vector3(104.2, -1294.0, 28.26), heading = 30.0, width = 0.7, height = 0.7, minZ = 28.06, maxZ = 32.85, distance = 3.0, pole = 1 },
	{ location = vector3(102.24, -1290.63, 28.25), heading = 30.0, width = 0.7, height = 0.7, minZ = 28.00, maxZ = 32.85, distance = 3.0, pole = 2 },
	{ location = vector3(112.61, -1286.76, 27.46), heading = 30.0, width = 0.7, height = 0.7, minZ = 27.30, maxZ = 31.26, distance = 3.0, pole = 3 },
}
Config.VanDance = {
	{ location = vector3(118.48, -1301.7, 29.27-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(116.36, -1302.87, 29.27-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(114.2, -1304.06, 29.27-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(112.45, -1305.3, 29.27-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(111.04, -1302.68, 29.27-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(112.96, -1301.75, 29.27-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
	{ location = vector3(114.86, -1300.71, 29.27-1), heading = 30.0, width = 0.6, height = 0.6, minZ= 27.68-1, maxZ= 28.49, distance = 1.7 },
}



