Config = {}

Config.PrintClient = false
Config.Offset = true
Config.CasinoMembership = "casino_member" 
Config.CheckMembership = true
Config.DrawMarker = true

Config.Mult = { -- Multipliers based on GTA:ONLINE
	['1'] = 25,	
	['2'] = 50,
	['3'] = 75,
	['4'] = 100,
	['5'] = 250,
	['6'] = 500,
	['7'] = 1000,
}

Config.Wins = { -- DO NOT TOUCH IT
	[1] = '2',
	[2] = '3',
	[3] = '6',
	[4] = '2',
	[5] = '4',
	[6] = '1',
	[7] = '6',
	[8] = '5',
	[9] = '2',
	[10] = '1',
	[11] = '3',
	[12] = '6',
	[13] = '7',
	[14] = '1',
	[15] = '4',
	[16] = '5',
}

Config.Slots = {
	--Main Lobby
	[1] = { -- Angel and the knight
		pos = vector3(986.06, 47.41, 71.06), -- done front foyer
		SlotName = "Angel and the Knight",
		bet = 10,
		prop = 'vw_prop_casino_slot_01a',
		prop1 = 'vw_prop_casino_slot_01a_reels',
		prop2 = 'vw_prop_casino_slot_01b_reels',
	},
	[2] = { -- Angel and the knight
		pos = vector3(992.8, 51.95, 71.06), -- done 
		SlotName = "Angel and the Knight",
		bet = 10,
		prop = 'vw_prop_casino_slot_01a',
		prop1 = 'vw_prop_casino_slot_01a_reels',
		prop2 = 'vw_prop_casino_slot_01b_reels',
	},
	[3] = { -- Angel and the knight
		pos = vector3(996.05, 46.35, 71.06), -- done 
		SlotName = "Angel and the Knight",
		bet = 10,
		prop = 'vw_prop_casino_slot_01a',
		prop1 = 'vw_prop_casino_slot_01a_reels',
		prop2 = 'vw_prop_casino_slot_01b_reels',
	},
	[4] = { -- Angel and the knight
		pos = vector3(999.75, 41.13, 71.06), -- done
		SlotName = "Angel and the Knight",
		bet = 10,
		prop = 'vw_prop_casino_slot_01a',
		prop1 = 'vw_prop_casino_slot_01a_reels',
		prop2 = 'vw_prop_casino_slot_01b_reels',
	},
	[5] = { -- Impotent Rage
		pos = vector3(986.45, 46.0, 71.06), --done

		SlotName = "Impotent Rage",
		bet = 15,
		prop = 'vw_prop_casino_slot_02a',
		prop1 = 'vw_prop_casino_slot_02a_reels',
		prop2 = 'vw_prop_casino_slot_02b_reels',
	},
	[6] = { -- Impotent Rage
		pos = vector3(993.23, 51.11, 70.65), -- done 
		SlotName = "Impotent Rage",
		bet = 15,
		prop = 'vw_prop_casino_slot_02a',
		prop1 = 'vw_prop_casino_slot_02a_reels',
		prop2 = 'vw_prop_casino_slot_02b_reels',
	},
	[7] = { -- Impotent Rage
		pos = vector3(996.65, 44.61, 71.0), -- done
		SlotName = "Impotent Rage",
		bet = 15,
		prop = 'vw_prop_casino_slot_02a',
		prop1 = 'vw_prop_casino_slot_02a_reels',
		prop2 = 'vw_prop_casino_slot_02b_reels',
	},
	[8] = { -- Impotent Rage
		pos = vector3(999.23, 40.32, 71.0), -- done
		SlotName = "Impotent Rage",
		bet = 15,
		prop = 'vw_prop_casino_slot_02a',
		prop1 = 'vw_prop_casino_slot_02a_reels',
		prop2 = 'vw_prop_casino_slot_02b_reels',
	},
	[9] = { -- Republican Space rangers
		pos = vector3(985.38, 44.61, 71.06), -- done
		SlotName = "Republican Space Rangers",
		bet = 5,
		prop = 'vw_prop_casino_slot_03a',
		prop1 = 'vw_prop_casino_slot_03a_reels',
		prop2 = 'vw_prop_casino_slot_03b_reels',
	},
	[10] = { -- Republican Space rangers
		pos = vector3(993.71, 50.31, 71.06), -- done
		SlotName = "Republican Space Rangers",
		bet = 5,
		prop = 'vw_prop_casino_slot_03a',
		prop1 = 'vw_prop_casino_slot_03a_reels',
		prop2 = 'vw_prop_casino_slot_03b_reels',
	},
	[11] = { -- Republican Space rangers
		pos = vector3(995.31, 43.48, 71.06), -- done
		SlotName = "Republican Space Rangers",
		bet = 5,
		prop = 'vw_prop_casino_slot_03a',
		prop1 = 'vw_prop_casino_slot_03a_reels',
		prop2 = 'vw_prop_casino_slot_03b_reels',
	},
	[12] = { -- Republican Space rangers
		pos = vector3(998.93, 39.43, 71.06), -- done
		SlotName = "Republican Space Rangers",
		bet = 5,
		prop = 'vw_prop_casino_slot_03a',
		prop1 = 'vw_prop_casino_slot_03a_reels',
		prop2 = 'vw_prop_casino_slot_03b_reels',
	},
	[13] = { -- Fame or Shame
		pos = vector3(981.71, 48.23, 70.96), -- done
		SlotName = "Fame or Shame",
		bet = 10,
		prop = 'vw_prop_casino_slot_04a',
		prop1 = 'vw_prop_casino_slot_04a_reels',
		prop2 = 'vw_prop_casino_slot_04b_reels',
	},
	[14] = { -- Fame or Shame
		pos = vector3(983.99, 45.67, 70.96), -- done
		SlotName = "Fame or Shame",
		bet = 10,
		prop = 'vw_prop_casino_slot_04a',
		prop1 = 'vw_prop_casino_slot_04a_reels',
		prop2 = 'vw_prop_casino_slot_04b_reels',
	},
	[15] = { -- Fame or Shame
		pos = vector3(991.37, 49.54, 70.96), -- done
		SlotName = "Fame or Shame",
		bet = 10,
		prop = 'vw_prop_casino_slot_04a',
		prop1 = 'vw_prop_casino_slot_04a_reels',
		prop2 = 'vw_prop_casino_slot_04b_reels',
	},
	[16] = { -- Fame or Shame
		pos = vector3(994.46, 49.86, 70.96), -- done
		SlotName = "Fame or Shame",
		bet = 10,
		prop = 'vw_prop_casino_slot_04a',
		prop1 = 'vw_prop_casino_slot_04a_reels',
		prop2 = 'vw_prop_casino_slot_04b_reels',
	},
	[17] = { -- Fame or Shame
		pos = vector3(993.89, 44.52, 70.96), -- done
		SlotName = "Fame or Shame",
		bet = 10,
		prop = 'vw_prop_casino_slot_04a',
		prop1 = 'vw_prop_casino_slot_04a_reels',
		prop2 = 'vw_prop_casino_slot_04b_reels',
	},
	[18] = { -- Fame or Shame
		pos = vector3(996.15, 40.64, 70.96), -- done
		SlotName = "Fame or Shame",
		bet = 10,
		prop = 'vw_prop_casino_slot_04a',
		prop1 = 'vw_prop_casino_slot_04a_reels',
		prop2 = 'vw_prop_casino_slot_04b_reels',
	},
	[19] = { -- Fame or Shame
		pos = vector3(998.57, 38.52, 70.96), -- done
		SlotName = "Fame or Shame",
		bet = 10,
		prop = 'vw_prop_casino_slot_04a',
		prop1 = 'vw_prop_casino_slot_04a_reels',
		prop2 = 'vw_prop_casino_slot_04b_reels',
	},
	[20] = { -- Deity of the sun
		pos = vector3(982.65, 48.48, 71.16), -- done
		SlotName = "Deity of the Sun",
		bet = 12,
		prop = 'vw_prop_casino_slot_05a',
		prop1 = 'vw_prop_casino_slot_05a_reels',
		prop2 = 'vw_prop_casino_slot_05b_reels',
	},
	[21] = { -- Deity of the sun
		pos = vector3(984.27, 47.38, 71.16), -- done
		SlotName = "Deity of the Sun",
		bet = 12,
		prop = 'vw_prop_casino_slot_05a',
		prop1 = 'vw_prop_casino_slot_05a_reels',
		prop2 = 'vw_prop_casino_slot_05b_reels',
	},
	[22] = { -- Deity of the sun
		pos = vector3(992.12, 47.76, 71.16), -- done
		SlotName = "Deity of the Sun",
		bet = 12,
		prop = 'vw_prop_casino_slot_05a',
		prop1 = 'vw_prop_casino_slot_05a_reels',
		prop2 = 'vw_prop_casino_slot_05b_reels',
	},
	[23] = { -- Deity of the sun
		pos = vector3(995.35, 49.49, 71.16), -- done
		SlotName = "Deity of the Sun",
		bet = 12,
		prop = 'vw_prop_casino_slot_05a',
		prop1 = 'vw_prop_casino_slot_05a_reels',
		prop2 = 'vw_prop_casino_slot_05b_reels',
	},
	[24] = { -- Deity of the sun
		pos = vector3(994.23, 46.17, 71.16), -- done
		SlotName = "Deity of the Sun",
		bet = 12,
		prop = 'vw_prop_casino_slot_05a',
		prop1 = 'vw_prop_casino_slot_05a_reels',
		prop2 = 'vw_prop_casino_slot_05b_reels',
	},
	[25] = { -- Deity of the sun
		pos = vector3(998.89, 37.6, 71.16), -- done
		SlotName = "Deity of the Sun",
		bet = 12,
		prop = 'vw_prop_casino_slot_05a',
		prop1 = 'vw_prop_casino_slot_05a_reels',
		prop2 = 'vw_prop_casino_slot_05b_reels',
	},
	[26] = { -- Deity of the sun
		pos = vector3(996.65, 38.95, 71.16), -- done
		SlotName = "Deity of the Sun",
		bet = 12,
		prop = 'vw_prop_casino_slot_05a',
		prop1 = 'vw_prop_casino_slot_05a_reels',
		prop2 = 'vw_prop_casino_slot_05b_reels',
	},
	[27] = { -- Twlight Knife
		pos = vector3(983.46, 49.02, 71.21), -- done
		SlotName = "Twlight Knife",
		bet = 1,
		prop = 'vw_prop_casino_slot_06a',
		prop1 = 'vw_prop_casino_slot_06a_reels',
		prop2 = 'vw_prop_casino_slot_06b_reels',
	},
	[28] = { -- Twlight Knife
		pos = vector3(990.62, 46.72, 71.21), -- done
		SlotName = "Twlight Knife",
		bet = 1,
		prop = 'vw_prop_casino_slot_06a',
		prop1 = 'vw_prop_casino_slot_06a_reels',
		prop2 = 'vw_prop_casino_slot_06b_reels',
	},
	[29] = { -- Twlight Knife
		pos = vector3(996.22, 49.17, 71.21), -- done
		SlotName = "Twlight Knife",
		bet = 1,
		prop = 'vw_prop_casino_slot_06a',
		prop1 = 'vw_prop_casino_slot_06a_reels',
		prop2 = 'vw_prop_casino_slot_06b_reels',
	},
	[30] = { -- Twlight Knife
		pos = vector3(995.34, 37.83, 71.21), -- done
		SlotName = "Twlight Knife",
		bet = 1,
		prop = 'vw_prop_casino_slot_06a',
		prop1 = 'vw_prop_casino_slot_06a_reels',
		prop2 = 'vw_prop_casino_slot_06b_reels',
	},
	[31] = { -- Diamond Miner
		pos = vector3(983.89, 49.83, 71.34), -- done	
		SlotName = "Diamond Miner",
		bet = 25,								
		prop = 'vw_prop_casino_slot_07a',			
		prop1 = 'vw_prop_casino_slot_07a_reels',	
		prop2 = 'vw_prop_casino_slot_07b_reels',	
	},
	[32] = { -- Diamond Miner
		pos = vector3(989.2, 47.69, 71.04),	-- done
		SlotName = "Diamond Miner",
		bet = 25,								
		prop = 'vw_prop_casino_slot_07a',			
		prop1 = 'vw_prop_casino_slot_07a_reels',	
		prop2 = 'vw_prop_casino_slot_07b_reels',	
	},
	[33] = { -- Diamond Miner
		pos = vector3(997.15, 49.39, 71.04), -- done	
		SlotName = "Diamond Miner",
		bet = 25,								
		prop = 'vw_prop_casino_slot_07a',			
		prop1 = 'vw_prop_casino_slot_07a_reels',	
		prop2 = 'vw_prop_casino_slot_07b_reels',	
	},
	[34] = { -- Diamond Miner
		pos = vector3(993.94, 38.79, 71.04), -- done	
		SlotName = "Diamond Miner",
		bet = 25,								
		prop = 'vw_prop_casino_slot_07a',			
		prop1 = 'vw_prop_casino_slot_07a_reels',	
		prop2 = 'vw_prop_casino_slot_07b_reels',	
	},
	[35] = { -- Evacuator
		pos = vector3(984.4, 50.61, 71.14), -- done
		SlotName = "Evacuator",
		bet = 50,
		prop = 'vw_prop_casino_slot_08a',
		prop1 = 'vw_prop_casino_slot_08a_reels',
		prop2 = 'vw_prop_casino_slot_08b_reels',
	},
	[36] = { -- Evacuator
		pos = vector3(989.6, 49.39, 71.14), -- done
		SlotName = "Evacuator",
		bet = 50,
		prop = 'vw_prop_casino_slot_08a',
		prop1 = 'vw_prop_casino_slot_08a_reels',
		prop2 = 'vw_prop_casino_slot_08b_reels',
	},
	[37] = { -- Evacuator
		pos = vector3(989.71, 49.27, 71.14), -- done
		SlotName = "Evacuator",
		bet = 50,
		prop = 'vw_prop_casino_slot_08a',
		prop1 = 'vw_prop_casino_slot_08a_reels',
		prop2 = 'vw_prop_casino_slot_08b_reels',
	},
	[38] = { -- Evacuator
		pos = vector3(994.38, 40.4, 71.14), -- done
		SlotName = "Evacuator",
		bet = 50,
		prop = 'vw_prop_casino_slot_08a',
		prop1 = 'vw_prop_casino_slot_08a_reels',
		prop2 = 'vw_prop_casino_slot_08b_reels',
	},
	[39] = { -- Evacuator
		pos = vector3(1017.39, 51.25, 69.94), -- done
		SlotName = "Evacuator",
		bet = 50,
		prop = 'vw_prop_casino_slot_08a',
		prop1 = 'vw_prop_casino_slot_08a_reels',
		prop2 = 'vw_prop_casino_slot_08b_reels',
	},
	[40] = { -- Impotent Rage
		pos = vector3(1018.34, 46.23, 69.5), -- done
		SlotName = "Impotent Rage",
		bet = 15,
		prop = 'vw_prop_casino_slot_02a',
		prop1 = 'vw_prop_casino_slot_02a_reels',
		prop2 = 'vw_prop_casino_slot_02b_reels',
	},
	[41] = { -- Republican Space rangers
		pos = vector3(1018.86, 47.07, 70.11), -- done
		SlotName = "Republican Space Rangers",
		bet = 5,
		prop = 'vw_prop_casino_slot_03a',
		prop1 = 'vw_prop_casino_slot_03a_reels',
		prop2 = 'vw_prop_casino_slot_03b_reels',
	},
	[42] = { -- Fame or Shame
		pos = vector3(1018.93, 47.95, 69.81), -- done
		SlotName = "Fame or Shame",
		bet = 10,
		prop = 'vw_prop_casino_slot_04a',
		prop1 = 'vw_prop_casino_slot_04a_reels',
		prop2 = 'vw_prop_casino_slot_04b_reels',
	},
	[43] = { -- Deity of the sun
		pos = vector3(1018.91, 48.92, 70.01), -- done
		SlotName = "Deity of the Sun",
		bet = 12,
		prop = 'vw_prop_casino_slot_05a',
		prop1 = 'vw_prop_casino_slot_05a_reels',
		prop2 = 'vw_prop_casino_slot_05b_reels',
	},
	[44] = { -- Twlight Knife
		pos = vector3(1018.61, 49.77, 69.86), -- done
		SlotName = "Twlight Knife",
		bet = 1,
		prop = 'vw_prop_casino_slot_06a',
		prop1 = 'vw_prop_casino_slot_06a_reels',
		prop2 = 'vw_prop_casino_slot_06b_reels',
	},
	[45] = { -- Diamond Miner
		pos = vector3(1017.96, 50.55, 70.09), -- done	
		SlotName = "Diamond Miner",
		bet = 25,								
		prop = 'vw_prop_casino_slot_07a',			
		prop1 = 'vw_prop_casino_slot_07a_reels',	
		prop2 = 'vw_prop_casino_slot_07b_reels',	
	},
}