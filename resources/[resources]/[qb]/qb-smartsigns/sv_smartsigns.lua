local signs = {}
config.main.logging.webhook = "https://discord.com/api/webhooks/857607261084844062/_mjmLA6hwO0kAGVmIVINTC-jAo6EVUXfiVyAlDeytx3n48NPgQyOA7nc-wnnw5f8g1Py" -- Put your Discord webhook here (the full URL)

if config.main.vRP.enabled then
    Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")
    config.disablePermissions = false
end

if config.main.ESX.enabled then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    config.disablePermissions = false
end

if config.main.acePermissions.enabled then
    config.disablePermissions = false
end

RegisterNetEvent("SmartSigns:updateSign")
AddEventHandler("SmartSigns:updateSign", function(signId, text, streetName)
    local source = source
    local permission = config.main.disablePermissions
    -- Add any additional permission checks here.
    -- We've pre-configured Ace Permissions, vRP and ESX

    -- vRP Permission Integration (if enabled in config)
    if config.main.vRP.enabled then
        local user_id = vRP.getUserId({source})
        if config.main.vRP.checkPermission.enabled then
            -- Permission Check (if enabled in config)
            for k, v in pairs(config.main.vRP.checkPermission.permissions) do
                if vRP.hasPermission({user_id,v}) then
                    permission = true
                end
            end
        end
            -- Group Check (if enabled in config)
        if config.main.vRP.checkGroup.enabled then
            for k, v in pairs(config.main.vRP.checkGroup.groups) do
                if vRP.hasGroup({user_id,v}) then
                    permission = true
                end
            end
        end
    end

    -- ESX Permission Integration (if enabled in config)
    if config.main.ESX.enabled then
        local xPlayer = ESX.GetPlayerFromId(source)
        for k, v in pairs(config.main.vRP.checkJob.jobs) do
            if xPlayer.job.name == v then
                permission = true
            end
        end
    end

    -- Ace Permission Integration (if enabled in config)
    if config.main.acePermissions.enabled then
        if IsPlayerAceAllowed(source, config.main.acePermissions.permission) then
            permission = true
        end
    end
    
    if permission then processSign(source, signId, text, streetName) end
end)

-- We do not recommend editing below here:

function processSign(source, signId, text, streetName)
    local text = text
    local streetName = streetName
    for i = 1, 3 do
        if text[i] == nil then text[i] = "" end
    end
    signs[signId] = {}

    for i = 1, 3 do -- 3 levels
        if config.main.developerMode then
            print("[Smart Signs] - Formatted string before: "..text[i].." for Sign ID: "..signId)
        end
        local formattedLine = text[i]

        for bannedWord = 1, #config.main.bannedWords do
            if string.find(formattedLine, config.main.bannedWords[bannedWord]) then
                if config.main.logging.bannedWordLogs.enabled then
                    if streetName == nil then
                        if config.main.developerMode then
                            print("[Smart Signs] - Street Name Not Received - Undefined")
                        end
                        local streetName = "" 
                    end
                    bannedWordDetection(source, signId, config.main.bannedWords[bannedWord].." (line "..i..")", formattedLine, streetName)
                end
            end
            formattedLine = formattedLine:gsub(config.main.bannedWords[bannedWord], " ")
            if config.main.developerMode then
                print("[Smart Signs] - Formatted string after banned word removal: "..formattedLine)
            end
        end

        for s = 1, #text[i] do
            local c = text[i]:sub(s,s)
            if config.main.developerMode then
                print("[Smart Signs] - Checking character: "..c.." for Sign ID: "..signId)
            end

            if c == "." or config.letterModels[c] == nil then
                if config.main.developerMode then
                    print("[Smart Signs] - Invalid character found: "..c.." Message before: "..formattedLine)
                end
                formattedLine = string.gsub(formattedLine, "%"..c, " ")
                if config.main.developerMode then
                    print("[Smart Signs] - Invalid character removed. Message after: "..formattedLine)
                end
            end
        end
        if config.main.developerMode then
            print("[Smart Signs] - Formatted string for Sign ID: "..signId.." Line: "..i.." - Formatted: "..formattedLine)
        end
        signs[signId][i] = formattedLine
    end
    if config.main.logging.enabled then
        if streetName == nil then
            if config.main.developerMode then
                print("[Smart Signs] - Street Name Not Received - Undefined")
            end
            local streetName = "" 
        end
        if config.main.developerMode then
            print("[Smart Signs] - Discord Webhook Submitted")
        end
        normalLog(source, signId, signs[signId], streetName)
    end
    TriggerClientEvent("SmartSigns:syncSignsClient", -1, signId, signs[signId])
end

RegisterServerEvent("SmartSigns:requestDataServer")
AddEventHandler("SmartSigns:requestDataServer", function()
    local source = source
    TriggerClientEvent("SmartSigns:signDataClient", source, signs)
    if config.main.developerMode then
        print("[Smart Signs] - Source: "..source.." - Requesting Sign Data Upon Joining")
    end
end)

function normalLog(source, signId, text, streetName)
    local embed = {
          {
              ["fields"] = {
                {
                    ["name"] = "**Player:**",
                    ["value"] = GetPlayerName(source),
                    ["inline"] = true
                },
                {
                    ["name"] = "**Sign ID:**",
                    ["value"] = signId,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Street Name:**",
                    ["value"] = tostring(streetName),
                    ["inline"] = false
                },
                {
                    ["name"] = "**Sign Message:**",
                    ["value"] = text[1].."\n"..text[2].."\n"..text[3],
                    ["inline"] = false
                },
              },
              ["color"] = config.main.logging.colour,
              ["title"] = config.main.logging.title,
              ["description"] = "",
              ["footer"] = {
                  ["text"] = "Timestamp: "..os.date(config.main.logging.dateFormat),
                  ["icon_url"] = config.main.logging.footerIcon,
              },
              ["thumbnail"] = {
                  ["url"] = config.main.logging.icon,
              },
          }
      }

    PerformHttpRequest(config.main.logging.webhook, function(err, text, headers) end, 'POST', json.encode({username = config.main.logging.displayName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function bannedWordDetection(source, signId, word, fullMessage, streetName)
    local embed = {
          {
              ["fields"] = {
                {
                    ["name"] = "**Player:**",
                    ["value"] = GetPlayerName(source),
                    ["inline"] = true
                },
                {
                    ["name"] = "**Sign ID:**",
                    ["value"] = signId,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Street Name:**",
                    ["value"] = tostring(streetName),
                    ["inline"] = false
                },
                {
                    ["name"] = "**Banned Word:**",
                    ["value"] = word,
                    ["inline"] = false
                },
                {
                    ["name"] = "**Full Line:**",
                    ["value"] = fullMessage,
                    ["inline"] = false
                },
              },
              ["color"] = config.main.logging.bannedWordLogs.colour,
              ["title"] = "Banned Word Detection",
              ["description"] = "",
              ["footer"] = {
                  ["text"] = "Timestamp: "..os.date(config.main.logging.dateFormat),
                  ["icon_url"] = config.main.logging.footerIcon,
              },
              ["thumbnail"] = {
                  ["url"] = config.main.logging.icon,
              },
          }
      }

    PerformHttpRequest(config.main.logging.webhook, function(err, text, headers) end, 'POST', json.encode({username = config.main.logging.displayName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end