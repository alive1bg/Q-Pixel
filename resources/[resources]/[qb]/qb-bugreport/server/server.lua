local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/933954379046862878/ifj94ACOLcHCd5Un3YzDR3IrP-Scuj2kyRg8NmEutefWiIYJfZGys-2p0b5jV7I_RPLC"

RegisterServerEvent('send')
AddEventHandler('send', function(data)
    if(data.url == nil or data.url == "") then
        data.url = "https://lh3.googleusercontent.com/proxy/eyhom2MpG4JlnVWyxOKZfqssXjRxRE1eh9K3F45mwGnaxHFnNGsiSH35W3PQBdM0WzIZ7pwZOHP49s5eeN3K92p8jDMYY4M"
    end
    local connect = {
        {
            ["color"] = "255",
            ["title"] = "Bug Report",
            ["description"] = "Title: \n `"..data.title.."` \n Description: \n `"..data.description.."`",
	        ["footer"] = {
                ["text"] = "NextGenRP",
            },
            ["image"] = {
                ["url"] = data.url,
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "NextGen RP Bug Reports",  avatar_url = "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/error-512.png",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

