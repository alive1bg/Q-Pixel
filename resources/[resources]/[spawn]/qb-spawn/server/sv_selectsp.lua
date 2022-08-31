local QBCore = exports['qb-core']:GetCoreObject()

function checkOverwrites(char)
    local rev = nil
    -- if char.jail then
    --     rev = "jail"
    -- end
    return rev
end

RegisterServerEvent("character:loadspawns", function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local char =  xPlayer.PlayerData.citizenid
    -- local cid = tonumber(char)

    MySQL.Async.fetchAll("SELECT ho.*, cm.cid, cm.building_type, hp.level, hp.illness, hp.time FROM users_motel cm LEFT JOIN users_housing ho on ho.cid = cm.cid LEFT JOIN users_hospital_patients hp on hp.cid = cm.cid WHERE cm.cid = @cid ",{
        ["cid"] = char
    },function(housingMotels)
        MySQL.Async.fetchAll("SELECT * FROM player_houses WHERE citizenid = @cid",{
            ["cid"] = char
        },function(housing_keys)
            if housingMotels[1] then
                local spawnData = {
                    ["overwrites"] = checkOverwrites(char),
                    ["hospital"] = {
                        ["illness"] = housingMotels[1].illness,
                        ["level"] = housingMotels[1].level,
                        ["time"] = housingMotels[1].time,
                    },
                    ["motelRoom"] = {
                        ["roomType"] = housingMotels[1].building_type,
                        ["cid"] = housingMotels[1].cid,
                    },
                    ["houses"] = {},
                    ["keys"] = {},
                }

                for k,v in pairs(housing_keys) do
                    if v.house ~= nil then
                        spawnData["houses"][v.house] = true
                    end
                end

                for k,v in pairs(housing_keys) do
                    if v.keyholders ~= nil then
                        spawnData["keys"][v.house] = true
                    end
                end
                TriggerClientEvent("spawn:clientSpawnData",src,spawnData)
            else
                -- This assumes a New Character
                MySQL.Async.execute("INSERT INTO users_motel (cid) VALUES (@cid)",{
                    ["cid"] = char
                })
                MySQL.Async.execute("INSERT INTO users_hospital_patients (cid,level,illness,time) VALUES (@cid,@level,@illness,@time)",{
                    ["cid"] = char,
                    ["level"] = 0,
                    ["illness"] = "none",
                    ["time"] = 0
                })

                local spawnData = {
                    ["overwrites"] = "new",
                    ["hospital"] = {
                        ["illness"] = "none",
                        ["level"] = 0,
                        ["time"] = 0,
                    },
                    ["motelRoom"] = {
                        ["roomType"] = 1,
                        ["cid"] = char,
                    },
                    ["houses"] = {},
                    ["keys"] = {},
                }
                TriggerClientEvent("spawn:clientSpawnData",src,spawnData)
            end
        end)
    end)
end)