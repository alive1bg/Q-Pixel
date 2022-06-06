local Translations = {
    error = {
        ["k9_alert"] = "Dog did not alert",
        ["k9_toofar"] = " Is too far away!",
        ["k9_locaterror"] = " Unable to locate people..",
        ["k9_vehlocate"] = " Unable to locate vehicle..",
        ["k9_returnerror"] = "You returned the K9 Unit!",
    },
    success = {
        ["k9_alert"] = "Dog Alerted!",
    },
    info = {
        ["k9_name"] = "Your dog",
        ["k9_searching"] = " is searching..",
        ["k9_scent"] = " found a scent..",
        ["k9_nofollow"] = " is no longer tracking..",
        ["k9_lostscent"] = " lost the scent..",
        ["k9_purchase"] = "Patrol Dog",
        ["k9_return"] = "You returned the K9 Unit!",
    },
    menu = {
        ["purchase_header"] = "🐶 | Police K9 Menu",
        ["k9_takeout"] = "🐕‍🦺 | Take out K9",
        ["takeout_txt"] = "Here you can take out one of departments avaible dogs",
        ["k9_return"] = "🐕 | Return K9",
        ["return_txt"] = "Here you can return one of the departments K9 Dogs",
        ["k9_commands"] = "Police K9 Commands",
        ["k9_sit"] = "🔈| K9 Sit",
        ["k9_sittxt"] = "Make your K9 Dog Sit",
        ["k9_lay"] = "🔈| K9 Lay Down",
        ["k9_laytxt"] = "Make your K9 Dog Lay Down",
        ["k9_carsearch"] = "🚗 | K9 Search Car",
        ["k9_carsearchtxt"] = "Make your K9 search nearby car",
        ["k9_enterveh"] = "🚘 | Put K9 in vehicle",
        ["k9_entervehtxt"] = "Tell your K9 to enter vehicle",
        ["k9_searchp"] = "🧍 | K9 Search Person",
        ["k9_searchptxt"] = "Make your K9 search nearby person",
        ["k9_area"] = "🌍 | K9 Search Area",
        ["k9_areatxt"] = "Make your K9 search area",
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})