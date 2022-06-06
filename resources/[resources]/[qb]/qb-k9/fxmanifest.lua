fx_version 'cerulean'
game 'gta5'

description 'K-9 Script for QB original author hashx_k9 edited by FjamZoo#0001'
version '1.0.0'

shared_script {
	'@qb-core/shared/locale.lua',
	'locales/en.lua',
	'config.lua',
}

client_scripts {
	'client/client.lua'
}

server_script {
	'server/server.lua'
}
