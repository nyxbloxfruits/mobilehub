--[[
    MobileHub v1.0
    Script leve para Blox Fruits
    Interface estilo Redz | Feito para funcionar em celular
    Criado por: nyxbloxfruits
]]

repeat task.wait() until game:IsLoaded()

-- Proteção contra kick simples
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local args = {...}
        if getnamecallmethod() == "Kick" then
            return nil
        end
        return old(self, unpack(args))
    end)
end)

-- UI Library (Redz Style Simplificado)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconHax/ui/main/simple.lua"))()
local Window = Library:Window("MobileHub", Color3.fromRGB(255, 87, 87), Enum.KeyCode.RightControl)

-- Variáveis
local SelectedMob = nil
local AutoFarm = false
local AutoChest = false
local UseFastAttack = true
local UseHaki = true
local BringMobs = true

-- Funções úteis
function getNearestMob(name)
    for _, mob in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if mob.Name == name and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
            return mob
        end
    end
end

function toTarget(pos)
    local ply = game.Players.LocalPlayer
    if ply.Character and ply.Character:FindFirstChild("HumanoidRootPart") then
        ply.Character.HumanoidRootPart.CFrame = pos
    end
end

function attackTarget(target)
    if UseFastAttack and target and target:FindFirstChild("HumanoidRootPart") then
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            for i = 1, 3 do
                tool:Activate()
                wait(0.15)
            end
        end
    end
end

-- Farm Loop
spawn(function()
    while task.wait(0.5) do
        if AutoFarm and SelectedMob then
            local mob = getNearestMob(SelectedMob)
            if mob then
                if UseHaki then
                    pcall(function()
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "J", false, game)
                    end)
                end
                if BringMobs then
                    toTarget(mob.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0))
                else
                    toTarget(mob.HumanoidRootPart.CFrame + Vector3.new(5, 5, 5))
                end
                attackTarget(mob)
            end
        end
    end
end)

-- Farm de Baús
spawn(function()
    while task.wait(1) do
        if AutoChest then
            for _, chest in pairs(game:GetService("Workspace"):GetDescendants()) do
                if chest:IsA("TouchTransmitter") and chest.Parent and chest.Parent:IsA("Model") and chest.Parent:FindFirstChild("TouchInterest") then
                    toTarget(chest.Parent.CFrame + Vector3.new(0, 2, 0))
                    wait(0.7)
                end
            end
        end
    end
end)

-- Aba de Farm
local farmTab = Window:Tab("Farm", "rbxassetid://11446959774")
farmTab:Dropdown("Escolher NPC", {
    "Bandit",
    "Monkey",
    "Gorilla",
    "Pirate",
    "Brute"
}, function(v)
    SelectedMob = v
end)

farmTab:Toggle("Ativar Farm", false, function(v)
    AutoFarm = v
end)

-- Aba de Baús
local chestTab = Window:Tab("Baús", "rbxassetid://6031091002")
chestTab:Toggle("Farm de Baús", false, function(v)
    AutoChest = v
end)

-- Aba de Configurações
local configTab = Window:Tab("Configurações", "rbxassetid://6034509993")
configTab:Toggle("Usar Haki", true, function(v)
    UseHaki = v
end)

configTab:Toggle("Fast Attack", true, function(v)
    UseFastAttack = v
end)

configTab:Toggle("Juntar Mobs", true, function(v)
    BringMobs = v
end)
