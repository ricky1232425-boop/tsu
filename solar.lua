local Players = game:GetService("Players") 
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer 
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Crear ScreenGui
local ScreenGui = Instance.new("ScreenGui") 
ScreenGui.Name = "SolarDevUI_Mobile" 
ScreenGui.ResetOnSpawn = false 
ScreenGui.Parent = PlayerGui

-- Marco Principal
local Main = Instance.new("Frame") 
Main.Size = UDim2.new(0.8, 0, 0.7, 0) 
Main.Position = UDim2.new(0.1, 0, 0.15, 0) 
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
Title.Size = UDim2.new(0.7, 0, 0.12, 0) 
Title.Position = UDim2.new(0.03, 0, 0, 0)
Title.Text = "★ SOLAR DEV." 
Title.TextColor3 = Color3.fromRGB(255,255,255) 
Title.Font = Enum.Font.GothamBold 
Title.TextSize = 14 
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

-- Contenedor de Botones Superiores (Minimizar y Cerrar)
local TopButtons = Instance.new("Frame")
TopButtons.BackgroundTransparency = 1
TopButtons.Size = UDim2.new(0.25, 0, 0.12, 0)
TopButtons.Position = UDim2.new(0.73, 0, 0, 0)
TopButtons.Parent = Main

-- Botón Minimizar (-)
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0.45, 0, 0.8, 0)
MinimizeBtn.Position = UDim2.new(0, 0, 0.1, 0)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 14
MinimizeBtn.Parent = TopButtons
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 4)

-- Botón Cerrar (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0.45, 0, 0.8, 0)
CloseBtn.Position = UDim2.new(0.55, 0, 0.1, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
CloseBtn.Parent = TopButtons
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

-- Sidebar (Menú Lateral)
local Sidebar = Instance.new("ScrollingFrame") 
Sidebar.Size = UDim2.new(0.3, 0, 0.83, 0) 
Sidebar.Position = UDim2.new(0.03, 0, 0.13, 0) 
Sidebar.BackgroundTransparency = 1 
Sidebar.ScrollBarThickness = 2
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
Sidebar.Parent = Main

local SidebarLayout = Instance.new("UIListLayout") 
SidebarLayout.Padding = UDim.new(0, 4) 
SidebarLayout.Parent = Sidebar

-- Contenedor de Páginas
local PagesFolder = Instance.new("Frame")
PagesFolder.Name = "Pages"
PagesFolder.Position = UDim2.new(0.35, 0, 0.13, 0)
PagesFolder.Size = UDim2.new(0.62, 0, 0.83, 0)
PagesFolder.BackgroundTransparency = 1
PagesFolder.Parent = Main

-- Función para Crear Opciones (Toggles)
local function CreateOption(parent, text) 
    local holder = Instance.new("Frame") 
    holder.Size = UDim2.new(0.98, 0, 0, 34) 
    holder.BackgroundColor3 = Color3.fromRGB(18,18,18) 
    holder.Parent = parent

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
    label.TextSize = 10
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = holder

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 42, 0, 18)
    toggle.Position = UDim2.new(1, -48, 0.5, -9)
    toggle.Text = "OFF"
    toggle.BackgroundColor3 = Color3.fromRGB(35,35,35)
    toggle.TextColor3 = Color3.new(1,1,1)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 8
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

-- Datos de las pestañas
local tabsData = { 
    ["Discord"] = {"Join Discord", "Copy Link"}, 
    ["Reach"] = {"Leg Reach", "Arm Reach", "Infinite Reach"}, 
    ["Body Parts Reach"] = {"Head Reach", "Torso Reach", "Foot Reach"}, 
    ["Reacts"] = {"Save React", "Kick React", "Shot React", "Dribble React", "Flick React"}, 
    ["Gamepasses"] = {"Unlock VIP", "Unlock Speed Pass"}, 
    ["Helpers"] = {"Auto Goal", "Auto Defense"}, 
    ["Miscellaneous"] = {"Anti AFK", "FPS Booster"}, 
    ["Troll"] = {"Fling All", "Annoy Sound"}, 
    ["Skyes"] = {"Night Sky", "Purple Sky"} 
}

local pages = {}
local tabButtons = {}
local firstTab = nil

-- Generar Pestañas y Páginas dinámicamente
for name, options in pairs(tabsData) do 
    if not firstTab then firstTab = name end

    -- Crear la página
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 2
    page.Visible = false
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new(0,0,0,0)
    page.Parent = PagesFolder

    local pageLayout = Instance.new("UIListLayout")
    pageLayout.Padding = UDim.new(0, 5)
    pageLayout.Parent = page

    for _, optText in ipairs(options) do
        CreateOption(page, optText)
    end
    
    pages[name] = page

    -- Crear Botón en la Barra Lateral
    local btn = Instance.new("TextButton") 
    btn.Size = UDim2.new(0.95, 0, 0, 30) 
    btn.BackgroundColor3 = Color3.fromRGB(20,20,20) 
    btn.Text = "★ " .. name 
    btn.TextColor3 = Color3.fromRGB(200,200,200) 
    btn.Font = Enum.Font.Gotham 
    btn.TextSize = 10 
    btn.Parent = Sidebar

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60,60,60)
    stroke.Thickness = 1
    stroke.Parent = btn

    tabButtons[name] = {btn = btn, stroke = stroke}

    -- Evento al presionar un apartado de la barra lateral
    btn.MouseButton1Click:Connect(function()
        for tabName, p in pairs(pages) do
            local isSelected = (tabName == name)
            p.Visible = isSelected
            
            local bData = tabButtons[tabName]
            if isSelected then
                bData.btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
                bData.btn.TextColor3 = Color3.fromRGB(255,196,0)
                bData.stroke.Color = Color3.fromRGB(255,196,0)
            else
                bData.btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
                bData.btn.TextColor3 = Color3.fromRGB(200,200,200)
                bData.stroke.Color = Color3.fromRGB(60,60,60)
            end
        end
    end)
end

-- Activar la primera pestaña por defecto de forma segura
if firstTab and pages[firstTab] then
    pages[firstTab].Visible = true
    tabButtons[firstTab].btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    tabButtons[firstTab].btn.TextColor3 = Color3.fromRGB(255,196,0)
    tabButtons[firstTab].stroke.Color = Color3.fromRGB(255,196,0)
end

-- FUNCIONALIDAD DE LOS BOTONES SUPERIORES (MINIMIZAR Y CERRAR)
local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    Sidebar.Visible = not minimized
    PagesFolder.Visible = not minimized
    if minimized then
        Main.Size = UDim2.new(0.8, 0, 0, 45)
        MinimizeBtn.Text = "+"
    else
        Main.Size = UDim2.new(0.8, 0, 0.7, 0)
        MinimizeBtn.Text = "-"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- SISTEMA PARA ARRASTRAR LA UI EN MOBILE
local dragging, dragInput, dragStart, startPos

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
