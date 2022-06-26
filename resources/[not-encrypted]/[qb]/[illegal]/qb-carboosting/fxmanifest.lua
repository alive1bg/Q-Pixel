fx_version 'cerulean'
games { 'gta5' }

lua54 'yes'

escrow_ignore {
}

client_scripts {
  'config.lua',
  'client/cl_*.lua',
}

server_scripts {
  'config.lua',
  'server/sv_*.lua',
}

ui_page 'ui/index.html'

files {
  'ui/*',
  'ui/images/*',
  'ui/css/*',
  'ui/webfonts/*'
}