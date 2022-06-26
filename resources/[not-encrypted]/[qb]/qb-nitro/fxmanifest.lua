fx_version 'cerulean'
game 'gta5'

lua54 'yes'

escrow_ignore {
}

client_script 'client/main.lua'

server_scripts {
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua',
}