fx_version 'adamant'
game 'gta5'

client_script {
    'client/cl_*.lua'
}

server_script {
    'server/sv_*.lua'
}

shared_scripts {
    'config.lua',
    '@qb-core/import.lua'
}