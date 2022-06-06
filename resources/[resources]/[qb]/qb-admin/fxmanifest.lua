fx_version 'cerulean'
game 'gta5'

author 'Mercy Collective (https://dsc.gg/mercy-coll)'
description 'Admin Menu'

ui_page "nui/index.html"

client_scripts {
    '@qb-core/shared/items.lua',
    '@qb-core/shared/jobs.lua',
    '@qb-core/shared/vehicles.lua',
    'client/cl_*.lua',
    'shared/sh_config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua',
}

files {
    "nui/index.html",
    "nui/js/*.js",
    "nui/css/*.css",
    "nui/webfonts/*.css",
    "nui/webfonts/*.otf",
    "nui/webfonts/*.ttf",
    "nui/webfonts/*.woff2",
}

dependencies {
    'oxmysql',
    'qb-core'
}

lua54 'yes'