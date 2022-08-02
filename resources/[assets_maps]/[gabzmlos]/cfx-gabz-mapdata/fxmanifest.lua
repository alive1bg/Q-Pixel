fx_version 'cerulean'
game 'gta5'
author 'Gabz'
description 'Mapdata'
version '8.0.0'
lua54 'yes'
this_is_a_map 'yes'

dependencies { 
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
}

server_scripts {
    'version_check.lua',
}

data_file 'TIMECYCLEMOD_FILE' 'gabz_timecycle_mods1.xml'

files {
    'gabz_timecycle_mods1.xml',
}

client_script {
    'gabz_entityset_mods1.lua',
}

escrow_ignore {
    'gabz-doorlocks/*.lua',
    'gabz_entityset_mods1.lua',
}
dependency '/assetpacks'