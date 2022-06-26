CreateThread(function()
    -- CONNECT VR HELMET
    exports['qb-target']:AddBoxZone("VAREnter1", vector3(-211.32, -301.29, 74.49), 0.5, 0.5, {
        name = "VAREnter1",
        heading = 117.36,
        debugPoly = false,
        minZ = 74.40,
        maxZ = 74.45,
        }, {
            options = { 
            {
                action = function()
                    ToggleVarConnect(1)
                end,
                icon = 'fas fa-user-secret',
                label = 'Connect To VAR Docket (Master)',
                canInteract = function()
                    return not Config.Docks[1]
                end
            },
            {
                action = function()
                    ToggleVarConnect(1)
                end,
                icon = 'fas fa-user-secret',
                label = 'Disconnect from VAR Docket',
                canInteract = function()
                    if Config.Docks[1] and connected then return true end
                    return false
                end
            },
            {
                type = 'server',
                event = 'qb-varheist:server:StartVar',
                icon = 'fas fa-hourglass-start',
                label = 'Start VAR',
                canInteract = function()
                    if Config.Docks[1] and connected then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VAREnter2", vector3(-212.73, -298.03, 74.49), 0.6, 0.6, {
        name = "VAREnter2",
        heading = 117.37,
        debugPoly = false,
        minZ = 74.40,
        maxZ = 74.55,
        }, {
            options = { 
            {
                action = function()
                    ToggleVarConnect(2)
                end,
                icon = 'fas fa-user-secret',
                label = 'Connect To VAR Docket',
                canInteract = function()
                    return not Config.Docks[2]
                end
            },
            {
                action = function()
                    ToggleVarConnect(2)
                end,
                icon = 'fas fa-user-secret',
                label = 'Disconnect from VAR Docket',
                canInteract = function()
                    if Config.Docks[2] and connected then return true end
                    return false
                end
            }            
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VAREnter3", vector3(-210.79, -292.66, 74.49), 0.5, 0.5, {
        name = "VAREnter3",
        heading = 117.28,
        debugPoly = false,
        minZ = 74.40,
        maxZ = 75.15,
        }, {
            options = { 
            {
                action = function()
                    ToggleVarConnect(3)
                end,
                icon = 'fas fa-user-secret',
                label = 'Connect To VAR Docket',
                canInteract = function()
                    return not Config.Docks[3]
                end
            },
            {
                action = function()
                    ToggleVarConnect(3)
                end,
                icon = 'fas fa-user-secret',
                label = 'Disconnect from VAR Docket',
                canInteract = function()
                    if Config.Docks[3] and connected then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VAREnter4", vector3(-209.37, -293.21, 74.49), 0.5, 0.5, {
        name = "VAREnter4",
        heading = 45.28,
        debugPoly = false,
        minZ = 74.40,
        maxZ = 74.45,
        }, {
            options = { 
            {
                action = function()
                    ToggleVarConnect(4)
                end,
                icon = 'fas fa-user-secret',
                label = 'Connect To VAR Docket',
                canInteract = function()
                    return not Config.Docks[4]
                end
            },
            {
                action = function()
                    ToggleVarConnect(4)
                end,
                icon = 'fas fa-user-secret',
                label = 'Disconnect from VAR Docket',
                canInteract = function()
                    if Config.Docks[4] and connected then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VAREnter5", vector3(-207.1, -294.06, 74.49), 0.5, 0.5, {
        name = "VAREnter5",
        heading = 45.28,
        debugPoly = false,
        minZ = 74.40,
        maxZ = 74.45,
        }, {
            options = { 
            {
                action = function()
                    ToggleVarConnect(5)
                end,
                icon = 'fas fa-user-secret',
                label = 'Connect To VAR Docket',
                canInteract = function()
                    return not Config.Docks[5]
                end
            },
            {
                action = function()
                    ToggleVarConnect(5)
                end,
                icon = 'fas fa-user-secret',
                label = 'Disconnect from VAR Docket',
                canInteract = function()
                    if Config.Docks[5] and connected then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VAREnter6", vector3(-206.39, -297.3, 74.49), 0.5, 0.5, {
        name = "VAREnter6",
        heading = 117.28,
        debugPoly = false,
        minZ = 74.40,
        maxZ = 74.45,
        }, {
            options = { 
            {
                action = function()
                    ToggleVarConnect(6)
                end,
                icon = 'fas fa-user-secret',
                label = 'Connect To VAR Docket',
                canInteract = function()
                    return not Config.Docks[6]
                end
            },
            {
                action = function()
                    ToggleVarConnect(6)
                end,
                icon = 'fas fa-user-secret',
                label = 'Disconnect from VAR Docket',
                canInteract = function()
                    if Config.Docks[6] and connected then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    -- TOP COMPUTERS
    exports['qb-target']:AddBoxZone("VARComputer1", vector3(2168.15, 2925.87, -80.25), 0.5, 0.5, {
        name = "VARComputer1",
        heading = 24.95,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 1 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 1 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer2", vector3(2171.31, 2927.62, -80.25), 0.5, 0.5, {
        name = "VARComputer2",
        heading = 24.95,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 2 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 2 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer3", vector3(2174.77, 2927.59, -80.25), 0.5, 0.5, {
        name = "VARComputer3",
        heading = 328.00,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 3 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 3 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer4", vector3(2177.98, 2925.9, -80.25), 0.5, 0.5, {
        name = "VARComputer4",
        heading = 328.00,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 4 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 4 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer5", vector3(2179.62, 2922.76, -80.25), 0.5, 0.5, {
        name = "VARComputer5",
        heading = 272.00,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 5 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 5 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer6", vector3(2179.62, 2919.17, -80.25), 0.5, 0.5, {
        name = "VARComputer6",
        heading = 272.00,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 6 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 6 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer7", vector3(2177.99, 2916.27, -80.25), 0.5, 0.5, {
        name = "VARComputer7",
        heading = 215.00,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 7 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 7 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer8", vector3(2174.69, 2914.4, -80.25), 0.5, 0.5, {
        name = "VARComputer8",
        heading = 215.00,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 8 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 8 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer9", vector3(2171.22, 2914.42, -80.25), 0.5, 0.5, {
        name = "VARComputer9",
        heading = 150.00,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 9 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 9 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARComputer10", vector3(2168.09, 2916.35, -80.25), 0.5, 0.5, {
        name = "VARComputer10",
        heading = 150.00,
        debugPoly = false,
        minZ = -81.35,
        maxZ = -81.05,
        }, {
            options = { 
            {
                type = 'client',
                event = 'qb-varheist:client:StartHack',
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 10 and not Config.CurrentHack.hacked then return true end
                    return false
                end
            },
            {
                type = 'client',
                event = 'qb-varheist:client:EnterPassword',
                icon = 'fas fa-desktop',
                label = 'Enter Password',
                canInteract = function()
                    if Config.CurrentHack.id == 10 and Config.CurrentHack.hacked then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    -- VAR LOWER HACKS
    exports['qb-target']:AddBoxZone("VARLowerHack1", vector3(2185.71, 2928.69, -83.96), 0.5, 0.5, {
        name = "VARLowerHack1",
        heading = 275.75,
        debugPoly = false,
        minZ = -85.19,
        maxZ = -84.86,
        }, {
            options = { 
            {
                action = function()
                    LowerHack(1)
                end,
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 11 and Config.CurrentHack.password and not Config.LowerHacks[1].hacked and not Config.LowerHacks[1].busy then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARLowerHack2", vector3(2185.88, 2913.3, -83.96), 0.5, 0.5, {
        name = "VARLowerHack2",
        heading = 265.75,
        debugPoly = false,
        minZ = -85.19,
        maxZ = -84.86,
        }, {
            options = { 
            {
                action = function()
                    LowerHack(2)
                end,
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 11 and Config.CurrentHack.password and not Config.LowerHacks[2].hacked and not Config.LowerHacks[2].busy then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARLowerHack3", vector3(2150.04, 2913.24, -83.92), 0.5, 0.5, {
        name = "VARLowerHack3",
        heading = 275.75,
        debugPoly = false,
        minZ = -85.19,
        maxZ = -84.86,
        }, {
            options = { 
            {
                action = function()
                    LowerHack(3)
                end,
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 11 and Config.CurrentHack.password and not Config.LowerHacks[3].hacked and not Config.LowerHacks[3].busy then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
    exports['qb-target']:AddBoxZone("VARLowerHack4", vector3(2150.37, 2928.58, -83.96), 0.5, 0.5, {
        name = "VARLowerHack4",
        heading = 89.55,
        debugPoly = false,
        minZ = -85.19,
        maxZ = -84.86,
        }, {
            options = { 
            {
                action = function()
                    LowerHack(4)
                end,
                icon = 'fas fa-desktop',
                label = 'Read Computer Data',
                canInteract = function()
                    if Config.CurrentHack.id == 11 and Config.CurrentHack.password and not Config.LowerHacks[4].hacked and not Config.LowerHacks[4].busy then return true end
                    return false
                end
            }
        },
        distance = 1.5,
    })
end)