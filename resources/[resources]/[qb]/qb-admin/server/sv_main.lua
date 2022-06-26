QBCore = exports['qb-core']:GetCoreObject()
SpectateData = {}

-- [ Code ] --

function tablelength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

-- [ Callbacks ] --

QBCore.Functions.CreateCallback('qb-admin/server/get-permission', function(source, Cb)
    local Group = QBCore.Functions.GetPermission(source)
    Cb(Group)
end)

QBCore.Functions.CreateCallback('qb-admin/server/get-active-players-in-radius', function(Source, Cb, Coords, Radius)
	local Coords, Radius = Coords ~= nil and vector3(Coords.x, Coords.y, Coords.z) or GetEntityCoords(GetPlayerPed(Source)), Radius ~= nil and Radius or 5.0
    local ActivePlayers = {}
	for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local TargetCoords = GetEntityCoords(GetPlayerPed(v))
        local TargetDistance = #(TargetCoords - Coords)
        if TargetDistance <= Radius then
            ActivePlayers[#ActivePlayers + 1] = {
                ['ServerId'] = v,
                ['Name'] = GetPlayerName(v)
            }
        end
	end
	Cb(ActivePlayers)
end)

QBCore.Functions.CreateCallback('qb-admin/server/get-bans', function(source, Cb)
    local BanList = {}
    local BansData = MySQL.Sync.fetchAll('SELECT * FROM bans', {})
    if BansData and BansData[1] ~= nil then
        for k, v in pairs(BansData) do
            local TPlayer = GetPlayerFromLicense(v.license)
            if TPlayer ~= nil then
                BanList[#BanList + 1] = {
                    Text = v.name.." ("..v.banid..")",
                    BanId = v.banid,
                    Source = TPlayer.Source,
                    Name = v.name,
                    Reason = v.reason,
                    Expires = os.date('*t', tonumber(v.expire)),
                    BannedOn = os.date('*t', tonumber(v.bannedon)),
                    BannedOnN = v.bannedon,
                    BannedBy = v.bannedby,
                    License = v.license,
                    Discord = v.discord,
                }
            end
        end
    end
    Cb(BanList)
end)

QBCore.Functions.CreateCallback('qb-admin/server/get-logs', function(source, Cb)
    local LogsList = {}
    local LogsData = MySQL.query.await('SELECT * FROM logs', {})
    if LogsData and LogsData[1] ~= nil then
        for k, v in pairs(LogsData) do
            LogsList[#LogsList + 1] = {
                Type = v.Type ~= nil and v.Type or Lang:t('logs.no_type'),
                Steam = v.Steam ~= nil and v.Steam  or Lang:t('logs.no_desc'),
                Desc = v.Log ~= nil and v.Log or Lang:t('logs.no_Desc'),
                Date = v.Date ~= nil and v.Date or Lang:t('logs.no_date'),
                Cid = v.Cid ~= nil and v.Cid or Lang:t('logs.no_cid'),
                Data = v.Data ~= nil and v.Data or Lang:t('logs.no_data'),
            }
        end
    end
    Cb(LogsList)
end)
 
QBCore.Functions.CreateCallback('qb-admin/server/get-players', function(source, Cb)
    local PlayerList = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        PlayerList[#PlayerList + 1] = {
            ServerId = v,
            Name = GetPlayerName(v),
            Steam = QBCore.Functions.GetIdentifier(v, "steam"),
            License = QBCore.Functions.GetIdentifier(v, "license")
        }
    end
    Cb(PlayerList)
end)

QBCore.Functions.CreateCallback('qb-admin/server/get-player-data', function(source, Cb, LicenseData)
    local PlayerInfo = {}
    for license, _ in pairs(LicenseData) do
        local TPlayer = GetPlayerFromLicense(license)
        if TPlayer ~= nil then
            PlayerInfo = {
                Name = TPlayer.PlayerData.name,
                Steam = QBCore.Functions.GetIdentifier(TPlayer.PlayerData.source, "steam"),
                CharName = TPlayer.PlayerData.charinfo.firstname..' '..TPlayer.PlayerData.charinfo.lastname,
                Source = TPlayer.PlayerData.source,
                CitizenId = TPlayer.PlayerData.citizenid
            }
        end
        Cb(PlayerInfo)
    end
end)

QBCore.Functions.CreateCallback('qb-admin/server/get-date-difference', function(source, Cb, Bans, Type)
    local FilteredBans, BanAmount = GetDateDifference(Type, Bans) 
    Cb(FilteredBans, BanAmount)
end)

QBCore.Functions.CreateCallback("qb-admin/server/create-log", function(source, Cb, Type, Log, Data)
    if Type == nil or Log == nil then return end

    local Player = QBCore.Functions.GetPlayer(source)
    local Steam = QBCore.Functions.GetIdentifier(source, "steam")
    if Player ~= nil then
        MySQL.insert('INSERT INTO logs (Type, Steam, Log, Cid, Data) VALUES (?, ?, ?, ?, ?)', {
            Type,
            Steam,
            Log,
            Player.PlayerData.citizenid ~= nil and Player.PlayerData.citizenid or "Not found",
            Data,
        })
    end
end)

-- [ Events ] --

RegisterNetEvent("qb-admin/server/try-open-menu", function(KeyPress)
    local src = source
    if not AdminCheck(src) then return end
    
    TriggerClientEvent('qb-admin/client/try-open-menu', src, KeyPress)
end)

-- User Actions

RegisterNetEvent("qb-admin/server/unban-player", function(BanId)
    local src = source
    if not AdminCheck(src) then return end

    local BanData = MySQL.query.await('SELECT * FROM bans WHERE banid = ?', {BanId})
    if BanData and BanData[1] ~= nil then
        MySQL.query('DELETE FROM bans WHERE banid = ?', {BanId})
        TriggerClientEvent('QBCore:Notify', src, Lang:t('bans.unbanned'), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('bans.not_banned'), 'error')
    end
end)

RegisterNetEvent("qb-admin/server/ban-player", function(ServerId, Expires, Reason)
    local src = source
    if not AdminCheck(src) then return end

    local License = QBCore.Functions.GetIdentifier(ServerId, 'license')
    local BanData = MySQL.query.await('SELECT * FROM bans WHERE license = ?', {License})
    if BanData and BanData[1] ~= nil then
        for k, v in pairs(BanData) do
            TriggerClientEvent('QBCore:Notify', src, Lang:t('bans.already_banned', {player = GetPlayerName(ServerId), reason = v.reason}), 'error')
        end
    else
        local Expiring, ExpireDate = GetBanTime(Expires)
        local Time = os.time()
        local BanId = "BAN-"..math.random(11111, 99999)
        MySQL.insert('INSERT INTO bans (banid, name, license, discord, ip, reason, bannedby, expire, bannedon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            BanId,
            GetPlayerName(ServerId),
            License,
            QBCore.Functions.GetIdentifier(ServerId, 'discord'),
            QBCore.Functions.GetIdentifier(ServerId, 'ip'),
            Reason,
            GetPlayerName(src),
            ExpireDate,
            Time,
        })
        TriggerClientEvent('QBCore:Notify', src, Lang:t('bans.success_banned', {player = GetPlayerName(ServerId), reason = Reason}), 'success')
        local ExpireHours = tonumber(Expiring['hour']) < 10 and "0"..Expiring['hour'] or Expiring['hour']
        local ExpireMinutes = tonumber(Expiring['min']) < 10 and "0"..Expiring['min'] or Expiring['min']
        local ExpiringDate = Expiring['day'] .. '/' .. Expiring['month'] .. '/' .. Expiring['year'] .. ' | '..ExpireHours..':'..ExpireMinutes
        if Expires == "Permanent" then
            DropPlayer(ServerId,  Lang:t('bans.perm_banned', {reason = Reason}))
        else
            DropPlayer(ServerId, Lang:t('bans.banned', {reason = Reason, expires = ExpiringDate}))
        end
    end
end)

RegisterNetEvent("qb-admin/server/kick-player", function(ServerId, Reason)
    local src = source
    if not AdminCheck(src) then return end

    DropPlayer(ServerId, Reason)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.banned'), 'success')
end)

RegisterNetEvent("qb-admin/server/give-item", function(ServerId, ItemName, ItemAmount)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = QBCore.Functions.GetPlayer(ServerId)
    TPlayer.Functions.AddItem(ItemName, ItemAmount, 'Admin-Menu-Give')
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.gaveitem', {amount = ItemAmount, name = ItemName}), 'success')
end)

RegisterNetEvent("qb-admin/server/request-job", function(ServerId, JobName)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = QBCore.Functions.GetPlayer(ServerId)
    TPlayer.Functions.SetJob(JobName, 1, 'Admin-Menu-Give-Job')
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.setjob', {jobname = JobName}), 'success')
end)

RegisterNetEvent('qb-admin/server/start-spectate', function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    -- Check if Person exists
    local Target = GetPlayerPed(ServerId)
    if not Target then
        return TriggerClientEvent('QBCore:Notify', src, Lang:t('spectate.not_found'), 'error')
    end

    -- Make Check for Spectating
    local SteamIdentifier = QBCore.Functions.GetIdentifier(src, "steam")
    if SpectateData[SteamIdentifier] ~= nil then
        SpectateData[SteamIdentifier]['Spectating'] = true
    else
        SpectateData[SteamIdentifier] = {}
        SpectateData[SteamIdentifier]['Spectating'] = true
    end

    local tgtCoords = GetEntityCoords(Target)
    TriggerClientEvent('QBCore/client/specPlayer', src, ServerId, tgtCoords)
end)

RegisterNetEvent('qb-admin/server/stop-spectate', function()
    local src = source
    if not AdminCheck(src) then return end

    local SteamIdentifier = QBCore.Functions.GetIdentifier(src, "steam")
    if SpectateData[SteamIdentifier] ~= nil and SpectateData[SteamIdentifier]['Spectating'] then
        SpectateData[SteamIdentifier]['Spectating'] = false
    end
end)

RegisterNetEvent("qb-admin/server/drunk", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('qb-admin/client/drunk', ServerId)
end)

RegisterNetEvent("qb-admin/server/animal-attack", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('qb-admin/client/animal-attack', ServerId)
end)

RegisterNetEvent("qb-admin/server/set-fire", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('qb-admin/client/set-fire', ServerId)
end)

RegisterNetEvent("qb-admin/server/fling-player", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('qb-admin/client/fling-player', ServerId)
end)

RegisterNetEvent("qb-admin/server/play-sound", function(ServerId, SoundId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('qb-admin/client/play-sound', ServerId, SoundId)
end)

-- Utility Actions

RegisterNetEvent("qb-admin/server/toggle-blips", function()
    local src = source
    if not AdminCheck(src) then return end

    local BlipData = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        BlipData[#BlipData + 1] = {
            ServerId = v,
            Name = GetPlayerName(v),
            Coords = GetEntityCoords(GetPlayerPed(v)),
        }
    end
    TriggerClientEvent('qb-admin/client/UpdatePlayerBlips', src, BlipData)
end)


RegisterNetEvent("qb-admin/server/teleport-player", function(ServerId, Type)
    local src = source
    if not AdminCheck(src) then return end

    local Msg = ""
    if Type == 'Goto' then
        Msg = Lang:t('info.teleportedto') 
        local TCoords = GetEntityCoords(GetPlayerPed(ServerId))
        TriggerClientEvent('qb-admin/client/teleport-player', src, TCoords)
    elseif Type == 'Bring' then
        Msg = Lang:t('info.teleportedbrought')
        local Coords = GetEntityCoords(GetPlayerPed(src))
        TriggerClientEvent('qb-admin/client/teleport-player', ServerId, Coords)
    end
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.teleported', {tpmsg = Msg}), 'success')
end)

RegisterNetEvent("qb-admin/server/chat-say", function(Message)
    TriggerClientEvent('chat:addMessage', -1, {
        template = "<div class=chat-message server'><strong>"..Lang:t('info.announcement').." | </strong> {0}</div>",
        args = {Message}
    })
end)

-- Player Actions

RegisterNetEvent("qb-admin/server/toggle-godmode", function(ServerId)
    TriggerClientEvent('qb-admin/client/toggle-godmode', ServerId)
end)

RegisterNetEvent("qb-admin/server/set-food-drink", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = QBCore.Functions.GetPlayer(ServerId)
    if TPlayer ~= nil then
        TPlayer.Functions.SetMetaData('thirst', 100)
        TPlayer.Functions.SetMetaData('hunger', 100)
        TriggerClientEvent('hud:client:UpdateNeeds', ServerId, 100, 100)
        TPlayer.Functions.Save()
        TriggerClientEvent('QBCore:Notify', src, Lang:t('info.gave_needs'), 'success')
    end
end)

RegisterNetEvent("qb-admin/server/remove-stress", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = QBCore.Functions.GetPlayer(ServerId)
    if TPlayer ~= nil then
        TPlayer.Functions.SetMetaData('stress', 0)
        TriggerClientEvent('hud:client:UpdateStress', ServerId, 0)
        TPlayer.Functions.Save()
        TriggerClientEvent('QBCore:Notify', src, Lang:t('info.removed_stress'), 'success')
    end
end)

RegisterNetEvent("qb-admin/server/set-armor", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = QBCore.Functions.GetPlayer(ServerId)
    if TPlayer ~= nil then
        SetPedArmour(GetPlayerPed(ServerId), 100)
        TriggerClientEvent('QBCore:Notify', src, Lang:t('info.gave_armor'), 'success')
    end
end)

RegisterNetEvent("qb-admin/server/reset-skin", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerEvent("raid_clothes:get_character_current", src)
end)

RegisterNetEvent("qb-admin/server/set-model", function(ServerId, Model)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('qb-admin/client/set-model', ServerId, Model)
end)

RegisterNetEvent("qb-admin/server/revive-in-distance", function()
    local src = source
    if not AdminCheck(src) then return end

    local Coords, Radius = GetEntityCoords(GetPlayerPed(src)), 5.0
	for k, v in pairs(QBCore.Functions.GetPlayers()) do
		local Player = QBCore.Functions.GetPlayer(v)
		if Player ~= nil then
			local TargetCoords = GetEntityCoords(GetPlayerPed(v))
			local TargetDistance = #(TargetCoords - Coords)
			if TargetDistance <= Radius then
                TriggerClientEvent('hospital:client:Revive', v, true)
			end
		end
	end
end)

RegisterNetEvent("qb-admin/server/revive-target", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('hospital:client:Revive', ServerId, true)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.revived'), 'success')
end)

RegisterNetEvent("qb-admin/server/open-clothing", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('raid_clothes:hasEnough', ServerId, 'clothing_shop')
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.gave_clothing'), 'success')
end)

RegisterNetEvent('qb-admin:server:GetPlayersForBlips', function()
    local src = source
    TriggerClientEvent('qb-admin:client:Show', src, players)
end)

CreateThread(function()
    while true do
        local tempPlayers = {}
        for _, v in pairs(QBCore.Functions.GetPlayers()) do
            local targetped = GetPlayerPed(v)
            local ped = QBCore.Functions.GetPlayer(v)
            tempPlayers[#tempPlayers + 1] = {
                name = (ped.PlayerData.charinfo.firstname or '') .. ' ' .. (ped.PlayerData.charinfo.lastname or '') .. ' | (' .. (GetPlayerName(v) or '') .. ')',
                id = v,
                coords = GetEntityCoords(targetped),
                cid = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname,
                citizenid = ped.PlayerData.citizenid,
                sources = GetPlayerPed(ped.PlayerData.source),
                sourceplayer = ped.PlayerData.source

            }
        end
        -- Sort players list by source ID (1,2,3,4,5, etc) --
        table.sort(tempPlayers, function(a, b)
            return a.id < b.id
        end)
        players = tempPlayers
        Wait(1500)
    end
end)

RegisterNetEvent('Admin:Server:SaveCar', function(mods, vehicle, _, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.query.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result[1] == nil then
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            Player.PlayerData.license,
            Player.PlayerData.citizenid,
            vehicle.model,
            vehicle.hash,
            json.encode(mods),
            plate,
            0
        })
        TriggerClientEvent('QBCore:Notify', src, "Your new proud owner of this vehicle", 'success', 5000)
    else
        TriggerClientEvent('QBCore:Notify', src, "This vehicle is already yours..", 'error', 3000)
    end
end)