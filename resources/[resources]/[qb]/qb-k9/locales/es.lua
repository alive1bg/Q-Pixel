local Translations = {
    error = {
        ["k9_alert"] = "Perro canino no alerto!",
        ["k9_toofar"] = "Esta muy lejo!",
        ["k9_locaterror"] = "No se pudo encontrar delincuentes!",
        ["k9_vehlocate"] = "No se pudo encontrar el carro.",
        ["k9_returnerror"] = "Has devuelto la unidad canina.,
    },
    success = {
        ["k9_alert"] = "Unidad canina alterto!",
    },
    info = {
        ["k9_name"] = "Renewed Scripts",
        ["k9_searching"] = "esta buscando...",
        ["k9_scent"] = "encontro un olor...",
        ["k9_nofollow"] = "ya no esta rastreando..",
        ["k9_lostscent"] = "perdido el olor...",
          ["k9_purchase"] = "Unidad Canina",
        ["k9_return"] = "Devolviste la unidad canina",
    },
    menu = {
        ["purchase_header"] = "🐶 | Unidad Canina Policia",
        ["k9_takeout"] = "🐕‍🦺 | Sacar Unidad Canina",
        ["takeout_txt"] = "Aqui puedes sacar un perro canino",
        ["k9_return"] = "🐕 | Devolver K9",
        ["return_txt"] = "Aqui puedes devolver el perro canino",
        ["k9_commands"] = "Comandos",
        ["k9_sit"] = "🔈| K9 Sentarse",
        ["k9_sittxt"] = "Haz que tu perro K9 se siente",
        ["k9_lay"] = "🔈| K9 Acuestarse",
        ["k9_laytxt"] = "Haz que tu perro K9 se acueste",
        ["k9_carsearch"] = "🚗 | K9 Buscar auto",
        ["k9_carsearchtxt"] = "Haz que tu K9 busque un coche cercano",
        ["k9_enterveh"] = "🚘 | Poner K9 en el vehiculo",
        ["k9_entervehtxt"] = "Decir a K9 que entre al vehiculo",
        ["k9_searchp"] = "🧍 | K9 Buscar Persona",
        ["k9_searchptxt"] = "Haz que tu K9 busque a las personas cercanas",
        ["k9_area"] = "🌍 | K9 Buscar el Area",
        ["k9_areatxt"] = "Haz que tu perro busque en la zona",
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
