local Mercy = exports['qb-core']:GetCoreObject()

SpectateData = {}

-- [ Code ] --

-- [ Commands ] --

Mercy.Commands.Add('menu', 'Open Admin menu', {}, false, function(source)
    TriggerClientEvent('qb-admin:client:try-open-menu', source,  true)
end, 'admin')

-- [ Callbacks ] --

Mercy.Functions.CreateCallback('qb-admin:server:get-active-players-in-radius', function(Source, Cb, Coords, Radius)
	local ActivePlayers = {}
	local Coords, Radius = Coords ~= nil and vector3(Coords.x, Coords.y, Coords.z) or GetEntityCoords(GetPlayerPed(Source)), Radius ~= nil and Radius or 5.0
	for k, v in pairs(Mercy.Functions.GetPlayers()) do
		local Player = Mercy.Functions.GetPlayer(v)
		if Player ~= nil then
			local TargetCoords = GetEntityCoords(GetPlayerPed(v))
			local TargetDistance = #(TargetCoords - Coords)
			if TargetDistance <= Radius then
				local ReturnData = {}
				ReturnData['ServerId'] = Player.PlayerData.source
				ReturnData['Name'] = GetPlayerName(Player.PlayerData.source)
				table.insert(ActivePlayers, ReturnData)
			end
		end
	end
	Cb(ActivePlayers)
end)

Mercy.Functions.CreateCallback('qb-admin:server:get-permission', function(source, cb, Rank)
    local Group = Mercy.Functions.GetPermission(source)
    if Group[Rank] then
        cb(true)
    else
        cb(false)
    end
end)

Mercy.Functions.CreateCallback('qb-admin:server:get-bans', function(source, cb)
    local BanList = {}
    MySQL.Async.execute('SELECT * FROM bans', {}, function(Bans)
         if Bans ~= nil then
            for k, v in pairs(Bans) do
                local TPlayer = Mercy.Functions.GetPlayerFromIdentifier(v.license)
                local TSteam = Mercy.Functions.GetIdentifier(TPlayer.PlayerData.source, "steam")
                local BannedPlayer = {}
                BannedPlayer.Source = TPlayer.source
                BannedPlayer.Steam = TSteam
                table.insert(BanList, BannedPlayer)
            end
             cb(BanList)
         else
             cb({})
         end
     end)
 end)
 
 Mercy.Functions.CreateCallback('qb-admin:server:get-players', function(source, cb)
     local Players = Mercy.Functions.GetPlayers()
     local PlayerList = {}
     for k, v in pairs(Players) do
         local Player = Mercy.Functions.GetPlayer(v)
         local Steam = Mercy.Functions.GetIdentifier(v, "steam")
         local License = Mercy.Functions.GetIdentifier(v, "license")
         local NewPlayer = {}
         NewPlayer.ServerId = v
         NewPlayer.Name = Player.PlayerData.name
         NewPlayer.Steam = Steam
         NewPlayer.License = License
         table.insert(PlayerList, NewPlayer)
     end
     cb(PlayerList)
 end)

 Mercy.Functions.CreateCallback('qb-admin:server:get-chardata', function(source, cb, License)
    for LicenseId, veee in pairs(License) do
        local TPlayer = Mercy.Functions.GetPlayerFromIdentifier(LicenseId)
        local TSteam = Mercy.Functions.GetIdentifier(TPlayer.PlayerData.source, "steam")
        local PlayerCharInfo = {}
        PlayerCharInfo.Name = TPlayer.PlayerData.name
        PlayerCharInfo.Steam = TSteam
        PlayerCharInfo.CharName = TPlayer.PlayerData.charinfo.firstname..' '..TPlayer.PlayerData.charinfo.lastname
        PlayerCharInfo.Source = TPlayer.PlayerData.source
        PlayerCharInfo.CitizenId = TPlayer.PlayerData.citizenid
        cb(PlayerCharInfo)
    end
 end)

-- [ Events ] --

-- Spectate

RegisterNetEvent('qb-admin:server:start-spectate', function(ServerId)
    local src = source
    if Mercy.Functions.HasPermission(src, "admin") then
        -- Check if Person exists
        local Target = GetPlayerPed(ServerId)
        if not Target then
            return TriggerClientEvent('QBCore:Notify', src, 'Player not found, leaving spectate..', 'error')
        end

        -- Make Check for Spectating
        local SteamIdentifier = Mercy.Functions.GetIdentifier(src, "steam")
        if SpectateData[SteamIdentifier] ~= nil then
            SpectateData[SteamIdentifier]['Spectating'] = true
        else
            SpectateData[SteamIdentifier] = {}
            SpectateData[SteamIdentifier]['Spectating'] = true
        end

        local tgtCoords = GetEntityCoords(Target)
        TriggerClientEvent('Mercy/client/specPlayer', src, ServerId, tgtCoords)
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission..', 'error')
    end
end)

RegisterNetEvent('qb-admin:server:stop-spectate', function()
    local src = source
    if Mercy.Functions.HasPermission(src, "admin") then
        local SteamIdentifier = Mercy.Functions.GetIdentifier(src, "steam")
        if SpectateData[SteamIdentifier] ~= nil and SpectateData[SteamIdentifier]['Spectating'] then
            SpectateData[SteamIdentifier]['Spectating'] = false
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission..', 'error')
    end
end)

-- Other

RegisterNetEvent("qb-admin:server:toggle-blips", function()
    local Players = Mercy.Functions.GetPlayers()
    local BlipData = {}
    for k, v in pairs(Players) do
        local Player = Mercy.Functions.GetPlayer(v)
        local NewPlayer = {}
        NewPlayer.ServerId = v
        NewPlayer.Name = Player.PlayerData.name
        NewPlayer.Coords = GetEntityCoords(GetPlayerPed(v))
        table.insert(BlipData, NewPlayer)
    end
    TriggerClientEvent('qb-admin:client:UpdatePlayerBlips', -1, BlipData)
end)

RegisterNetEvent("qb-admin:server:ban-player", function(ServerId, Expires, Reason)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        local Time = os.time()
        local Expiring = nil
        local ExpireDate = nil
        if Expires == '1 Hour' then
            Expiring = os.date("*t", Time + 3600)
            ExpireDate = tonumber(Time + 3600)
        elseif Expires == '6 Hours' then
            Expiring = os.date("*t", Time + 21600)
            ExpireDate = tonumber(Time + 21600)
        elseif Expires == '12 Hours' then
            Expiring = os.date("*t", Time + 43200)
            ExpireDate = tonumber(Time + 43200)
        elseif Expires == '1 Day' then
            Expiring = os.date("*t", Time + 86400)
            ExpireDate = tonumber(Time + 86400)
        elseif Expires == '3 Days' then
            Expiring = os.date("*t", Time + 259200)
            ExpireDate = tonumber(Time + 259200)
        elseif Expires == '1 Week' then
            Expiring = os.date("*t", Time + 604800)
            ExpireDate = tonumber(Time + 604800)
        elseif Expires == 'Permanent' then
            Expiring = os.date("*t", Time + 315360000) -- 10 Years
            ExpireDate = tonumber(Time + 315360000)
        end         
        MySQL.Async.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            GetPlayerName(ServerId),
            Mercy.Functions.GetIdentifier(ServerId, 'license'),
            Mercy.Functions.GetIdentifier(ServerId, 'discord'),
            Mercy.Functions.GetIdentifier(ServerId, 'ip'),
            Reason,
            ExpireDate,
            GetPlayerName(src)
        })
        local ExpireHours = tonumber(Expiring['hour']) < 10 and "0"..Expiring['hour'] or Expiring['hour']
        local ExpireMinutes = tonumber(Expiring['min']) < 10 and "0"..Expiring['min'] or Expiring['min']
        if Expires == "Permanent" then
            DropPlayer(ServerId, '\n🔰 You are permanently banned.'..'\n🛑 Reason:'..Reason)
        else
            DropPlayer(ServerId, '\n🔰 You are banned.' .. '\n🛑 Reason: ' .. Reason .. "\n\n⏰Ban expires on " .. Expiring['day'] .. '/' .. Expiring['month'] .. '/' .. Expiring['year'] .. ' '..ExpireHours..':'..ExpireMinutes..'.')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)

RegisterNetEvent("qb-admin:server:toggle-godmode", function(ServerId)
    TriggerClientEvent('qb-admin:client:toggle-godmode', ServerId)
end)

RegisterNetEvent("qb-admin:server:fling-player", function(ServerId)
    TriggerClientEvent('qb-admin:client:fling-player', ServerId)
end)

RegisterNetEvent("qb-admin:server:play-sound", function(ServerId, SoundId)
    TriggerClientEvent('qb-admin:client:play-sound', ServerId, SoundId)
end)

RegisterNetEvent("qb-admin:server:kick-player", function(ServerId, Reason)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        DropPlayer(ServerId, Reason)
        TriggerClientEvent('QBCore:Notify', src, 'Successfully kicked player.', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src,'No permission.', 'error')
    end

end)

RegisterNetEvent("qb-admin:server:give-item", function(ServerId, ItemName, ItemAmount)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        local TPlayer = Mercy.Functions.GetPlayer(ServerId)
        if TPlayer ~= nil then
            TPlayer.Functions.AddItem(ItemName, ItemAmount, 'Admin-Menu-Give')
            TriggerClientEvent('QBCore:Notify', src, 'Successfully gave player x'..ItemAmount..' of '..ItemName..'.', 'success')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)

RegisterNetEvent("qb-admin:server:request-job", function(ServerId, JobName)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        local TPlayer = Mercy.Functions.GetPlayer(ServerId)
        if TPlayer ~= nil then
            TPlayer.Functions.SetJob(JobName, 1, 'Admin-Menu-Give-Job')
            TriggerClientEvent('QBCore:Notify', src, 'Successfully set player as '..JobName..'.', 'success')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)

RegisterNetEvent("qb-admin:server:set-food-drink", function(ServerId)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        local TPlayer = Mercy.Functions.GetPlayer(ServerId)
        if ServerId ~= nil then
            TPlayer.Functions.SetMetaData('thirst', 100)
            TPlayer.Functions.SetMetaData('hunger', 100)
            TriggerClientEvent('hud:client:UpdateNeeds', ServerId, 100, 100)
            TPlayer.Functions.Save();
            TriggerClientEvent('QBCore:Notify', src, 'Successfully gave player food and water.', 'success')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)

RegisterNetEvent("qb-admin:server:remove-stress", function(ServerId)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        local TPlayer = Mercy.Functions.GetPlayer(ServerId)
        TPlayer.Functions.SetMetaData('stress', 0)
        TPlayer.Functions.Save();
        TriggerClientEvent('QBCore:Notify', src, 'Successfully removed stress of player.', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)

RegisterNetEvent("qb-admin:server:set-armor", function(ServerId)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        local TPlayer = Mercy.Functions.GetPlayer(ServerId)
        SetPedArmour(GetPlayerPed(ServerId), 100)
        TPlayer.Functions.SetMetaData('armor', 100)
        TPlayer.Functions.Save();
        TriggerClientEvent('QBCore:Notify', src, 'Successfully gave player shield.', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)

RegisterNetEvent("qb-admin:server:reset-skin", function(ServerId)
    local Player = Mercy.Functions.GetPlayer(ServerId)
    local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
    if result[1] ~= nil then
        TriggerClientEvent("qb-clothes:loadSkin", ServerId, false, result[1].model, result[1].skin)
    else
        TriggerClientEvent("qb-clothes:loadSkin", ServerId, true)
    end
end)

RegisterNetEvent("qb-admin:server:set-model", function(ServerId, Model)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        TriggerClientEvent('qb-admin:client:set-model', ServerId, Model)
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)

RegisterNetEvent("qb-admin:server:revive-in-distance", function()
    local src = source
    local Coords, Radius = GetEntityCoords(GetPlayerPed(src)), 5.0
	for k, v in pairs(Mercy.Functions.GetPlayers()) do
		local Player = Mercy.Functions.GetPlayer(v)
		if Player ~= nil then
			local TargetCoords = GetEntityCoords(GetPlayerPed(v))
			local TargetDistance = #(TargetCoords - Coords)
			if TargetDistance <= Radius then
                TriggerClientEvent('hospital:client:Revive', v, true)
			end
		end
	end
end)

RegisterNetEvent("qb-admin:server:revive-target", function(ServerId)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        TriggerClientEvent('hospital:client:Revive', ServerId, true)
        TriggerClientEvent('QBCore:Notify', src, 'Successfully revived player.', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end

end)

RegisterNetEvent("qb-admin:server:open-clothing", function(ServerId)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    if Mercy.Functions.HasPermission(src, "admin") then
        TriggerClientEvent('qb-clothing:client:openMenu', ServerId)
        TriggerClientEvent('QBCore:Notify', src, 'Successfully gave player clothing menu.', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)

RegisterNetEvent("qb-admin:server:teleport-player", function(ServerId, Type)
    local src = source
    local Player = Mercy.Functions.GetPlayer(src)
    local Msg = ""
    if Mercy.Functions.HasPermission(src, "admin") then
        if Type == 'Goto' then
            Msg = 'teleported to'
            local TCoords = GetEntityCoords(GetPlayerPed(ServerId))
            TriggerClientEvent('qb-admin:client:teleport-player', src, TCoords)
        elseif Type == 'Bring' then
            Msg = 'brought'
            local Coords = GetEntityCoords(GetPlayerPed(src))
            TriggerClientEvent('qb-admin:client:teleport-player', ServerId, Coords)
        end
        TriggerClientEvent('QBCore:Notify', src, 'Successfully '..Msg..' player.', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'No permission.', 'error')
    end
end)