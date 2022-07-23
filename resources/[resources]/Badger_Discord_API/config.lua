Config = {
	Guild_ID = '999095447513747526', -- Set to the ID of your guild (or your Primary guild if using Multiguild)
  Multiguild = false, -- Set to true if you want to use multiple guilds
  Guilds = {
    ["name"] = "guild_id", -- Replace this with a name, like "main"
  },
	Bot_Token = 'MTAwMDQ2MTI2NTUwNTg5NDYwMg.GyVTMs.N2XRIKT60PxWorNLn6-l5VRJp6D4iTPqn_Pi5s',
	RoleList = {
        ['👑 〣  Owner'] = 999095447593435291
		['👦 〣 Civilian'] = 999095447530512461
		['🎆 〣  Admin'] = 999095447580840024
   
	},
	CacheDiscordRoles = true, -- true to cache player roles, false to make a new Discord Request every time
	CacheDiscordRolesTime = 60, -- if CacheDiscordRoles is true, how long to cache roles before clearing (in seconds)
}

Config.Splash = {
	Header_IMG = 'https://forum.cfx.re/uploads/default/original/3X/a/6/a6ad03c9fb60fa7888424e7c9389402846107c7e.png',
	Enabled = true,
	Wait = 10, -- How many seconds should splash page be shown for? (Max is 12)
	Heading1 = "Welcome to [ServerName]",
	Heading2 = "Make sure to join our Discord and check out our website!",
	Discord_Link = 'https://discord.gg',
	Website_Link = 'https://badger.store',
}