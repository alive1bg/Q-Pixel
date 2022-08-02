local QBCore = exports['qb-core']:GetCoreObject()
local SpawnVehicle = false

RegisterNetEvent('qb-rental:openMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Rental Vehicles",
            isMenuHeader = true,
        },
        {
            id = 1,
            header = "Return Vehicle ",
            txt = "Return your rented vehicle.",
            params = {
                event = "qb-rental:return",
            }
        },
        {
            id = 2,
            header = "Boat Trailer",
            txt = "$500.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'boattrailer',
                    money = 500,
                }
            }
        },
        {
            id = 3,
            header = "Car Trailer",
            txt = "$500.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'trailersmall',
                    money = 500,
                }
            }
        },
        {
            id = 4,
            header = "Bison",
            txt = "$500.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'bison',
                    money = 500,
                }
            }
        },
        {
            id = 5,
            header = "Futo ",
            txt = "$600.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'futo',
                    money = 600,
                }
            }
        },
        {
            id = 6,
            header = "Buccaneer",
            txt = "$625.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'buccaneer',
                    money = 625,
                }
            }
        },
        {
            id = 7,
            header = "Sanchez",
            txt = "$2500.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'sanchez',
                    money = 2500,
                }
            }
        },
        {
            id = 8,
            header = "Coach",
            txt = "$800.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'coach',
                    money = 800,
                }
            }
        },
        {
            id = 9,
            header = "Shuttle Bus",
            txt = "$800.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'rentalbus',
                    money = 800,
                }
            }
        },
        {
            id = 10,
            header = "Tour Bus",
            txt = "$800.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'tourbus',
                    money = 800,
                }
            }
        },
        {
            id = 11,
            header = "Taco Truck",
            txt = "$800.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'nptaco',
                    money = 800,
                }
            }
        },
        {
            id = 12,
            header = "Limo",
            txt = "$1500.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'vustretch',
                    money = 1500,
                }
            }
        },
        {
            id = 13,
            header = "Hearse",
            txt = "$1500.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'romero',
                    money = 1500,
                }
            }
        },
        {
            id = 14,
            header = "Clown Car",
            txt = "$5000.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'speedo2',
                    money = 5000,
                }
            }
        },
        {
            id = 15,
            header = "Festival Bus",
            txt = "$10000.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'pbus2',
                    money = 10000,
                }
            }
        },
    })
end)

CreateThread(function()
    SpawnNPC()
end)


SpawnNPC = function()
    CreateThread(function()
       
        RequestModel(GetHashKey('cs_andreas'))
        while not HasModelLoaded(GetHashKey('cs_andreas')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('cs_andreas') , 109.9739, -1088.61, 28.302, 345.64, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end

RegisterNetEvent('qb-rental:spawncar')
AddEventHandler('qb-rental:spawncar', function(data)
    local money =data.money
    local model = data.model
    local player = PlayerPedId()

    QBCore.Functions.TriggerCallback('qb-rental:checkmoney', function(result)
        if result then
            QBCore.Functions.SpawnVehicle(model, function(vehicle)
                SetEntityHeading(vehicle, 340.0)
                TaskWarpPedIntoVehicle(player, vehicle, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
                SetVehicleEngineOn(vehicle, true, true)
                SpawnVehicle = true
            end, vector4(111.4223, -1081.24, 29.192,340.0), true)
        
            Wait(1000)

            local vehicle = GetVehiclePedIsIn(player, false)
            local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            vehicleLabel = GetLabelText(vehicleLabel)
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent('qb-rental:rentalpapers', plate, vehicleLabel, money)
        else
            QBCore.Functions.Notify('You do not have enough money!')
        end
    end, money)

    
end)

RegisterNetEvent('qb-rental:return')
AddEventHandler('qb-rental:return', function()
    if SpawnVehicle then
        local Player = QBCore.Functions.GetPlayerData()
        QBCore.Functions.Notify('Returned vehicle!', 'success')
        TriggerServerEvent('qb-rental:removepapers')
        local car = GetVehiclePedIsIn(PlayerPedId(),true)
        NetworkFadeOutEntity(car, true,false)
        Wait(2000)
        QBCore.Functions.DeleteVehicle(car)
    else 
        QBCore.Functions.Notify("No vehicle to return", "error")
    end
    SpawnVehicle = false
end)

CreateThread(function()
    blip = AddBlipForCoord(111.0112, -1088.67, 29.302)
    SetBlipSprite (blip, 56)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.5)
    SetBlipColour (blip, 43)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Vehicle Rental')
    EndTextCommandSetBlipName(blip)
end)
