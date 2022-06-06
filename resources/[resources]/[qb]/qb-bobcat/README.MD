1. Add the codes below to your qb-policejob config.lua Config.SecurityCameras

    [35] = {label = "Bobcat Security CAM#1", coords = vector3(875.71, -2257.14, 33.85), r = {-35.0, y = 0.0, z = 319.31}, canRotate = true, isOnline = true},
    [36] = {label = "Bobcat Security CAM#2", coords = vector3(885.82, -2252.53, 35.08), r = {-35.0, y = 0.0, z = 312.9}, canRotate = true, isOnline = true},
    [37] = {label = "Bobcat Security CAM#3", coords = vector3(874.84, -2253.16, 36.83), r = {-35.0, y = 0.0, z = 32.0}, canRotate = true, isOnline = true},

2. Add items to shared.lua

    ["thermitecharge"] 			 	 	 = {["name"] = "thermitecharge", 			  			["label"] = "Thermite Charge", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "thermitecharge.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Burning... Hahaahaha.."},
	["bobcatsecuritycard"] 			 	 	 = {["name"] = "bobcatsecuritycard", 			  			["label"] = "Bobcat Security Card", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "gruppe62.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "For Bobcat ;)"},

3. Copy images and paste it to inventory images folder

4. Create a config file inside qb or nui_doorlock as bobcat and put the codes below.

    Config.DoorList['bobcatfirst'] = {
	    lockpick = false,
	    maxDistance = 2.5,
	    slides = false,
	    doors = {
	    	{objHash = -1259801187, objHeading = 355.0022277832, objCoords = vec3(883.480347, -2258.529785, 32.534859)},
	    	{objHash = -1563799200, objHeading = 175.0022277832, objCoords = vec3(880.895142, -2258.308350, 32.534859)}
        },
	    audioRemote = false,
	    authorizedJobs = { ['police']=0 },
	    locked = true,
        --oldMethod = true,
        --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
        --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
        --autoLock = 1000
    }

    Config.DoorList['bobcatsecond'] = {
    	audioRemote = false,
    	objCoords = vec3(881.617065, -2264.669434, 32.591564),
    	garage = false,
    	fixText = false,
    	lockpick = false,
    	slides = false,
    	authorizedJobs = { ['police']=0 },
    	maxDistance = 2.0,
    	objHeading = 175.0022277832,
    	objHash = -551608542,
    	locked = true,
        --oldMethod = true,
        --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
        --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
        --autoLock = 1000
    }

    Config.DoorList['bobcatthird'] = {
    	lockpick = false,
    	slides = false,
    	authorizedJobs = { ['police']=0 },
    	maxDistance = 2.5,
    	doors = {
    		{objHash = 933053701, objHeading = 355.0022277832, objCoords = vec3(882.619873, -2268.408203, 32.591602)},
    		{objHash = 933053701, objHeading = 175.00221252441, objCoords = vec3(880.029785, -2268.181641, 32.591602)}
        },
    	audioRemote = false,
    	locked = true,
        --oldMethod = true,
        --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
        --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
        --autoLock = 1000
    }