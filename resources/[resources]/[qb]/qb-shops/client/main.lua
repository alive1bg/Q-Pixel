local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function SetupItems(shop)
    local products = Config.Locations[shop].products
    local playerJob = QBCore.Functions.GetPlayerData().job.name
    local items = {}
    for i = 1, #products do
        if not products[i].requiredJob then
            items[#items+1] = products[i]
        else
            for i2 = 1, #products[i].requiredJob do
                if playerJob == products[i].requiredJob[i2] then
                    items[#items+1] = products[i]
                end
            end
        end
    end
    return items
end

local function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Events

RegisterNetEvent('qb-shops:client:UpdateShop', function(shop, itemData, amount)
    TriggerServerEvent('qb-shops:server:UpdateShopItems', shop, itemData, amount)
end)

RegisterNetEvent('qb-shops:client:SetShopItems', function(shop, shopProducts)
    Config.Locations[shop]["products"] = shopProducts
end)

RegisterNetEvent('qb-shops:client:RestockShopItems', function(shop, amount)
    if Config.Locations[shop]["products"] ~= nil then
        for k, v in pairs(Config.Locations[shop]["products"]) do
            Config.Locations[shop]["products"][k].amount = Config.Locations[shop]["products"][k].amount + amount
        end
    end
end)

local peds = {
    "mp_m_shopkeep_01",
    `s_m_y_construct_01`,
    `mp_m_weapexp_01`,
    `S_M_M_StrVend_01`
}

exports['qb-target']:AddTargetModel(peds, {
    options = {
        {
            event = "qb-shops:marketshop",
            icon = "fas fa-shopping-bag",
            label = "Shop",
        },
    },
    distance = 3.0
})

local hunting = {
    `ig_hunter`
}

exports['qb-target']:AddTargetModel(hunting, {
    options = {
        {
            event = "qb-shops:huntingshop",
            icon = "fas fa-bullseye",
            label = "Hunting Shop",
        },
    },
    distance = 3.0
})

-- Threads
RegisterNetEvent('qb-shops:marketshop', function()
    local InRange = false
    local PlayerPed = PlayerPedId()
    local PlayerPos = GetEntityCoords(PlayerPed)

    for shop, _ in pairs(Config.Locations) do
        local position = Config.Locations[shop]["coords"]
        local products = Config.Locations[shop].products
        for _, loc in pairs(position) do
            local dist = #(PlayerPos - vector3(loc["x"], loc["y"], loc["z"]))
            if dist < 3 then
                InRange = true
                local ShopItems = {}
                ShopItems.items = {}
                QBCore.Functions.TriggerCallback("qb-shops:server:getLicenseStatus", function(hasLicense, licenseItem)
                    ShopItems.label = Config.Locations[shop]["label"]
                    if Config.Locations[shop].products == Config.Products["weapons"] then
                        if hasLicense and licenseItem then
                            ShopItems.items = SetupItems(shop)
                            QBCore.Functions.Notify(Lang:t("success.dealer_verify"), "success")
                            Wait(500)
                        else
                            for i = 1, #products do
                                if not products[i].requiredJob then
                                    if not products[i].requiresLicense then
                                        ShopItems.items[#ShopItems.items+1] = products[i]
                                    end
                                else
                                    for i2 = 1, #products[i].requiredJob do
                                        if QBCore.Functions.GetPlayerData().job.name == products[i].requiredJob[i2] and not products[i].requiresLicense then
                                            ShopItems.items[#ShopItems.items+1] = products[i]
                                        end
                                    end
                                end
                            end
                            QBCore.Functions.Notify(Lang:t("error.dealer_decline"), "error")
                            Wait(500)
                            QBCore.Functions.Notify(Lang:t("error.talk_cop"), "error")
                            Wait(1000)
                        end
                    else
                        ShopItems.items = SetupItems(shop)
                    end
                    for k, v in pairs(ShopItems.items) do
                        ShopItems.items[k].slot = k
                    end
                    ShopItems.slots = 30
                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_"..shop, ShopItems)
                end)
            end
        end
    end

    if not InRange then
        Wait(5000)
    end
    Wait(5)
end)

RegisterNetEvent('qb-shops:huntingshop', function()
    local InRange = false
    local PlayerPed = PlayerPedId()
    local PlayerPos = GetEntityCoords(PlayerPed)

    for shop, _ in pairs(Config.Locations) do
        local position = Config.Locations[shop]["coords"]
        local products = Config.Locations[shop].products
        for _, loc in pairs(position) do
            local dist = #(PlayerPos - vector3(loc["x"], loc["y"], loc["z"]))
            if dist < 3 then
                InRange = true
                local ShopItems = {}
                ShopItems.items = {}
                QBCore.Functions.TriggerCallback("qb-shops:server:getLicenseHuntingStatus", function(hasLicense, licenseItem)
                    ShopItems.label = Config.Locations[shop]["label"]
                    if Config.Locations[shop].products == Config.Products["huntingshop"] then
                        if hasLicense and licenseItem then
                            ShopItems.items = SetupItems(shop)
                            QBCore.Functions.Notify(Lang:t("success.dealer_verify"), "success")
                            Wait(500)
                        else
                            for i = 1, #products do
                                if not products[i].requiredJob then
                                    if not products[i].requiresLicense then
                                        ShopItems.items[#ShopItems.items+1] = products[i]
                                    end
                                else
                                    for i2 = 1, #products[i].requiredJob do
                                        if QBCore.Functions.GetPlayerData().job.name == products[i].requiredJob[i2] and not products[i].requiresLicense then
                                            ShopItems.items[#ShopItems.items+1] = products[i]
                                        end
                                    end
                                end
                            end
                            QBCore.Functions.Notify(Lang:t("error.dealer_decline"), "error")
                            Wait(500)
                            QBCore.Functions.Notify(Lang:t("error.talk_cop"), "error")
                            Wait(1000)
                        end
                    else
                        ShopItems.items = SetupItems(shop)
                    end
                    for k, v in pairs(ShopItems.items) do
                        ShopItems.items[k].slot = k
                    end
                    ShopItems.slots = 30
                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_"..shop, ShopItems)
                end)
            end
        end
    end

    if not InRange then
        Wait(5000)
    end
    Wait(5)
end)

-- Threads

CreateThread(function()
    for store, _ in pairs(Config.Locations) do
        if Config.Locations[store]["showblip"] then
            for i = 1, #Config.Locations[store]["coords"] do
                StoreBlip = AddBlipForCoord(Config.Locations[store]["coords"][i]["x"], Config.Locations[store]["coords"][i]["y"], Config.Locations[store]["coords"][i]["z"])
                SetBlipColour(StoreBlip, 25)
                SetBlipSprite(StoreBlip, Config.Locations[store]["blipsprite"])
                SetBlipScale(StoreBlip, 0.6)
                SetBlipDisplay(StoreBlip, 4)
                SetBlipAsShortRange(StoreBlip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(Config.Locations[store]["label"])
                EndTextCommandSetBlipName(StoreBlip)
            end
        end
    end
end)


local blips = {
    -- Title is the displayed name on the map
    -- color MUST have the 'u' in it
    -- ALL coords MUST include 2 decimal places
    -- 'id' is the sprite ID found here -> https://wiki.gtanet.work/index.php?title=Blips , https://docs.fivem.net/docs/game-references/blips/
  
   {title = "24/7 Supermarket", colour=25, id=52, x = 25.7, y = -1347.3, z = 29.49}, --done
   {title = "24/7 Supermarket", colour=25, id=52, x = -3038.71, y = 585.9, z = 7.9},--done
   {title = "24/7 Supermarket", colour=25, id=52, x = -3241.47, y = 1001.14, z = 12.83},--done
   {title = "24/7 Supermarket", colour=25, id=52, x = 1728.66, y = 6414.16, z = 35.03},--done
   {title = "24/7 Supermarket", colour=25, id=52, x = 1697.99, y = 4924.4, z = 42.06},--done
   {title = "24/7 Supermarket", colour=25, id=52, x = 1961.48, y = 3739.96, z = 32.34},--done
   {title = "24/7 Supermarket", colour=25, id=52, x = 547.79, y = 2671.79, z = 42.15},--done
   {title = "24/7 Supermarket", colour=25, id=52, x = 2679.25, y = 3280.12, z = 55.24},--done
   {title = "24/7 Supermarket", colour=25, id=52, x = 2557.94, y = 382.05, z = 108.62},--done
   {title = "24/7 Supermarket", colour=25, id=52, x = 373.55, y = 325.56, z = 103.56}, -- done
   {title = "LTD Gasoline", colour=25, id=52, x = -48.44, y = -1757.86, z = 29.42},-- done
   {title = "LTD Gasoline", colour=25, id=52, x = -707.41, y = -912.83, z = 19.21},-- done
   {title = "LTD Gasoline", colour=25, id=52, x = -1820.33, y = 792.66, z = 138.1},-- done
   {title = "LTD Gasoline", colour=25, id=52, x = 1163.7, y = -323.92, z = 69.2}, -- done
   {title = "Robs Liquor", colour=25, id=52, x = -1222.77, y = -907.19, z = 12.32}, -- done
   {title = "Robs Liquor", colour=25, id=52, x = -1487.7, y = -378.53, z = 40.16},-- done 
   {title = "Robs Liquor", colour=25, id=52, x = -2967.79, y = 391.64, z = 15.04}, -- done 
   {title = "Robs Liquor", colour=25, id=52, x = 1165.28, y = 2709.4, z = 38.15}, -- done 
   {title = "Robs Liquor", colour=25, id=52, x = 1135.66, y = -982.76, z = 46.41}, -- done 
   {title = "Hardware Store", colour=46, id=566, x = 45.55, y = -1749.01, z = 29.6},-- done 
   {title = "Hardware Store", colour=46, id=566, x = 2747.8, y = 3472.86, z = 55.67},-- done 
   {title = "Hardware Store", colour=46, id=566, x = -421.84, y = 6136.09, z = 31.78},-- done
   {title = "Ammunation",   colour=46, id=110, x = -662.1, y = -935.3, z = 21.8},-- done
   {title = "Ammunation",   colour=46, id=110, x = 810.2, y = -2157.3, z = 29.6},-- done
   {title = "Ammunation",   colour=46, id=110, x = 1693.4, y = 3759.5, z = 34.7},-- done
   {title = "Ammunation",   colour=46, id=110, x = -330.2, y = 6083.8, z = 31.4},-- done
   {title = "Ammunation",   colour=46, id=110, x = 252.3, y = -50.0, z = 69.9},-- done
   {title = "Ammunation",   colour=46, id=110, x = 22.0, y = -1107.2, z = 29.8},-- done
   {title = "Ammunation",   colour=46, id=110, x = 2567.6, y = 294.3, z = 108.7},-- done
   {title = "Ammunation",   colour=46, id=110, x = -1117.5, y = 2698.6, z = 18.5},-- done
   {title = "Ammunation",   colour=46, id=110, x = 842.4, y = -1033.4, z = 28.1},-- done
   {title = "Diamond Casino",  colour=0, id=617, x = 948.3834, y = 34.21247, z = 71.839},-- done
   {title = "Smoke On The Water",  colour=25, id=140, x = -1172.43, y = -1572.24, z = 4.66},-- done
   {title = "Gear Shop",  colour=25, id=176, x = -1686.9, y = -1072.23, z = 13.15},-- done
   {title = "Leisure Shop", colour=25, id=52, x = -1505.91, y = 1511.78, z = 115.29},-- done
   {title = "Robs Liquor", colour=25, id=52, x = -159.36, y = 6321.59, z = 31.58},
   {title = "24/7 Supermarket", colour=25, id=52, x = 161.41, y = 6640.78, z = 31.69},
   

}

  
CreateThread(function()
  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.7)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)