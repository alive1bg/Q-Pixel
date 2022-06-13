

-- garagedoor created by popo
Config.DoorList['garagedoor'] = {
    distance = 7,
    authorizedGangs = { ['cg'] = 0 },
    objName = -700626879,
    objYaw = 0.0,
    doorType = 'door',
    doorRate = 1.0,
    audioRemote = true,
    locked = true,
    fixText = false,
    authorizedJobs = { ['wuchang'] = 0 },
    objCoords = vec3(-816.223633, -740.162659, 24.165236),
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- frontleft created by popo
Config.DoorList['frontleft'] = {
    distance = 2,
    doorRate = 1.0,
    audioRemote = false,
    locked = true,
    authorizedGangs = { ['cg'] = 0 },
    doors = {
        {objName = 2001816392, objYaw = 89.999977111816, objCoords = vec3(-826.402527, -695.814758, 28.490826)},
        {objName = 2001816392, objYaw = 270.00003051758, objCoords = vec3(-826.402527, -697.994385, 28.490826)}
    },
    doorType = 'double',
    authorizedJobs = { ['wuchang'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- frontright created by popo
Config.DoorList['frontright'] = {
    distance = 2,
    doorRate = 1.0,
    audioRemote = false,
    locked = true,
    authorizedGangs = { ['cg'] = 0 },
    doors = {
        {objName = 2001816392, objYaw = 89.999977111816, objCoords = vec3(-826.402527, -698.747803, 28.490826)},
        {objName = 2001816392, objYaw = 270.00003051758, objCoords = vec3(-826.402527, -700.930115, 28.490826)}
    },
    doorType = 'double',
    authorizedJobs = { ['wuchang'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- lobbyright created by popo
Config.DoorList['lobbyright'] = {
    objYaw = 89.999977111816,
    audioRemote = false,
    objName = 693644064,
    distance = 1,
    fixText = false,
    locked = true,
    authorizedGangs = { ['cg'] = 0 },
    doorType = 'door',
    doorRate = 1.0,
    objCoords = vec3(-816.603821, -702.343811, 28.205597),
    authorizedJobs = { ['wuchang'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- lobbyleft created by popo
Config.DoorList['lobbyleft'] = {
    objYaw = 270.00003051758,
    audioRemote = false,
    objName = 693644064,
    distance = 1,
    fixText = false,
    locked = true,
    authorizedGangs = { ['cg'] = 0 },
    doorType = 'door',
    doorRate = 1.0,
    objCoords = vec3(-816.603821, -694.399841, 28.205597),
    authorizedJobs = { ['wuchang'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- lobbyhallwaydoubledoor created by popo
Config.DoorList['lobbyhallwaydoubledoor'] = {
    distance = 1,
    doorRate = 1.0,
    audioRemote = false,
    locked = true,
    authorizedGangs = { ['cg'] = 0 },
    doors = {
        {objName = 1403720845, objYaw = 0.0, objCoords = vec3(-820.312622, -703.126343, 28.205597)},
        {objName = 75593271, objYaw = 0.0, objCoords = vec3(-822.314270, -703.126343, 28.205597)}
    },
    doorType = 'double',
    authorizedJobs = { ['wuchang'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}