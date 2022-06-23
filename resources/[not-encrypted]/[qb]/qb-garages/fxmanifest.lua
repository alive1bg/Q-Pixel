fx_version 'cerulean'
game 'gta5'

lua54 'yes'

escrow_ignore {
	'config.lua'
}

server_script {
    'Server/sv_main.lua',
}

client_script {
    'Client/cl_functions.lua',
    'Client/cl_main.lua',
}

shared_script {
    'config.lua',
}