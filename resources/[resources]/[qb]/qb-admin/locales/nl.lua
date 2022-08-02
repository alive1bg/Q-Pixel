local Translations = {
    logs = {
        no_type =  "Geen type gevonden.",
        no_steam =  "Geen steam gevonden.",
        no_desc =  "Geen beschrijving gevonden.",
        no_date =  "Geen datum gevonden.",
        no_cid =  "Geen cid gevonden.",
        no_data =  "Niets",
    },
    bans = {
        unbanned = "Je hebt de speler succesvol geunbanned.",
        not_banned = "Er is iets misgegaan.. Deze persoon is niet verbannen.",
        already_banned = "%{player} is al verbannen voor %{reason}",
        success_banned = "%{player} succesvol verbannen voor %{reason}.",
        perm_banned = "\n🔰 Je bent permanent verbannen. \n🛑 Reden: %{reason}",
        banned = "\n🔰 Je bent verbannen. \n🛑 Reden: %{reason} \n\n⏰Ban vervalt op %{expires}",
    },
    info = {
        keymapping_desc = "Open Admin Menu",
        reset_data = "Reset alle admin menu gegevens",
        announcement = "MEDEDELING",
        kicked = "Speler succesvol gekicked.",
        got_kicked = "\n🛑 Je bent gekicked van de server! \n🛑 Reden: %{reason}", 
        gaveitem = "Succesvol x%{amount} van %{name} gegeven aan speler.",
        setjob = "Succesvol spelers baan ingesteld op %{jobname}.",
        teleportedto = "naar speler geteleporteerd",
        teleportedbrought = "speler gebracht",
        teleported = "Succesvol %{tpmsg}.",
        gave_needs = "Succesvol voedsel en water gegeven aan speler.",
        removed_stress = "Succesvol stres weggehaald van speler.",
        gave_armor = "Succesvol armor gegeven aan speler.",
        revived = "Succesvol speler gerevived.",
        gave_clothing = "Succesvol kleding menu gegeven aan speler.",
    },
    actions = {
        health = 'Health',
        armor = 'Armor',
        enabled = 'Ingeschakeld.',
        disabled = 'Uitgeschakeld.',
        faster = 'Sneller',
        slower = 'Trager',
        fwdback = "Voor/Achter",
        leftright = "Links/Rechts",
        down = "Omlaag",
        up = "Omhoog",
    },
    spectate = {
        not_found = "Speler niet gevonden, spectate verlaten..",
        self = "Je kan jezelf niet spectaten..'",
        stopped_not_found = "Gestopt met spectaten, speler niet gevonden..",
        stopped = "Gestopt met %{player} spectaten.",
        started = "SGestopt met %{player} spectaten.",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})