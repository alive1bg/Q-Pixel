fx_version 'cerulean'

lua54 'yes'

escrow_ignore {
}

games {
    'gta5',
    'rdr3'
}

client_scripts {
	'client_init.lua',
	'client/cl_*.lua'
}

shared_scripts {
	"shared/*.lua",
	--'@rp_core/import.lua'
}

server_scripts {
	'server/*.lua'
}