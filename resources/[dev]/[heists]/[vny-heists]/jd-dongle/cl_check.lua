local QBCore = exports['qb-core']:GetCoreObject()

function checkstatus ()
    local context = {
        {
            id = 1,
            header = "Robbery Situations",
            txt = "",
            params = {
                event = ""
            }
        },
    }
    QBCore.Functions.TriggerCallback('jd-check:sorguhocam', function(data)
        print(json.encode(data))
        if data then
                table.insert(context, {
                    id = 2,
                    header = "Jeweler",
                    txt = data.jeweler,
                    params = {
                        event = "",
                        args = ""
                    },
                })
                table.insert(context, {
                    id = 3,
                    header = "Bay City Bank",
                    txt = data.mazebank,
                    params = {
                        event = "",
                        args = ""
                    },
                })
                table.insert(context, {
                    id = 4,
                    header = "Fleeca:Great Ocean",
                    txt = data.greatocean,
                    params = {
                        event = "",
                        args = ""
                    },
                })
                table.insert(context, {
                    id = 5,
                    header = "Fleeca:Harmony",
                    txt = data.harmony,
                    params = {
                        event = "",
                        args = ""
                    },
                })
                table.insert(context, {
                    id = 6,
                    header = "Paleto Bank",
                    txt = data.paleto,
                    params = {
                        event = "",
                        args = ""
                    },
                })
                table.insert(context, {
                    id = 7,
                    header = "Upper Vault (City Bank)",
                    txt = data.uppervault,
                    params = {
                        event = "",
                        args = ""
                    },
                })
                table.insert(context, {
                    id = 8,
                    header = "Lower Vault (City Bank)",
                    txt = data.lowervault,
                    params = {
                        event = "",
                        args = ""
                    },
                })
            end
    end)
    Wait(100)
    TriggerEvent('nh-context:sendMenu', context)
end

function buyitems ()
    local context1 = {
        {
            id = 1,
            header = "Practice Makes Perferct",
            txt = "",
            params = {
                event = ""
            }
        },
    }
        table.insert(context1, {
            id = 2,
            header = "Green Laptop (100SHUNG)",
            txt = "Useful for Fleecas",
            params = {
            event = "itemverclientside",
            args = "greenlaptop"
        },
        })
        table.insert(context1, {
            id = 3,
            header = "Blue Laptop (250SHUNG)",
            txt = "Useful for Paleto",
            params = {
            event = "itemverclientside",
            args = "bluelaptop"
        },
        })
        table.insert(context1, {
            id = 4,
            header = "Red Laptop (500SHUNG)",
            txt = "Useful for Upper Vault (City Bank)",
            params = {
            event = "itemverclientside",
            args = "redlaptop"
        },
        })
        table.insert(context1, {
            id = 5,
            header = "Gold Laptop (1500SHUNG)",
            txt = "Useful for Lower Vault (City Bank)",
            params = {
            event = "itemverclientside",
            args = "goldlaptop"
        },
        })
        table.insert(context1, {
            id = 6,
            header = "Gold Dongle (100SHUNG)",
            txt = "Useful for acquiring other tools",
            params = {
            event = "itemverclientside",
            args = "golddongle"
        },
        })
    Wait(100)
    TriggerEvent('nh-context:sendMenu', context1)
end


RegisterNetEvent("itemverclientside", function (itemname)
TriggerServerEvent("itemverserverside", itemname)
end)

AddEventHandler('chechkeventtarget', function(data)
    Wait(200)
    checkstatus()
end)

AddEventHandler('buyitemsseventtarget', function(data)
    Wait(200)
    buyitems()
end)

Citizen.CreateThread(function()
    model = GetHashKey("cs_mrk")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,-1359.24, -760.47, 22.3 - 1.00, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, 349.2 )
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
end)

exports['qb-target']:AddBoxZone("bankdonglenpcped", vector3(-1359.32, -760.31, 22.3), 0.45, 0.35, {
	name = "bankdonglenpcped",
	heading = 11.0,
	debugPoly = false,
	minZ = 20.3,
	maxZ = 23.3,
}, {
	options = {
        {
            type="client",
            event = "chechkeventtarget",
            icon = "fas fa-laptop-code",
            label = "Check Availability"
        },
        {
            type = "client",
            event = "buyitemsseventtarget",
            icon = "fas fa-sign-in-alt",
            label = "Buy Laptop",
        }
	},
	distance = 2.5
})