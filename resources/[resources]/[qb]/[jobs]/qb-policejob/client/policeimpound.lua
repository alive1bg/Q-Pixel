QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('police:client:Impound', function(fullImpound, price)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local bodyDamage = math.ceil(GetVehicleBodyHealth(vehicle))
    local engineDamage = math.ceil(GetVehicleEngineHealth(vehicle))
    local totalFuel = exports['qb-fuel']:GetFuel(vehicle)
    if vehicle ~= 0 and vehicle then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
            QBCore.Functions.Progressbar("impound_vehicle", "Requesting Impound", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            }, {}, {}, {}, function() -- Done
                local plate = QBCore.Functions.GetPlate(vehicle)
                TriggerServerEvent("police:server:Impound", plate, fullImpound, price, bodyDamage, engineDamage, totalFuel)
                QBCore.Functions.DeleteVehicle(vehicle)
            end, function() -- Cancel
                QBCore.Functions.Notify("Canceled..", "error")
            end)
        end
    end
end)

RegisterNetEvent("police:Impound")
AddEventHandler('police:Impound', function(data)
    TriggerEvent('police:client:Impound', false, data.price)
end)

RegisterNetEvent("police:FullImpound")
AddEventHandler('police:FullImpound', function(data)
    TriggerEvent('police:client:Impound', true, data.price)
end)

RegisterNetEvent("qb-policejob:copimpound", function(source, raw)
    exports['qb-menu']:openMenu({
        {
            header = "Request Impound",
            txt = "Request Tow Worker to impound this vehicle",
            params = {
                event = "qb-policejob:towimpound",
            }
        },
        {
            header = "Police Impoud",
            txt = "Impound this vehicle",
            params = {
                event = "qb-policejob:policeimpound",
            },
        },
        {
            header = "Close",
            txt = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu"
            },
        },
    })
end)

RegisterNetEvent("qb-policejob:policeimpound", function(source, args, raw)
    exports['qb-menu']:openMenu({
        {
            header = "Police Impound",
            isMenuHeader = true
        },
        {
            header = "Evidence Of a Crime",
            txt = "Vehicle has been used in or is evidence of a crime.",
            params = {
                event = "police:FullImpound",
                args = {
					price = '750',
				}
            }
        },
        {
            header = "Reckless Evading",
            txt = "Driven carelessly with gross disregard for human life.",
            params = {
                event = "police:FullImpound",
				args = {
					price = '1300',
				}
            }
        },
        {
            header = "Street Racing",
            txt = "Vehicle was uised in a speed contest on a public road/highway.",
            params = {
                event = "police:FullImpound",
				args = {
					price = '800',
				}
            }
        },
        {
            header = "Vehicle Repossession",
            txt = "Vehicle with an outstanding loan that was not paid off and is to be seized.",
            params = {
                event = "police:FullImpound",
				args = {
					price = '2000',
				}
            }
        },
        {
            header = "Robbery or Kidnapping",
            txt = "Vehicle was used in the commission of any robbery or kidnapping related offense.",
            params = {
                event = "police:FullImpound",
				args = {
					price = '4000',
				}
            }
        },
        {
            header = "Inoperable on a scene",
            txt = "Vehicle found on a scene in an inoperable state.",
            params = {
                event = "police:FullImpound",
				args = {
					price = '500',
				}
            }
        },
        {
            header = "Violent Felony",
            txt = "Used in the commission of violent crime either in a drive by shooting or for transporting to and from the scene of a violent crime.",
            params = {
                event = "police:FullImpound",
				args = {
					price = '3500',
				}
            }
        },
        {
            header = "Back",
            txt = "Back to main menu",
            params = {
                event = "qb-policejob:copimpound",
            }
        },
        {
            header = "Close",
            txt = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu"
            },
        },
    })
end)

RegisterNetEvent("qb-policejob:towimpound", function(source, args, raw)
    exports['qb-menu']:openMenu({
        {
            header = "Tow Impound",
            isMenuHeader = true
        },
        {
            header = "Vehicle Scuff",
            txt = "Vehicle in an unrecoverable state.",
            params = {
                event = "qb-tow:client:markVehicleNew",
            }
        },
        {
            header = "Parking Violation",
            txt = "Vehicle parked in an restricted or unauthorzied place.",
            params = {
                event = "qb-tow:client:markVehicleNew",
            }
        },
        {
            header = "Back",
            txt = "Back to main menu",
            params = {
                event = "qb-policejob:copimpound",
            }
        },
        {
            header = "Close",
            txt = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu"
            },
        },
    })
end)