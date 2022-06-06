local Translations = {
    error = {
        ["k9_alert"] = "Hunden gav ikke tegn",
        ["k9_toofar"] = " Er for for langt væk!",
        ["k9_locaterror"] = " Kunne ikke finde nogen!",
        ["k9_vehlocate"] = " Kunne ikke finde nogen biler!",
        ["k9_returnerror"] = "Der er ingenting at returnere",
    },
    success = {
        ["k9_alert"] = "Hunden Gav Tegn!",
    },
    info = {
        ["k9_name"] = "Renewed Scripts",
        ["k9_searching"] = " Leder efter kontrabande",
        ["k9_scent"] = " kan dufte noget..",
        ["k9_nofollow"] = " kunne ikke længere finde personen..",
        ["k9_lostscent"] = " mistede duften..",
        ["k9_purchase"] = "Patrulje Hund",
        ["k9_return"] = "Du returneret Politihunden!",
    },
    menu = {
        ["purchase_header"] = "🐶 | Politi K9 Menu",
        ["k9_takeout"] = "🐕‍🦺 | Tag en K9 ud",
        ["takeout_txt"] = "Her kan du tage en af politihundene ud!",
        ["k9_return"] = "🐕 | Returner K9 hund",
        ["return_txt"] = "Her kan du returnere en af Politi k9 hundene!",
        ["k9_commands"] = "Politi k9 Kommandoer",
        ["k9_sit"] = "🔈| K9 Sit",
        ["k9_sittxt"] = "Få hunden til at sætte sig",
        ["k9_lay"] = "🔈| K9 Læg Dig",
        ["k9_laytxt"] = "Få hunden til at lægge sig ned",
        ["k9_carsearch"] = "🚗 | K9 Søg Bilen",
        ["k9_carsearchtxt"] = "Få din hund til at søge den tætteste bil!",
        ["k9_enterveh"] = "🚘 | Put k9 hunden I bilen!",
        ["k9_entervehtxt"] = "Få din k9 hund til at hoppe ind eller ud af bilen!",
        ["k9_searchp"] = "🧍 | K9 Søg Person",
        ["k9_searchptxt"] = "Få din K9 Hund til at søge den nærmeste person",
        ["k9_area"] = "🌍 | K9 Søg Område",
        ["k9_areatxt"] = "Få din K9 hund til at søge området",
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})