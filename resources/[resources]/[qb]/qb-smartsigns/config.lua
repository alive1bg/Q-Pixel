-- For any help configuring this resource, ask in #support in our Discord Server: https://discord.gg/AtPt9ND
-- Documentation: https://docs.londonstudios.net/#document-6

-- We'd like to thank you for purchasing this resource, we hope you enjoy using it!

config = {
    main = {
        -- Here you are able to define how far the sign will load in from.
        -- If the player has loaded in the sign and goes out of this range the sign will unload on their client.
        loadInDistance = 300.0,

        -- Here you are able to define how close the player must be to the signs keypad in order to edit the text.
        -- 3.0 is the ideal value for "arms reach"
        accessPointDistance = 3.0,
        
        -- Here is the prop for the sign. 
        -- You can change this if you wish but we recommend leaving this unless you are highly experienced.
        signModelName = `prop_led_trafficsign`,
        
        -- This is the text that appears when you are changing the message. You could use this to translate to another language.
        instructionalText = "Press [E] to adjust sign",
    
        -- Here you can change which button must be pressed to change the text on the sign
        -- A list of controls can be found on the official FiveM documentation @ https://docs.fivem.net/docs/game-references/controls/
        adjustButton = {0, 103}, -- {control group, control}
        
        -- This will change whether users can use /newsign to get the coordinates and rotation for configuring new signs
        -- This will also enable debug printing on both the client and the server. This should be set to false most of the time.
        developerMode = false,
        
        -- Here you can define a list of words which cannot be placed on signs.
        -- These are automatically removed and replaced with blank text
        bannedWords = {
            "fuck",
            "shit",
        },

        -- Enable this to use Ace Permissions.
        -- This requires you to give groups or individual users the permission set below
        -- If you want to add further Ace Permission integration, edit sv_smartsigns.lua
        acePermissions = {
            enable = false,
            permission = "update.sign"
        },

        -- We've added vRP integration. All you need to do is enable it below
        -- Then, configure if you wish to check for groups or permissions, or even both
        -- If you want to add further vRP integration, edit sv_smartsigns.lua
        -- This is not tested with vRP, however we've followed their documentation
        vRP = {
            enabled = false,
            checkGroup = {
                enabled = true, -- Enable this to use vRP group check
                groups = {"police", "emergency", "admin"}, -- A user can have any of the following groups, meaning you can add different jobs
            },
            checkPermission = {
                enabled = false, -- Enable this to use vRP permission check
                permissions = {"police.menu", "player.kick"} -- A user can have any of the following permissions, allowing you to add multiple
            },
        },

        -- We've added ESX integration. All you need to do is enable it below
        -- Then, configure which jobs you want to check for
        -- If you want to add further ESX integration, edit sv_smartsigns.lua
        -- This is not tested with ESX, however we've followed their documentation
        ESX = {
            enabled = false,
            checkJob = {
                enabled = true, -- Enable this to use ESX job check
                jobs = {"police"} -- A user can have any of the following jobs, allowing you to add multiple
            }
        },
        
        -- Enable this if you do not wish to use permissions, eg, your server is whitelisted
        -- If you enable vRP, ESX or Ace Permissions above, this will be automatically set to false
        disablePermissions = true,
        
        -- Here is the animations which are played when entering text for a sign.
        -- It is unlikely that this will need to be changed but you can disable the animation if you wish to do so.
        -- Find the animation list here: https://alexguirre.github.io/animations-list/
        animation = {
            enabled = true,
            dict = "anim@heists@prison_heiststation@cop_reactions", -- This is the animation dictionary (these show in bold on the animation list)
            name = "cop_b_idle", -- This is the animation name (these show below bold dictionaries on the animation list)
        },

        -- This allows you to enable Discord logging for the signs
        -- You must add your webhook in sv_motorways.lua (not in the config, as this is client sided)
        logging = {
            enabled = true,
            displayName = "Smart Signs",
            colour = 31487,
            title = "**New Sign Log**",
            icon = "https://i.imgur.com/o7oAPb8.png",
            footerIcon = "https://i.imgur.com/n3n7JNW.png",
            dateFormat = "%d-%m-%Y %H:%M:%S", -- Day-Month-Year Hour-Minute-Second

            bannedWordLogs = {
                enabled = true,
                colour = 16711680,
            }
        },

        soundEffect = {
            enabled = true,
            name = "CONFIRM_BEEP",
            dict = "HUD_MINI_GAME_SOUNDSET",
        },
        
        -- This allows you to move the position of every sign to a certain offSet, such as 1m down, if you feel they are all too high for example
        signOffset = {0.0, 0.0, 0.0}, -- x, y, z
    },

    -- Here you can define the various locations of the signs around the map.
    -- We have defined 15 for you already, however you may add and remove as you feel suitable.
    -- The signs should be configured as below:
    -- sign = {vector3(x, y, z), rotation(degrees)}
    signs = {
        {
            sign = {vector3(-1968.6062011719, -471.55065917969, 10.877113342285), 48.999973297119}, -- Del Perro Fwy
            defaultText = {
                "ACCIDENT AHEAD", "WATCH YOUR", "SPEED"
            },
        },
        {
            sign = {vector3(866.47338867188, 133.4723815918, 70.606071472168), 325.0}, -- Los Santos Freeway
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2122.1013183594, 6032.8041992188, 49.430641174316), 233.99981689453}, -- Senora Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(1620.9342041016, 1113.6678466797, 81.301879882812), 167.99987792969}, -- Los Santos Freeway
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(1954.310546875, 2504.4406738281, 53.584655761719), 325.0}, -- Senora Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(554.32385253906, -372.91738891602, 32.319610595703), 334.0}, -- Los Santos Freeway
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(579.90002441406, -337.38436889648, 34.788860321045), 155.99952697754}, -- Los Santos Freeway
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2047.1314697266, 2610.9548339844, 52.215137481689), 132.99990844727}, -- Senora Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2339.5219726562, 2984.6748046875, 47.098838806152), 244.9998626709}, -- Route 68
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2008.4978027344, 2654.697265625, 45.748458862305), 128.99978637695}, -- Route 68
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2732.5581054688, 3272.4865722656, 54.463748931885), 155.99963378906}, -- Senora Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2883.6391601562, 3632.1889648438, 51.68860244751), 346.0}, -- Senora Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-90.220024108887, -723.75708007812, 43.291240692139), 253.99955749512}, -- San Andreas Ave
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2749.1611328125, 4588.5546875, 44.192741394043), 15.999979972839}, -- Senora Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2638.2607421875, 5033.2670898438, 43.566692352295), 199.99961853027}, -- Senora Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-743.38311767578, -513.70532226562, 23.990354537964), 89.999885559082}, -- Del Perro Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-445.06665039062, -513.64306640625, 24.123254776001), 269.99969482422}, -- Del Perro Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-202.76458740234, -1796.4968261719, 28.668190002441), 121.99969482422}, -- Davis Ave
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(80.516258239746, -2040.5129394531, 17.51057434082), 269.99969482422}, -- Dutch London St
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-89.696464538574, -2069.5490722656, 22.992635726929), 111.99980926514}, -- Dutch London St
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(712.80285644531, -3035.7331542969, 5.2128005027771), 173.9995880127}, -- Buccaneer Way
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-374.07006835938, -1681.8887939453, 17.811515808105), 151.99964904785}, -- Alta St
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-1698.9853515625, 1.4262487888336, 63.809642791748), 229.99975585938}, -- North Rockford Dr
            defaultText = {
                "", "", ""
            }
        }, -- 
        {
            sign = {vector3(-2111.8276367188, -218.60554504394, 18.170526504517), 320.0}, -- West Eclipse Blvd
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-1844.5789794922, -256.49917602539, 39.563083648682), 29.999988555908}, -- West Eclipse Blvd
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-532.85943603516, -328.93719482422, 34.165554046631), 211.99952697754}, -- Rockford Dr
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-1652.5061035156, 4844.5493164062, 59.772548675537), 135.99967956543}, -- Great Ocean Hwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-291.83135986328, 6085.4931640625, 30.222248077393), 316.0}, -- Great Ocean Hwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2449.9318847656, 5665.7778320312, 43.858947753906), 21.999988555908}, -- Senora Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2193.4782714844, 3788.7846679688, 32.301906585693), 123.99975585938}, -- East Joshua Road
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-1136.9641113281, -1330.9791259766, 4.2735800743103), 117.99978637695}, -- Palomino Ave
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(805.07867431641, 3539.2102050781, 32.926376342773), 275.99969482422}, -- Joshua Rd
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-1536.2546386719, -797.89880371094, 12.373041152954), 247.99951171875}, -- Equality Way
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(478.05953979492, 6562.0322265625, 25.804773330688), 83.999900817871}, -- Great Ocean Hwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-1996.6799316406, 4522.1782226562, 55.693145751953), 316.0}, -- Great Ocean Hwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-2658.6875, 2630.6862792969, 15.674699783325), 352.0}, -- Great Ocean Hwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(-2611.9904785156, 2321.2104492188, 27.157592773438), 291.99981689453}, -- Route 68
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(737.38366699219, -621.54895019531, 35.010707855225), 245.99948120117}, -- Del Perro Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(1295.5040283203, -2194.890625, 49.005409240723), 29.999982833862}, -- Elysian Fields Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(1101.7208251953, -2571.8439941406, 31.132476806641), 103.99983978271}, -- Elysian Fields Fwy
            defaultText = {
                "CAUTION", "HEAVY RAIN", "UNSAFE ROADS"
            }
        },
        {
            sign = {vector3(1754.2171630859, 1851.4086914062, 73.947532653809), 175.99952697754}, -- Los Santos Freeway
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2564.4213867188, 533.00158691406, 107.48042297363), 191.99955749512}, -- Palomino Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(2246.009765625, -467.8371887207, 89.202377319336), 137.99969482422}, -- Palomino Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(916.69879150391, -749.38604736328, 39.112194061279), 39.999977111816}, -- Del Perro Fwy
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(1697.7863769531, 1448.1340332031, 84.270927429199), 0.0}, -- Los Santos Freeway
            defaultText = {
                "", "", ""
            }
        },
        {
            sign = {vector3(732.18511962891, -2749.4631347656, 5.3980503082275), 4.0000095367432}, -- Buccaneer Way
            defaultText = {
                "", "", ""
            }
        },

        
    },
    
    -- You can add your own letters below
    -- This allows you to retexture them into your own language
    letterModels = {
        ["a"] = `prop_font_a`,
        ["b"] = `prop_font_b`,
        ["c"] = `prop_font_c`,
        ["d"] = `prop_font_d`,
        ["e"] = `prop_font_e`,
        ["f"] = `prop_font_f`,
        ["g"] = `prop_font_g`,
        ["h"] = `prop_font_h`,
        ["i"] = `prop_font_i`,
        ["j"] = `prop_font_j`,
        ["k"] = `prop_font_k`,
        ["l"] = `prop_font_l`,
        ["m"] = `prop_font_m`,
        ["n"] = `prop_font_n`,
        ["o"] = `prop_font_o`,
        ["p"] = `prop_font_p`,
        ["q"] = `prop_font_q`,
        ["r"] = `prop_font_r`,
        ["s"] = `prop_font_s`,
        ["t"] = `prop_font_t`,
        ["u"] = `prop_font_u`,
        ["v"] = `prop_font_v`,
        ["w"] = `prop_font_w`,
        ["x"] = `prop_font_x`,
        ["y"] = `prop_font_y`,
        ["z"] = `prop_font_z`,
        ["0"] = `prop_font_0`,
        ["1"] = `prop_font_1`,
        ["2"] = `prop_font_2`,
        ["3"] = `prop_font_3`,
        ["4"] = `prop_font_4`,
        ["5"] = `prop_font_5`,
        ["6"] = `prop_font_6`,
        ["7"] = `prop_font_7`,
        ["8"] = `prop_font_8`,
        ["9"] = `prop_font_9`,
    },

    -- Here are the offsets for the placement of the letter objects
    -- We highly recommend not editing this section unless you know what you are doing
    -- Configuration of this section requires absolute precision
    letterPositions = {
        rotation = {0.0, 0.0, 0.0},
        mainLevel = {
            {0.6, -0.7, 9.1},
            {1.1, -0.7, 9.1},
            {1.6, -0.7, 9.1},
            {2.1, -0.7, 9.1},
            {2.6, -0.7, 9.1},
            {3.1, -0.7, 9.1},
            {3.6, -0.7, 9.1},
            {4.1, -0.7, 9.1},
            {4.6, -0.7, 9.1},
            {5.1, -0.7, 9.1},
            {5.6, -0.7, 9.1},
            {6.1, -0.7, 9.1},
            {6.6, -0.7, 9.1},
            {7.1, -0.7, 9.1},
        },
        levelOffset = 0.6,
    },
}
