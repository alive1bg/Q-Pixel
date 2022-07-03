fx_version 'cerulean'
game 'gta5'
description 'AV House Robberies'
version '1.0.0'
ui_page 'nui/index.html'

files {
  "nui/index.html",
  "nui/scripts.js",
  "nui/css/style.css",
}

--[[ UNCOMMENT THIS IF YOU USE VRP

dependency "vrp"

]]

client_scripts {
--	'lib/Proxy.lua', --UNCOMMENT THIS IF YOU USE VRP
--	'lib/Tunnel.lua', --UNCOMMENT THIS IF YOU USE VRP
	'config.lua',
	'client/*.lua'
}

server_scripts {
--	'@vrp/lib/utils.lua', --UNCOMMENT THIS IF YOU USE VRP
	'config.lua',
	'server/*.lua'
}

shared_scripts { 
	'@qb-core/import.lua', -- UNCOMMENT THIS IF YOU USE QBCORE
--	'@pmc-callbacks/import.lua' -- UNCOMMENT THIS IF YOU USE VRP OR CUSTOM FRAMEWORK
}
