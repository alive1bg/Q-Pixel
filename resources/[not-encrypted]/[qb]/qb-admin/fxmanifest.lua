fx_version 'cerulean'
games { 'gta5' }

lua54 'yes'

escrow_ignore {
}

ui_page "ui-build/index.html"

files {
  "ui-build/*",
}

client_scripts {
  'config.lua',
  'client/cl_*.lua',
}

server_scripts {
  'config.lua',
  'server/sv_*.lua',
}

