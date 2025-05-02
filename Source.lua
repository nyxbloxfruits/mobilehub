repeat wait() until game:IsLoaded()

if game.PlaceId ~= 2753915549 and game.PlaceId ~= 4442272183 and game.PlaceId ~= 7449423635 then
    return
end

getgenv().MobileHub_Config = {
    JoinTeam = "Pirates", -- Pirates ou Marines
    Translator = true,
    HubName = "MobileHub",
    Creator = "nyxbloxfruits"
}

-- Menu baseado no estilo Redz, mas com nome e autoria personalizados
loadstring(game:HttpGet("https://raw.githubusercontent.com/nyxbloxfruits/MobileHub/main/Core/MobileUI.lua"))()
