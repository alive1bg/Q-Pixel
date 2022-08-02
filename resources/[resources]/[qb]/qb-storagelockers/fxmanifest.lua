

fx_version 'cerulean'
game 'gta5'

description 'shanks-storagelockers'
version '1.0.0'
authour 'Sam Shanks'


ui_page 'html/index.html'

client_scripts {
	'client/main.lua',
}

server_script 'server/main.lua'

files {
	'*.json',
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/reset.css'
}