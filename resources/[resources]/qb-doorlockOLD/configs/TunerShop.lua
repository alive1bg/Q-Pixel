------------------------------------------
--	MISSION ROW POLICE DEPARTMENT		--
------------------------------------------

-- Mechanic Main Door
Config.DoorList[#Config.DoorList+1] = {
	objHash = -2023754432,
	objHeading = 270.00003051758,
	locked = true,
	audioRemote = false,
	slides = false,
	fixText = false,
	maxDistance = 1.5,
	lockpick = false,
	authorizedJobs = { ['tuner']=0 },
	doorID = 63,
	garage = false,
	objCoords = vector3(154.9345, -3017.323, 7.190679),
    --oldMethod = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
}

-- Mechanic Garage Door 1
Config.DoorList[#Config.DoorList+1] = {
	objHash = -456733639,
	objHeading = 89.999961853027,
	locked = true,
	audioRemote = true,
	slides = true,
	fixText = false,
	maxDistance = 6.0,
	lockpick = false,
	authorizedJobs = { ['tuner']=0 },
	doorID = 64,
	garage = true,
	objCoords = vector3(154.8095, -3023.889, 8.503336),
    --oldMethod = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
}

-- Mechanic Garage Door 2
Config.DoorList[#Config.DoorList+1] = {
	objHash = -456733639,
	objHeading = 89.999961853027,
	locked = true,
	audioRemote = true,
	slides = true,
	fixText = false,
	maxDistance = 6.0,
	lockpick = false,
	authorizedJobs = { ['tuner']=0 },
	doorID = 65,
	garage = true,
	objCoords = vector3(154.8095, -3034.051, 8.503336),
    --oldMethod = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
}

-- mechanic hide door
Config.DoorList[#Config.DoorList+1] = {
	garage = false,
	audioRemote = false,
	authorizedJobs = { ['tuner']=0 },
	objCoords = vector3(151.4668, -3011.705, 7.258367),
	objHeading = 89.999977111816,
	slides = false,
	lockpick = false,
	locked = true,
	maxDistance = 1.5,
	fixText = false,
	objHash = -1229046235,
	doorID = 66,
    --oldMethod = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000
}