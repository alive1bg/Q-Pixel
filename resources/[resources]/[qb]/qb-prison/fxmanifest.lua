fx_version 'cerulean'
game 'gta5'

description 'QB-Prison'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
	'locales/en.lua',
	'config.lua'
}

escrow_ignore {
	'client/*.lua',
	'server/*.lua',
	'config.lua',
	'locales/en.lua',
  }


client_scripts {
	'client/main.lua',
	'client/jobs.lua',
	'client/prisonbreak.lua',
	'client/chairs.lua'
}

server_script 'server/main.lua'

lua54 'yes'
dependency '/assetpacks'