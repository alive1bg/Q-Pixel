fx_version 'cerulean'
game 'gta5'
author "Dankbudbaker#2880"
version '6.0.0'

description 'Dankbudbaker\'s qb-burgershot job'

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/main.lua',
    'client/chairs.lua',
}

server_script 'server/main.lua'

shared_scripts {
    'config.lua'
}

escrow_ignore {
    'config.lua',   -- Ignore all .yft files in any subfolder
}

lua54 'yes'