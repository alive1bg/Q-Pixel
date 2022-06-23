local QBCore = exports['qb-core']:GetCoreObject()
Config = {}
local OwnedLockerBlips = {}
local currentLocker, lockerName

CreateThread(function() --add an onplayer loaded for blips and config fetch as well as this thread
    TriggerEvent('qb-storagelockers:client:FetchConfig')
    TriggerEvent('qb-storagelockers:client:setupBlips')
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('qb-storagelockers:client:FetchConfig')
    TriggerEvent('qb-storagelockers:client:setupBlips')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(OwnedLockerBlips) do
        RemoveBlip(v)
    end
end)

RegisterNetEvent('qb-storagelockers:client:FetchConfig')
AddEventHandler('qb-storagelockers:client:FetchConfig', function()
    QBCore.Functions.TriggerCallback("qb-storagelockers:server:FetchConfig", function(lockers)
        Config.Lockers = lockers
    end)
end)

RegisterNetEvent('qb-storagelockers:client:setupBlips')
AddEventHandler('qb-storagelockers:client:setupBlips', function()
    for k, v in pairs(OwnedLockerBlips) do
        RemoveBlip(v)
    end
    QBCore.Functions.TriggerCallback('qb-storagelockers:server:getOwnedLockers', function(ownedLockers)
        if ownedLockers ~= nil then
            for k, v in pairs(ownedLockers) do
                local locker = Config.Lockers[v]['coords']
                local lockerBlip = AddBlipForCoord(locker.x, locker.y, locker.z)
                SetBlipSprite (lockerBlip, 587)
                SetBlipDisplay(lockerBlip, 4)
                SetBlipScale  (lockerBlip, 0.65)
                SetBlipAsShortRange(lockerBlip, true)
                SetBlipColour(lockerBlip, 1)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName("Warehouse")
                EndTextCommandSetBlipName(lockerBlip)
                table.insert(OwnedLockerBlips, lockerBlip)
            end
        end
    end)
end)

CreateThread(function() 
    local alreadyEnteredZone = false
    while true do
        inZone = false
        sleep = 1000
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            if Config.Lockers ~= nil then
                for k, v in pairs(Config.Lockers) do
                    local dist = #(pos - vector3(v["coords"].x, v["coords"].y, v["coords"].z))
                    if dist < 4 then
                        if dist <= 1.5 then 
                            inZone = true
                            exports['qb-ui']:showInteraction("[E] Open Storage")
                            if dist <= 2 then
                                currentLocker = v
                                lockerName = k
                                sleep = 5
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-storagelockers:client:interact", k, v)
                                end
                            end
                        else
                            exports['qb-ui']:hideInteraction()
                        end
                
                end
            end
        end
        if inZone and not alreadyEnteredZone then
            alreadyEnteredZone = true
            exports['qb-ui']:showInteraction()
        end

        if not inZone and alreadyEnteredZone then
            alreadyEnteredZone = false
            exports['qb-ui']:hideInteraction()
        end
    Wait(sleep)
    end
end)

RegisterNetEvent('qb-storagelockers:buystorage')
AddEventHandler('qb-storagelockers:buystorage', function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Create Password",
        submitText = "Submit",
        inputs = {
            {
                text = "Password", -- text you want to be displayed as a place holder
                name = "password", -- name of the input should be unique otherwise it might override
                type = "password", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })
    --[[local dialog = exports['qb-ui']:OpenInputMenu({
        {
            label = 'Create Password',
            name = 'password',
            icon = 'pencil-alt',
        }
    })]]
    if dialog ~= nil then
        QBCore.Functions.TriggerCallback('qb-storagelockers:server:purchaselocker', function(bankmoney)
            if bankmoney >= currentLocker.price then
                TriggerServerEvent("qb-storagelockers:server:createPassword", dialog.password, lockerName)
                TriggerEvent('qb-storagelockers:client:FetchConfig')
                QBCore.Functions.Notify("You have purchased this locker","success")
            end
        end, currentLocker, lockerName)
    end
end)

RegisterNetEvent('qb-storagelockers:changePassword')
AddEventHandler('qb-storagelockers:changePassword', function()
    --[[local dialog = exports['qb-input']:ShowInput({
        header = "Change Password",
        submitText = "Submit",
        inputs = {
            {
                text = "Password", -- text you want to be displayed as a place holder
                name = "password", -- name of the input should be unique otherwise it might override
                type = "password", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })]]
    local dialog = exports['qb-ui']:OpenInputMenu({
        {
            label = 'Change Password',
            name = 'password',
            icon = 'pencil-alt',
        }
    })
    if dialog ~= nil then
        TriggerServerEvent("qb-storagelockers:server:changePasscode", dialog.password, lockerName, currentLocker)
    end
end)

RegisterNetEvent('qb-storagelockers:openStorage')
AddEventHandler('qb-storagelockers:openStorage', function()
    --[[local dialog = exports['qb-input']:ShowInput({
        header = "Storage Password",
        submitText = "Submit",
        inputs = {
            {
                text = "Password", -- text you want to be displayed as a place holder
                name = "password", -- name of the input should be unique otherwise it might override
                type = "password", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })]]
    local dialog = exports['qb-ui']:OpenInputMenu({
        {
            label = 'Storage Password',
            name = 'password',
            icon = 'pencil-alt',
        }
    })
    if dialog ~= nil then
        QBCore.Functions.TriggerCallback('qb-storagelockers:server:getData', function(password)
            if tonumber(dialog.password) ~= nil then
                if tonumber(dialog.password) == tonumber(password) then
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", lockerName, {
                    maxweight = currentLocker.capacity,
                    slots = currentLocker.slots,
                    })
                    TriggerEvent("inventory:client:SetCurrentStash", lockerName)   
                    --takeAnim()
                else
                    QBCore.Functions.Notify("Incorrect Password", 'error')
                end
            end        
        end, lockerName, 'password')
    end
end)

RegisterNetEvent("qb-storagelockers:client:interact")
AddEventHandler("qb-storagelockers:client:interact", function(k, v)
    local lockername = k
    local lockertable = v
    local citizenid = QBCore.Functions.GetPlayerData().citizenid
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    local storages = {
        {
            header = "Locker "..lockername,
            isMenuHeader = true
        }
    }

    if not lockertable["isOwned"] then
        storages[#storages+1] = {
            header = "Purchase",
            txt = "Purchase Locker for $" .. v.price,
            params = {
                event = "qb-storagelockers:client:purchase",
            }
        }

    elseif lockertable["isOwned"] then
        storages[#storages + 1] = {
            header = "Open Locker",
            txt = "",
            params = {
                event = "qb-storagelockers:client:openLocker",
            }
        }
    end

    if lockertable["owner"] == citizenid then
        storages[#storages + 1] = {
            header = "Change Passcode",
            txt = "",
            params = {
                event = "qb-storagelockers:client:changePasscode", 
            }
        }
    end
    if lockertable["owner"] == citizenid then
        storages[#storages + 1] = {
            header = "Sell Locker",
            txt = "",
            params = {
                event = "qb-storagelockers:client:sellLocker",
                args = {
                    lockername = lockername,
                    lockertable = lockertable
                }
            }
        }
    end

    if PlayerJob.name == "police" then
        storages[#storages + 1] = {
            header = "Raid Locker",
            txt = "",
            params = {
                event = "qb-storagelockers:client:raidLocker", 
                args = {
                    lockername = lockername,
                    lockertable = lockertable
                }
            }
        }
    end

    storages[#storages+1] = {
        header = "Close Menu",
        txt = "",
        params = {
            event = exports['qb-menu']:closeMenu()
        }

    }
    exports['qb-menu']:openMenu(storages)
end)

RegisterNetEvent('qb-storagelockers:client:sellLocker')
AddEventHandler('qb-storagelockers:client:sellLocker', function(data)
    TriggerServerEvent('qb-storagelockers:server:sellLocker', data.lockername, data.lockertable)
end)

RegisterNetEvent('qb-storagelockers:client:changePasscode')
AddEventHandler('qb-storagelockers:client:changePasscode', function()
    TriggerEvent("qb-storagelockers:changePassword")
    QBCore.Functions.Notify("Please set new password")
end)

RegisterNetEvent('qb-storagelockers:client:raidLocker')
AddEventHandler('qb-storagelockers:client:raidLocker', function(data)
    local seconds = math.random(10,20)
    local circles = math.random(1,2)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            --add progressbar/animation
            local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
            if success then     
                TriggerServerEvent("inventory:server:OpenInventory", "stash", data.lockername, {
                    maxweight = currentLocker.capacity,
                    slots = currentLocker.slots,
                    })
                TriggerEvent("inventory:client:SetCurrentStash", data.lockername)
                TriggerServerEvent("QBCore:Server:RemoveItem", "police_stormram", 1)
                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["police_stormram"], "remove")
                QBCore.Functions.Notify("U ARE GOD!", "success")
            else
                TriggerServerEvent("QBCore:Server:RemoveItem", "police_stormram", 1)
                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["police_stormram"], "remove")
                TriggerServerEvent('hud:server:GainStress', math.random(5, 10))
                QBCore.Functions.Notify("Fuck U!", "error")
            end
        else
            QBCore.Functions.Notify("You don't have a Stormram on you..", "error")
        end
    end, 'police_stormram' )
end)

RegisterNetEvent('qb-storagelockers:client:purchase') --trigger event after nh-context purchase button. Set password which then starts the buying process
AddEventHandler('qb-storagelockers:client:purchase', function()
    --add the money check here instead
    TriggerEvent("qb-storagelockers:buystorage")
    QBCore.Functions.Notify("Please set a password")
end)

RegisterNetEvent('qb-storagelockers:client:openLocker') --trigger event after nh-context open locker button. Opens the password UI for the locker
AddEventHandler('qb-storagelockers:client:openLocker', function()
    TriggerEvent("qb-storagelockers:openStorage")
end)