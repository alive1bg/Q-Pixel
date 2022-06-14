onDuty = false
local inLoggedIn = true
local PlayerJob = {}
local fries = false
local patty = false
local skillbar = false
local cleanfry = false

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
	PlayerJob = QBCore.Functions.GetPlayerData().job
    CreateThread(function()
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            onDuty = PlayerData.job.onduty
        end)
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('kn-burgershot:client:ToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
    print('aima shel osher zona')
    print('naorcn the king')
end)

-- Functions
function MakeBleeder()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        QBCore.Functions.TriggerCallback('kn-burgershot:checkitem2', function(hasItem)
            QBCore.Functions.TriggerCallback('kn-burgershot:checkitem3', function(hasItem)
                QBCore.Functions.TriggerCallback('kn-burgershot:checkitem4', function(hasItem)
                    if hasItem then
                        QBCore.Functions.Progressbar("bleeder", "Preparing Bleeder Burger", 10000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@amb@business@coc@coc_unpack_cut@",
                            anim = "fullcut_cycle_v6_cokecutter",
                            flags = 49,
                        }, {}, {}, function(cancelled) 
                            if not cancelled then
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerbuns', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'cheese', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'lettuce', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerpatty', 1)
                                TriggerServerEvent('kn-burgershot:giveitem', 'bleederburger', 1)
                            else
                                -- Do Something If Action Was Cancelled
                            end
                        end)
                    end
                end, 'hamburgerbuns')
            end, 'cheese')
        end, 'lettuce')
    end, 'hamburgerpatty')
end

function MakeHeartStopper()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        QBCore.Functions.TriggerCallback('kn-burgershot:checkitem2', function(hasItem)
            QBCore.Functions.TriggerCallback('kn-burgershot:checkitem3', function(hasItem)
                QBCore.Functions.TriggerCallback('kn-burgershot:checkitem4', function(hasItem)
                    if hasItem then
                        QBCore.Functions.Progressbar("heartstopper", "Preparing Heart Stopper", 10000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@amb@business@coc@coc_unpack_cut@",
                            anim = "fullcut_cycle_v6_cokecutter",
                            flags = 49,
                        }, {}, {}, function(cancelled) 
                            if not cancelled then
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerbuns', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'cheese', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'lettuce', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerpatty', 1)
                                TriggerServerEvent('kn-burgershot:giveitem',   'heartstopper', 1)
                            else
                                -- Do Something If Action Was Cancelled
                            end
                        end)
                    end
                end, 'hamburgerbuns')
            end, 'cheese')
        end, 'lettuce')
    end, 'hamburgerpatty')
end

function MakeTorpedo()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        QBCore.Functions.TriggerCallback('kn-burgershot:checkitem2', function(hasItem)
            QBCore.Functions.TriggerCallback('kn-burgershot:checkitem3', function(hasItem)
                QBCore.Functions.TriggerCallback('kn-burgershot:checkitem4', function(hasItem)
                    if hasItem then
                        QBCore.Functions.Progressbar("torpedo", "Preparing Torpedo", 10000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@amb@business@coc@coc_unpack_cut@",
                            anim = "fullcut_cycle_v6_cokecutter",
                            flags = 49,
                        }, {}, {}, function(cancelled) 
                            if not cancelled then
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerbuns', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'cheese', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'lettuce', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerpatty', 1)
                                TriggerServerEvent('kn-burgershot:giveitem', 'torpedo', 1)
                            else
                                -- Do Something If Action Was Cancelled
                            end
                        end)
                    end
                end, 'hamburgerbuns')
            end, 'cheese')
        end, 'lettuce')
    end, 'hamburgerpatty')
end

function MakeMoneyShot()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        QBCore.Functions.TriggerCallback('kn-burgershot:checkitem2', function(hasItem)
            QBCore.Functions.TriggerCallback('kn-burgershot:checkitem3', function(hasItem)
                QBCore.Functions.TriggerCallback('kn-burgershot:checkitem4', function(hasItem)
                    if hasItem then
                        QBCore.Functions.Progressbar("moneyshot", "Preparing Moneyshot", 10000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@amb@business@coc@coc_unpack_cut@",
                            anim = "fullcut_cycle_v6_cokecutter",
                            flags = 49,
                        }, {}, {}, function(cancelled) 
                            if not cancelled then
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerbuns', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'cheese', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'lettuce', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerpatty', 1)
                                TriggerServerEvent('kn-burgershot:giveitem', 'moneyshot', 1)
                            else
                                -- Do Something If Action Was Cancelled
                            end
                        end)
                    end
                end, 'hamburgerbuns')
            end, 'cheese')
        end, 'lettuce')
    end, 'hamburgerpatty')
end

function MakeMeatFree()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        QBCore.Functions.TriggerCallback('kn-burgershot:checkitem2', function(hasItem)
                    if hasItem then
                        QBCore.Functions.Progressbar("meatfree", "Preparing Meat Free", 10000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@amb@business@coc@coc_unpack_cut@",
                            anim = "fullcut_cycle_v6_cokecutter",
                            flags = 49,
                        }, {}, {}, function(cancelled) 
                            if not cancelled then
                                TriggerServerEvent('kn-burgershot:deleteitem', 'lettuce', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'hamburgerbuns', 1)
                                TriggerServerEvent('kn-burgershot:giveitem', 'meatfree', 1)
                            else
                                -- Do Something If Action Was Cancelled
                            end
                        end)
                    end
        end, 'lettuce')
    end, 'hamburgerbuns')
end

function MakeFries()
    if not fries then
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("fryyy", "Frying Fries", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "missfinale_c2ig_11",
                anim = "pushcar_offcliff_f",
                flags = 49,
            }, {}, {}, function(cancelled) 
                if not cancelled then
                    TriggerServerEvent('kn-burgershot:deleteitem', 'potato', 1)
                    TriggerServerEvent('kn-burgershot:giveitem', 'fries', 1)
                    fries = false
                else
                    -- Do Something If Action Was Cancelled
                end
            end)
        end
    end, 'potato')
    end
end

function CookPatty()
    if not patty then
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("pattyy", "Cooking Patty", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "amb@prop_human_bbq@male@base",
                anim = "base",
                flags = 49,
            }, {}, {}, function(cancelled) 
                if not cancelled then
                    TriggerServerEvent('kn-burgershot:deleteitem', 'questionablemeat', 1)
                    TriggerServerEvent('kn-burgershot:giveitem', 'hamburgerpatty', 1)
                    patty = false
                else
                    -- Do Something If Action Was Cancelled
                end
            end)
        end
    end, 'questionablemeat')
    end
end

function MakeWater()
    QBCore.Functions.Progressbar("tapwater", "Dispensing Tap Water", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_ped_interaction",
        anim = "handshake_guy_a",
        flags = 49,
    }, {}, {}, function(cancelled) 
        if not cancelled then
            TriggerServerEvent('kn-burgershot:giveitem', 'water', 1)
        else
            -- Do Something If Action Was Cancelled
        end
    end)
end

function MakeSoftDrink()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("softdrink", "Dispensing Soft Drink", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_ped_interaction",
                anim = "handshake_guy_a",
                flags = 49,
            }, {}, {}, function(cancelled) 
                if not cancelled then
                    TriggerServerEvent('kn-burgershot:deleteitem', 'hfcs', 1)
                    TriggerServerEvent('kn-burgershot:giveitem', 'softdrink', 1)
                else
                end
            end)
        end
    end, 'hfcs')
end

function MakeMilkShake()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
        QBCore.Functions.TriggerCallback('kn-burgershot:checkitem2', function(hasItem)
                    if hasItem then
                        QBCore.Functions.Progressbar("milkshake", "Dispensing Milkshake", 10000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mp_ped_interaction",
                            anim = "handshake_guy_a",
                            flags = 49,
                        }, {}, {}, function(cancelled) 
                            if not cancelled then
                                TriggerServerEvent('kn-burgershot:deleteitem', 'icecreamingred', 1)
                                TriggerServerEvent('kn-burgershot:deleteitem', 'milk', 1)
                                TriggerServerEvent('kn-burgershot:giveitem',   'mshake', 1)
                            else
                                -- Do Something If Action Was Cancelled
                            end
                        end)
                    end
        end, 'icecreamingred')
    end, 'milk')
end

function MakeCoffee()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem2', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("coffeepre", "Dispensing Cheap Coffee", 15000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_ped_interaction",
                anim = "handshake_guy_a",
                flags = 49,
            }, {}, {}, function(cancelled) 
                if not cancelled then
                    TriggerServerEvent('kn-burgershot:deleteitem', 'coffeebeans', 1)
                    TriggerServerEvent('kn-burgershot:deleteitem', 'milk', 1)
                    TriggerServerEvent('kn-burgershot:giveitem', 'bscoffee', 1)
                else
                    -- Do Something If Action Was Cancelled
                end
            end)
        end
    end, 'coffeebeans')
    end, 'milk')
end

function MakeFruitSlushy()
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem', function(hasItem)
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem2', function(hasItem)
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem3', function(hasItem)  
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem4', function(hasItem)
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem5', function(hasItem)
    QBCore.Functions.TriggerCallback('kn-burgershot:checkitem6', function(hasItem)  
        if hasItem then
            QBCore.Functions.Progressbar("fslushypre", "Dispensing Fruit Slushy", 15000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_ped_interaction",
                anim = "handshake_guy_a",
                flags = 49,
            }, {}, {}, function(cancelled) 
                if not cancelled then
                    TriggerServerEvent('kn-burgershot:deleteitem', 'apple', 1)
                    TriggerServerEvent('kn-burgershot:deleteitem', 'banana', 1)
                    TriggerServerEvent('kn-burgershot:deleteitem', 'cherry', 1)
                    TriggerServerEvent('kn-burgershot:deleteitem', 'orange', 1)
                    TriggerServerEvent('kn-burgershot:deleteitem', 'peach', 1)
                    TriggerServerEvent('kn-burgershot:deleteitem', 'strawberry', 1)
                    TriggerServerEvent('kn-burgershot:giveitem', 'fruitslushy', 1)
                else
                    -- Do Something If Action Was Cancelled
                end
            end)
        end
        end, 'apple')
    end, 'banana')
    end, 'cherry')
    end, 'orange')
    end, 'peach')
    end, 'strawberry')
end

function GrabDonut()
    QBCore.Functions.Progressbar("grabdonut", "Grabbing Donut", 15000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "missfinale_c2ig_11",
        anim = "pushcar_offcliff_f",
        flags = 49,
    }, {}, {}, function(cancelled) 
        if not cancelled then
            TriggerServerEvent('kn-burgershot:giveitem', 'donut', 1)
        else
        end
    end)
end

function GrabCreamPie()
    QBCore.Functions.Progressbar("grabcreampie", "Grabbing Cream Pie", 15000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "missfinale_c2ig_11",
        anim = "pushcar_offcliff_f",
        flags = 49,
    }, {}, {}, function(cancelled) 
        if not cancelled then
            TriggerServerEvent('kn-burgershot:giveitem', 'applepie', 1)
        else
        end
    end)
end

-- Item making via nh-context
RegisterNetEvent('kn-burgershot:makefood', function()
    TriggerEvent('nh-context:sendMenu', {
        {	
			id = 1,
            header = "Bleeder",
            txt = "1 Bun, 1 Cheese, 1 Lettuce, 1 Patty | 10s",
			params = {
                event = "burger:bleeder"
            }
        },
        {
			id = 2,
            header = "Heart Stopper",
            txt = "1 Bun, 1 Cheese, 1 Lettuce, 1 Patty | 10s",
			params = {
                event = "burger:heartstopper"
            }
        },
        {
			id = 3,
            header = "Torpedo",
            txt = "1 Bun, 1 Cheese, 1 Lettuce, 1 Patty | 10s",
			params = {
                event = "burger:torpedo"
            }
        },
        {
			id = 4,
            header = "Moneyshot",
            txt = "1 Bun, 1 Cheese, 1 Lettuce, 1 Patty | 10s",
			params = {
                event = "burger:moneyshot"
            }
        },
        {
			id = 5,
            header = "Meat Free",
            txt = "1 Bun, 1 Lettuce | 10s",
			params = {
                event = "burger:meatfree"
            }
        },
		{
			id = 6,
            header = "Close", 
            txt = "",
			params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent("burger:bleeder", function()
    if onDuty then
        MakeBleeder()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("burger:heartstopper", function()
    if onDuty then
        MakeHeartStopper()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("burger:torpedo", function()
    if onDuty then
        MakeTorpedo()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)



RegisterNetEvent("burger:meatfree", function()
    if onDuty then
        MakeMeatFree()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("burger:moneyshot", function()
    if onDuty then
        MakeMoneyShot()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent('burger:getmurdermeal', function()
    if onDuty then
        TriggerServerEvent('kn-burgershot:getmurder', 'murdermeal', 1)
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent('burger:getrandomtoy', function()
    local toy = math.random(3)
    if onDuty then
    if toy == 1 then
        TriggerServerEvent('kn-burgershot:giveitem', 'randomtoy', 1)
    elseif toy == 2 then
        TriggerServerEvent('kn-burgershot:giveitem', 'randomtoy2', 1)
    elseif toy == 3 then
        TriggerServerEvent('kn-burgershot:giveitem', 'randomtoy3', 1)
    end
    else
    QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

-- Item making via nh-context
RegisterNetEvent('kn-burgershot:makedrinks', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Tap Water",
            txt = "None | 5s",
			params = {
                event = "burger:tapwater"
            }
        },
        {
			id = 2,
            header = "Soft Drink",
            txt = "1 High-Fructose Syrup | 5s",
			params = {
                event = "burger:softdrink"
            }
        },
        {
			id = 3,
            header = "Milkshake",
            txt = "1 Milk, 1 Ice Cream | 10s",
			params = {
                event = "burger:milkshake"
            }
        },
        {
			id = 4,
            header = "Cheap Coffee",
            txt = "1 Coffee Bean, 1 Milk | 15s",
			params = {
                event = "burger:coffee"
            }
        },
        {
			id = 5,
            header = "Fruit Slushy",
            txt = "1 Apple, 1 Banana, 1 Cherry, 1 Orange, 1 Peach, 1 Strawberry | 15s",
			params = {
                event = "burger:fruitslushy"
            }
        },
		{
			id = 6,
            header = "Close", 
            txt = "",
			params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent("burger:tapwater", function()
    if onDuty then
        MakeWater()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("burger:softdrink", function()
    if onDuty then
        MakeSoftDrink()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("burger:milkshake", function()
    if onDuty then
        MakeMilkShake()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("burger:coffee", function()
    if onDuty then
        MakeCoffee()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("burger:fruitslushy", function()
    if onDuty then
        MakeFruitSlushy()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent('kn-burgershot:grabmisc', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Donut",
            txt = "None | 15s",
			params = {
                event = "burger:donut"
            }
        },
        {
			id = 2,
            header = "Cream Pie",
            txt = "Made with love ;) | 15s",
			params = {
                event = "burger:creampie"
            }
        },
		{
			id = 3,
            header = "Close", 
            txt = "",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent("burger:donut", function()
    if onDuty then
        GrabDonut()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("burger:creampie", function()
    if onDuty then
        GrabCreamPie()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent('kn-burgershot:fries', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Fries",
            txt = "1 Potato | 10s",
			params = {
                event = "kn-burgershot:makefries"
            }
        },
    })
end)

RegisterNetEvent('kn-burgershot:pattyyy', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Patty",
            txt = "1 Questionable Meat | 10s",
			params = {
                event = "kn-burgershot:cookpatty"
            }
        },
    })
end)

RegisterNetEvent('kn-burgershot:cleanmenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
			id = 1,
            header = "Clean",
            txt = "The fryer needs cleaning",
			params = {
				event = "kn-burgershot:clean"
            }
        },
    })
end)

-- BurgerShot
exports['qb-target']:AddCircleZone("burgerspickup", vector3(141.39, -1466.75, 29.35), 1.0,{
    name="burgerspickup",
    debugPoly=false,
    useZ=true,
    }, {
        options = {
            {
                event = "kn-burgershot:pickup",
                icon = "fas fa-hand-holding",
                label = "Open",
            },
        },
        job = {"all"},
        distance = 1.5
    })
exports['qb-target']:AddCircleZone("burgerspickup2", vector3(139.44, -1468.94, 29.35), 1.0,{
    name="burgerspickup2",
    debugPoly=false,
    useZ=true,
    }, {
        options = {
            {
                event = "kn-burgershot:pickup2",
                icon = "fas fa-hand-holding",
                label = "Open",
            },
        },
        job = {"all"},
        distance = 1.5
    })
exports['qb-target']:AddCircleZone("burgershotshelf", vector3(144.26, -1466.04, 29.35), 0.8, {
    name="burgershotshelf",
    debugPoly=false,
    useZ=true,
    }, {
        options = {
            {
                event = "kn-burgershot:shelf",
                icon = "fas fa-box-open",
                label = "Open",
            },
        },
        job = {"burgershot"},
        distance = 1.5
    })
exports['qb-target']:AddCircleZone("burgershotdrinks", vector3(141.11, -1469.68, 29.35), 1.0, {
        name="burgershotdrinks",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
                {
                    event = "kn-burgershot:makedrinks",
                    icon = "fas fa-mug-hot",
                    label = "Open Station",
                },
            },
            job = {"burgershot"},
            distance = 1.5
        })
exports['qb-target']:AddCircleZone("burgershotfood", vector3(147.42, -1469.17, 29.35), 1.0, {
        name="burgershotfood",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
                {
                    event = "kn-burgershot:makefood",
                    icon = "fas fa-hamburger",
                    label = "Open Station",
                },
            },
            job = {"burgershot"},
            distance = 1.5
        })
exports['qb-target']:AddCircleZone("burgershotstorage", vector3(137.70, -1471.15, 29.35), 1.0, {
        name="burgershotstorage",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
                {
                    event = "kn-burgershot:ingredient",
                    icon = "fas fa-box-open",
                    label = "Ingredient Storage",
                },
            },
            job = {"burgershot"},
            distance = 1.5
        })
        exports['qb-target']:AddCircleZone("burgershotmisc", vector3(139.32, -1472.20, 29.35), 1.0, {
            name="burgershotmisc",
            debugPoly=false,
            useZ=true,
            }, {
                options = {
                    {
                        event = "kn-burgershot:grabmisc",
                        icon = "fas fa-ice-cream",
                        label = "Open Station",
                    },
                },
                job = {"burgershot"},
                distance = 1.5
            })
exports['qb-target']:AddCircleZone("burgershotfries", vector3(146.00, -1470.80, 29.35), 1.5, {
        name="burgershotfries",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
                {
                    event = "kn-burgershot:fries",
                    icon = "fas fa-temperature-high",
                    label = "Open Station",
                },
            },
            job = {"burgershot"},
            distance = 1.5
        })
        exports['qb-target']:AddCircleZone("burgershotpatty", vector3(144.61, -1472.52, 29.35), 1.0, {
            name="burgershotpatty",
            debugPoly=false,
            useZ=true,
            }, {
                options = {
                    {
                        event = "kn-burgershot:pattyyy",
                        icon = "fas fa-hamburger",
                        label = "Open Station",
                    },
                },
                job = {"burgershot"},
                distance = 1.5
            })

exports['qb-target']:AddCircleZone("burgermisc", vector3(145.31, -1466.93, 29.35), 1.5, {
        name="burgermisc",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
                {
                    event = "burger:getmurdermeal",
                    icon = "fas fa-box",
                    label = "Get Murder Meal",
                },
            {
                event = "burger:getrandomtoy",
                icon = "fas fa-smile-wink",
                label = "Get Toys",
            },
        },
            job = {"burgershot"},
            distance = 1.5
        })

exports['qb-target']:AddCircleZone("burgerboss", vector3(142.82, -1463.58, 29.35), 1.5, {
    name="burgerboss",
    debugPoly=false,
    useZ=true,
    }, {
        options = {
        {
            event = "kn-burgershot:client:ToggleDuty",
            icon = "fas fa-clock",
            label = "Clock In/Out",
        },    
        {
            event = "qb-mechanic:interact:boss",
            icon = "fas fa-laptop",
            label = "Job Management",
        },
    },
    job = {"burgershot"},
    distance = 1.5
})

RegisterNetEvent("kn-burgershot:targetmenu", function()
    if cleanfry then
        TriggerEvent("kn-burgershot:fries")
    else
        TriggerEvent("kn-burgershot:cleanmenu")
    end
end)

RegisterNetEvent("kn-burgershot:clean", function()
    if onDuty then
        exports["qb-taskbarskill"]:taskBar(1200,7)
        cleanfry = true
        QBCore.Functions.Notify("Station cleaned.")
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)


RegisterNetEvent("kn-burgershot:makefries", function()
    if onDuty then
        MakeFries()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("kn-burgershot:cookpatty", function()
    if onDuty then
        CookPatty()
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("kn-burgershot:interact:boss", function()
    TriggerServerEvent("qb-bossmenu:server:openMenu")
end)

RegisterNetEvent("kn-burgershot:shelf", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Burger Shelf")
    TriggerEvent("inventory:client:SetCurrentStash", "Burger Shelf")
end)

RegisterNetEvent("kn-burgershot:ingredient", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Ingredient Storage")
    TriggerEvent("inventory:client:SetCurrentStash", "Ingredient Storage")
end)

RegisterNetEvent("kn-burgershot:pickup", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Pickup Order #1")
    TriggerEvent("inventory:client:SetCurrentStash", "Pickup Order #1")
end)

RegisterNetEvent("kn-burgershot:pickup2", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Pickup Order #2")
    TriggerEvent("inventory:client:SetCurrentStash", "Pickup Order #2")
end)