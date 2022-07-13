local ApartmentObjects = {}
local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function CreateApartmentId(type)
    local UniqueFound = false
	local AparmentId = nil

	while not UniqueFound do
		AparmentId = tostring(math.random(1, 9999))
        local result = MySQL.query.await('SELECT COUNT(*) as count FROM apartments WHERE name = ?', { tostring(type .. AparmentId) })
        if result[1].count == 0 then
            UniqueFound = true
        end
	end
	return AparmentId
end

local function GetApartmentInfo(apartmentId)
    local retval = nil
    local result = MySQL.query.await('SELECT * FROM apartments WHERE name = ?', { apartmentId })
    if result[1] ~= nil then
        retval = result[1]
    end
    return retval
end

QBCore.Functions.CreateCallback('apartments:PoliceApartment', function(source, cb, cid)
    local result = MySQL.query.await('SELECT * FROM apartments WHERE citizenid = ?', { cid })
    return cb(result[1])
end)

-- Events

RegisterNetEvent('qb-apartments:server:SetInsideMeta', function(house, insideId, bool, isVisiting)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local insideMeta = Player.PlayerData.metadata["inside"]

    if bool then
        local routeId = insideId:gsub("[^%-%d]", "")
        if not isVisiting then
            insideMeta.apartment.apartmentType = house
            insideMeta.apartment.apartmentId = insideId
            insideMeta.house = nil
            Player.Functions.SetMetaData("inside", insideMeta)
        end
        QBCore.Functions.SetPlayerBucket(src, tonumber(routeId))
    else
        insideMeta.apartment.apartmentType = nil
        insideMeta.apartment.apartmentId = nil
        insideMeta.house = nil


        Player.Functions.SetMetaData("inside", insideMeta)
        QBCore.Functions.SetPlayerBucket(src, 0)
    end
end)

RegisterNetEvent('qb-apartments:returnBucket', function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
end)

RegisterNetEvent('apartments:server:CreateApartment', function(type, label, bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local num = CreateApartmentId(type)

    MySQL.query('SELECT * FROM apartments WHERE citizenid = @citizenid', {
        ['@citizenid'] = Player.PlayerData.citizenid,
    }, function(result)
        if result[1] ~= nil then
            TriggerClientEvent("apartments:client:SpawnInApartment", src, result[1].name, result[1].type)
        else
            local apartmentId = tostring(type .. num)
            local label = tostring(label .. " " .. num)
            MySQL.query('INSERT INTO apartments (name, type, label, citizenid) VALUES (?, ?, ?, ?)', {
                apartmentId,
                type,
                label,
                Player.PlayerData.citizenid
            })
            TriggerClientEvent('QBCore:Notify', src, 'You have new apartment.')
            TriggerClientEvent("apartments:client:SpawnInApartment", src, apartmentId, type)
            TriggerClientEvent("apartments:client:SetHomeBlip", src, type)
            print("Starter Items Added.")
            GiveStarterItems(src)

        end
    end)
end)

function GiveStarterItems(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for _, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        end
        Player.Functions.AddItem(v.item, v.amount, false, info)
    end
end

RegisterNetEvent('apartments:server:UpdateApartment', function(type, label)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    MySQL.query('UPDATE apartments SET type = ?, label = ? WHERE citizenid = ?', { type, label, Player.PlayerData.citizenid })
    TriggerClientEvent('QBCore:Notify', src, "Your apartment is upgraded")
    TriggerClientEvent("apartments:client:SetHomeBlip", src, type)
end)

RegisterNetEvent('apartments:server:RingDoor', function(apartmentId, apartment)
    local src = source
    if ApartmentObjects[apartment].apartments[apartmentId] ~= nil and next(ApartmentObjects[apartment].apartments[apartmentId].players) ~= nil then
        for k, v in pairs(ApartmentObjects[apartment].apartments[apartmentId].players) do
            TriggerClientEvent('apartments:client:RingDoor', k, src)
        end
    end
end)

RegisterNetEvent('apartments:server:OpenDoor', function(target, apartmentId, apartment)
    local OtherPlayer = QBCore.Functions.GetPlayer(target)
    if OtherPlayer ~= nil then
        TriggerClientEvent('apartments:client:SpawnInApartment', OtherPlayer.PlayerData.source, apartmentId, apartment)
    end
end)

RegisterNetEvent('apartments:server:AddObject', function(apartmentId, apartment, offset)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if ApartmentObjects[apartment] ~= nil and ApartmentObjects[apartment].apartments ~= nil and ApartmentObjects[apartment].apartments[apartmentId] ~= nil then
        ApartmentObjects[apartment].apartments[apartmentId].players[src] = Player.PlayerData.citizenid
    else
        if ApartmentObjects[apartment] ~= nil and ApartmentObjects[apartment].apartments ~= nil then
            ApartmentObjects[apartment].apartments[apartmentId] = {}
            ApartmentObjects[apartment].apartments[apartmentId].offset = offset
            ApartmentObjects[apartment].apartments[apartmentId].players = {}
            ApartmentObjects[apartment].apartments[apartmentId].players[src] = Player.PlayerData.citizenid
        else
            ApartmentObjects[apartment] = {}
            ApartmentObjects[apartment].apartments = {}
            ApartmentObjects[apartment].apartments[apartmentId] = {}
            ApartmentObjects[apartment].apartments[apartmentId].offset = offset
            ApartmentObjects[apartment].apartments[apartmentId].players = {}
            ApartmentObjects[apartment].apartments[apartmentId].players[src] = Player.PlayerData.citizenid
        end
    end
end)

RegisterNetEvent('apartments:server:RemoveObject', function(apartmentId, apartment)
    local src = source
    if ApartmentObjects[apartment].apartments[apartmentId].players ~= nil then
        ApartmentObjects[apartment].apartments[apartmentId].players[src] = nil
        if next(ApartmentObjects[apartment].apartments[apartmentId].players) == nil then
            ApartmentObjects[apartment].apartments[apartmentId] = nil
        end
    end
end)

-- Callbacks

QBCore.Functions.CreateCallback('apartments:GetAvailableApartments', function(source, cb, apartment)
    local apartments = {}
    if ApartmentObjects ~= nil and ApartmentObjects[apartment] ~= nil and ApartmentObjects[apartment].apartments ~= nil then
        for k, v in pairs(ApartmentObjects[apartment].apartments) do
            if (ApartmentObjects[apartment].apartments[k] ~= nil and next(ApartmentObjects[apartment].apartments[k].players) ~= nil) then
                local apartmentInfo = GetApartmentInfo(k)
                apartments[k] = apartmentInfo.label
            end
        end
    end
    cb(apartments)
end)

QBCore.Functions.CreateCallback('apartments:GetApartmentOffset', function(source, cb, apartmentId)
    local retval = 0
    if ApartmentObjects ~= nil then
        for k, v in pairs(ApartmentObjects) do
            if (ApartmentObjects[k].apartments[apartmentId] ~= nil and tonumber(ApartmentObjects[k].apartments[apartmentId].offset) ~= 0) then
                retval = tonumber(ApartmentObjects[k].apartments[apartmentId].offset)
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('apartments:GetApartmentOffsetNewOffset', function(source, cb, apartment)
    local retval = Apartments.SpawnOffset
    if ApartmentObjects ~= nil and ApartmentObjects[apartment] ~= nil and ApartmentObjects[apartment].apartments ~= nil then
        for k, v in pairs(ApartmentObjects[apartment].apartments) do
            if (ApartmentObjects[apartment].apartments[k] ~= nil) then
                retval = ApartmentObjects[apartment].apartments[k].offset + Apartments.SpawnOffset
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('apartments:GetOwnedApartment', function(source, cb, cid)
    if cid ~= nil then
        local result = MySQL.query.await('SELECT * FROM apartments WHERE citizenid = ?', { cid })
        if result[1] ~= nil then
            return cb(result[1])
        end
        return cb(nil)
    else
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local result = MySQL.query.await('SELECT * FROM apartments WHERE citizenid = ?', { Player.PlayerData.citizenid })
        if result[1] ~= nil then
            return cb(result[1])
        end
        return cb(nil)
    end
end)

QBCore.Functions.CreateCallback('apartments:IsOwner', function(source, cb, apartment)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then
        MySQL.query('SELECT type FROM apartments WHERE citizenid = ?', { Player.PlayerData.citizenid }, function(result)
            if result[1] ~= nil then
                if result[1].type == apartment then
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end)
    end
end)

RegisterNetEvent("openpresent")
AddEventHandler("openpresent", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('lockpick', 2)
    Player.Functions.AddItem('phone', 1) 
    Player.Functions.AddItem('water_bottle', 5)
    Player.Functions.AddItem('sandwich', 5)
    Player.Functions.AddItem('id_card', 1)
    Player.Functions.AddItem('driver_license', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lockpick'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['phone'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['water_bottle'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sandwich'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['id_card'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['driver_license'] , "add")
    TriggerClientEvent('QBCore:Notify', src, "Present Opened, Check your inventory!", "primary", 3500)
end)

QBCore.Functions.CreateUseableItem('present', function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerEvent("openpresent", src, item.name)
    end
end)