local Players = game:GetService("Players") 
local Player = Players.LocalPlayer 
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui") 
ScreenGui.Name = "SolarDevUI" 
ScreenGui.ResetOnSpawn = false 
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Size = UDim2.new(0, 700, 0, 420)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.BackgroundColor3 = Color3.fromRGB(12,12,12) 
Main.BorderSizePixel = 0 
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)

local Stroke = Instance.new("UIStroke") 
Stroke.Color = Color3.fromRGB(255,196,0) 
Stroke.Thickness = 1.5 
Stroke.Parent = Main

local Title = Instance.new("TextLabel") 
Title.BackgroundTransparency = 1 
Title.Size = UDim2.new(1,0,0,50) 
Title.Text = "â˜… SOLAR DEV." 
Title.TextColor3 = Color3.fromRGB(255,255,255) 
Title.Font = Enum.Font.GothamBold 
Title.TextSize = 28 
Title.Parent = Main

local Sidebar = Instance.new("Frame") 
Sidebar.Size = UDim2.new(0, 170, 1, -50)
Sidebar.Position = UDim2.new(0,10,0,45) 
Sidebar.BackgroundTransparency = 1 
Sidebar.Parent = Main

local Layout = Instance.new("UIListLayout") 
Layout.Padding = UDim.new(0,10) 
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

for _,name in ipairs(tabs) do 
local b = Instance.new("TextButton") 
b.Size = UDim2.new(1,0,0,48) 
b.BackgroundColor3 = Color3.fromRGB(20,20,20) 
b.Text = "â˜… "..name 
b.TextColor3 = Color3.fromRGB(255,255,255) 
b.Font = Enum.Font.Gotham 
b.TextSize = 18 
b.Parent = Sidebar

Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)

local s = Instance.new("UIStroke")
s.Color = Color3.fromRGB(255,196,0)
s.Parent = b
end

local Content = Instance.new("Frame") 
Content.Position = UDim2.new(0,245,0,55) 
Content.Size = UDim2.new(1,-255,1,-65) 
Content.BackgroundTransparency = 1 
Content.Parent = Main

local function CreateOption(text,y) 
local holder = Instance.new("Frame") 
holder.Size = UDim2.new(1,0,0,55) 
holder.Position = UDim2.new(0,0,0,y) 
holder.BackgroundColor3 = Color3.fromRGB(18,18,18) 
holder.Parent = Content

Instance.new("UICorner", holder).CornerRadius = UDim.new(0,8)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255,196,0)
stroke.Parent = holder

local label = Instance.new("TextLabel")
label.BackgroundTransparency = 1
label.Size = UDim2.new(.5,0,1,0)
label.Position = UDim2.new(0,15,0,0)
label.Text = text
label.TextColor3 = Color3.new(1,1,1)
label.Font = Enum.Font.Gotham
label.TextSize = 20
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = holder

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0,80,0,30)
toggle.Position = UDim2.new(1,-95,.5,-15)
toggle.Text = "OFF"
toggle.BackgroundColor3 = Color3.fromRGB(35,35,35)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.Parent = holder

Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

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

CreateOption("Save React",0) 
CreateOption("Kick React",70) 
CreateOption("Shot React",140) 
CreateOption("Dribble React",210) 
CreateOption("Flick React",280)
