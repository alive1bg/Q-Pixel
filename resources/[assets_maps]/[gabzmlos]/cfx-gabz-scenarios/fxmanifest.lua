fx_version 'cerulean'
game 'gta5'
author 'Gabz'
description 'Scenarios'
version '8.0.0'
lua54 'yes'
this_is_a_map 'yes'

dependencies { 
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
}

files {
    'sp_manifest.ymt',
}

data_file 'SCENARIO_POINTS_OVERRIDE_PSO_FILE' 'sp_manifest.ymt'

server_scripts {
    'version_check.lua',
}

dependency '/assetpacks'