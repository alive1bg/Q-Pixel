fx_version 'cerulean'
game 'gta5'

description 'Admin Menu'

ui_page "nui/index.html"

shared_scripts {
    'shared/sh_config.lua',
    'locale.lua',
    'locales/en.lua', -- Change this to your desired language.
}

client_scripts {
    '@qb-core/shared/items.lua',
    '@qb-core/shared/jobs.lua',
    '@qb-core/shared/vehicles.lua',
    'client/**/cl_*.lua',
    'shared/sh_actions.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/**/sv_*.lua',
}

files {
    "nui/index.html",
    "nui/js/**.js",
    "nui/css/**.css",
    "nui/webfonts/*.css",
    "nui/webfonts/*.otf",
    "nui/webfonts/*.ttf",
    "nui/webfonts/*.woff2",
}

exports {
    'CreateLog'
}

server_exports {
    'CreateLog'
}

lua54 'yes'