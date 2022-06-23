fx_version 'cerulean'
game 'gta5'

description 'amir_expert#1911 - ATM Robbery'

version '1.0.3'

lua54 'yes'

escrow_ignore {
	'config.lua'
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