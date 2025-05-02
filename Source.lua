repeat wait() until game:IsLoaded()
if game.PlaceId ~= 2753915549 and game.PlaceId ~= 4442272183 and game.PlaceId ~= 7449423635 then return end

_G.MobileHub_Config = {
    JoinTeam = "Pirates",
    Translator = true,
    Owner = "nyxbloxfruits",
    HubName = "MobileHub"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/main/Source.luau"))(_G.MobileHub_Config)
