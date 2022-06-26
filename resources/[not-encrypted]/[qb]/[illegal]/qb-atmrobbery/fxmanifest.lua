fx_version 'cerulean'
game 'gta5'

lua54 'yes'

escrow_ignore {
}

client_script 'client/client.lua'
server_script 'server/server.lua'
shared_script 'config.lua'

lua54 'yes'

escrow_ignore {
    'client/client.lua',
    'server/server.lua',
    'config.lua',
    'README.md',
    'LICENSE',
}
dependency '/assetpacks'server_scripts { '@mysql-async/lib/MySQL.lua' }