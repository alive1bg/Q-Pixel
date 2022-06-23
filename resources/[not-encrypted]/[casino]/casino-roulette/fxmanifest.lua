version '1.0.2'
author 'freamee'
decription 'Aquiver rulett'

lua54 'yes'

escrow_ignore {
 'config.lua'
}

client_scripts {
    'config.lua',
    'translations.lua',
    'shared/shared_utils.lua',
    'client/cl_main.lua'
}

server_scripts {
    'config.lua',
    'translations.lua',
    'shared/shared_utils.lua',
    'server/sv_main.lua'
}

game 'gta5'
fx_version 'adamant'
