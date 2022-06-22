fx_version 'cerulean'
game 'gta5'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/menu.css',
    'html/js/ui.js',
    'html/imgs/*.png',
    'html/sounds/*.ogg',
}


shared_script 'config.lua'

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cl_ui.lua',
    'client/cl_bennys.lua'
}

server_scripts {
    'server/sv_bennys.lua',
    '@oxmysql/lib/MySQL.lua',
}

lua54 'yes'