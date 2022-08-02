PlayerData = nil
local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetCoreObject', function(obj) QBCore = obj end)
		Citizen.Wait(200)
	end

	while QBCore.Functions.GetPlayerData() == nil do
		Wait(0)
	end

	while QBCore.Functions.GetPlayerData().job == nil do
		Wait(0)
	end

	PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(JobInfo)
	PlayerData.job = JobInfo
end)

local sellItemsSet = false
local sellPrice = 0
local sellHardwareItemsSet = false
local sellHardwarePrice = 0

CreateThread(function()
    local blip = AddBlipForCoord(-776.9136, -596.8099, 30.275985);
    SetBlipSprite(blip, 490);
    SetBlipDisplay(blip, 4);
    SetBlipScale(blip, 0.6);
    SetBlipColour(blip, 28);
    SetBlipAsShortRange(blip, true);
    BeginTextCommandSetBlipName("STRING");
    AddTextComponentString('Pawn Shop');
    EndTextCommandSetBlipName(blip);

    while true do
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed)
        local letSleep = true
        
        if PlayerData and PlayerData.job.name == 'pawn' then
			local boss = Config.Locations['boss']
		
            if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, boss.x, boss.y, boss.z, true) < 10) and PlayerData.job.isboss then
                letSleep = false
                DrawMarker(2, boss.x, boss.y, boss.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, boss.x, boss.y, boss.z, true) < 1.5) then
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("qb-bossmenu:server:openMenu")
                    end
                end  
            end
			
            end
            if letSleep then
            Wait(2500)
        end

        Wait(1)
	end
end)

local ped;

RegisterNetEvent("qb-pawnshop:sellGoods", function()
    local plyPed = PlayerPedId()
    TriggerEvent('animations:client:EmoteCommandStart', {"id"})
    QBCore.Functions.Progressbar("pawnshop:sellGoods", "Selling Goods", 5000, false, true, {}, {}, {}, {}, function()
        ClearPedTasks(plyPed)
        TriggerServerEvent("qb-pawnshop:sellGoods")
    end, function()
        ClearPedTasks(plyPed)
        QBCore.Functions.Notify("Canceled.", "error")
    end)
end)

RegisterNetEvent('qb-pawnshop:shop', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Pawnshop", Config.Items)
end);

exports['qb-target']:AddBoxZone("BossMENu", vector3(-786.4273, -615.7285, 29.868223), 1, 0.45, {
    name = "BossMENu",
    heading = 11.0,
    debugPoly = false,
    minZ = 27.868223,
    maxZ = 30.868223,
}, {
    options = {{
        ['icon'] = "care.svg",
        ['label'] = "Sell Goods",
        ['event'] = "qb-pawnshop:sellGoods",
    },
    {
        ['size'] = 0.8,
        ['icon'] = "repair.svg",
        ['label'] = "Purchase Goods",
        ['event'] = "qb-pawnshop:shop"
    }},
    job = {"pawnshop"},
}, {
    animation = 'clipboard'
});

function BuildInteract()
    ped = exports['qb-target']:CreateInteractivePed(`cs_jimmyboston`, vector3(-786.0122, -616.0579, 30.027109), {
        options = {{
            ['icon'] = "care.svg",
            ['label'] = "Sell Goods",
            ['event'] = "qb-pawnshop:sellGoods",
        },
        {
            ['size'] = 0.8,
            ['icon'] = "repair.svg",
            ['label'] = "Purchase Goods",
            ['event'] = "qb-pawnshop:shop"
        }},
        job = {"pawnshop"},
    }, {
        animation = 'clipboard'
    });
end

RegisterCommand("focus", function()
    SetNuiFocus(false, false);
    SetNuiFocusKeepInput(false);
end)

CreateThread(BuildInteract);
RegisterNetEvent("qb-interact:init", BuildInteract);

AddEventHandler("onClientResourceStop", function(r)
    if (r == "qb-pawnshop") then
        DeleteEntity(ped);
    end
end);

function DrawText3D(x, y, z, text)
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
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 68)
    ClearDrawOrigin()
end

