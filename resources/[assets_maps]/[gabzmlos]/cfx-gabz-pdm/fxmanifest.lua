fx_version 'cerulean'
game 'gta5'
author 'Gabz'
description 'PDM'
version '8.0.0'
lua54 'yes'
this_is_a_map 'yes'

dependencies { 
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
    'cfx-gabz-mapdata', -- ⚠️PLEASE READ⚠️; Requires [cfx-gabz-mapdata] to work properly.
}

server_scripts {
    'version_check.lua',
}

data_file 'TIMECYCLEMOD_FILE' 'gabz_pdm_timecycle.xml'

files {
	'gabz_pdm_timecycle.xml',
}

escrow_ignore {
    'stream/**/*.ytd',
    'stream/ydr/gabz_pdm_flag1.yft',
    'stream/ydr/gabz_pdm_flag2.yft',
    'pdm.lua',
}
dependency '/assetpacks'