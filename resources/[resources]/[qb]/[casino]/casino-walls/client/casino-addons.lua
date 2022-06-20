local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-casino:client:openCasinoShop', function()
    local ShopItems = {}
    ShopItems.label = "Diamond Casino Shop"
    ShopItems.items = Config.CasinoShop
    ShopItems.slots = #Config.CasinoShop 
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end)

RegisterNetEvent('doj:casinoChipMenu', function()
    TriggerEvent('drawtextui:HideUI')
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Chip Exchange",
            isMenuHeader = true,
        },
        {
            header = "Sell All White Casino Chips", 
            txt = "Current Value: $"..Config.whiteChipPrice.." per chip",
            params = {
                event = "qb-casino:server:WhiteSell",
                isServer = true,
            }
        },
        {
            header = "Sell All Green Casino Chips", 
            txt = "Current Value: $"..Config.greenChipPrice.." per chip",
            params = {
                event = "qb-casino:server:GreenSell",
                isServer = true,
            }
        },
        {
            header = "Sell All Red Casino Chips", 
            txt = "Current Value: $"..Config.redChipPrice.." per chip",
            params = {
                event = "qb-casino:server:RedSell",
                isServer = true,
            }
        },
        {
            header = "Sell All Blue Casino Chips", 
            txt = "Current Value: $"..Config.blueChipPrice.." per chip",
            params = {
                event = "qb-casino:server:BlueSell", 
                isServer = true,
            }
        },
        {
            header = "Sell All Black Casino Chips", 
            txt = "Current Value: $"..Config.blackChipPrice.." per chip",
            params = {
                event = "qb-casino:server:BlackSell",
                isServer = true,
            }
        },
        {
            header = "Sell All Gold Casino Chips", 
            txt = "Current Value: $"..Config.goldChipPrice.." per chip",
            params = {
                
                event = "qb-casino:server:GoldSell",
                isServer = true,
            }
        },
        {
            header = "< Return",
			txt = "",
			params = {
                event = "doj:casinoMainMenu"
            }
        },
    })
end)

CreateThread(function()
    local CasinoShop = CircleZone:Create(vector3(989.35, 31.8, 71.47), 2.0, {
        name="CasinoShop",
        heading=160,
        debugPoly=false,
        useZ=true,
    })
    CasinoShop:onPlayerInOut(function(isPointInside)
        if isPointInside then
            if Config.CasinoEmployeePrompt == 'walk-up' then 
                TriggerEvent('doj:casinoMenuHeader') 
            elseif Config.CasinoEmployeePrompt == 'peek' then
                text = '<b>Diamond Casino Exchange</b>'
                exports['textUi']:DrawTextUi('show', text)
                exports['qb-target']:AddTargetModel('U_F_M_CasinoCash_01', {
                    options = {
                        { 
                            event = "doj:casinoMainMenu",
                            icon = "fab fa-speakap",
                            label = "Speak with Casino Employee", 
                        },
                    },
                    distance = 3.0 
                })
            end
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
end)

RegisterNetEvent('doj:casinoMenuHeader', function()
    exports['qb-menu']:showHeader({
        {
            header = "Diamond Casino Shop",
            isMenuHeader = true,
        },
        {
            header = "Chip Exchange", 
            txt = "See current prices",
            params = {
                event = "doj:casinoChipMenu",
            }
        },
        {
            header = "Browse Shop", 
            txt = "See what we have to offer",
            params = {
                event = "qb-casino:client:openCasinoShop",
            }
        },
        {
            header = "Cancel",
			txt = "",
			params = {
                event = "doj:casinoMenuHeader"
            }
        },
    })
end)

RegisterNetEvent('doj:casinoMainMenu', function()
    exports['textUi']:HideTextUi('hide')
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino",
            isMenuHeader = true,
        },
        {
            header = "Chip Exchange", 
            txt = "See current prices",
            params = {
                event = "doj:casinoChipMenu",
            }
        },
        {
            header = "Browse Shop", 
            txt = "See what we have to offer",
            params = {
                event = "qb-casino:client:openCasinoShop",
            }
        },
        {
            header = "Cancel",
			txt = "",
			params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent('casino:client:safestash', function()
TriggerServerEvent("inventory:server:OpenInventory", "stash", "casinostash_"..QBCore.Functions.GetPlayerData().citizenid)
TriggerEvent("inventory:client:SetCurrentStash", "casinostash_"..QBCore.Functions.GetPlayerData().citizenid)
end)



exports['qb-target']:AddBoxZone("casinogeneralsafestorage", vector3(989.39, 30.18, 71.47), 0.5, 0.5, {       
	name="casinogeneralsafestorage",
	heading=-53,
	debugPoly=false,
	minZ=71.17,
	maxZ=71.57
    }, {
        options = {
            {
                type = "client",
                event = "casino:client:safestash",
                icon = "fa fa-circle",
                label = "Storage",
                job = "casino"
            },
        },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("casinogeneralsafestorage2", vector3(991.49, 32.71, 71.47), 0.5, 0.5, {       
    name="casinogeneralsafestorage2",
    heading=-53,
    debugPoly=false,
    minZ=71.17,
    maxZ=71.57
    }, {
        options = {
            {
                type = "client",
                event = "casino:client:safestash",
                icon = "fa fa-circle",
                label = "Storage",
                job = "casino"
            },
        },
    distance = 2.5
})

function showDiamondsOnScreenBaby()
    Citizen.CreateThread(function()
      local propNames = {"vw_vwint01_video_overlay", "gbz_casino_video_overlay"}
      for _, propName in pairs(propNames) do
        Citizen.CreateThread(function()
          local model = GetHashKey(propName)
          local timeout = 21085 -- 5000 / 255
          local casinoScreenStr = propName == "vw_vwint01_video_overlay" and "CasinoScreen_01" or "CasinoScreen_02"
          local handle = CreateNamedRenderTargetForModel(casinoScreenStr, model)
          --print(model, propName, casinoScreenStr, handle)
          RegisterScriptWithAudio(0)
          SetTvChannel(-1)
          SetTvVolume(0)
          SetScriptGfxDrawOrder(4)
          SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
          SetTvChannel(2)
          EnableMovieSubtitles(1)
  
          function doAlpha()
            Citizen.SetTimeout(timeout, function()
              SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
              SetTvChannel(2)
              if inCasino then
                doAlpha()
              end
            end)
          end
          doAlpha()
  
          Citizen.CreateThread(function()
            while inCasino do
              SetTextRenderId(handle)
              DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
              SetTextRenderId(GetDefaultScriptRendertargetRenderId())
              Citizen.Wait(0)
            end
            SetTvChannel(-1)
            ReleaseNamedRendertarget(GetHashKey(casinoScreenStr))
            SetTextRenderId(GetDefaultScriptRendertargetRenderId())
          end)
        end)
      end
    end)
  end
  
  function showDiamondsOnInsideTrackScreenBaby()
    Citizen.CreateThread(function()
      local model = GetHashKey("vw_vwint01_betting_screen")
      local timeout = 21085 -- 5000 / 255
  
      local handle = CreateNamedRenderTargetForModel("CasinoScreen_02", model)
  
      RegisterScriptWithAudio(0)
      SetTvChannel(-1)
      SetTvVolume(0)
      SetScriptGfxDrawOrder(4)
      SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
      SetTvChannel(2)
      EnableMovieSubtitles(1)
  
      function doAlpha()
        Citizen.SetTimeout(timeout, function()
          SetTvChannelPlaylist(2, "CASINO_DIA_PL", 0)
          SetTvChannel(2)
          if inCasino then
            doAlpha()
          end
        end)
      end
      doAlpha()
  
      Citizen.CreateThread(function()
        while inCasino do
          SetTextRenderId(handle)
          DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
          SetTextRenderId(GetDefaultScriptRendertargetRenderId())
          Citizen.Wait(0)
        end
        SetTvChannel(-1)
        ReleaseNamedRendertarget(GetHashKey("CasinoScreen_02"))
        SetTextRenderId(GetDefaultScriptRendertargetRenderId())
      end)
    end)
  end
  
  function playSomeBackgroundAudioBaby()
    CreateThread(function()
      local function audioBanks()
        while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_GENERAL", false, -1) do
          Wait(0)
        end
        while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_01", false, -1) do
          Wait(0)
        end
        while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_02", false, -1) do
          Wait(0)
        end
        while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_03", false, -1) do
          Wait(0)
        end
        --while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_INTERIOR_STEMS", false, -1) do
        --  print('load 5')
        --  Wait(0)
        --end
      end
      audioBanks()
      if IsStreamPlaying() then
        StopStream()
      end
      if IsAudioSceneActive("DLC_VW_Casino_General") then
        StopAudioScene("DLC_VW_Casino_General")
      end
      ReleaseScriptAudioBank("DLC_VINEWOOD/CASINO_GENERAL")
      ReleaseScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_01")
      ReleaseScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_02")
      ReleaseScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_03")
    end)
  end