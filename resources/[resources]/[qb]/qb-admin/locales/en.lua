local Translations = {
    logs = {
        no_type =  "No type found.",
        no_steam =  "No steam found.",
        no_desc =  "No description found.",
        no_date =  "No date found.",
        no_cid =  "No cid found.",
        no_data =  "None",
    },
    bans = {
        unbanned = "You successfully unbanned the player.",
        not_banned = "Something went wrong.. This person is not banned.",
        already_banned = "%{player} is already banned for %{reason}",
        success_banned = "Successfully banned %{player} for %{reason}.",
        perm_banned = "\n🔰 You are permanently banned. \n🛑 Reason: %{reason}",
        banned = "\n🔰 You are banned. \n🛑 Reason: %{reason} \n\n⏰Ban expires on %{expires}",
    },
    info = {
        keymapping_desc = "Open Admin Menu",
        reset_data = "Reset All Admin menu data",
        announcement = "ANNOUNCEMENT",
        kicked = "Successfully kicked player.",
        got_kicked = "\n🛑 You got kicked from the server! \nReason: %{reason}", 
        gaveitem = "Successfully gave player x%{amount} of %{name}.",
        setjob = "Successfully set player's job as %{jobname}.",
        teleportedto = "teleported to",
        teleportedbrought = "brought",
        teleported = "Successfully %{tpmsg} player.",
        gave_needs = "Successfully gave player food and water.",
        removed_stress = "Successfully removed stress of player.",
        gave_armor = "Successfully gave player armor.",
        revived = "Successfully revived player.",
        gave_clothing = "Successfully gave player clothing menu.",
    },
    actions = {
        health = 'Health',
        armor = 'Armor',
        enabled = 'Enabled.',
        disabled = 'Disabled.',
        faster = 'Faster',
        slower = 'Slower',
        fwdback = "Fwd/Back",
        leftright = "Left/Right",
        down = "Down",
        up = "Up",
    },
    spectate = {
        not_found = "Player not found, leaving spectate..",
        self = "You can\'t spectate yourself..",
        stopped_not_found = "Stopped spectating, could not find player..",
        stopped = "Stopped spectating %{player}",
        started = "Started spectating %{player}",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})