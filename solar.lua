local Players = game:GetService("Players") 
local Player = Players.LocalPlayer 
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui") 
ScreenGui.Name = "SolarDevUI_Mobile" 
ScreenGui.ResetOnSpawn = false 
ScreenGui.Parent = PlayerGui

-- Marco Principal (Tamaño adaptado para Mobile)
local Main = Instance.new("Frame") 
Main.Size = UDim2.new(0.85, 0, 0.75, 0) -- Ocupa el 85% de ancho y 75% de alto de la pantalla
Main.Position = UDim2.new(0.075, 0, 0.125, 0) 
Main.BackgroundColor3 = Color3.fromRGB(12,12,12) 
Main.BorderSizePixel = 0 
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local Stroke = Instance.new("UIStroke") 
Stroke.Color = Color3.fromRGB(255,196,0) 
Stroke.Thickness = 1 
Stroke.Parent = Main

-- Título
local Title = Instance.new("TextLabel") 
Title.BackgroundTransparency = 1 
Title.Size = UDim2.new(1, 0, 0.12, 0) 
Title.Text = "★ SOLAR DEV." 
Title.TextColor3 = Color3.fromRGB(255,255,255) 
Title.Font = Enum.Font.GothamBold 
Title.TextSize = 16 
Title.Parent = Main

-- Sidebar Scrollable para Mobile (Permite deslizar las opciones)
local Sidebar = Instance.new("ScrollingFrame") 
Sidebar.Size = UDim2.new(0.3, 0, 0.84, 0) 
Sidebar.Position = UDim2.new(0.03, 0, 0.13, 0) 
Sidebar.BackgroundTransparency = 1 
Sidebar.ScrollBarThickness = 2
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
Sidebar.Parent = Main

local Layout = Instance.new("UIListLayout") 
Layout.Padding = UDim.new(0, 5) 
Layout.Parent = Sidebar

local tabs = { 
    "Discord", 
    "Reach", 
    "Body Parts Reach", 
    "Reacts", 
    "Gamepasses", 
    "Helpers", 
    "Miscellaneous", 
    "Troll", 
    "Skyes" 
}

for _, name in ipairs(tabs) do 
    local b = Instance.new("TextButton") 
    b.Size = UDim2.new(0.95, 0, 0, 32) 
    b.BackgroundColor3 = Color3.fromRGB(20,20,20) 
    b.Text = "★ " .. name 
    b.TextColor3 = Color3.fromRGB(255,255,255) 
    b.Font = Enum.Font.Gotham 
    b.TextSize = 11 
    b.TextScaled = true
    b.Parent = Sidebar

    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)

    local s = Instance.new("UIStroke")
    s.Color = Color3.fromRGB(255,196,0)
    s.Thickness = 1
    s.Parent = b
end

-- Contenedor Principal de Opciones con Scroll
local Content = Instance.new("ScrollingFrame") 
Content.Position = UDim2.new(0.36, 0, 0.13, 0) 
Content.Size = UDim2.new(0.61, 0, 0.84, 0) 
Content.BackgroundTransparency = 1 
Content.ScrollBarThickness = 2
Content.CanvasSize = UDim2.new(0, 0, 0, 0)
Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
Content.Parent = Main

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 6)
ContentLayout.Parent = Content

local function CreateOption(text) 
    local holder = Instance.new("Frame") 
    holder.Size = UDim2.new(0.98, 0, 0, 36) 
    holder.BackgroundColor3 = Color3.fromRGB(18,18,18) 
    holder.Parent = Content

    Instance.new("UICorner", holder).CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255,196,0)
    stroke.Thickness = 1
    stroke.Parent = holder

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.Text = text
    label.TextColor3 = Color3.new(1,1,1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = holder

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 45, 0, 20)
    toggle.Position = UDim2.new(1, -52, 0.5, -10)
    toggle.Text = "OFF"
    toggle.BackgroundColor3 = Color3.fromRGB(35,35,35)
    toggle.TextColor3 = Color3.new(1,1,1)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 9
    toggle.Parent = holder

    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)

    local enabled = false

    toggle.MouseButton1Click:Connect(function()
        enabled = not enabled

        if enabled then
            toggle.Text = "ON"
            toggle.BackgroundColor3 = Color3.fromRGB(255,196,0)
            toggle.TextColor3 = Color3.new(0,0,0)
        else
            toggle.Text = "OFF"
            toggle.BackgroundColor3 = Color3.fromRGB(35,35,35)
            toggle.TextColor3 = Color3.new(1,1,1)
        end
    end)
end

-- Opciones del menú
CreateOption("Save React") 
CreateOption("Kick React") 
CreateOption("Shot React") 
CreateOption("Dribble React") 
CreateOption("Flick React")

