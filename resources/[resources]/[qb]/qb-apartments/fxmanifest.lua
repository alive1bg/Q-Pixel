fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
	'client/main.lua',
	'client/gui.lua'
}

dependencies {
	'qb-interior',
	'qb-weathersync'
}

lua54 'yes'
