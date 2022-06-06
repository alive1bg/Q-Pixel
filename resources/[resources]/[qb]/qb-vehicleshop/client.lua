-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData() -- Just for resource restart (same as event handler)
local insideZones = {}

for name, shop in pairs(Config.Shops) do -- foreach shop
    insideZones[name] = false  -- default to not being in a shop
end

local testDriveVeh, inTestDrive = 0, false
local ClosestVehicle = 1
local zones = {}

function getShopInsideOf() 
    for name, shop in pairs(Config.Shops) do -- foreach shop
        if insideZones[name] then
            return name
        end
    end
    return nil
end

-- Handlers

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    local citizenid = PlayerData.citizenid
    local gameTime = GetGameTimer()
    TriggerServerEvent('qb-vehicleshop:server:addPlayer', citizenid, gameTime)
    TriggerServerEvent('qb-vehicleshop:server:checkFinance')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    local citizenid = PlayerData.citizenid
    TriggerServerEvent('qb-vehicleshop:server:removePlayer', citizenid)
    PlayerData = {}
end)

-- Static Headers

local vehHeaderMenu = {
    {
        header = 'Vehicle Options',
        txt = 'Interact with the current vehicle',
        params = {
            event = 'qb-vehicleshop:client:showVehOptions'
        }
    }
}

local financeMenu = {
    {
        header = 'Financed Vehicles',
        txt = 'Browse your owned vehicles',
        params = {
            event = 'qb-vehicleshop:client:getVehicles'
        }
    }
}

local returnTestDrive = {
    {
        header = 'Finish Test Drive',
        params = {
            event = 'qb-vehicleshop:client:TestDriveReturn'
        }
    }
}

-- Functions

local function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

local function comma_value(amount)
    local formatted = amount
    while true do
      formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
      if (k==0) then
        break
      end
    end
    return formatted
end

local function getVehName()
    return QBCore.Shared.Vehicles[Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle]["name"]
end

local function getVehPrice()
    return comma_value(QBCore.Shared.Vehicles[Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle]["price"])
end

local function getVehBrand()
    return QBCore.Shared.Vehicles[Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle]["brand"]
end

local function setClosestShowroomVehicle()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
    local closestShop = getShopInsideOf()
    for id, veh in pairs(Config.Shops[closestShop]["ShowroomVehicles"]) do
        local dist2 = #(pos - vector3(Config.Shops[closestShop]["ShowroomVehicles"][id].coords.x, Config.Shops[closestShop]["ShowroomVehicles"][id].coords.y, Config.Shops[closestShop]["ShowroomVehicles"][id].coords.z))
        if current ~= nil then
            if dist2 < dist then
                current = id
                dist = dist2
            end
        else
            dist = dist2
            current = id
        end
    end
    if current ~= ClosestVehicle then
        ClosestVehicle = current
    end
end

local function createTestDriveReturn()
    testDriveZone = BoxZone:Create(
        Config.Shops[getShopInsideOf()]["ReturnLocation"],
        3.0,
        5.0, {
        name="box_zone"
    })

    testDriveZone:onPlayerInOut(function(isPointInside)
        if isPointInside and IsPedInAnyVehicle(PlayerPedId()) then
			SetVehicleForwardSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 0)
            exports['qb-menu']:openMenu(returnTestDrive)
        else
            exports['qb-menu']:closeMenu()
        end
    end)
end

local function startTestDriveTimer(testDriveTime)
    local gameTimer = GetGameTimer()
    CreateThread(function()
        while inTestDrive do
            Wait(1)
            if GetGameTimer() < gameTimer+tonumber(1000*testDriveTime) then
                local secondsLeft = GetGameTimer() - gameTimer
                drawTxt('Test Drive Time Remaining: '..math.ceil(testDriveTime - secondsLeft/1000),4,0.5,0.93,0.50,255,255,255,180)
            end
        end
    end)
end

local function isInShop() 
    for shopName, isInside in pairs(insideZones) do
        if isInside then
            return true
        end
    end

    return false
end

local function createVehZones(shopName) -- This will create an entity zone if config is true that you can use to target and open the vehicle menu
    if not Config.UsingTarget then
        for i = 1, #Config.Shops[shopName]['ShowroomVehicles'] do
            zones[#zones+1] = BoxZone:Create(
                vector3(Config.Shops[shopName]['ShowroomVehicles'][i]['coords'].x,
                Config.Shops[shopName]['ShowroomVehicles'][i]['coords'].y,
                Config.Shops[shopName]['ShowroomVehicles'][i]['coords'].z),
                2.75,
                2.75, {
                name="box_zone",
                debugpoly = false,
            })
        end
        local combo = ComboZone:Create(zones, {name = "vehCombo", debugPoly = false})
        combo:onPlayerInOut(function(isPointInside)
            local insideShop = getShopInsideOf()
            if isPointInside then
                if PlayerData.job.name == Config.Shops[insideShop]['Job'] or Config.Shops[insideShop]['Job'] == 'none' then
                    exports['qb-menu']:showHeader(vehHeaderMenu)
                end
            else
                exports['qb-menu']:closeMenu()
            end
        end)
    else
        exports['qb-target']:AddGlobalVehicle({
            options = {
                {
                    type = "client",
                    event = "qb-vehicleshop:client:showVehOptions",
                    icon = "fas fa-car",
                    label = "Vehicle Interaction",
                    canInteract = function(entity)
                        local closestShop = getShopInsideOf()
                        if (closestShop ~= nil) and (Config.Shops[closestShop]['Job'] == 'none' or PlayerData.job.name == Config.Shops[closestShop]['Job']) then
                            return true
                        end
                        return false
                    end
                },
            },
            distance = 2.0
        })
    end
end

-- Zones

function createFreeUseShop(shopShape, name)
    local zone = PolyZone:Create(shopShape, {  -- create the zone
        name= name,
        minZ = shopShape.minZ,
        maxZ = shopShape.maxZ
    })
    
    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            insideZones[name] = true
            CreateThread(function()
                while insideZones[name] do
                    setClosestShowroomVehicle()
                    vehicleMenu = {
                        {
                            isMenuHeader = true,
                            header = getVehBrand():upper().. ' '..getVehName():upper().. ' - $' ..getVehPrice(),
                        },
                        {
                            header = 'Test Drive',
                            txt = 'Test drive currently selected vehicle',
                            params = {
                                event = 'qb-vehicleshop:client:TestDrive',
                            }
                        },
                        {
                            header = "Buy Vehicle",
                            txt = 'Purchase currently selected vehicle',
                            params = {
                                isServer = true,
                                event = 'qb-vehicleshop:server:buyShowroomVehicle',
                                args = {
                                    buyVehicle = Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle
                                }
                            }
                        },
                        {
                            header = 'Finance Vehicle',
                            txt = 'Finance currently selected vehicle',
                            params = {
                                event = 'qb-vehicleshop:client:openFinance',
                                args = {
                                    price = getVehPrice(),
                                    buyVehicle = Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle
                                }
                            }
                        },
                        {
                            header = 'Swap Vehicle',
                            txt = 'Change currently selected vehicle',
                            params = {
                                event = 'qb-vehicleshop:client:vehCategories',
                            }
                        },
                    }
                    Wait(1000)
                end
            end)
        else
            insideZones[name] = false -- leave the shops zone
            ClosestVehicle = 1
        end
    end)
end

function createManagedShop(shopShape, name, jobName)
    local zone = PolyZone:Create(shopShape, {  -- create the zone
        name= name,
        minZ = shopShape.minZ,
        maxZ = shopShape.maxZ
    })
    
    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            insideZones[name] = true
            CreateThread(function()
                while insideZones[name] and PlayerData.job ~= nil and PlayerData.job.name == Config.Shops[name]['Job'] do
                    setClosestShowroomVehicle()
                    local closestShop = getShopInsideOf()
                    vehicleMenu = {
                        {
                            isMenuHeader = true,
                            header = getVehBrand():upper().. ' '..getVehName():upper().. ' - $' ..getVehPrice(),
                        },
                        {
                            header = 'Test Drive',
                            txt = 'Allow player for test drive',
                            params = {
                                event = 'qb-vehicleshop:client:openIdMenu',
                                args = {
                                    vehicle = Config.Shops[closestShop]["ShowroomVehicles"][ClosestVehicle].chosenVehicle,
                                    type = 'testDrive'
                                }
                            }
                        },
                        {
                            header = "Sell Vehicle",
                            txt = 'Sell vehicle to Player',
                            params = {
                                event = 'qb-vehicleshop:client:openIdMenu',
                                args = {
                                    vehicle = Config.Shops[closestShop]["ShowroomVehicles"][ClosestVehicle].chosenVehicle,
                                    type = 'sellVehicle'
                                }
                            }
                        },
                        {
                            header = 'Finance Vehicle',
                            txt = 'Finance vehicle to Player',
                            params = {
                                event = 'qb-vehicleshop:client:openCustomFinance',
                                args = {
                                    price = getVehPrice(),
                                    vehicle = Config.Shops[closestShop]["ShowroomVehicles"][ClosestVehicle].chosenVehicle
                                }
                            }
                        },
                        {
                            header = 'Swap Vehicle',
                            txt = 'Change currently selected vehicle',
                            params = {
                                event = 'qb-vehicleshop:client:vehCategories',
                            }
                        },
                    }
                    Wait(1000)
                end
            end)
        else
            insideZones[name] = false -- leave the shops zone
            ClosestVehicle = 1
        end
    end)
end

for name, shop in pairs(Config.Shops) do 
    if shop['Type'] == 'free-use' then
        createFreeUseShop(shop['Zone']['Shape'], name)
    elseif shop['Type'] == 'managed' then
        createManagedShop(shop['Zone']['Shape'], name)
    end
end

-- Events

RegisterNetEvent('qb-vehicleshop:client:homeMenu', function()
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('qb-vehicleshop:client:showVehOptions', function()
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('qb-vehicleshop:client:TestDrive', function()
    if not inTestDrive and ClosestVehicle ~= 0 then
        inTestDrive = true
        local prevCoords = GetEntityCoords(PlayerPedId())
        QBCore.Functions.SpawnVehicle(Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle, function(veh)
            local closestShop = getShopInsideOf()
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            exports['qb-fuel']:SetFuel(veh, 100)
            SetVehicleModKit(veh, 0)
            SetVehicleNumberPlateText(veh, 'TESTDRIVE')
            SetEntityAsMissionEntity(veh, true, true)
            SetEntityHeading(veh, Config.Shops[closestShop]["VehicleSpawn"].w)
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
            TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
            testDriveVeh = veh
            QBCore.Functions.Notify('You have '..Config.Shops[closestShop]["TestDriveTimeLimit"]..' minutes remaining')
            SetTimeout(Config.Shops[closestShop]["TestDriveTimeLimit"] * 60000, function()
                if testDriveVeh ~= 0 then
                    testDriveVeh = 0
                    inTestDrive = false
                    QBCore.Functions.DeleteVehicle(veh)
                    SetEntityCoords(PlayerPedId(), prevCoords)
                    QBCore.Functions.Notify('Vehicle test drive complete')
                end
            end)
        end, Config.Shops[getShopInsideOf()]["VehicleSpawn"], false)
        createTestDriveReturn()
        startTestDriveTimer(Config.Shops[getShopInsideOf()]["TestDriveTimeLimit"] * 60)
    else
        QBCore.Functions.Notify('Already in test drive', 'error')
    end
end)

RegisterNetEvent('qb-vehicleshop:client:customTestDrive', function(data)
    if not inTestDrive then
        inTestDrive = true
        shopInsideOf = getShopInsideOf()
        local vehicle = data
        local prevCoords = GetEntityCoords(PlayerPedId())
        QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            local shopInsideOf = getShopInsideOf()
            exports['qb-fuel']:SetFuel(veh, 100)
            SetVehicleModKit(veh, 0)
            SetVehicleNumberPlateText(veh, 'TESTDRIVE')
            SetEntityAsMissionEntity(veh, true, true)
            SetEntityHeading(veh, Config.Shops[shopInsideOf]["VehicleSpawn"].w)
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
            TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
            testDriveVeh = veh
            QBCore.Functions.Notify('You have '..Config.Shops[shopInsideOf]["TestDriveTimeLimit"]..' minutes remaining')
            SetTimeout(Config.Shops[shopInsideOf]["TestDriveTimeLimit"] * 60000, function()
                if testDriveVeh ~= 0 then
                    testDriveVeh = 0
                    inTestDrive = false
                    QBCore.Functions.DeleteVehicle(veh)
                    SetEntityCoords(PlayerPedId(), prevCoords)
                    QBCore.Functions.Notify('Vehicle test drive complete')
                end
            end)
        end, Config.Shops[shopInsideOf]["VehicleSpawn"], false)
        createTestDriveReturn()
        startTestDriveTimer(Config.Shops[shopInsideOf]["TestDriveTimeLimit"] * 60)
    else
        QBCore.Functions.Notify('Already in test drive', 'error')
    end
end)

RegisterNetEvent('qb-vehicleshop:client:TestDriveReturn', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if veh == testDriveVeh then
        testDriveVeh = 0
        inTestDrive = false
        QBCore.Functions.DeleteVehicle(veh)
        exports['qb-menu']:closeMenu()
        testDriveZone:destroy()
    else
        QBCore.Functions.Notify('This is not your test drive vehicle', 'error')
    end
end)

RegisterNetEvent('qb-vehicleshop:client:vehCategories', function()
    local categoryMenu = {
        {
            header = '< Go Back',
            params = {
                event = 'qb-vehicleshop:client:homeMenu'
            }
        }
    }
    for k,v in pairs(Config.Shops[getShopInsideOf()]['Categories']) do
        categoryMenu[#categoryMenu + 1] = {
            header = v,
            params = {
                event = 'qb-vehicleshop:client:openVehCats',
                args = {
                    catName = k
                }
            }
        }
    end
    exports['qb-menu']:openMenu(categoryMenu)
end)

RegisterNetEvent('qb-vehicleshop:client:openVehCats', function(data)
    local vehicleMenu = {
        {
            header = '< Go Back',
            params = {
                event = 'qb-vehicleshop:client:vehCategories'
            }
        }
    }
    for k,v in pairs(QBCore.Shared.Vehicles) do
        if QBCore.Shared.Vehicles[k]["category"] == data.catName and QBCore.Shared.Vehicles[k]["shop"] == getShopInsideOf() then
            vehicleMenu[#vehicleMenu + 1] = {
                header = v.name,
                txt = 'Price: $'..v.price,
                params = {
                    isServer = true,
                    event = 'qb-vehicleshop:server:swapVehicle',
                    args = {
                        toVehicle = v.model,
                        ClosestVehicle = ClosestVehicle,
                        ClosestShop = getShopInsideOf()
                    }
                }
            }
        end
    end
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('qb-vehicleshop:client:openFinance', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = getVehBrand():upper().. ' ' ..data.buyVehicle:upper().. ' - $' ..data.price,
        submitText = "Submit",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'downPayment',
                text = 'Down Payment Amount - Min ' ..Config.MinimumDown..'%'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'paymentAmount',
                text = 'Total Payments - Max '..Config.MaximumPayments
            }
        }
    })
    if dialog then
        if not dialog.downPayment or not dialog.paymentAmount then return end
        TriggerServerEvent('qb-vehicleshop:server:financeVehicle', dialog.downPayment, dialog.paymentAmount, data.buyVehicle)
    end
end)

RegisterNetEvent('qb-vehicleshop:client:openCustomFinance', function(data)
    TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    local dialog = exports['qb-input']:ShowInput({
        header = getVehBrand():upper().. ' ' ..data.vehicle:upper().. ' - $' ..data.price,
        submitText = "Submit",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'downPayment',
                text = 'Down Payment Amount - Min 10%'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'paymentAmount',
                text = 'Total Payments - Max '..Config.MaximumPayments
            },
            {
                text = "Server ID (#)",
                name = "playerid", 
                type = "number",
                isRequired = true
            }
        }
    })
    if dialog then
        if not dialog.downPayment or not dialog.paymentAmount or not dialog.playerid then return end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('qb-vehicleshop:server:sellfinanceVehicle', dialog.downPayment, dialog.paymentAmount, data.vehicle, dialog.playerid)
    end
end)

RegisterNetEvent('qb-vehicleshop:client:swapVehicle', function(data)
    local shopName = getShopInsideOf()
    if Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].chosenVehicle ~= data.toVehicle then
        local closestVehicle, closestDistance = QBCore.Functions.GetClosestVehicle(vector3(Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.x, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.y, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.z))
        if closestVehicle == 0 then return end
        if closestDistance < 5 then QBCore.Functions.DeleteVehicle(closestVehicle) end
        Wait(250)
        local model = GetHashKey(data.toVehicle)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(250)
        end
        local veh = CreateVehicle(model, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.x, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.y, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.z, false, false)
        SetModelAsNoLongerNeeded(model)
        SetVehicleOnGroundProperly(veh)
        SetEntityInvincible(veh,true)
        SetEntityHeading(veh, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.w)
        SetVehicleDoorsLocked(veh, 3)
        FreezeEntityPosition(veh, true)
        SetVehicleNumberPlateText(veh, 'BUY ME')
        Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].chosenVehicle = data.toVehicle
    end
end)

RegisterNetEvent('qb-vehicleshop:client:buyShowroomVehicle', function(vehicle, plate)
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        exports['qb-fuel']:SetFuel(veh, 100)
        SetVehicleModKit(veh, 0)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, Config.Shops[getShopInsideOf()]["VehicleSpawn"].w)
        SetEntityAsMissionEntity(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(veh))
    end, Config.Shops[getShopInsideOf()]["VehicleSpawn"], true)
end) 

RegisterNetEvent('qb-vehicleshop:client:getVehicles', function()
    QBCore.Functions.TriggerCallback('qb-vehicleshop:server:getVehicles', function(vehicles)
        local ownedVehicles = {}
        for k,v in pairs(vehicles) do
            if v.balance then
                local name = QBCore.Shared.Vehicles[v.vehicle]["name"]
                local plate = v.plate:upper()
                ownedVehicles[#ownedVehicles + 1] = {
                    header = ''..name..'',
                    txt = 'Plate: ' ..plate,
                    params = {
                        event = 'qb-vehicleshop:client:getVehicleFinance',
                        args = {
                            vehiclePlate = plate,
                            balance = v.balance,
                            paymentsLeft = v.paymentsleft,
                            paymentAmount = v.paymentamount
                        }
                    }
                }
            end
        end
        exports['qb-menu']:openMenu(ownedVehicles)
    end)
end)

RegisterNetEvent('qb-vehicleshop:client:getVehicleFinance', function(data)
    local vehFinance = {
        {
            header = '< Go Back',
            params = {
                event = 'qb-vehicleshop:client:getVehicles'
            }
        },
        {
            isMenuHeader = true,
            header = 'Total Balance Remaining',
            txt = '$'..comma_value(data.balance)..''
        },
        {
            isMenuHeader = true,
            header = 'Total Payments Remaining',
            txt = ''..data.paymentsLeft..''
        },
        {
            isMenuHeader = true,
            header = 'Recurring Payment Amount',
            txt = '$'..comma_value(data.paymentAmount)..''
        },
        {
            header = 'Make a payment',
            params = {
                event = 'qb-vehicleshop:client:financePayment',
                args = {
                    vehData = data,
                    paymentsLeft = data.paymentsleft,
                    paymentAmount = data.paymentamount
                }
            }
        },
        {
            header = 'Payoff vehicle',
            params = {
                isServer = true,
                event = 'qb-vehicleshop:server:financePaymentFull',
                args = {
                    vehBalance = data.balance,
                    vehPlate = data.vehiclePlate
                }
            }
        },
    }
    exports['qb-menu']:openMenu(vehFinance)
end)

RegisterNetEvent('qb-vehicleshop:client:financePayment', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = 'Vehicle Payment',
        submitText = "Make Payment",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'paymentAmount',
                text = 'Payment Amount ($)'
            }
        }
    })
    if dialog then
        if not dialog.paymentAmount then return end
        TriggerServerEvent('qb-vehicleshop:server:financePayment', dialog.paymentAmount, data.vehData)
    end
end)

RegisterNetEvent('qb-vehicleshop:client:openIdMenu', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = QBCore.Shared.Vehicles[data.vehicle]["name"],
        submitText = "Submit",
        inputs = {
            {
                text = "Server ID (#)",
                name = "playerid", 
                type = "number",
                isRequired = true
            }
        }
    })
    if dialog then
        if not dialog.playerid then return end
        if data.type == 'testDrive' then
            TriggerServerEvent('qb-vehicleshop:server:customTestDrive', data.vehicle, dialog.playerid)
        elseif data.type == 'sellVehicle' then
            TriggerServerEvent('qb-vehicleshop:server:sellShowroomVehicle', data.vehicle, dialog.playerid)
        end
    end
end)

-- Threads

CreateThread(function()
    for k,v in pairs(Config.Shops) do
        if v.showBlip then
	    local Dealer = AddBlipForCoord(Config.Shops[k]["Location"])
	    SetBlipSprite (Dealer, 326)
            SetBlipDisplay(Dealer, 4)
            SetBlipScale  (Dealer, 0.75)
	    SetBlipAsShortRange(Dealer, true)
	    SetBlipColour(Dealer, 50)
            BeginTextCommandSetBlipName("STRING")
	    AddTextComponentSubstringPlayerName(Config.Shops[k]["ShopLabel"])
	    EndTextCommandSetBlipName(Dealer)
	end
    end
end)

CreateThread(function()
    local financeZone = BoxZone:Create(Config.FinanceZone, 2.0, 2.0, {
        name="financeZone",
        offset={0.0, 0.0, 0.0},
        scale={1.0, 1.0, 1.0},
        debugpoly = false,
    })

    financeZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            exports['qb-menu']:showHeader(financeMenu)
        else
            exports['qb-menu']:closeMenu()
        end
    end)
end)

CreateThread(function()
    for k,v in pairs(Config.Shops) do
        for i = 1, #Config.Shops[k]['ShowroomVehicles'] do
            local model = GetHashKey(Config.Shops[k]["ShowroomVehicles"][i].defaultVehicle)
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(0)
            end
            local veh = CreateVehicle(model, Config.Shops[k]["ShowroomVehicles"][i].coords.x, Config.Shops[k]["ShowroomVehicles"][i].coords.y, Config.Shops[k]["ShowroomVehicles"][i].coords.z, false, false)
            SetModelAsNoLongerNeeded(model)
            SetEntityAsMissionEntity(veh, true, true)
            SetVehicleOnGroundProperly(veh)
            SetEntityInvincible(veh,true)
            SetVehicleDirtLevel(veh, 0.0)
            SetVehicleDoorsLocked(veh, 3)
            SetEntityHeading(veh, Config.Shops[k]["ShowroomVehicles"][i].coords.w)
            FreezeEntityPosition(veh,true)
            SetVehicleNumberPlateText(veh, 'BUY ME')
        end
			
        createVehZones(k)
    end
end)






------------- VEHICLE EXTRAS
------ Vehicle Extras ------

function createExtrasMenu()
    extrasMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Veh Extras Controls'
        },
        {
            header = "Activate Extras",
			txt = "Turn Extra's On",
			params = {
                isServer = false,
                event = "ccvehmenu:client:extrasActMenu",
            }
        },
        {
            header = "Deactivate Extras",
			txt = "Turn Extra's Off",
			params = {
                isServer = false,
                event = "ccvehmenu:client:extrasDeactMenu",
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(extrasMenu)
end

function createExtrasDeactMenu()
    extrasDeactMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Veh Extras Controls'
        },
        {
            header = "Extra 1",
			txt = "Turn Extra 1 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 1
            }
        },
        {
            header = "Extra 2",
			txt = "Turn Extra 2 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 3
            }
        },
        {
            header = "Extra 3",
			txt = "Turn Extra 3 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 5
            }
        },
        {
            header = "Extra 4",
			txt = "Turn Extra 4 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 7
            }
        },
        {
            header = "Extra 5",
			txt = "Turn Extra 6 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 9
            }
        },
        {
            header = "Extra 7",
			txt = "Turn Extra 7 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 11
            }
        },
        {
            header = "Extra 8",
			txt = "Turn Extra 8 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 13
            }
        },
        {
            header = "Extra 9",
			txt = "Turn Extra 9 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 15
            }
        },
        {
            header = "Extra 10",
			txt = "Turn Extra 10 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 17
            }
        },
        {
            header = "Extra 11",
			txt = "Turn Extra 11 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 19
            }
        },
        {
            header = "Extra 12",
			txt = "Turn Extra 12 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 21
            }
        },
        {
            header = "Extra 13",
			txt = "Turn Extra 13 Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 23
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(extrasDeactMenu)
end

function createExtrasActMenu()
    extrasActMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Veh Extras Controls'
        },
        {
            header = "Extra 1",
			txt = "Turn Extra 1 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 2
            }
        },
        {
            header = "Extra 2",
			txt = "Turn Extra 2 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 4
            }
        },
        {
            header = "Extra 3",
			txt = "Turn Extra 3 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 6
            }
        },
        {
            header = "Extra 4",
			txt = "Turn Extra 4 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 8
            }
        },
        {
            header = "Extra 5",
			txt = "Turn Extra 6 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 10
            }
        },
        {
            header = "Extra 7",
			txt = "Turn Extra 7 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 12
            }
        },
        {
            header = "Extra 8",
			txt = "Turn Extra 8 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 14
            }
        },
        {
            header = "Extra 9",
			txt = "Turn Extra 9 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 16
            }
        },
        {
            header = "Extra 10",
			txt = "Turn Extra 10 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 18
            }
        },
        {
            header = "Extra 11",
			txt = "Turn Extra 11 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 20
            }
        },
        {
            header = "Extra 12",
			txt = "Turn Extra 12 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 22
            }
        },
        {
            header = "Extra 13",
			txt = "Turn Extra 13 On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:vehicleExtras",
                args = 24
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(extrasActMenu)
end

RegisterNetEvent('qb-vehiclemenu:vehicleExtras', function(args)
    local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed)
    local plate = GetVehicleNumberPlateText(veh)
    if veh ~= nil then
        if veh == true then
            QBCore.Functions.Notify('Not In A Vehicle..')
        else
            SetVehicleAutoRepairDisabled(veh, true)
            if DoesExtraExist(veh, 1) then
                local args = tonumber(args)
                if args == 1 then 
                    SetVehicleExtra(veh, 1, 1)
                    QBCore.Functions.Notify('Extra ' .. 1 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 2 then 
                    SetVehicleExtra(veh, 1, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 1 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 2) then
                local args = tonumber(args)
                if args == 3 then 
                    SetVehicleExtra(veh, 2, 1)
                    QBCore.Functions.Notify('Extra ' .. 2 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 4 then 
                    SetVehicleExtra(veh, 2, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 2 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 3) then
                local args = tonumber(args)
                if args == 5 then 
                    SetVehicleExtra(veh, 3, 1)
                    QBCore.Functions.Notify('Extra ' .. 3 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 6 then 
                    SetVehicleExtra(veh, 3, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 3 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 4) then
                local args = tonumber(args)
                if args == 7 then 
                    SetVehicleExtra(veh, 4, 1)
                    QBCore.Functions.Notify('Extra ' .. 4 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 8 then 
                    SetVehicleExtra(veh, 4, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 4 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 5) then
                local args = tonumber(args)
                if args == 9 then 
                    SetVehicleExtra(veh, 5, 1)
                    QBCore.Functions.Notify('Extra ' .. 5 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 10 then 
                    SetVehicleExtra(veh, 5, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 5 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end

                end
            if DoesExtraExist(veh, 6) then
                local args = tonumber(args)
                if args == 11 then 
                    SetVehicleExtra(veh, 6, 1)
                    QBCore.Functions.Notify('Extra ' .. 6 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 12 then 
                    SetVehicleExtra(veh, 6, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 6 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 7) then
                local args = tonumber(args)
                if args == 13 then 
                    SetVehicleExtra(veh, 7, 1)
                    QBCore.Functions.Notify('Extra ' .. 7 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 14 then 
                    SetVehicleExtra(veh, 7, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 7 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 8) then
                local args = tonumber(args)
                if args == 15 then 
                    SetVehicleExtra(veh, 8, 1)
                    QBCore.Functions.Notify('Extra ' .. 8 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 16 then 
                    SetVehicleExtra(veh, 8, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 8 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 9) then
                local args = tonumber(args)
                if args == 17 then 
                    SetVehicleExtra(veh, 9, 1)
                    QBCore.Functions.Notify('Extra ' .. 9 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 18 then 
                    SetVehicleExtra(veh, 9, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 9 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 10) then
                local args = tonumber(args)
                if args == 19 then 
                    SetVehicleExtra(veh, 10, 1)
                    QBCore.Functions.Notify('Extra ' .. 10 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 20 then 
                    SetVehicleExtra(veh, 10, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 10 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 11) then
                local args = tonumber(args)
                if args == 21 then 
                    SetVehicleExtra(veh, 11, 1)
                    QBCore.Functions.Notify('Extra ' .. 11 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 22 then 
                    SetVehicleExtra(veh, 11, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 11 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 12) then
                local args = tonumber(args)
                if args == 23 then 
                    SetVehicleExtra(veh, 12, 1)
                    QBCore.Functions.Notify('Extra ' .. 12 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 24 then 
                    SetVehicleExtra(veh, 12, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 12 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 13) then
                local args = tonumber(args)
                if args == 25 then 
                    SetVehicleExtra(veh, 13, 1)
                    QBCore.Functions.Notify('Extra ' .. 13 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 26 then 
                    SetVehicleExtra(veh, 13, 0)
                    SetVehicleAutoRepairDisabled(true)
                    QBCore.Functions.Notify('Extra ' .. 13 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, nil) then
                QBCore.Functions.Notify('This extra is not present on this vehicle ', 'error', 2500)
            end
        end
    end
end)


-- events
RegisterNetEvent('ccvehmenu:client:extrasMenu', function()
    createExtrasMenu()
    exports['qb-menu']:openMenu(extrasMenu)
end)

RegisterNetEvent('ccvehmenu:client:extrasActMenu', function()
    createExtrasActMenu()
    exports['qb-menu']:openMenu(extrasActMenu)
end)

RegisterNetEvent('ccvehmenu:client:extrasDeactMenu', function()
    createExtrasDeactMenu()
    exports['qb-menu']:openMenu(extrasDeactMenu)
end)

