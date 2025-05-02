-- Código do menu MobileHub (estilo Redz, com nome MobileHub e autoria personalizada)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconHax/ui/main/simple.lua"))()

local Window = Library:Window("MobileHub", Color3.fromRGB(255, 87, 87), Enum.KeyCode.RightControl)

-- Funções do MobileHub
local FarmTab = Window:Tab("Farm", "rbxassetid://11446959774")
FarmTab:Button("Ativar Farm", function()
    -- Farm NPC Code (depois vou adicionar)
end)

FarmTab:Button("Ativar Farm de Baús", function()
    -- Baú Farm Code (depois vou adicionar)
end)

local ConfigTab = Window:Tab("Configurações", "rbxassetid://6034509993")
ConfigTab:Toggle("Usar Fast Attack", true, function(value)
    -- Fast Attack Code (depois vou adicionar)
end)

ConfigTab:Toggle("Haki Ativado", true, function(value)
    -- Haki Code (depois vou adicionar)
end)

-- Funções de teleporte e outros comandos podem ser colocadas aqui também
