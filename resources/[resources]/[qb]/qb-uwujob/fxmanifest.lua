fx_version 'cerulean'
game 'gta5'
author "Dankbudbaker#2880"
version '1.0.0'

description 'Dankbudbaker\'s qb-uWu Cafe job'

client_scripts{
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua'
}
server_script 'server.lua'
shared_scripts {
    
    'config.lua'
}

escrow_ignore {
    'config.lua',   -- Ignore all .yft files in any subfolder
}

lua54 'yes'