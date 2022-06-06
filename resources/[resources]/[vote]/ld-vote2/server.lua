
            local oylar	 = {}
            local QBCore = exports['qb-core']:GetCoreObject()
            
            QBCore.Functions.CreateCallback("ld-vote:server:isVoted", function(source, cb)
                local xPlayer = QBCore.Functions.GetPlayer(source)
                if oylar[xPlayer.PlayerData.citizenid] == nil then
                    cb(false)
                else
                    cb(true)
                end
            end)
            
            RegisterServerEvent("ld-vote:server:postedVote")
            AddEventHandler("ld-vote:server:postedVote", function(kim)
                local xPlayer = QBCore.Functions.GetPlayer(source)
                oylar[xPlayer.PlayerData.citizenid] = "kullandi"
                if oylar[kim] == nil then
                    oylar[kim] = 1 
                else
                    oylar[kim] = oylar[kim] + 1
                end
                SaveResourceFile(GetCurrentResourceName(), "data.json", json.encode(oylar))
            end)
            
            CreateThread(function()
                local result = json.decode(LoadResourceFile(GetCurrentResourceName(), "data.json"))
            
                if result then
                    oylar = result
                end
            end)
            
