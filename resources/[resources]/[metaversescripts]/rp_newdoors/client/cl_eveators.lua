local Elevators = {
    [1] = {
		["floors"] = {
			[1] = {floorName = "Pillbox Ground Floor", zone = {center = vector3(344.3, -586.14, 28.8), width = 1.5, length = 1.5, options = {heading = 250.0, debugPoly=false, minZ = 27.8, maxZ = 29.8, data = {id = "pbmc_elevator_2", elevatorId = 1, floorId = 1}}}},
			[2] = {floorName = "Pillbox Main Floor", zone = {center = vector3(330.32, -601.08, 43.28), width = 1.5, length = 1.5, options = {heading = 250.0, debugPoly=false, minZ = 42.28, maxZ = 44.28, data = {id = "pbmc_elevator_1", elevatorId = 1, floorId = 2}}}},
		},

    },
	[2] = {
		["floors"] = {
			[1] = {floorName = "Pillbox Ground Floor", zone = {center = vector3(345.68, -582.51, 28.8), width = 1.5, length = 1.5, options = {heading = 250.0, debugPoly=false, minZ = 27.8, maxZ = 29.8, data = {id = "pbmc_elevator_4", elevatorId = 2, floorId = 1}}}},
			[2] = {floorName = "Pillbox Main Floor", zone = {center = vector3(332.36, -595.75, 43.28), width = 1.5, length = 1.5, options = {heading = 250.0, debugPoly=false, minZ = 42.28, maxZ = 44.28, data = {id = "pbmc_elevator_3", elevatorId = 2, floorId = 2}}}},
		},
	},
	[3] = {
		["floors"] = {
			[1] = {floorName = "Pillbox Main Floor", zone = {center = vector3(332.93, -568.96, 43.28), width = 1.5, length = 1.5, options = {heading = 339.14, debugPoly=false, minZ = 42.28, maxZ = 44.28, data = {id = "pbmc_elevator_5", elevatorId = 3, floorId = 1}}}},
			[2] = {floorName = "Pillbox Roof", zone = {center =vector3(338.6, -583.82, 74.16), width = 1.5, length = 1.5, options = {heading = 71.95, debugPoly=false, minZ = 73.16, maxZ = 75.16, data = {id = "pbmc_elevator_6", elevatorId = 3, floorId = 2}}}},
		},
	},
	[4] = {
		["floors"] = {
			[1] = {floorName = "Courthouse Main Floor", zone = {center = vector3(254.61, -1083.98, 29.29), width = 1.5, length = 1.5, options = {heading = 89.47, debugPoly=false, minZ = 27.29, maxZ = 31.29, data = {id = "courthouse_elevator_1", elevatorId = 4, floorId = 1}}}},
			[2] = {floorName = "Courthouse Second Floor", zone = {center = vector3(254.9, -1083.91, 36.13), width = 1.5, length = 1.5, options = {heading = 71.95, debugPoly=false, minZ = 34.13, maxZ = 38.13, data = {id = "courthouse_elevator_2", elevatorId = 4, floorId = 2}}}},
		},
	},
	-- [5] = {
	-- 	["floors"] = {
	-- 		[1] = {floorName = "Maze Bank Arena", zone = {center = vector3(-282.45, -2031.64, 30.15), width = 1.5, length = 1.5, options = {heading = 110.25, debugPoly=false, minZ = 28.15, maxZ = 32.15, data = {id = "paintball_elevator_1", elevatorId = 5, floorId = 1}}}},
	-- 		[2] = {floorName = "Paintball Arena", zone = {center = vector3(5516.56, 5965.0, 635.84), width = 1.5, length = 1.5, options = {heading = 178.26, debugPoly=false, minZ = 633.84, maxZ = 637.84, data = {id = "paintball_elevator_2", elevatorId = 5, floorId = 2}}}},
	-- 	},
	-- }
}


local myElevator = nil
local runningThread = false

local function reverse(tbl)
    for i=1, math.floor(#tbl / 2) do
        tbl[i], tbl[#tbl - i + 1] = tbl[#tbl - i + 1], tbl[i]
    end

    return tbl
end

local function BuildElevatorMenu()
	exports['qb-interact']:SetTitle("Elevator Menu")

    local user = QBCore.Functions.GetPlayerData()
    local job = user.job.name

	local fixTable = reverse(Elevators[myElevator.elevatorId].floors)
	for k,v in ipairs(fixTable) do
		if myElevator.floorId == v.zone.options.data.floorId then
			exports['qb-interact']:AddButton(v.floorName .. " | Current Floor", '','qb-newdoors:client:enterElevator', json.encode({["coords"] = v.zone.center, ["zoneName"] = v.zone.options.data.id}), false)
		else
			exports['qb-interact']:AddButton(v.floorName.. ' | Floor #'..v.zone.options.data.floorId, '','qb-newdoors:client:enterElevator', json.encode({["coords"] = v.zone.center, ["zoneName"] = v.zone.options.data.id}), false)
		end
	end
	exports['qb-interact']:OpenMenu()
end

local function InsideElevatorZone()
	if runningThread then return end

	runningThread = true

	CreateThread(function()
		while runningThread do
			Wait(3)
			if IsControlJustPressed(0, 38) then
				BuildElevatorMenu()
			end
		end
	end)
end

--[[CreateThread(function()
	for _, elevator in ipairs(Elevators) do
		local floors = elevator.floors
		for floorId, floor in ipairs(floors) do
			local zone = floor.zone
			exports.polyzone:AddBoxZone("qb-doors:elevator", zone.center, zone.width, zone.length, zone.options)
		end
	end
end)]]

AddEventHandler('qb-polyzone:enter', function(name, data)
	if name ~= "qb-doors:elevator" then return end
	if not data.elevatorId then return end
	myElevator = data
	exports['np-ui']:ActionBox({action = "show", text = "<strong>[E] Elevator Menu</strong>"})

	InsideElevatorZone()
end)

AddEventHandler('qb-polyzone:exit', function(name, data)
	if name ~= "qb-doors:elevator" then return end
	exports['np-ui']:ActionBox({action = "hide"})
	runningThread = false
end)

AddEventHandler('qb-newdoors:client:enterElevator', function(data)
	 DoScreenFadeOut(1000)
	RequestCollisionAtCoord(data.coords.x, data.coords.y, data.coords.z)
	while IsScreenFadingOut() do
        Citizen.Wait(0)
    end
	SetEntityCoords(PlayerPedId(), vector3(data.coords.x, data.coords.y, data.coords.z))
	DoScreenFadeIn(1000)
	runningThread = false
end)