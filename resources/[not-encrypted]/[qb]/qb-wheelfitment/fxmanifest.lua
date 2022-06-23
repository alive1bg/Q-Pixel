fx_version "cerulean"
games {"gta5"}

lua54 'yes'

escrow_ignore {
  
}

ui_page "client/ui/html/index.html"

files {
  "client/ui/html/index.html", 
  "client/ui/html/js/ui.js", 
  "client/ui/html/css/menu.css", 
  "client/ui/html/imgs/logo.png",
}

client_script "@PolyZone/client.lua"

shared_script "_configs/cfg_general.lua"

client_scripts {
  "client/cl_*.lua"
}

server_scripts {
   'server.lua',
   '@oxmysql/lib/MySQL.lua',
}