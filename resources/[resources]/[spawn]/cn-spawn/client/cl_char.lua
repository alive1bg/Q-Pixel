QBCore = exports['qb-core']:GetCoreObject()
playerload = false

PlayerData = {}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
	-- playerload = true
	PlayerData = QBCore.Functions.GetPlayerData()
end)

function Login.CreatePlayerCharacterPeds(characterModelData, isReset)
    if Login.actionsBlocked and not isReset then return end
    Login.actionsBlocked = true
    if not isReset then
        Wait(1000)
        Login.LoadFinished = false
        Login.ClearSpawnedPeds()
        CleanUpArea()
        Wait(1000)
        CleanUpArea()

        while Login.isTrainMoving do
            Wait(10)
        end

        while Login.HasTransistionFinished do
            Wait(10)
        end
    end

    if characterModelData ~= nil then
        Login.CurrentClothing = characterModelData
    end
    QBCore.Functions.TriggerCallback("cn-spawn:fetchPlayerCharacters", function(data) 
        if data.err then
            return
        end

        local pedCoords = GetEntityCoords(PlayerPedId())
        
        if isReset then
            Login.ClearSpawnedPeds()
        end
        Login.CreatedPeds = {}
        local PlusOneEmpty = false
		
        local noCharacters = true
		
        for _=1,#Login.spawnLoc do
            local isCustom = false
            local character = nil
            local cid = 0

            local cModelHash = GetHashKey("np_m_character_select")
            if data[_] ~= nil then 
                character = data[_]

                local sex = `mp_male`

                if character.sex == 1 then
                    cModelHash = GetHashKey("mp_f_freemode_01")
                    sex = `mp_female`
                else
                    cModelHash = GetHashKey("mp_m_freemode_01")
                    
                end
                cid = character.cid
                if characterModelData ~= nil then
                    if characterModelData[cid] ~= nil then cModelHash = tonumber(characterModelData[cid].model) end
                end
				noCharacters = false
            else
                if math.random(2) == 1 then
                    cModelHash = GetHashKey("np_f_character_select")
                end
            end
            
            if character == nil and not PlusOneEmpty then
                PlusOneEmpty = _
            end

            Login.RequestModel(cModelHash, function(loaded, model, modelHash)
                if loaded then

                    local newPed = nil 
                    
                    if character ~= nil then
                        newPed = CreatePed(3, modelHash,Login.spawnLoc[_].x, Login.spawnLoc[_].y, Login.spawnLoc[_].z, 0.72, false, false)
                        
                    else
                        if PlusOneEmpty == _ then 
                            newPed = CreatePed(3, modelHash,Login.spawnLoc[_].x, Login.spawnLoc[_].y, Login.spawnLoc[_].z, 0.72, false, false)
                        end
                    end
                    
                    
                    
                    if newPed == nil then
                        goto skip_to_next
                    end

                    SetEntityHeading(newPed, Login.spawnLoc[_].w)
                    if characterModelData ~= nil then
                        if character ~= nil and characterModelData[cid] ~= nil and characterModelData[cid] ~= {} and not isCustom then
                            Login.LoadPed(newPed, characterModelData[cid], modelHash)
                        end
                    end

                    if not isCustom then
                        if modelHash == GetHashKey("np_f_character_select") or modelHash == GetHashKey("np_m_character_select") then
                            if character ~= nil then
                                SetEntityAlpha(newPed,200,false)
                            else
                                SetEntityAlpha(newPed,0.9,false)
                            end
                        end
                    end

                    TaskLookAtCoord(newPed, vector3(-3968.05, 2015.41, 502.3 ),-1, 0, 2)
                    FreezeEntityPosition(newPed, true)
                    SetEntityInvincible(newPed, true)
                    SetBlockingOfNonTemporaryEvents(newPed, true)

                    Login.currentProtected[newPed] = true

                    if character ~= nil then
                        Login.CreatedPeds[_] = {
                            pedObject = newPed,
                            charId = cid,
                            posId = _
                        }
                    else
                        Login.CreatedPeds[_] = {
                            pedObject = newPed,
                            charId = 0,
                            posId = _
                        }
                    end

                    ::skip_to_next::
                end
            end)
        end


        Wait(600)
        SetNuiFocus(true, true)
        SendNUIMessage({
            open = true,
           chars = data
        })
		
		--If no characters, open Creation menu
        if noCharacters then
            SendNUIMessage({ firstOpen = true })
        end
    end, nil)

    Login.actionsBlocked = false
end

RegisterNetEvent("login:CreatePlayerCharacterPeds", Login.CreatePlayerCharacterPeds)

function Login.getCharacters(isReset)    
    if not isReset then
        TransitionFromBlurred(500)
        QBCore.Functions.TriggerCallback("cn-spawn:loginPlayer", function(data) 
            if type(data) == "table" and data.err then
                return
            end
        end, nil)
    end

    QBCore.Functions.TriggerCallback("cn-spawn:fetchPlayerCharacters", function(data) 
        if data.err then
            print("Found error in getting player Char")
            return
        end

        local charIds = {}
        local cit = nil
        for k,v in ipairs(data) do
            charIds[#charIds + 1] = v.cid
            cit = v.citizenid
        end
        
        TriggerServerEvent("login:getCharModels", charIds, isReset, cit)
    end, nil)
end

function Login.SelectedChar(data)
	Login.ClearSpawnedPeds()
	TriggerEvent("character:PlayerSelectedCharacter")
    QBCore.Functions.TriggerCallback("cn-spawn:selectCharacter", function(returnData) 
        if not returnData.loggedin or not returnData.chardata then sendMessage({err = {err = true, msg = "There was a problem logging in as that character, if the problem persists, contact an administrator <br/> Cid: " .. tostring(data.selectcharacter)}}) return end

        playerload = true
        while playerload == false do
            Wait(100)
        end

        if Login.CurrentClothing[data.actionData] == nil then
        	Login.setClothingForChar()
        else
            deleteTrain()
            TriggerEvent("QBCore:firstSpawn")
	    end
    end, data.actionData)
end

function Login.setClothingForChar()
    Login.actionsBlocked = true

    SendNUIMessage({
      close = true
    })
    SetEntityVisible(PlayerPedId(), true)

    SetEntityCoords(PlayerPedId(),-3963.54,2013.95, 499.92)
    SetEntityHeading(PlayerPedId(),64.71)

    SetGameplayCamRelativeHeading(180.0)
    SetGameplayCamRelativePitch(1.0, 1.0)

    Wait(800)

    for i=1,25 do
      local posoffset = GetCamCoord(LoginSafe.Cam)
      local setpos = VecLerp(posoffset.x,posoffset.y,posoffset.z, -3965.88,2014.55, 501.6, i/30, true)
      SetCamCoord(LoginSafe.Cam, setpos)
      Wait(15)
    end

    Login.Open = false

    local sex = Login.secilensex

    if sex ~= 0 then
        SetSkin(GetHashKey("mp_f_freemode_01"), true)
    else
        SetSkin(GetHashKey("mp_m_freemode_01"), true)
    end

    TriggerEvent("raid_clothes:openClothing")
    TriggerEvent("raid_clothes:inSpawn", true)

    SetEntityHeading(PlayerPedId(),64.71)

    SetGameplayCamRelativeHeading(180.0)

    SetGameplayCamRelativePitch(4.0, 1.0)
end

RegisterNetEvent("cn-spawn:finishedClothing", function(endType)
    print(endType, 'endtype')
    local playerped = PlayerPedId()
    local playerCoords = GetEntityCoords(playerped)
    local pos = vector3(-3965.88,2014.55, 501.6)
    local distance = #(playerCoords - pos)
    TriggerEvent("raid_clothes:inSpawn", false)

    if distance <= 10 then
        SetEntityVisible(PlayerPedId(), false)
        FreezeEntityPosition(PlayerPedId(), false)
    	if endType == "Finished" then
            DoScreenFadeOut(2)
            -- TriggerServerEvent("apartments:server:CreateApartment", 'apartment1', 'Alta Street')
    		spawnChar()
    	else
    		backToMenu()
    	end
    end	
end)

function backToMenu()
    Login.actionsBlocked = false
	SetCamActive(LoginSafe.Cam, true)
	RenderScriptCams(true, false, 0, true, true)
	Login.nativeStart(true)
end

function spawnChar()
    Login.actionsBlocked = false
    deleteTrain()
    playerload = true
    while playerload == false do
        Wait(100)
    end
    SetEntityVisible(PlayerPedId(), true)
    TriggerEvent("QBCore:firstSpawn")
    SendNUIMessage({
        default = true
    })

    Login.Selected = false
    Login.CurrentPedInfo = nil
    Login.CurrentPed = nil
    Login.CreatedPeds = {}
end

RegisterNetEvent("character:finishedLoadingChar", function()
    Login.characterLoaded()
end)