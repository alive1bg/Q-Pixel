fx_version 'bodacious'

game 'gta5'

lua54 'yes'

escrow_ignore {
}


description 'dont try to leak it. i ll prolly know who did that and u dont want this tbh'

client_scripts {
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
    'client.lua',


}

server_scripts {
    'server.lua',
}

shared_scripts {
	"veny.lua",
	"config.lua"
}