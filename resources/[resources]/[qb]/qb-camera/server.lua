local QBCore = exports['qb-core']:GetCoreObject()

local WebHook = "https://discordapp.com/api/webhooks/998206233158885399/396DdD9VrlPl9p5hjetDS_3AHR6c_8YAn9I_OzB9OXcc07QIkDMHM1dITssbzZu08Sai"

QBCore.Functions.CreateUseableItem("camera", function(source, item)
    local src = source
    TriggerClientEvent("wert-camera:client:use-camera", src)
end)

QBCore.Functions.CreateUseableItem("photo", function(source, item)
    local src = source
    if item.info and item.info.photourl then
        TriggerClientEvent("wert-camera:client:use-photo", src, item.info.photourl)
    end
end)

RegisterNetEvent("wert-camera:server:add-photo-item", function(url)
    local src = source
    local ply = QBCore.Functions.GetPlayer(source)
    if ply then
        local info = {
            photourl = url
        }
        ply.Functions.AddItem("photo", 1, nil, info)
    end
end)

QBCore.Functions.CreateCallback("wert-camera:server:webhook",function(source,cb)
	if WebHook ~= "" then
		cb(WebHook)
	else
		cb(nil)
	end
end)
