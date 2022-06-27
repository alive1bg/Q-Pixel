fx_version 'cerulean'
game 'gta5'

lua54 'yes'

escrow_ignore {
}

shared_script { 
--	'@qb-core/import.lua'
}

client_scripts {
	'config.lua',
	'client/camera.lua',
}

server_script 'server/main.lua'

ui_page 'html/index.html'

files {
	'html/vue.min.js',
	'html/*.html',
	'html/script.js',
	'html/style.css',
	'html/vcr-ocd.ttf'
}

dependency 'qb-core'
