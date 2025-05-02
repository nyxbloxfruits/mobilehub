-- MobileHub - Painel Estilo Redz (100% personalizado)
repeat wait() until game:IsLoaded()

local MobileHub = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local FarmTab = Instance.new("Frame")
local FarmToggle = Instance.new("TextButton")
local Status = Instance.new("TextLabel")
local Dropdown = Instance.new("TextBox")

MobileHub.Name = "MobileHub"
MobileHub.Parent = game.CoreGui
MobileHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = MobileHub
Main.BackgroundColor3 = Color3.fromRGB(40, 0, 65)
Main.Position = UDim2.new(0.3, 0, 0.3, 0)
Main.Size = UDim2.new(0, 300, 0, 250)
Main.Active = true
Main.Draggable = true

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(25, 0, 40)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "MobileHub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

FarmTab.Name = "FarmTab"
FarmTab.Parent = Main
FarmTab.Position = UDim2.new(0, 0, 0, 30)
FarmTab.Size = UDim2.new(1, 0, 1, -30)

FarmToggle.Name = "FarmToggle"
FarmToggle.Parent = FarmTab
FarmToggle.Position = UDim2.new(0.1, 0, 0.1, 0)
FarmToggle.Size = UDim2.new(0.8, 0, 0.2, 0)
FarmToggle.Text = "Ativar Farm"
FarmToggle.BackgroundColor3 = Color3.fromRGB(85, 0, 130)
FarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmToggle.Font = Enum.Font.Gotham
FarmToggle.TextSize = 14

Status.Name = "Status"
Status.Parent = FarmTab
Status.Position = UDim2.new(0.1, 0, 0.7, 0)
Status.Size = UDim2.new(0.8, 0, 0.2, 0)
Status.Text = "Status: Desligado"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1
Status.Font = Enum.Font.Gotham
Status.TextSize = 14

Dropdown.Name = "Dropdown"
Dropdown.Parent = FarmTab
Dropdown.Position = UDim2.new(0.1, 0, 0.4, 0)
Dropdown.Size = UDim2.new(0.8, 0, 0.2, 0)
Dropdown.PlaceholderText = "Escolha o NPC (ex: Bandit)"
Dropdown.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
Dropdown.Font = Enum.Font.Gotham
Dropdown.TextSize = 14

-- Variáveis para controle
local farming = false
local selectedNPC = ""

FarmToggle.MouseButton1Click:Connect(function()
    farming = not farming
    FarmToggle.Text = farming and "Desativar Farm" or "Ativar Farm"
    Status.Text = farming and "Status: Farmando..." or "Status: Desligado"
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if farming and selectedNPC ~= "" then
        for _, mob in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if mob.Name == selectedNPC and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                repeat
                    pcall(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                    end)
                    wait(0.2)
                until not mob or mob.Humanoid.Health <= 0 or not farming
            end
        end
    end
end)
