local QBCore = exports['qb-core']:GetCoreObject()
SecurityCameras = {}
-- NetID = {}
GcamID = 1
QBCore.Functions.CreateUseableItem("cctv", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-cameras:client:UseCCTVCamera", source, 0, GcamID)
    end
end)

QBCore.Functions.CreateUseableItem("360cctv", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-cameras:client:UseCCTVCamera", source, 1, GcamID)
    end
end)

QBCore.Functions.CreateUseableItem("camviewer", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-cameras:client:OpenMenu", source)
    end
end)

FetchedData = {}

CreateThread(function()
    exports.oxmysql:query('SELECT * FROM cameras', {}, function(result)
        if result[1] ~= nil then
            GcamID = (result[#result].camID + 1) or 1
            for _, v in pairs(result) do
                if(SecurityCameras[v.cid] == nil) then 
                    SecurityCameras[v.cid] = {}
                end
                local data = json.decode(v.cameradata)
                local data1 = v.cameradata

                FetchedData[data.camID] = data1

                SecurityCameras[v.cid][#SecurityCameras[v.cid]+1] = {
                    label = data.label,
                    type = data.type,
                    coords = data.coords,
                    r = data.r, 
                    canRotate = data.canRotate, 
                    isOnline = data.isOnline,
                    camID = data.camID,
                }
                -- cam = CreateObject(prop, data.coords.x, data.coords.y, data.coords.z, true, true, false)
                -- local netid =  NetworkGetNetworkIdFromEntity(cam)
                -- NetID[netid] = #SecurityCameras[v.cid]
            end
        end
    end)
end)

RegisterServerEvent("qb-cameras:server:RequestSync")
AddEventHandler("qb-cameras:server:RequestSync", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid

    if SecurityCameras[cid] ~= nil then 
        TriggerClientEvent("qb-cameras:client:SyncData", src, SecurityCameras[cid])
        TriggerClientEvent("qb-cameras:client:CreateCamerasAndTarget", src, FetchedData, 0)
    end

    -- Wait(5000)
    -- for k, v in pairs(NetID) do 
    --     TriggerClientEvent("qb-cameras:client:NewCameraTarget", src, k)
    -- end
end)

RegisterServerEvent("qb-cameras:server:DisableCam")
AddEventHandler("qb-cameras:server:DisableCam", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local numid = tonumber(data.camera)
    local cid = nil
    local dt = nil
    if FetchedData[numid] ~= nil then 
        if type(FetchedData[numid]) ~= "table" then
            dt = json.decode(FetchedData[numid])
        else
            dt = FetchedData[numid]
        end
        if dt ~= nil then 
            if dt.isOnline ~= data.enable then
                dt.isOnline = data.enable
                FetchedData[numid] = json.encode(dt)
                for k, v in pairs(SecurityCameras) do 
                    for i, d in pairs(v) do 
                        if d.camID == numid then
                            SecurityCameras[k][i].isOnline = data.enable
                            cid = k
                            break
                        end
                    end
                end
                local ply = QBCore.Functions.GetPlayerByCitizenId(cid)
                if ply ~= nil then
                    TriggerClientEvent("qb-cameras:client:DisableCam", ply.PlayerData.source, numid, data.enable)
                end
                if data.enable then 
                    TriggerClientEvent("QBCore:Notify", src, "The Camera is Now Enabled.", "success")
                else
                    TriggerClientEvent("QBCore:Notify", src, "The Camera is Disabled temporarily.", "error")
                end
            else
                if data.enable then 
                    TriggerClientEvent("QBCore:Notify", src, "The Camera is already Functional.", "success")
                else
                    TriggerClientEvent("QBCore:Notify", src, "The Camera is already Disabled.", "error")
                end
            end
        end
    end
end)

RegisterServerEvent("qb-cameras:server:RemoveCamera")
AddEventHandler("qb-cameras:server:RemoveCamera", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local numid = tonumber(data.camera)
    local cid, is360 = nil, false
    if FetchedData[numid] ~= nil then 
        table.remove(FetchedData, numid)
        for k, v in pairs(SecurityCameras) do 
            for i, d in pairs(v) do 
                if d.camID == numid then
                    cid = k
                    is360 = d.canRotate
                    SecurityCameras[k][i] = nil
                    break
                end
            end
        end
        local ply = QBCore.Functions.GetPlayerByCitizenId(cid)
        if ply ~= nil then
            TriggerClientEvent("qb-cameras:client:RemoveCamera", ply.PlayerData.source, numid, true, tonumber(data.ent))
        end
        if is360 then
            Player.Functions.AddItem('360cctv', 1)
        else
            Player.Functions.AddItem('cctv', 1)
        end
        TriggerClientEvent("qb-cameras:client:RemoveCamera", src, numid, false, tonumber(data.ent))
        exports.oxmysql:query('DELETE FROM `cameras` WHERE `camID` = ?', {numid})
        TriggerClientEvent("QBCore:Notify", src, "Camera was disconnected and put into your inventory.", "success")
    end
end)

RegisterServerEvent("qb-cameras:server:AddCamera")
AddEventHandler("qb-cameras:server:AddCamera", function(data, is360, cam)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid


    if SecurityCameras[cid] == nil then 
        SecurityCameras[cid] = {}
    end

    local index = #SecurityCameras[cid]+1
    SecurityCameras[cid][index] = {
        label = data.label,
        type = data.type,
        coords = data.coords,
        r = data.r, 
        canRotate = data.canRotate, 
        isOnline = data.isOnline,
        camID = GcamID
    }

    FetchedData[GcamID] = SecurityCameras[cid][index]
    
    -- local netid =  NetworkGetNetworkIdFromEntity(cam)
    -- NetID[netid] = #SecurityCameras[cid]
    -- TriggerClientEvent("qb-cameras:client:NewCameraTarget", -1, netid)

    if is360 then 
        Player.Functions.RemoveItem('360cctv', 1)
    else
        Player.Functions.RemoveItem('cctv', 1)
    end

    exports.oxmysql:insert('INSERT INTO cameras (cid, camID, cameradata) VALUES (?, ?, ?) ', {cid, GcamID, json.encode(SecurityCameras[cid][index])}, function(id)
        GcamID = GcamID + 1
    end)

    local mainTable = {SecurityCameras[cid][index]}
    TriggerClientEvent("qb-cameras:client:CreateCamerasAndTarget", -1, mainTable, src)
    
end)

