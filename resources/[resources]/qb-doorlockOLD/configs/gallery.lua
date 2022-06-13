

-- warehousegaragedoor1 created by popo
Config.DoorList['warehousegaragedoor1'] = {
    doorType = 'garage',
    fixText = false,
    audioRemote = true,
    locked = true,
    doorRate = 1.0,
    objName = -901044889,
    objYaw = 357.04284667969,
    authorizedJobs = { ['gallery'] = 0 },
    objCoords = vec3(-460.773682, -47.390755, 45.474998),
    distance = 6,
    authorizedGangs = { ['cg'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- warehousegaragedoor2 created by popo
Config.DoorList['warehousegaragedoor2'] = {
    doorType = 'garage',
    fixText = false,
    audioRemote = true,
    locked = true,
    doorRate = 1.0,
    objName = -901044889,
    objYaw = 357.04284667969,
    authorizedJobs = { ['gallery'] = 0 },
    objCoords = vec3(-454.506134, -47.666679, 45.475712),
    distance = 4,
    authorizedGangs = { ['cg'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- warehousesingledoor created by popo
Config.DoorList['warehousesingledoor'] = {
    doorType = 'door',
    fixText = false,
    audioRemote = false,
    locked = true,
    doorRate = 1.0,
    objName = -1795835524,
    objYaw = 357.04284667969,
    authorizedJobs = { ['gallery'] = 0 },
    objCoords = vec3(-449.266815, -48.022987, 44.663258),
    distance = 2,
    authorizedGangs = { ['cg'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- warehousechanggangwoodendoor created by popo
Config.DoorList['warehousechanggangwoodendoor'] = {
    doorType = 'door',
    fixText = false,
    audioRemote = false,
    locked = true,
    doorRate = 1.0,
    distance = 1,
    objYaw = 357.04284667969,
    objCoords = vec3(-445.065369, -26.461613, 44.724850),
    authorizedGangs = { ['cg'] = 0 },
    objName = 1221385821,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- frontgallerydoors created by popo
Config.DoorList['frontgallerydoors'] = {
    doorType = 'double',
    authorizedJobs = { ['gallery'] = 0 },
    audioRemote = false,
    locked = true,
    doors = {
        {objName = -1663450520, objYaw = 355.02020263672, objCoords = vec3(-426.076569, 23.748024, 46.523895)},
        {objName = -1854854241, objYaw = 355.02020263672, objCoords = vec3(-423.596741, 23.533863, 46.523220)}
    },
    doorRate = 1.0,
    distance = 2,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}