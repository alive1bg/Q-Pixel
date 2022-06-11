# Beta Released

Integrated with https://github.com/Project-Sloth/qb-mdt

For all support questions, ask in our Discord support chat. Do not create issues if you need help. Issues are for bug reporting and new features only.

https://www.discord.gg/projectsloth

# Installation
* Download ZIP
* Drag and drop resource into your server files
* Start resource through server.cfg
* Drag and drop sounds folder into interact-sound\client\html\sounds
* Restart your server.


# Alert Exports
```lua
- exports['qb-dispatch']:VehicleShooting(vehicle)

- exports['qb-dispatch']:Shooting()

- exports['qb-dispatch']:OfficerDown()

- exports['qb-dispatch']:SpeedingVehicle(vehicle)

- exports['qb-dispatch']:Fight()

- exports['qb-dispatch']:InjuriedPerson()

- exports['qb-dispatch']:StoreRobbery(camId)

- exports['qb-dispatch']:FleecaBankRobbery(camId)

- exports['qb-dispatch']:PaletoBankRobbery(camId)

- exports['qb-dispatch']:PacificBankRobbery(camId)

- exports['qb-dispatch']:PrisonBreak()

- exports['qb-dispatch']:VangelicoRobbery(camId)

- exports['qb-dispatch']:HouseRobbery()

- exports['qb-dispatch']:PrisonBreak()

- exports['qb-dispatch']:DrugSale()

- exports['qb-dispatch']:ArtGalleryRobbery()

- exports['qb-dispatch']:HumaneRobery()

- exports['qb-dispatch']:TrainRobbery()

- exports['qb-dispatch']:VanRobbery()

- exports['qb-dispatch']:UndergroundRobbery()

- exports['qb-dispatch']:DrugBoatRobbery()

- exports['qb-dispatch']:UnionRobbery()

- exports['qb-dispatch']:YachtHeist()

- exports['qb-dispatch']:CarBoosting(vehicle)

- exports['qb-dispatch']:CarJacking(vehicle)

- exports['qb-dispatch']:VehicleTheft(vehicle)

- exports['qb-dispatch']:SuspiciousActivity()
```

# Steps to Create New Alert

1. Create a client event that will be triggered from whatever script you want

```lua
local function FleecaBankRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "bankrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Fleeca Bank Robbery", -- message
        job = {"police"} -- jobs that will get the alerts
    })
end exports('FleecaBankRobbery', FleecaBankRobbery)
```

2. Add Dispatch Code in sv_dispatchcodes.lua for the particular robbery to display the blip

`["storerobbery"] is the dispatchcodename you passed with the TriggerServerEvent in step 1`
```lua
	["bankrobbery"] =  {displayCode = '10-90', description = "Fleeca Bank Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 2, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
```
Information about each parameter is in the file.

# Alerts with Vehicle Information
1. If you want to display vehicle information with a particular alert, you need to pass the vehicle along with the exports like this
```lua 
exports['qb-dispatch']:TestVehicleAlert(vehicle)
```

and its function in qb-dispatch would look like this

```lua
local function TestVehicleAlert(vehicle)
    local vehdata = vehicleData(vehicle)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local heading = getCardinalDirectionFromHeading()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "speeding", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-11",
        firstStreet = locationInfo,
        model = vehdata.name, -- vehicle name
        plate = vehdata.plate, -- vehicle plate
        priority = 2, 
        firstColor = vehdata.colour, -- vehicle color
        heading = heading, 
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Speeding Vehicle",
        job = {"police"}
    })
end 

exports('SpeedingVehicle', SpeedingVehicle)
```

Rest steps will be similar as mentioned above in Steps to create alerts.

# Work to be done

* Hunting Zones
* Locales for alerts

# DMCA Protection Certificate
![image](https://user-images.githubusercontent.com/82112471/169714852-1c4597b8-0ed3-4b56-a439-d0462681e3ff.png)

https://www.dmca.com/r/d03ek52
