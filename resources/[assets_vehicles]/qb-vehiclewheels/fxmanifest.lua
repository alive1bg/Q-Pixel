fx_version 'cerulean'
games {'gta5'}

files {
  'jdmrimscontentunlocks.meta',
  'wheelspackcontentunlocks.meta',
  'carcols.meta',
  'dlctext.meta',
}

data_file 'WHEELS_PACK_CONTENT_UNLOCKS' 'wheelspackcontentunlocks.meta'
data_file 'JDM_RIMS_CONTENT_UNLOCKS' 'jdmrimscontentunlocks.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'DLTTEXT_FILE' 'dlctext.meta'

client_script {
    'vehicle_names.lua',
    '86049.lua'
}