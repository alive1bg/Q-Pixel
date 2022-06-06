fx_version 'cerulean'

games { 'rdr3', 'gta5' }

version '1.0.0'

ui_page 'build/index.html'

files {
  'build/index.html',
  'build/static/js/*.js',
  'build/static/css/*.css',
  'build/static/media/*.ttf',
  'build/static/media/*.png',
  'build/static/media/*.jpg',
  'build/static/media/*.gif',
  'build/static/media/*.ogg',
}

client_scripts {
  '@qb-lib/client/cl_ui.lua',
  'client/cl_exports.lua',
  'client/model/*.lua'
}

-- server_scripts {
--   -- '@qb-lib/server/sv_rpc.lua',
--   'server/sv_*.lua'
--   'server/sv_*.js'
-- }
