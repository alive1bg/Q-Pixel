fx_version 'cerulean'
games {'gta5'}

shared_scripts {
	'@qb-core/import.lua',
    'sh_init.lua'
}

client_scripts {
	'@qb-core/client/ped.lua',
	'cl_main.lua',
    'client/*.lua',
	'client/modules/module_*.lua'
}

server_scripts {
    'server/*.lua'
}

exports {
	'GetVehicleStatusList',
	'SetVehicleStatus'
}