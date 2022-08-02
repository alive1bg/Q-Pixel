fx_version 'bodacious'
games {'gta5'}


shared_script {
    'config.lua', 
    'shared/shared.lua'
}

client_scripts {
    '@PolyZone/client.lua', 
    '@PolyZone/CircleZone.lua', 
    'client/functions.lua', 
    'client/cl_main.lua'
}

server_script {
    'server/sv_main.lua'
}
