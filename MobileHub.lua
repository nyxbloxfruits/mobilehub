--[[
    MobileHub v2
    Menu leve estilo Redz (sem biblioteca externa)
    Criado por: nyxbloxfruits
]]

repeat task.wait() until game:IsLoaded()

-- Proteção contra kick
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

-- Interface simples embutida
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "MobileHub"

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 270, 0, 300)
Main.Position = UDim2.new(0.5, -135, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Main.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Main)
Title.Text = "MobileHub"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 87, 87)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22

local Dropdown = Instance.new("TextBox", Main)
Dropdown.PlaceholderText = "Nome do NPC (ex: Bandit)"
Dropdown.Size = UDim2.new(1, -20, 0, 30)
Dropdown.Position = UDim2.new(0, 10, 0, 50)
Dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Dropdown.TextColor3 = Color3.new(1, 1, 1)
Dropdown.TextSize = 14

local Toggle = Instance.new("TextButton", Main)
Toggle.Text = "Iniciar Farm"
Toggle.Size = UDim2.new(1, -20, 0, 35)
Toggle.Position = UDim2.new(0, 10, 0, 90)
Toggle.BackgroundColor3 = Color3.fromRGB(255, 87, 87)
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 16
Toggle.Font = Enum.Font.GothamBold

-- Variáveis
local farming = false
local selectedNPC = ""
local player = game.Players.LocalPlayer

-- Farm simples
Toggle.MouseButton1Click:Connect(function()
    farming = not farming
    Toggle.Text = farming and "Parar Farm" or "Iniciar Farm"
    selectedNPC = Dropdown.Text
end)

spawn(function()
    while task.wait(0.5) do
        if farming and selectedNPC ~= "" then
            for _, mob in pairs(workspace.Enemies:GetChildren()) do
                if mob.Name == selectedNPC and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    pcall(function()
                        -- Teleportar e atacar
                        local char = player.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                        end

                        local tool = char and char:FindFirstChildOfClass("Tool")
                        if tool then
                            tool:Activate()
                        end
                    end)
                    wait(0.5)
                end
            end
        end
    end
end
