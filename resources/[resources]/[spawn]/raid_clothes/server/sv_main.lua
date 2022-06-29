QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("clothing:purchase", function(source,cb,price)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer.Functions.RemoveMoney('cash', price) then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("PriceWithTaxString", function(source, cb, pData, pType)
    local data = {
        total = pData,
        text = pData.." + "..pType
    }
    cb(data)
end)

QBCore.Functions.CreateCallback("skins:getSteamId", function(source,cb)
    local hexid = QBCore.Functions.GetIdentifier(source, 'license')
    cb(hexid)
end)

function HexIdToComId(hexid)
    return math.floor(tonumber(string.sub(hexid, 7), 16))
end

local function checkExistenceClothes(citizenid, cb)
    MySQL.Async.fetchAll("SELECT citizenid FROM users_current WHERE citizenid = @citizenid LIMIT 1;", {
        ['@citizenid'] = citizenid
    }, function(result)
        local exists = result and result[1] and true or false
        cb(exists)
    end)
end

local function checkExistenceFace(citizenid, cb)
    MySQL.Async.fetchAll("SELECT citizenid FROM users_face WHERE citizenid = @citizenid LIMIT 1;", {
        ["@citizenid"] = citizenid
    }, function(result)
        local exists = result and result[1] and true or false
        cb(exists)
    end)
end

RegisterServerEvent("raid_clothes:insert_character_current", function(data)
    if not data then return end
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local characterId = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid
    if not characterId and not citizenid then return end
    checkExistenceClothes(citizenid, function(exists)
        local values = {
            ["@citizenid"] = citizenid,
            ['@cid'] = characterId,
            ["@model"] = json.encode(data.model),
            ["@drawables"] = json.encode(data.drawables),
            ["@props"] = json.encode(data.props),
            ["@drawtextures"] = json.encode(data.drawtextures),
            ["@proptextures"] = json.encode(data.proptextures),
        }

        if not exists then
            local cols = "citizenid, cid, model, drawables, props, drawtextures, proptextures"
            local vals = "@citizenid, @cid, @model, @drawables, @props, @drawtextures, @proptextures"

            MySQL.Async.execute("INSERT INTO users_current ("..cols..") VALUES ("..vals..")", values)
            MySQL.Async.fetchAll("SELECT * FROM users_tattoos WHERE citizenid = @citizenid", {
                ['@citizenid'] = citizenid,
                ['@cid'] = characterId
            }, function(result)
                if (result[1] == nil) then
                    local tattooValue = "{}"
                    MySQL.Async.execute("INSERT INTO users_tattoos (citizenid, cid, tattoos) VALUES (@citizenid, @cid, @tattoo)", {
                        ['@citizenid'] = citizenid, 
                        ['@cid'] = characterId,
                        ['@tattoo'] = tattooValue
                    })
                end
            end)
            return
        end

        local set = "model = @model,drawables = @drawables,props = @props,drawtextures = @drawtextures,proptextures = @proptextures"
        MySQL.Async.execute("UPDATE users_current SET "..set.." WHERE citizenid = @citizenid", values)
    end)
end)

RegisterServerEvent("raid_clothes:insert_character_face", function(data)
    if not data then return end
    local src = source

    local xPlayer = QBCore.Functions.GetPlayer(src)
    local characterId = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid

    if not characterId then return end

    checkExistenceFace(citizenid, function(exists)
        if data.headBlend == "null" or data.headBlend == nil then
            data.headBlend = '[]'
        else
            data.headBlend = json.encode(data.headBlend)
        end
        local values = {
            ['@citizenid'] = citizenid,
            ["@cid"] = characterId,
            ["@hairColor"] = json.encode(data.hairColor),
            ["@headBlend"] = data.headBlend,
            ["@headOverlay"] = json.encode(data.headOverlay),
            ["@headStructure"] = json.encode(data.headStructure),
        }

        if not exists then
            local cols = "citizenid, cid, hairColor, headBlend, headOverlay, headStructure"
            local vals = "@citizenid, @cid, @hairColor, @headBlend, @headOverlay, @headStructure"
            MySQL.Async.execute("INSERT INTO users_face ("..cols..") VALUES ("..vals..")", values)
            return
        end

        local set = "hairColor = @hairColor,headBlend = @headBlend, headOverlay = @headOverlay,headStructure = @headStructure, citizenid = @citizenid"
        MySQL.Async.execute("UPDATE users_face SET "..set.." WHERE citizenid = @citizenid", values)
    end)
end)

RegisterServerEvent("raid_clothes:get_character_face", function(pSrc)
    local src = (not pSrc and source or pSrc)
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local characterId = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid

    if not citizenid then return end

    local query = "SELECT cc.model, cf.hairColor, cf.headBlend, cf.headOverlay, cf.headStructure FROM users_face cf INNER JOIN users_current cc on cc.citizenid = cf.citizenid WHERE cf.citizenid = @citizenid"
    MySQL.Async.fetchAll(query, {
        -- ['@cid'] = citizenid,
        ['@citizenid'] = citizenid
    }, function(result)
        if (result ~= nil and result[1] ~= nil) then
            local temp_data = {
                hairColor = json.decode(result[1].hairColor),
                headBlend = json.decode(result[1].headBlend),
                headOverlay = json.decode(result[1].headOverlay),
                headStructure = json.decode(result[1].headStructure),
            }
            local model = tonumber(result[1].model)
            if model == 1885233650 or model == -1667301416 then
                TriggerClientEvent("raid_clothes:setpedfeatures", src, temp_data)
            end
        else
            TriggerClientEvent("raid_clothes:setpedfeatures", src, false)
        end
	end)
end)

RegisterServerEvent("raid_clothes:get_character_current", function(pSrc)
    local src = (not pSrc and source or pSrc)
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local characterId = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid
    if not citizenid then return end
    local temp_data = {}

    MySQL.Async.fetchAll("SELECT * FROM users_current WHERE citizenid = @citizenid AND cid = @cid", {
        ['@citizenid'] = citizenid,
        ['@cid'] = characterId
    }, function(result)
        if result[1] ~= nil then
            temp_data = {
                model = result[1].model,
                drawables = json.decode(result[1].drawables),
                props = json.decode(result[1].props),
                drawtextures = json.decode(result[1].drawtextures),
                proptextures = json.decode(result[1].proptextures),
            }
        end
        TriggerClientEvent("raid_clothes:setclothes", src, temp_data, 0)
	end)
end)

RegisterServerEvent("raid_clothes:retrieve_tats", function(pSrc)
    local src = (not pSrc and source or pSrc)
	local xPlayer = QBCore.Functions.GetPlayer(src)
	MySQL.Async.fetchAll("SELECT * FROM users_tattoos WHERE citizenid = @citizenid AND cid = @cid", {
        ['@citizenid'] = xPlayer.PlayerData.citizenid,
        ['@cid'] = xPlayer.PlayerData.cid
    }, function(result)
        if(result[1] ~= nil) then
			TriggerClientEvent("raid_clothes:settattoos", src, json.decode(result[1].tattoos))
		else
			local tattooValue = "{}"
			MySQL.Async.execute("INSERT INTO users_tattoos (cid, tattoos, citizenid) VALUES (@cid, @tattoo, @citizenid)", {
                ['@tattoo'] = tattooValue,
                ['@cid'] = xPlayer.PlayerData.cid,
                ['@citizenid'] = xPlayer.PlayerData.citizenid
            })
			TriggerClientEvent("raid_clothes:settattoos", src, {})
		end
	end)
end)

RegisterServerEvent("raid_clothes:set_tats", function(tattoosList)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
    MySQL.Async.execute("UPDATE users_tattoos SET tattoos = @tattoos WHERE citizenid = @citizenid AND cid = @cid", {
        ['@tattoos'] = json.encode(tattoosList), 
        ['@citizenid'] = xPlayer.PlayerData.citizenid,
        ['@cid'] = xPlayer.PlayerData.cid,
    })
end)

QBCore.Commands.Add('outfits', 'List Your Outfits', {}, false, function(source, args)
    if args ~= nil then
        TriggerClientEvent('raid_clothes:outfits', source)
    end
end)

RegisterServerEvent("raid_clothes:targetoutfits", function(source, args)
    if args ~= nil then
        TriggerClientEvent('raid_clothes:outfits', source)
    end
end)

RegisterServerEvent("raid_clothes:get_outfit", function(slot)
    if not slot then return end
    local src = source

    local xPlayer = QBCore.Functions.GetPlayer(src)
    local characterId = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid

    if not characterId then return end
    
    MySQL.Async.fetchAll("SELECT * FROM users_outfits WHERE slot = @slot AND citizenid = @citizenid AND cid = @cid", {
        ['@slot'] = slot,
        ['@citizenid'] = citizenid,
        ['@cid'] = characterId
    }, function(result)
        if result and result[1] then
            if result[1].model == nil then
                TriggerClientEvent("QBCore:Notify", src, "You can't use this")
                return
            end

            local data = {
                model = result[1].model,
                drawables = json.decode(result[1].drawables),
                props = json.decode(result[1].props),
                drawtextures = json.decode(result[1].drawtextures),
                proptextures = json.decode(result[1].proptextures),
                hairColor = json.decode(result[1].hairColor)
            }

            TriggerClientEvent("raid_clothes:setclothes", src, data, 0)

            local values = {
                ['@citizenid'] = citizenid,
                ["@cid"] = characterId,
                ["@model"] = data.model,
                ["@drawables"] = json.encode(data.drawables),
                ["@props"] = json.encode(data.props),
                ["@drawtextures"] = json.encode(data.drawtextures),
                ["@proptextures"] = json.encode(data.proptextures),
            }

            local set = "model = @model, drawables = @drawables, props = @props,drawtextures = @drawtextures,proptextures = @proptextures, citizenid = @citizenid"
            MySQL.Async.execute("UPDATE users_current SET "..set.." WHERE citizenid = @citizenid", values)
        else
            TriggerClientEvent("QBCore:Notify", src, "No outfit on slot " .. slot)
        end
	end)
end)

RegisterServerEvent("raid_clothes:set_outfit", function(slot, name, data)
    if not slot then return end
    local src = source

    local xPlayer = QBCore.Functions.GetPlayer(src)
    local characterId = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid

    if not characterId then return end

    MySQL.Async.fetchAll("SELECT slot FROM users_outfits WHERE slot = @slot AND citizenid = @citizenid", {
        ['@slot'] = slot,
        ['@citizenid'] = citizenid
    }, function(result)
        if result and result[1] then
            local values = {
                ["@cid"] = characterId,
                ["@citizenid"] = citizenid,
                ["@slot"] = slot,
                ["@name"] = name,
                ["@model"] = json.encode(data.model),
                ["@drawables"] = json.encode(data.drawables),
                ["@props"] = json.encode(data.props),
                ["@drawtextures"] = json.encode(data.drawtextures),
                ["@proptextures"] = json.encode(data.proptextures),
                ["@hairColor"] = json.encode(data.hairColor),
            }

            local set = "model = @model,name = @name,drawables = @drawables,props = @props,drawtextures = @drawtextures,proptextures = @proptextures,hairColor = @hairColor"
            MySQL.Async.execute("UPDATE users_outfits SET "..set.." WHERE slot = @slot and citizenid = @citizenid", values)
        else
            local cols = "citizenid, cid, model, name, slot, drawables, props, drawtextures, proptextures, hairColor"
            local vals = "@citizenid, @cid, @model, @name, @slot, @drawables, @props, @drawtextures, @proptextures, @hairColor"

            local values = {
                ['@citizenid'] = citizenid,
                ['@cid'] = characterId,
                ["@name"] = name,
                ["@slot"] = slot,
                ["@model"] = data.model,
                ["@drawables"] = json.encode(data.drawables),
                ["@props"] = json.encode(data.props),
                ["@drawtextures"] = json.encode(data.drawtextures),
                ["@proptextures"] = json.encode(data.proptextures),
                ["@hairColor"] = json.encode(data.hairColor)
            }

            MySQL.Async.execute("INSERT INTO users_outfits ("..cols..") VALUES ("..vals..")", values, function()
                TriggerClientEvent("QBCore:Notify", src, "Outfit ".. name .. " stored in slot " .. slot)
            end)
        end
	end)
end)

RegisterServerEvent("raid_clothes:remove_outfit",function(slot)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local cid = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid
    local slot = slot

    if not citizenid then return end
    MySQL.Async.execute("DELETE FROM users_outfits WHERE slot = @slot AND citizenid = @citizenid", {
        ["slot"] = slot,
        ['@citizenid'] = citizenid
    })
    TriggerClientEvent("notify", src,"Removed slot " .. slot .. ".",1)
end)

RegisterServerEvent("raid_clothes:list_outfits", function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local cid = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid
    local slot = slot
    local name = name

    if not citizenid then return end

    MySQL.Async.fetchAll("SELECT slot, name FROM users_outfits WHERE citizenid = @citizenid", {
        ['@citizenid'] = citizenid
    }, function(skincheck)
    	TriggerClientEvent("raid_clothes:ListOutfits",src, skincheck)
	end)
end)

RegisterServerEvent("clothing:checkIfNew", function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local cid = xPlayer.PlayerData.cid
    local citizenid = xPlayer.PlayerData.citizenid
    MySQL.Async.fetchAll("SELECT count(model) FROM users_current WHERE citizenid = @citizenid LIMIT 1", {
        ['@citizenid'] = citizenid
    }, function(result)
        local isService = false;
        if result == 0 then
            MySQL.Async.fetchAll("select count(citizenid) assExist from users_current citizenid = @citizenid", {
                ['@citizenid'] = citizenid
            }, function(clothingCheck)
                local existsClothing = clothingCheck[1].assExist
                TriggerClientEvent('raid_clothes:setclothes',src,{},existsClothing)
            end)
            return
        else
            TriggerEvent("raid_clothes:get_character_current", src)
        end
        TriggerClientEvent("raid_clothes:inService",src,isService)
    end)
end)

RegisterServerEvent("clothing:payment")
AddEventHandler("clothing:payment", function(pType,price)
    print(pType)
    print(price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney(pType, price, 'Clothing Payment')
end)