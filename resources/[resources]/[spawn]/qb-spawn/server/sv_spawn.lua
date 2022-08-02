local QBCore = exports['qb-core']:GetCoreObject()

function Login.decode(tablestring)
    if tablestring == nil or tablestring == "" then
        return {}
    else
        return json.decode(tablestring)
    end
end

RegisterServerEvent("login:getCharModels", function(charlist, isReset, citizenid)
    local src = source
    local list = ""
    for i=1,#charlist do
        if i == #charlist then
            list = list..charlist[i]
        else
            list = list..charlist[i]..","
        end
    end

    if charlist == nil or json.encode(charlist) == "[]" then
        TriggerClientEvent("login:CreatePlayerCharacterPeds", src, nil, isReset)
        return
    end
    local fix = "SELECT cc.*, cf.*, ct.* FROM users_face cf LEFT JOIN users_current cc on cc.cid = cf.cid LEFT JOIN users_tattoos ct on ct.cid = cf.cid WHERE cf.cid IN ("..list..")"
    MySQL.query(fix, function(result)
        if result ~= nil then
            local temp_data = {}

            for k,v in pairs(result) do
                temp_data[v.cid] = {
                    model = v.model,
                    drawables = Login.decode(v.drawables),
                    props = Login.decode(v.props),
                    drawtextures = Login.decode(v.drawtextures),
                    proptextures = Login.decode(v.proptextures),
                    hairColor = Login.decode(v.hairColor),
                    headBlend = Login.decode(v.headBlend),
                    headOverlay = Login.decode(v.headOverlay),
                    headStructure = Login.decode(v.headStructure),
                    tattoos = Login.decode(v.tattoos),
                }
            end
            for i=1,#charlist do
                if temp_data[charlist[i]] == nil then
                    temp_data[charlist[i]] = nil
                end
            end
            TriggerClientEvent("login:CreatePlayerCharacterPeds",src, temp_data, isReset)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-spawn:createCharacter", function(source,cb,args)
    local src = source

    local newData = {}
    -- newData.cid = args.cid
    newData.charinfo = {
        -- cid = data.cid
        firstname = args.firstname,
        lastname = args.lastname,
        birthdate = args.dateofbirth,
        gender = args.sex
    }
    print(json.encode(newData))
    if QBCore.Player.Login(src, false, newData) then
        QBCore.Commands.Refresh(src)
        loadHouseData()
        GiveStarterItems(src)
        cb(true)
	end
end)

QBCore.Functions.CreateCallback("qb-spawn:deleteCharacter", function(source,cb,args)
    QBCore.Player.DeleteCharacter(source, args)
    cb(true)
end)

QBCore.Functions.CreateCallback("qb-spawn:fetchPlayerCharacters", function(source,cb)
    local license = QBCore.Functions.GetIdentifier(source, 'license')

    MySQL.Async.fetchAll("SELECT * FROM players WHERE license = @license",{
        ["@license"] = license
    },function(result)
        if result[1] ~= nil then
            result[1].charinfo = json.decode(result[1].charinfo)
        end
        cb(result)
    end)
end)

QBCore.Functions.CreateCallback("qb-spawn:selectCharacter", function(source,cb, args)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local identifier = QBCore.Functions.GetIdentifier(src, 'license')
    print(args)
    MySQL.query("SELECT * FROM players WHERE license = @license and cid = @cid",{
        ["@license"] = identifier,
        ["@cid"] = args
    },function(result)
        -- print(player.PlayerData.citizenid)
        -- if player.PlayerData.citizenid ~= nil then
        --     if QBCore.Player.Login(src, player.PlayaData.citizenid) then
        --         QBCore.Commands.Refresh(src)
        --         loadHouseData()
        --         local data = {
        --             loggedin = true,
        --             chardata = result[1],
        --             selectcharacter = args
        --         }
        --         cb(data)
        --     end
        -- else
            if QBCore.Player.Login(src, result[1].citizenid) then
                QBCore.Commands.Refresh(src)
                loadHouseData()
                local data = {
                    loggedin = true,
                    chardata = result[1],
                    selectcharacter = args
                }
                cb(data)
            end
        -- end
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

function loadHouseData()
    local HouseGarages = {}
    local Houses = {}
	MySQL.Async.fetchAll("SELECT * FROM `houselocations`", function(result)
		if result[1] ~= nil then
			for k, v in pairs(result) do
				local owned = false
				if tonumber(v.owned) == 1 then
					owned = true
				end
				local garage = v.garage ~= nil and json.decode(v.garage) or {}
				Houses[v.name] = {
					coords = json.decode(v.coords),
					owned = v.owned,
					price = v.price,
					locked = true,
					adress = v.label, 
					tier = v.tier,
					garage = garage,
					decorations = {},
				}
				HouseGarages[v.name] = {
					label = v.label,
					takeVehicle = garage,
				}
			end
		end
		TriggerClientEvent("qb-garages:client:houseGarageConfig", -1, HouseGarages)
		TriggerClientEvent("qb-houses:client:setHouseConfig", -1, Houses)
	end)
end