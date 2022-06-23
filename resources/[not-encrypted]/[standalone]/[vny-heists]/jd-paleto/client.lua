
local QBCore = exports['qb-core']:GetCoreObject()
local paraToplaAktif = false
local keypadCoords = vector3(-105.3, 6471.61, 31.63)
local activepolicenumber = 0

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    ResetBankDoors()
    isLoggedIn = true
end)

kapilar = {
    ["KasabaBanka"] = {
        ["termit-1"] = {
            x= -104.81, 
            y= 6473.65, 
            z= 31.95, 
            type = 1622278560, 
            lock = true
        },
    }
}

RegisterNetEvent('soygunbaslatma')
AddEventHandler('soygunbaslatma', function()
	local plyCoords = GetEntityCoords(PlayerPedId())
	local dist = GetDistanceBetweenCoords(plyCoords, -105.3, 6471.61, 31.63, true)
     if bankaKontrol("KasabaBanka") then
         if polisKontrol(activepolicenumber) then -- Polis kontrol
    		if dist < 2.0 then
			local ply = PlayerPedId()
  		  	ClearPedTasksImmediately(ply)
   		 	Wait(0)
   			TaskGoStraightToCoord(ply, -105.3, 6471.61, 31.63, 2.0, -1, 46.5)

 			local hackAnimDict = "anim@heists@ornate_bank@hack"

			RequestAnimDict(hackAnimDict)
			RequestModel("hei_prop_hst_laptop")
			RequestModel("hei_p_m_bag_var22_arm_s")
			RequestModel("hei_prop_heist_card_hack_02")
			while not HasAnimDictLoaded(hackAnimDict)
			or not HasModelLoaded("hei_prop_hst_laptop")
			or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
			or not HasModelLoaded("hei_prop_heist_card_hack_02") do
			Wait(0)
			end
			Wait(0)
			while GetIsTaskActive(ply, 35) do
			Wait(0)
			end
			ClearPedTasksImmediately(ply)
			Wait(0)
			SetEntityHeading(ply, 46.5) --bura
			Wait(0)
			TaskPlayAnimAdvanced(ply, hackAnimDict, "hack_enter", -105.3, 6471.61, 31.63, 0, 0, 0, 1.0, 0.0, 8300, 0, 0.3, false, false, false)
			Wait(0)
			SetEntityHeading(ply, 46.5) -- bura 
			while IsEntityPlayingAnim(ply, hackAnimDict, "hack_enter", 3) do
			Wait(0)
			end
			local laptop = CreateObject(`hei_prop_hst_laptop`, GetOffsetFromEntityInWorldCoords(ply, 0.2, 0.6, 0.0), 1, 1, 0)
			Wait(0)
			SetEntityRotation(laptop, GetEntityRotation(ply, 2), 2, true)
			PlaceObjectOnGroundProperly(laptop)
			Wait(0)
			TaskPlayAnim(ply, hackAnimDict, "hack_loop", 1.0, 0.0, -1, 1, 0, false, false, false)

			Wait(1000)
			DeleteObject(laptop)
			PaletoUsePanel()
			end
 		end
 	end
end)


function usePanel()
    local ply = PlayerPedId()

    local success = exports["minigame-fleeca"]:HackingFleeca(100000, 2)

    if not success then
        QBCore.Functions.Notify("Yapamadın.", "error")
        local hackAnimDict = "anim@heists@ornate_bank@hack"
        local laptop = CreateObject(`hei_prop_hst_laptop`, GetOffsetFromEntityInWorldCoords(ply, 0.2, 0.6, 0.0), 1, 1, 0)
        DeleteObject(laptop)
        ClearPedTasksImmediately(ply)    
        StopAnimTask(PlayerPedId(), hackAnimDict, "hack_loop", 1.0)
        return
        TriggerServerEvent("jd-paleto:itemsil", "bluelaptop")
    end
    local hackAnimDict = "anim@heists@ornate_bank@hack"
    local laptop = CreateObject(`hei_prop_hst_laptop`, GetOffsetFromEntityInWorldCoords(ply, 0.2, 0.6, 0.0), 1, 1, 0)
    DeleteObject(laptop)
    ClearPedTasksImmediately(ply)    
    StopAnimTask(PlayerPedId(), hackAnimDict, "hack_loop", 1.0)
    TriggerEvent('jd-BankaSoygunu:PolisBildirim', "Kasaba")
    TriggerServerEvent("jd-paleto:itemsil", "bluelaptop")
    TriggerServerEvent("server-update", "paleto", "Unavailable")
    TriggerServerEvent("jd-BankaSoygunu:set-cd-kasaba")
    SpawnTrolleys("KasabaBanka")
    QBCore.Functions.Notify("Wait.", "error")
    Wait(60000)
    QBCore.Functions.Notify("Open Door", "succes")
    paraToplaAktif = true
    TriggerServerEvent("jd-bankasoygunu:server:kapi-ac", "KasabaBanka", "termit-1")
end

function PaletoCanUsePanel()
    return #(GetEntityCoords(PlayerPedId()) - keypadCoords) < 1.0
end

function PaletoUsePanel(...)
    usePanel(...)
end

paraMasasi = {
    ["KasabaBanka"] = {
        ["left"] = { 
            ["pos"] = vector3(vector3(-102.967, 6477.433, 31.649)), 
            ["heading"] = 136.08,
            ["empty"] = true
        }
    }
}
function SpawnTrolleys(bank, tip)
	local bankTrolleys = paraMasasi[bank]
    local trolleyInfo = `hei_prop_hei_cash_trolly_01`
    if tip then
        TriggerServerEvent("jd-bankasoygunu:server:kapi-ac", bank, tip)
    end

    for trolley, values in pairs(bankTrolleys) do
        values["empty"] = false
		if not HasModelLoaded(trolleyInfo) then
			LoadModels({trolleyInfo})
		end
		local trolleyObject = CreateObject(trolleyInfo, values["pos"], true)
		SetEntityRotation(trolleyObject, 0.0, 0.0, values["heading"])
		PlaceObjectOnGroundProperly(trolleyObject)
        SetEntityAsMissionEntity(trolleyObject, true, true)

		SetModelAsNoLongerNeeded(trolleyInfo)
	end
end

RegisterNetEvent("jd-bankasoygunu:kapi-kilit")
AddEventHandler("jd-bankasoygunu:kapi-kilit", function(bank, door, lock)
    local kapi = kapilar[bank][door]
    kapi.lock = lock
    if door == "vualt-1" then
        OpenDoor(vector3(kapi.x, kapi.y, kapi.z), kapi.type)
		OpenPaletoDoor()
    end
end)
RegisterNetEvent("jd-paleto:kapilarkapansin")
AddEventHandler("jd-paleto:kapilarkapansin", function()
	local paletoObject = GetClosestObjectOfType(-105.61, 6472.03, 31.62, 5.0, -1185205679, false, false, false)
	SetEntityHeading(paletoObject, 45.45)
	paraToplaAktif = false
end)

function OpenDoor(coords, model)
	RequestScriptAudioBank("vault_door", false)
	while not HasAnimDictLoaded("anim@heists@fleeca_bank@bank_vault_door") do
		Wait(0)

		RequestAnimDict("anim@heists@fleeca_bank@bank_vault_door")
	end
	local doorInformation = coords
	local doorEntity = GetClosestObjectOfType(coords, 5.0, model, false)
	if not DoesEntityExist(doorEntity) then
		return
	end
	FreezeEntityPosition(doorEntity, false)
	PlaySoundFromCoord(-1, "vault_unlock", coords, "dlc_heist_fleeca_bank_door_sounds", 0, 0, 0)
	PlayEntityAnim(doorEntity, "bank_vault_door_opens", "anim@heists@fleeca_bank@bank_vault_door", 4.0, false, 1, 0, 0.0, 8)
	ForceEntityAiAndAnimationUpdate(doorEntity)
	Wait(5000)
	DeleteEntity(doorEntity)
	if IsEntityPlayingAnim(doorEntity, "anim@heists@fleeca_bank@bank_vault_door", "bank_vault_door_opens", 3) then
		if GetEntityAnimCurrentTime(doorEntity, "anim@heists@fleeca_bank@bank_vault_door", "bank_vault_door_opens") >= 1.0 then
			FreezeEntityPosition(doorEntity, true)
			StopEntityAnim(doorEntity, "bank_vault_door_opens", "anim@heists@fleeca_bank@bank_vault_door", -1000.0)
			SetEntityRotation(doorEntity, 0, 0, -80.0, 2, 1)
			ForceEntityAiAndAnimationUpdate(doorEntity)
			RemoveAnimDict("anim@heists@fleeca_bank@bank_vault_door")
		end
	end
end

rastgelePara = {
    ["BuyukBanka"] = math.random(200, 300),
    ["KasabaBanka"] = math.random(200, 300),
}

function GrabCash(bank, coords, masa)
	local ped = PlayerPedId()
    TriggerEvent("jd-bankasoygunu:ParaVerClient", rastgelePara[bank])
	local CashAppear = function()
		local pedCoords = GetEntityCoords(ped)
		local cashModel = `hei_prop_heist_cash_pile`
		LoadModels({cashModel})
		local cashPile = CreateObject(cashModel, pedCoords, true)
		FreezeEntityPosition(cashPile, true)
		SetEntityInvincible(cashPile, true)
		SetEntityNoCollisionEntity(cashPile, ped)
		SetEntityVisible(cashPile, false, false)
		AttachEntityToEntity(cashPile, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
		local startedGrabbing = GetGameTimer()   
		CreateThread(function()
			while GetGameTimer() - startedGrabbing < 37000 do
				Wait(0)
                
				DisableControlAction(0, 38, true)

				if HasAnimEventFired(ped, `CASH_APPEAR`) then
					if not IsEntityVisible(cashPile) then
						SetEntityVisible(cashPile, true, false)
					end
				end
		
				if HasAnimEventFired(ped, `RELEASE_CASH_DESTROY`) then
					if IsEntityVisible(cashPile) then
						SetEntityVisible(cashPile, false, false)					
					end
				end
			end
		
			DeleteObject(cashPile)
		end)
	end
	local trolleyObject = GetClosestObjectOfType(coords, 5.0, `hei_prop_hei_cash_trolly_01`, false)
	local emptyTrolley = `hei_prop_hei_cash_trolly_03`
	if IsEntityPlayingAnim(trolleyObject, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
		return
	end
	LoadModels({`hei_p_m_bag_var22_arm_s`,"anim@heists@ornate_bank@grab_cash",emptyTrolley})
	bag = CreateObject(`hei_p_m_bag_var22_arm_s`, GetEntityCoords(PlayerPedId()), true, false, false)
	scene = NetworkCreateSynchronisedScene(GetEntityCoords(trolleyObject), GetEntityRotation(trolleyObject), 2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(ped, scene, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene)
	Wait(1500)
	CashAppear()
	scene = NetworkCreateSynchronisedScene(GetEntityCoords(trolleyObject), GetEntityRotation(trolleyObject), 2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(ped, scene, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(trolleyObject, scene, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene)
	Wait(37000)
	scene = NetworkCreateSynchronisedScene(GetEntityCoords(trolleyObject), GetEntityRotation(trolleyObject), 2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(ped, scene, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene)
	local newTrolley = CreateObject(emptyTrolley, GetEntityCoords(trolleyObject) + vector3(0.0, 0.0, - 0.985), true)
	SetEntityRotation(newTrolley, GetEntityRotation(trolleyObject))
	while not NetworkHasControlOfEntity(trolleyObject) do
		Wait(0)

		NetworkRequestControlOfEntity(trolleyObject)
	end
	DeleteObject(trolleyObject)
	PlaceObjectOnGroundProperly(newTrolley)
	Wait(1900)
	DeleteObject(bag)
	RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
	SetModelAsNoLongerNeeded(emptyTrolley)
	SetModelAsNoLongerNeeded(`hei_p_m_bag_var22_arm_s`)
end

function LoadModels(models)
	for index, model in ipairs(models) do
		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)
	
				Wait(10)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)
	
				Wait(10)
			end    
		end
	end
end

RegisterNetEvent('jd-bankasoygunu:ParaVerClient')
AddEventHandler('jd-bankasoygunu:ParaVerClient', function(money)
	count = 0
	repeat
		
		Wait(900)
		count = count  + 1
	until count == 41
	TriggerServerEvent("jd-BankaSoygunu:ParaVerServer", money)
end)

hack = false
kasabaBankaKonum = vector3(-108.08, 6467.08, 31.63)
islem = false
CreateThread(function()
    while true do
        if #(kasabaBankaKonum - GetEntityCoords(PlayerPedId())) < 50 then
            for kapi, data in pairs(kapilar["KasabaBanka"]) do
                local door = GetClosestObjectOfType(data.x, data.y, data.z, 1.0, data.type, false, false, false)
                FreezeEntityPosition(door, data.lock)
            end
        end
        Wait(1000)
    end
end)

CreateThread(function()
	while true do
		local time = 1000
			local playerPed = PlayerPedId()
			local pos = GetEntityCoords(playerPed, true)
			if paraToplaAktif and not islem then
				exports["qb-target"]:AddBoxZone("paletograb", vector3(-102.967, 6477.433, 31.649), 0.4, 0.6, {
					name="paletograb",
					debugpoly = false,
					useZ=true
					}, {
						options = {
							{
								event = "jd-paletoqbtargetevent",
								icon = "fas fa-hand-holding",
								label = "Grab It!",
							},
						},
						job = {"all"},
						distance = 1.5
					}
				)
			end
		Wait(time)
	end
end)

AddEventHandler("jd-paletoqbtargetevent", function ()
	Wait(1)
	for trolley, values in pairs(paraMasasi["KasabaBanka"]) do
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		if #(values["pos"] - pos) < 2 and not values["empty"]then
			values["empty"] = true
			GrabCash("KasabaBanka", values["pos"])
		end
	end
end)

function ResetBankDoors()
    if not paraToplaAktif then
        local paletoObject = GetClosestObjectOfType(-105.61, 6472.03, 31.62, 5.0, -1185205679, false, false, false)
        SetEntityHeading(paletoObject, 130.45)
	end
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
	Kapiserver()
end)

AddEventHandler('kapilarresetle', function()
    ResetBankDoors()
	TriggerServerEvent("server-update", "paleto", "Available")
end)

function Kapiserver()
	TriggerServerEvent("jd-paleto:serverkapi")
end

function OpenPaletoDoor()
    --TriggerServerEvent('qb-doorlock:server:updateState', 4, false, false, false, true, false, false)
    local object = GetClosestObjectOfType(-105.61, 6472.03, 31.62, 5.0, -1185205679, false, false, false)
    if object ~= 0 then
        SetEntityHeading(object, 45.45)
    end
end

function polisKontrol(gerekenPolis)
    local durum = nil
    QBCore.Functions.TriggerCallback('jd-base:polis-sayi', function(OnlinePolis)
        if OnlinePolis >= gerekenPolis then
            durum = true
        else
            QBCore.Functions.Notify('Not Enough Police Are Active!', 'error')
            durum = false
        end
    end)

    while durum == nil do Wait(10) end
    return durum
end

function bankaKontrol(bank, num)
    local durum = nil
    QBCore.Functions.TriggerCallback('jd-banka-soygunu:banka-kontrol', function(status)
        if status then
            QBCore.Functions.Notify('This Bank Has Already Been Robbed!', 'error')
            durum = false
        else
            durum = true
        end
    end, bank, num)

    while durum == nil do Wait(10) end
    return durum
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local PaletoDist = #(pos - vector3(-105.61, 6472.03, 31.62))
        if PaletoDist < 15 then
            if paraToplaAktif then
                TriggerServerEvent('qb-doorlock:server:updateState', 4, false, false, false, true, false, false)
                    local object = GetClosestObjectOfType(-105.61, 6472.03, 31.62, 5.0, -1185205679, false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, 130.45)
                end
            else
                TriggerServerEvent('qb-doorlock:server:updateState', 4, true, false, false, true, false, false)
                    local object = GetClosestObjectOfType(-105.61, 6472.03, 31.62, 5.0, -1185205679, false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, 45.45)
                end
            end
        end
        Wait(1000)
    end
end)
