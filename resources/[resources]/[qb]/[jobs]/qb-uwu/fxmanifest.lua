fx_version 'cerulean'
game 'gta5'

ui_page {'html/index.html'}

client_scripts {
    'config.lua',
    'client/*.lua',
}

server_scripts {
    'config.lua',
    'server/server.lua'
}

exports {
    'GetActiveRegister',
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',
} 