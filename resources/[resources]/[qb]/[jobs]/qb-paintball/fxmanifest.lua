fx_version 'cerulean'
games { 'gta5' }

ui_page "ui/index.html"

files({
    "ui/index.html",
    "ui/js/*.js",
    "ui/css/*.css",
})

client_scripts {
    'client/cl_*.lua',
    "@PolyZone/client.lua",
    "@PolyZone/BoxZone.lua",
    "@PolyZone/ComboZone.lua",
}

server_scripts {
    'server/sv_*.lua',
}
