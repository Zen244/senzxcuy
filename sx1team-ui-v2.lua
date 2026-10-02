-- [[ Axiom Engine: Pitch Black UI Framework - Custom Column Headers ]]

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Clean up existing UI if re-executed
if CoreGui:FindFirstChild("AxiomPremiumUI") then
    CoreGui.AxiomPremiumUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SxPremiumUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.ResetOnSpawn = false

-- Tombol Floating Utama (Buka/Tutup Menu)
local FloatButton = Instance.new("TextButton")
FloatButton.Name = "FloatButton"
FloatButton.Parent = ScreenGui
FloatButton.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
FloatButton.Position = UDim2.new(0, 20, 0.5, -20)
FloatButton.Size = UDim2.new(0, 40, 0, 40)
FloatButton.AutoButtonColor = false
FloatButton.Font = Enum.Font.GothamBold
FloatButton.Text = "SX1"
FloatButton.TextColor3 = Color3.fromRGB(115, 40, 215)
FloatButton.TextSize = 12
FloatButton.ClipsDescendants = true

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(0, 8)
FloatCorner.Parent = FloatButton

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Parent = FloatButton
FloatStroke.Color = Color3.fromRGB(40, 40, 50)
FloatStroke.Thickness = 1.2

-- Main Frame (Hitam Pekat, Floating)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -145)
MainFrame.Size = UDim2.new(0, 460, 0, 290)
MainFrame.ClipsDescendants = false 
MainFrame.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(25, 25, 25)
MainStroke.Thickness = 1.2

-- Animasi Klik & Logika Float Button
local menuVisible = true

FloatButton.MouseButton1Down:Connect(function()
    TweenService:Create(FloatButton, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(115, 40, 215),
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }):Play()
end)

FloatButton.MouseButton1Up:Connect(function()
    TweenService:Create(FloatButton, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(10, 10, 15),
        TextColor3 = Color3.fromRGB(115, 40, 215)
    }):Play()
end)

FloatButton.MouseLeave:Connect(function()
    TweenService:Create(FloatButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(10, 10, 15),
        TextColor3 = Color3.fromRGB(115, 40, 215)
    }):Play()
end)

FloatButton.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    if menuVisible then
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = FloatButton.Position
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 460, 0, 290),
            Position = UDim2.new(0.5, -230, 0.5, -145)
        }):Play()
    else
        MainFrame.Visible = false
    end
end)

-- Header & Description Area
local HeaderContainer = Instance.new("Frame")
HeaderContainer.Name = "HeaderContainer"
HeaderContainer.Parent = MainFrame
HeaderContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HeaderContainer.BorderSizePixel = 0
HeaderContainer.Position = UDim2.new(0, 4, 0, 4)
HeaderContainer.Size = UDim2.new(0, 117, 0, 38)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = HeaderContainer
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 6, 0, 4)
TitleLabel.Size = UDim2.new(1, -6, 0, 16)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "SENZX MODZ"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
TitleLabel.TextSize = 12
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local DescLabel = Instance.new("TextLabel")
DescLabel.Parent = HeaderContainer
DescLabel.BackgroundTransparency = 1
DescLabel.Position = UDim2.new(0, 6, 0, 19)
DescLabel.Size = UDim2.new(1, -6, 0, 14)
DescLabel.Font = Enum.Font.Gotham
DescLabel.Text = "UNIVERSAL V2.0"
DescLabel.TextColor3 = Color3.fromRGB(110, 110, 125)
DescLabel.TextSize = 10
DescLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Profile Card
local ProfileCard = Instance.new("Frame")
ProfileCard.Name = "ProfileCard"
ProfileCard.Parent = MainFrame
ProfileCard.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
ProfileCard.BorderSizePixel = 0
ProfileCard.Position = UDim2.new(0, 4, 1, -42)
ProfileCard.Size = UDim2.new(0, 117, 0, 38)

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 8)
ProfileCorner.Parent = ProfileCard

local AvatarImg = Instance.new("ImageLabel")
AvatarImg.Name = "AvatarImg"
AvatarImg.Parent = ProfileCard
AvatarImg.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
AvatarImg.BorderSizePixel = 0
AvatarImg.Position = UDim2.new(0, 4, 0, 4)
AvatarImg.Size = UDim2.new(0, 30, 0, 30)
AvatarImg.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=48&h=48"

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = AvatarImg

local ProfileName = Instance.new("TextLabel")
ProfileName.Parent = ProfileCard
ProfileName.BackgroundTransparency = 1
ProfileName.Position = UDim2.new(0, 38, 0, 5)
ProfileName.Size = UDim2.new(1, -42, 0, 14)
ProfileName.Font = Enum.Font.GothamBold
ProfileName.Text = LocalPlayer.Name
ProfileName.TextColor3 = Color3.fromRGB(220, 220, 230)
ProfileName.TextSize = 10
ProfileName.TextXAlignment = Enum.TextXAlignment.Left
ProfileName.TextTruncate = Enum.TextTruncate.AtEnd

local ProfileStatus = Instance.new("TextLabel")
ProfileStatus.Parent = ProfileCard
ProfileStatus.BackgroundTransparency = 1
ProfileStatus.Position = UDim2.new(0, 38, 0, 19)
ProfileStatus.Size = UDim2.new(1, -42, 0, 12)
ProfileStatus.Font = Enum.Font.Gotham
ProfileStatus.Text = "Online"
ProfileStatus.TextColor3 = Color3.fromRGB(100, 220, 100)
ProfileStatus.TextSize = 9
ProfileStatus.TextXAlignment = Enum.TextXAlignment.Left

-- Sidebar ScrollingFrame
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Sidebar.BackgroundTransparency = 1
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0, 4, 0, 44)
Sidebar.Size = UDim2.new(0, 117, 1, -90)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
Sidebar.ScrollBarThickness = 2
Sidebar.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
Sidebar.ClipsDescendants = true

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 4)

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.Parent = Sidebar
SidebarPadding.PaddingTop = UDim.new(0, 4)
SidebarPadding.PaddingLeft = UDim.new(0, 4)
SidebarPadding.PaddingRight = UDim.new(0, 4)

-- Content Area Container
local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Parent = MainFrame
Container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.Position = UDim2.new(0, 125, 0, 4)
Container.Size = UDim2.new(1, -129, 1, -8)
Container.ClipsDescendants = false

local PagesFolder = Instance.new("Folder")
PagesFolder.Name = "PagesFolder"
PagesFolder.Parent = Container

local tabs = {"AIM", "VISUALS", "MISC", "BRUTAL", "PROFIL"}
local buttons = {}
local pageObjects = {}

local activeColor = Color3.fromRGB(115, 40, 215)
local inactiveColor = Color3.fromRGB(0, 0, 0)

for i, tabName in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Name = tabName .. "Btn"
    btn.Parent = Sidebar
    btn.BackgroundColor3 = (i == 1) and activeColor or inactiveColor
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.AutoButtonColor = false
    btn.Font = Enum.Font.GothamBold
    btn.Text = tabName
    btn.TextColor3 = (i == 1) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(140, 140, 155)
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Center

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    local pageContainer = Instance.new("Frame")
    pageContainer.Name = tabName .. "Page"
    pageContainer.Parent = PagesFolder
    pageContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    pageContainer.BackgroundTransparency = 1
    pageContainer.Size = UDim2.new(1, 0, 1, 0)
    pageContainer.Visible = (i == 1)
    pageContainer.ClipsDescendants = false

    local title1, title2

    local function createDualColumns(titleCol1, titleCol2)
        local colWidth = 157
        local gap = 13

        local col1Wrapper = Instance.new("Frame")
        col1Wrapper.Parent = pageContainer
        col1Wrapper.BackgroundTransparency = 1
        col1Wrapper.Position = UDim2.new(0, 0, 0, 0)
        col1Wrapper.Size = UDim2.new(0, colWidth, 1, 0)
        col1Wrapper.ClipsDescendants = false

        title1 = Instance.new("TextLabel")
        title1.Parent = col1Wrapper
        title1.BackgroundTransparency = 1
        title1.Position = UDim2.new(0, 4, 0, 2)
        title1.Size = UDim2.new(1, -4, 0, 18)
        title1.Font = Enum.Font.GothamBold
        title1.Text = titleCol1
        title1.TextColor3 = Color3.fromRGB(200, 200, 215)
        title1.TextSize = 10
        title1.TextXAlignment = Enum.TextXAlignment.Left

        local scroll1 = Instance.new("ScrollingFrame")
        scroll1.Name = "Column1Scroll"
        scroll1.Parent = col1Wrapper
        scroll1.BackgroundTransparency = 1
        scroll1.BorderSizePixel = 0
        scroll1.Position = UDim2.new(0, 0, 0, 22)
        scroll1.Size = UDim2.new(1, 0, 1, -22)
        scroll1.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll1.AutomaticCanvasSize = Enum.AutomaticSize.Y
        scroll1.ScrollBarThickness = 2
        scroll1.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
        scroll1.ClipsDescendants = false 

        local layout1 = Instance.new("UIListLayout")
        layout1.Parent = scroll1
        layout1.SortOrder = Enum.SortOrder.LayoutOrder
        layout1.Padding = UDim.new(0, 5)

        local pad1 = Instance.new("UIPadding")
        pad1.Parent = scroll1
        pad1.PaddingTop = UDim.new(0, 2)
        pad1.PaddingLeft = UDim.new(0, 2)
        pad1.PaddingRight = UDim.new(0, 2)

        local col2Wrapper = Instance.new("Frame")
        col2Wrapper.Parent = pageContainer
        col2Wrapper.BackgroundTransparency = 1
        col2Wrapper.Position = UDim2.new(0, colWidth + gap, 0, 0)
        col2Wrapper.Size = UDim2.new(0, colWidth, 1, 0)
        col2Wrapper.ClipsDescendants = false

        title2 = Instance.new("TextLabel")
        title2.Parent = col2Wrapper
        title2.BackgroundTransparency = 1
        title2.Position = UDim2.new(0, 4, 0, 2)
        title2.Size = UDim2.new(1, -4, 0, 18)
        title2.Font = Enum.Font.GothamBold
        title2.Text = titleCol2
        title2.TextColor3 = Color3.fromRGB(200, 200, 215)
        title2.TextSize = 10
        title2.TextXAlignment = Enum.TextXAlignment.Left

        local scroll2 = Instance.new("ScrollingFrame")
        scroll2.Name = "Column2Scroll"
        scroll2.Parent = col2Wrapper
        scroll2.BackgroundTransparency = 1
        scroll2.BorderSizePixel = 0
        scroll2.Position = UDim2.new(0, 0, 0, 22)
        scroll2.Size = UDim2.new(1, 0, 1, -22)
        scroll2.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll2.AutomaticCanvasSize = Enum.AutomaticSize.Y
        scroll2.ScrollBarThickness = 2
        scroll2.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
        scroll2.ClipsDescendants = false 

        local layout2 = Instance.new("UIListLayout")
        layout2.Parent = scroll2
        layout2.SortOrder = Enum.SortOrder.LayoutOrder
        layout2.Padding = UDim.new(0, 5)

        local pad2 = Instance.new("UIPadding")
        pad2.Parent = scroll2
        pad2.PaddingTop = UDim.new(0, 2)
        pad2.PaddingLeft = UDim.new(0, 2)
        pad2.PaddingRight = UDim.new(0, 2)

        return scroll1, scroll2
    end

    local col1, col2 = createDualColumns("GENERAL " .. tabName, "ADVANCED " .. tabName)
    
    buttons[tabName] = btn
    
    local tabObj = {}
    
    -- Fungsi untuk mengubah judul atas / header kolom halaman
    function tabObj:AddColumnTitles(leftTitle, rightTitle)
        if title1 then title1.Text = leftTitle end
        if title2 then title2.Text = rightTitle end
    end

    function tabObj:AddButton(side, titleText, callback)
        local targetScroll = (side:lower() == "left" or side:lower() == "col1") and col1 or col2
        
        local btnContainer = Instance.new("TextButton")
        btnContainer.Parent = targetScroll
        btnContainer.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
        btnContainer.Size = UDim2.new(1, 0, 0, 26)
        btnContainer.AutoButtonColor = false
        btnContainer.Text = ""
        btnContainer.ClipsDescendants = true
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = btnContainer

        local label = Instance.new("TextLabel")
        label.Parent = btnContainer
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 6, 0, 0)
        label.Size = UDim2.new(1, -12, 1, 0)
        label.Font = Enum.Font.GothamBold
        label.Text = titleText
        label.TextColor3 = Color3.fromRGB(200, 200, 210)
        label.TextSize = 9.5
        label.TextXAlignment = Enum.TextXAlignment.Center

        btnContainer.MouseButton1Down:Connect(function()
            TweenService:Create(btnContainer, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(115, 40, 215)
            }):Play()
            TweenService:Create(label, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end)

        btnContainer.MouseButton1Up:Connect(function()
            TweenService:Create(btnContainer, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(5, 5, 5)
            }):Play()
            TweenService:Create(label, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextColor3 = Color3.fromRGB(200, 200, 210)
            }):Play()
        end)

        btnContainer.MouseLeave:Connect(function()
            TweenService:Create(btnContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(5, 5, 5)
            }):Play()
            TweenService:Create(label, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextColor3 = Color3.fromRGB(200, 200, 210)
            }):Play()
        end)

        btnContainer.MouseButton1Click:Connect(function()
            if callback then callback() end
        end)
    end

    function tabObj:AddToggle(side, titleText, callback)
        local targetScroll = (side:lower() == "left" or side:lower() == "col1") and col1 or col2
        
        local toggleContainer = Instance.new("Frame")
        toggleContainer.Parent = targetScroll
        toggleContainer.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
        toggleContainer.Size = UDim2.new(1, 0, 0, 26)
        toggleContainer.BorderSizePixel = 0
        toggleContainer.ClipsDescendants = true
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = toggleContainer

        local label = Instance.new("TextLabel")
        label.Parent = toggleContainer
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 6, 0, 0)
        label.Size = UDim2.new(1, -34, 1, 0)
        label.Font = Enum.Font.GothamBold
        label.Text = titleText
        label.TextColor3 = Color3.fromRGB(200, 200, 210)
        label.TextSize = 9.5
        label.TextXAlignment = Enum.TextXAlignment.Left

        local switchTrack = Instance.new("TextButton")
        switchTrack.Parent = toggleContainer
        switchTrack.AnchorPoint = Vector2.new(1, 0.5)
        switchTrack.Position = UDim2.new(1, -6, 0.5, 0)
        switchTrack.Size = UDim2.new(0, 26, 0, 14)
        switchTrack.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        switchTrack.BorderSizePixel = 0
        switchTrack.AutoButtonColor = false
        switchTrack.Text = ""

        local trackCorner = Instance.new("UICorner")
        trackCorner.CornerRadius = UDim.new(1, 0)
        trackCorner.Parent = switchTrack

        local switchKnob = Instance.new("Frame")
        switchKnob.Parent = switchTrack
        switchKnob.AnchorPoint = Vector2.new(0, 0.5)
        switchKnob.Position = UDim2.new(0, 2, 0.5, 0)
        switchKnob.Size = UDim2.new(0, 10, 0, 10)
        switchKnob.BackgroundColor3 = Color3.fromRGB(150, 150, 160)
        switchKnob.BorderSizePixel = 0

        local knobCorner = Instance.new("UICorner")
        knobCorner.CornerRadius = UDim.new(1, 0)
        knobCorner.Parent = switchKnob

        local toggled = false
        
        local function triggerToggle()
            toggled = not toggled
            local targetColor = toggled and Color3.fromRGB(115, 40, 215) or Color3.fromRGB(25, 25, 30)
            local knobPos = toggled and UDim2.new(1, -12, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
            local knobColor = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 160)

            TweenService:Create(switchTrack, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
            TweenService:Create(switchKnob, TweenInfo.new(0.2), {Position = knobPos, BackgroundColor3 = knobColor}):Play()

            if callback then callback(toggled) end
        end

        switchTrack.MouseButton1Click:Connect(triggerToggle)
    end

    function tabObj:AddSlider(side, titleText, min, max, default, callback)
        local targetScroll = (side:lower() == "left" or side:lower() == "col1") and col1 or col2
        
        local sliderContainer = Instance.new("Frame")
        sliderContainer.Parent = targetScroll
        sliderContainer.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
        sliderContainer.Size = UDim2.new(1, 0, 0, 36)
        sliderContainer.BorderSizePixel = 0
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = sliderContainer

        local label = Instance.new("TextLabel")
        label.Parent = sliderContainer
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 6, 0, 3)
        label.Size = UDim2.new(1, -12, 0, 14)
        label.Font = Enum.Font.GothamBold
        label.Text = titleText
        label.TextColor3 = Color3.fromRGB(200, 200, 210)
        label.TextSize = 9.5
        label.TextXAlignment = Enum.TextXAlignment.Left

        local valueLabel = Instance.new("TextLabel")
        valueLabel.Parent = sliderContainer
        valueLabel.BackgroundTransparency = 1
        valueLabel.Position = UDim2.new(0, 6, 0, 3)
        valueLabel.Size = UDim2.new(1, -12, 0, 14)
        valueLabel.Font = Enum.Font.GothamBold
        valueLabel.Text = tostring(default)
        valueLabel.TextColor3 = Color3.fromRGB(115, 40, 215)
        valueLabel.TextSize = 9.5
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right

        local sliderBar = Instance.new("TextButton")
        sliderBar.Parent = sliderContainer
        sliderBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        sliderBar.Position = UDim2.new(0, 6, 0, 21)
        sliderBar.Size = UDim2.new(1, -12, 0, 6)
        sliderBar.AutoButtonColor = false
        sliderBar.Text = ""
        sliderBar.BorderSizePixel = 0

        local barCorner = Instance.new("UICorner")
        barCorner.CornerRadius = UDim.new(1, 0)
        barCorner.Parent = sliderBar

        local sliderFill = Instance.new("Frame")
        sliderFill.Parent = sliderBar
        sliderFill.BackgroundColor3 = Color3.fromRGB(115, 40, 215)
        sliderFill.Size = UDim2.new(math.clamp((default - min) / (max - min), 0, 1), 0, 1, 0)
        sliderFill.BorderSizePixel = 0

        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(1, 0)
        fillCorner.Parent = sliderFill

        local sliderKnob = Instance.new("Frame")
        sliderKnob.Parent = sliderFill
        sliderKnob.AnchorPoint = Vector2.new(0.5, 0.5)
        sliderKnob.Position = UDim2.new(1, 0, 0.5, 0)
        sliderKnob.Size = UDim2.new(0, 8, 0, 8)
        sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sliderKnob.BorderSizePixel = 0

        local knobCorner = Instance.new("UICorner")
        knobCorner.CornerRadius = UDim.new(1, 0)
        knobCorner.Parent = sliderKnob

        local draggingSlider = false
        local currentValue = default

        local function updateSlider(input)
            local pos = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            currentValue = math.floor(min + ((max - min) * pos))
            
            TweenService:Create(sliderFill, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(pos, 0, 1, 0)
            }):Play()
            
            valueLabel.Text = tostring(currentValue)
            if callback then callback(currentValue) end
        end

        sliderBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = true
                updateSlider(input)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = false
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateSlider(input)
            end
        end)
    end

    function tabObj:AddDropdown(side, titleText, options, default, callback)
        local targetScroll = (side:lower() == "left" or side:lower() == "col1") and col1 or col2
        local opened = false
        local selectedOption = default or options[1] or "Select..."
        local maxHeight = 90 

        local dropdownContainer = Instance.new("Frame")
        dropdownContainer.Parent = targetScroll
        dropdownContainer.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
        dropdownContainer.Size = UDim2.new(1, 0, 0, 28)
        dropdownContainer.BorderSizePixel = 0
        dropdownContainer.ClipsDescendants = false
        dropdownContainer.ZIndex = 50

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = dropdownContainer

        local triggerBtn = Instance.new("TextButton")
        triggerBtn.Parent = dropdownContainer
        triggerBtn.BackgroundTransparency = 1
        triggerBtn.Size = UDim2.new(1, 0, 0, 28)
        triggerBtn.AutoButtonColor = false
        triggerBtn.Text = ""
        triggerBtn.ZIndex = 52

        local label = Instance.new("TextLabel")
        label.Parent = dropdownContainer
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 6, 0, 0)
        label.Size = UDim2.new(1, -24, 0, 28)
        label.Font = Enum.Font.GothamBold
        label.Text = titleText .. ": " .. tostring(selectedOption)
        label.TextColor3 = Color3.fromRGB(200, 200, 210)
        label.TextSize = 9.5
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.ZIndex = 51

        local arrow = Instance.new("TextLabel")
        arrow.Parent = dropdownContainer
        arrow.BackgroundTransparency = 1
        arrow.Position = UDim2.new(1, -20, 0, 0)
        arrow.Size = UDim2.new(0, 14, 0, 28)
        arrow.Font = Enum.Font.GothamBold
        arrow.Text = "v"
        arrow.TextColor3 = Color3.fromRGB(115, 40, 215)
        arrow.TextSize = 9.5
        arrow.ZIndex = 51

        local listScroll = Instance.new("ScrollingFrame")
        listScroll.Parent = MainFrame
        listScroll.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
        listScroll.BorderSizePixel = 0
        listScroll.Size = UDim2.new(0, 0, 0, 0)
        listScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        listScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        listScroll.ScrollBarThickness = 2
        listScroll.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
        listScroll.ClipsDescendants = true
        listScroll.Visible = false
        listScroll.ZIndex = 999

        local listCorner = Instance.new("UICorner")
        listCorner.CornerRadius = UDim.new(0, 8)
        listCorner.Parent = listScroll

        local listLayout = Instance.new("UIListLayout")
        listLayout.Parent = listScroll
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder
        listLayout.Padding = UDim.new(0, 2)

        local listPad = Instance.new("UIPadding")
        listPad.Parent = listScroll
        listPad.PaddingTop = UDim.new(0, 2)
        listPad.PaddingBottom = UDim.new(0, 3)
        listPad.PaddingLeft = UDim.new(0, 2)
        listPad.PaddingRight = UDim.new(0, 2)

        local itemHeight = 20
        local calculatedListHeight = math.min(#options * (itemHeight + 2), maxHeight)
        local optionButtons = {}

        for _, opt in ipairs(options) do
            local optBtn = Instance.new("TextButton")
            optBtn.Parent = listScroll
            optBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
            optBtn.Size = UDim2.new(1, 0, 0, itemHeight)
            optBtn.AutoButtonColor = false
            optBtn.Font = Enum.Font.Gotham
            optBtn.Text = "  " .. tostring(opt)
            optBtn.TextColor3 = (opt == selectedOption) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 175)
            optBtn.TextSize = 9.5
            optBtn.TextXAlignment = Enum.TextXAlignment.Left
            optBtn.ZIndex = 1000

            local optCorner = Instance.new("UICorner")
            optCorner.CornerRadius = UDim.new(0, 6)
            optCorner.Parent = optBtn

            optionButtons[opt] = optBtn

            optBtn.MouseButton1Click:Connect(function()
                selectedOption = opt
                label.Text = titleText .. ": " .. tostring(selectedOption)
                opened = false
                
                for itemValue, btnObj in pairs(optionButtons) do
                    btnObj.TextColor3 = (itemValue == selectedOption) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 175)
                end
                
                TweenService:Create(listScroll, TweenInfo.new(0.2), {
                    Size = UDim2.new(0, dropdownContainer.AbsoluteSize.X, 0, 0)
                }):Play()
                TweenService:Create(arrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
                
                task.delay(0.2, function()
                    if not opened then listScroll.Visible = false end
                end)

                if callback then callback(selectedOption) end
            end)
        end

        triggerBtn.MouseButton1Click:Connect(function()
            opened = not opened
            local rotAngle = opened and 180 or 0

            if opened then
                listScroll.Visible = true
                local absPos = dropdownContainer.AbsolutePosition
                local mainAbsPos = MainFrame.AbsolutePosition
                listScroll.Position = UDim2.new(0, absPos.X - mainAbsPos.X, 0, (absPos.Y - mainAbsPos.Y) + 31)
                listScroll.Size = UDim2.new(0, 0, 0, 0)
                
                TweenService:Create(listScroll, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, dropdownContainer.AbsoluteSize.X, 0, calculatedListHeight)
                }):Play()
            else
                TweenService:Create(listScroll, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    Size = UDim2.new(0, dropdownContainer.AbsoluteSize.X, 0, 0)
                }):Play()
                task.delay(0.2, function()
                    if not opened then listScroll.Visible = false end
                end)
            end

            TweenService:Create(arrow, TweenInfo.new(0.25), {Rotation = rotAngle}):Play()
        end)
    end

    pageObjects[tabName] = tabObj

    btn.MouseButton1Click:Connect(function()
        for name, otherBtn in pairs(buttons) do
            local isTarget = (name == tabName)
            TweenService:Create(otherBtn, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = isTarget and activeColor or inactiveColor,
                TextColor3 = isTarget and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(140, 140, 155)
            }):Play()
            local targetPage = PagesFolder:FindFirstChild(name .. "Page")
            if targetPage then targetPage.Visible = isTarget end
        end
    end)
end

-- SISTEM DRAG DENGAN TOLERANSI (ANTI-SLIP) TANPA LOCK
local dragThreshold = 6

local function makeDraggable(guiObject)
    local dragging = false
    local dragInput, dragStart, startPos
    local hasMoved = false

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            hasMoved = false
            dragStart = input.Position
            startPos = guiObject.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.abs(delta.X) > dragThreshold or math.abs(delta.Y) > dragThreshold then
                hasMoved = true
            end
            
            if hasMoved then
                TweenService:Create(guiObject, TweenInfo.new(0.05), {
                    Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                }):Play()
            end
        end
    end)
end

makeDraggable(MainFrame)
makeDraggable(FloatButton)

-- CONTOH PEMANGGILAN (Mengubah Judul Atas Kolom Kiri & Kanan via AddColumnTitles)
pageObjects["AIM"]:AddColumnTitles("AIM TARGETING", "AIM SETTINGS")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local aimbotConnection = nil
local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Thickness = 1
fovCircle.NumSides = 64
fovCircle.Filled = false
fovCircle.Color = Color3.fromRGB(255, 255, 255)

local aimbotSettings = {
    enabled = false,
    wallCheck = false,
    targetPart = "Head",
    smoothness = 1,
    fov = 120,
    showFov = true
}

local function isVisible(targetPart, character)
    if not aimbotSettings.wallCheck then return true end
    local localCharacter = LocalPlayer.Character
    if not localCharacter or not localCharacter:FindFirstChild("Head") then return true end
    
    local origin = Camera.CFrame.Position
    local targetPos = targetPart.Position
    local direction = targetPos - origin
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {localCharacter, character}
    raycastParams.IgnoreWater = true
    
    local result = workspace:Raycast(origin, direction, raycastParams)
    
    if result == nil then
        return true
    end
    
    if result.Instance:IsDescendantOf(character) then
        return true
    end
    
    return false
end

local function getClosestPlayerInFOV()
    local closestPlayer = nil
    local shortestDistance = aimbotSettings.fov
    local viewportCenter = Camera.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local targetPart = player.Character:FindFirstChild(aimbotSettings.targetPart) or player.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and humanoid.Health > 0 and targetPart then
                local screenPoint, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                
                if onScreen then
                    local screenPosition = Vector2.new(screenPoint.X, screenPoint.Y)
                    local distance = (viewportCenter - screenPosition).Magnitude
                    
                    if distance < shortestDistance then
                        if isVisible(targetPart, player.Character) then
                            shortestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function updateAimbotState()
    if aimbotSettings.enabled then
        if not aimbotConnection then
            aimbotConnection = RunService.RenderStepped:Connect(function()
                local viewportCenter = Camera.ViewportSize / 2
                
                fovCircle.Position = viewportCenter
                fovCircle.Radius = aimbotSettings.fov
                fovCircle.Visible = aimbotSettings.showFov
                
                local targetPlayer = getClosestPlayerInFOV()
                if targetPlayer and targetPlayer.Character then
                    local targetPart = targetPlayer.Character:FindFirstChild(aimbotSettings.targetPart) or targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetPart then
                        local targetPosition = targetPart.Position
                        local currentCameraCFrame = Camera.CFrame
                        local desiredCFrame = CFrame.new(currentCameraCFrame.Position, targetPosition)
                        
                        if aimbotSettings.smoothness <= 1 then
                            Camera.CFrame = desiredCFrame
                        else
                            Camera.CFrame = currentCameraCFrame:Lerp(desiredCFrame, 1 / aimbotSettings.smoothness)
                        end
                    end
                end
            end)
        end
    else
        if aimbotConnection then
            aimbotConnection:Disconnect()
            aimbotConnection = nil
        end
        fovCircle.Visible = false
    end
end

-- UI Integration menggunakan pageObjects["AIM"]

pageObjects["AIM"]:AddToggle("left", "Aimbot", function(state)
    aimbotSettings.enabled = state
    updateAimbotState()
    print("Aimbot:", state)
end)

pageObjects["AIM"]:AddToggle("left", "WallCheck", function(state)
    aimbotSettings.wallCheck = state
    print("WallCheck:", state)
end)

pageObjects["AIM"]:AddToggle("left", "Show FOV", function(state)
    aimbotSettings.showFov = state
    print("Show FOV:", state)
end)

pageObjects["AIM"]:AddDropdown("right", "Target Part", {"Head", "HumanoidRootPart", "UpperTorso"}, "Head", function(selected)
    aimbotSettings.targetPart = selected
    print("Target Part:", selected)
end)

pageObjects["AIM"]:AddSlider("right", "Aimbot FOV", 10, 500, 120, function(value)
    aimbotSettings.fov = value
    print("Aimbot FOV:", value)
end)

pageObjects["AIM"]:AddSlider("right", "Aimbot Smoothness", 1, 20, 1, function(value)
    aimbotSettings.smoothness = value
    print("Aimbot Smoothness:", value)
end)

pageObjects["VISUALS"]:AddColumnTitles("ESP PLAYERS", "ESP SETTINGS")

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local ColorList = {
    White = Color3.fromRGB(255, 255, 255),
    Red = Color3.fromRGB(255, 0, 0),
    Green = Color3.fromRGB(0, 255, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Yellow = Color3.fromRGB(255, 255, 0),
    Purple = Color3.fromRGB(128, 0, 128)
}

local LocalPlayer = Players.LocalPlayer
local ESP_ENABLED = false
local ESP_COLOR = Color3.fromRGB(255, 255, 255)
local LINE_POSITION = "Bottom"
local EXCLUDED_TEAMS = {}

local espContainer = {}

local function createLine()
    local line = Drawing.new("Line")
    line.Visible = false
    line.Color = ESP_COLOR
    line.Thickness = 1.5
    line.Transparency = 1
    return line
end

local function removeEsp(player)
    if espContainer[player] then
        for _, line in pairs(espContainer[player]) do
            line:Remove()
        end
        espContainer[player] = nil
    end
end

local function getOriginPosition()
    local viewport = Camera.ViewportSize
    if LINE_POSITION == "Top" then
        return Vector2.new(viewport.X / 2, 0)
    elseif LINE_POSITION == "Center" then
        return Vector2.new(viewport.X / 2, viewport.Y / 2)
    elseif LINE_POSITION == "Bottom" then
        return Vector2.new(viewport.X / 2, viewport.Y)
    elseif LINE_POSITION == "Crosshair" then
        return Vector2.new(viewport.X / 2, viewport.Y / 2)
    end
    return Vector2.new(viewport.X / 2, viewport.Y)
end

local function renderEsp()
    if not ESP_ENABLED then
        for player, _ in pairs(espContainer) do
            removeEsp(player)
        end
        return
    end

    local origin = getOriginPosition()

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local character = player.Character
            local hrp = character.HumanoidRootPart
            local humanoid = character:FindFirstChild("Humanoid")

            if humanoid and humanoid.Health > 0 then
                local shouldRender = true
                for _, teamName in ipairs(EXCLUDED_TEAMS) do
                    if player.Team and player.Team.Name == teamName then
                        shouldRender = false
                        break
                    end
                end

                if shouldRender then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

                    if not espContainer[player] then
                        espContainer[player] = { createLine() }
                    end

                    local line = espContainer[player][1]
                    line.Color = ESP_COLOR

                    if onScreen then
                        line.From = origin
                        line.To = Vector2.new(screenPos.X, screenPos.Y)
                        line.Visible = true
                    else
                        line.Visible = false
                    end
                else
                    removeEsp(player)
                end
            else
                removeEsp(player)
            end
        else
            removeEsp(player)
        end
    end
end

pageObjects["VISUALS"]:AddToggle("left", "Esp Line", function(state)
    ESP_ENABLED = state
    if not ESP_ENABLED then
        renderEsp()
    end
    print("Esp line:", state)
end)

pageObjects["VISUALS"]:AddDropdown("right", "Line Position", {"Top", "Center", "Bottom", "Crosshair"}, "Bottom", function(selected)
    LINE_POSITION = selected
    print("Selected Line Position:", selected)
end)

pageObjects["VISUALS"]:AddDropdown("right", "Line Color", {"White", "Red", "Green", "Blue", "Yellow", "Purple"}, "White", function(selected)
    ESP_COLOR = ColorList[selected] or Color3.fromRGB(255, 255, 255)
    print("Selected Line Color:", selected)
end)

RunService.RenderStepped:Connect(renderEsp)
Players.PlayerRemoving:Connect(removeEsp)

local CORNER_ENABLED = false
local CORNER_COLOR = Color3.fromRGB(255, 255, 255)
local CORNER_MODEL = "Full"

local cornerContainer = {}

local function createCornerLines()
    local lines = {}
    for i = 1, 8 do
        local line = Drawing.new("Line")
        line.Visible = false
        line.Color = CORNER_COLOR
        line.Thickness = 1.5
        line.Transparency = 1
        table.insert(lines, line)
    end
    return lines
end

local function removeCorner(player)
    if cornerContainer[player] then
        for _, line in pairs(cornerContainer[player]) do
            line:Remove()
        end
        cornerContainer[player] = nil
    end
end

local function hideCorner(player)
    if cornerContainer[player] then
        for _, line in pairs(cornerContainer[player]) do
            line.Visible = false
        end
    end
end

local function renderCorner()
    if not CORNER_ENABLED then
        for player, _ in pairs(cornerContainer) do
            removeCorner(player)
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                local humanoid = character:FindFirstChild("Humanoid")
                local head = character:FindFirstChild("Head")

                if hrp and humanoid and head then
                    if humanoid.Health > 0 then
                        local shouldRender = true
                        for _, teamName in ipairs(EXCLUDED_TEAMS) do
                            if player.Team and player.Team.Name == teamName then
                                shouldRender = false
                                break
                            end
                        end

                        if shouldRender then
                            local headPos, headOnScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                            local rootPos, rootOnScreen = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))

                            if not cornerContainer[player] then
                                cornerContainer[player] = createCornerLines()
                            end

                            local lines = cornerContainer[player]
                            for _, line in ipairs(lines) do
                                line.Color = CORNER_COLOR
                            end

                            if headPos.Z > 0 or rootPos.Z > 0 then
                                local height = math.abs(headPos.Y - rootPos.Y)
                                local width = height / 2
                                local x = headPos.X - width / 2
                                local y = headPos.Y

                                if CORNER_MODEL == "Box Biasa" then
                                    lines[1].From = Vector2.new(x, y)
                                    lines[1].To = Vector2.new(x + width, y)
                                    
                                    lines[2].From = Vector2.new(x + width, y)
                                    lines[2].To = Vector2.new(x + width, y + height)
                                    
                                    lines[3].From = Vector2.new(x + width, y + height)
                                    lines[3].To = Vector2.new(x, y + height)
                                    
                                    lines[4].From = Vector2.new(x, y + height)
                                    lines[4].To = Vector2.new(x, y)

                                    for i = 1, 4 do lines[i].Visible = true end
                                    for i = 5, 8 do lines[i].Visible = false end
                                else
                                    local length = (CORNER_MODEL == "Full") and (height / 3) or (CORNER_MODEL == "Half" and (height / 5) or (height / 4))

                                    lines[1].From = Vector2.new(x, y)
                                    lines[1].To = Vector2.new(x + length, y)
                                    lines[2].From = Vector2.new(x, y)
                                    lines[2].To = Vector2.new(x, y + length)

                                    lines[3].From = Vector2.new(x + width, y)
                                    lines[3].To = Vector2.new(x + width - length, y)
                                    lines[4].From = Vector2.new(x + width, y)
                                    lines[4].To = Vector2.new(x + width, y + length)

                                    lines[5].From = Vector2.new(x, y + height)
                                    lines[5].To = Vector2.new(x + length, y + height)
                                    lines[6].From = Vector2.new(x, y + height)
                                    lines[6].To = Vector2.new(x, y + height - length)

                                    lines[7].From = Vector2.new(x + width, y + height)
                                    lines[7].To = Vector2.new(x + width - length, y + height)
                                    lines[8].From = Vector2.new(x + width, y + height)
                                    lines[8].To = Vector2.new(x + width, y + height - length)

                                    for i = 1, 8 do lines[i].Visible = true end
                                end
                            else
                                hideCorner(player)
                            end
                        else
                            removeCorner(player)
                        end
                    else
                        removeCorner(player)
                    end
                else
                    hideCorner(player)
                end
            else
                removeCorner(player)
            end
        end
    end
end

pageObjects["VISUALS"]:AddToggle("left", "Esp Corner", function(state)
    CORNER_ENABLED = state
    if not CORNER_ENABLED then
        renderCorner()
    end
    print("Esp corner:", state)
end)

pageObjects["VISUALS"]:AddDropdown("right", "Corner Model", {"Full", "Half", "Dynamic", "Box Biasa"}, "Full", function(selected)
    CORNER_MODEL = selected
    print("Selected Corner Model:", selected)
end)

pageObjects["VISUALS"]:AddDropdown("right", "Corner Color", {"White", "Red", "Green", "Blue", "Yellow", "Purple"}, "White", function(selected)
    CORNER_COLOR = ColorList[selected] or Color3.fromRGB(255, 255, 255)
    print("Selected Corner Color:", selected)
end)

RunService.RenderStepped:Connect(renderCorner)
Players.PlayerRemoving:Connect(removeCorner)

local HEALTHBAR_ENABLED = false
local healthBarContainer = {}

local function createHealthBarLines()
    local lines = {}
    for i = 1, 2 do
        local line = Drawing.new("Line")
        line.Visible = false
        line.Thickness = 1.5
        line.Transparency = 1
        table.insert(lines, line)
    end
    return lines
end

local function removeHealthBar(player)
    if healthBarContainer[player] then
        for _, line in pairs(healthBarContainer[player]) do
            line:Remove()
        end
        healthBarContainer[player] = nil
    end
end

local function hideHealthBar(player)
    if healthBarContainer[player] then
        for _, line in pairs(healthBarContainer[player]) do
            line.Visible = false
        end
    end
end

local function renderHealthBar()
    if not HEALTHBAR_ENABLED then
        for player, _ in pairs(healthBarContainer) do
            removeHealthBar(player)
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                local humanoid = character:FindFirstChild("Humanoid")
                local head = character:FindFirstChild("Head")

                if hrp and humanoid and head then
                    if humanoid.Health > 0 then
                        local shouldRender = true
                        for _, teamName in ipairs(EXCLUDED_TEAMS) do
                            if player.Team and player.Team.Name == teamName then
                                shouldRender = false
                                break
                            end
                        end

                        if shouldRender then
                            local headPos, headOnScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                            local rootPos, rootOnScreen = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))

                            if not healthBarContainer[player] then
                                healthBarContainer[player] = createHealthBarLines()
                            end

                            local lines = healthBarContainer[player]

                            if headPos.Z > 0 or rootPos.Z > 0 then
                                local height = math.abs(headPos.Y - rootPos.Y)
                                local width = height / 2
                                local x = headPos.X - width / 2
                                local y = headPos.Y

                                local healthPercent = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
                                local barHeight = height * healthPercent
                                
                                local healthBg = lines[1]
                                healthBg.From = Vector2.new(x + width + 4, y)
                                healthBg.To = Vector2.new(x + width + 4, y + height)
                                healthBg.Color = Color3.fromRGB(0, 0, 0)
                                healthBg.Thickness = 2
                                healthBg.Transparency = 0.7
                                healthBg.Visible = true

                                local healthBar = lines[2]
                                healthBar.From = Vector2.new(x + width + 4, y + height)
                                healthBar.To = Vector2.new(x + width + 4, (y + height) - barHeight)
                                healthBar.Color = Color3.fromRGB(255 * (1 - healthPercent), 255 * healthPercent, 0)
                                healthBar.Thickness = 1.5
                                healthBar.Transparency = 1
                                healthBar.Visible = true
                            else
                                hideHealthBar(player)
                            end
                        else
                            removeHealthBar(player)
                        end
                    else
                        removeHealthBar(player)
                    end
                else
                    hideHealthBar(player)
                end
            else
                removeHealthBar(player)
            end
        end
    end
end

pageObjects["VISUALS"]:AddToggle("left", "Esp Health Bar", function(state)
    HEALTHBAR_ENABLED = state
    if not HEALTHBAR_ENABLED then
        renderHealthBar()
    end
    print("Health Bar:", state)
end)

RunService.RenderStepped:Connect(renderHealthBar)
Players.PlayerRemoving:Connect(removeHealthBar)

local SKELETON_ENABLED = false
local SKELETON_COLOR = Color3.fromRGB(255, 255, 255)
local skeletonContainer = {}

local R6_CONNECTIONS = {
    {"Head", "Torso"},
    {"Torso", "Left Arm"},
    {"Torso", "Right Arm"},
    {"Torso", "Left Leg"},
    {"Torso", "Right Leg"}
}

local R15_CONNECTIONS = {
    {"Head", "UpperTorso"},
    {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "LeftUpperArm"},
    {"LeftUpperArm", "LeftLowerArm"},
    {"LeftLowerArm", "LeftHand"},
    {"UpperTorso", "RightUpperArm"},
    {"RightUpperArm", "RightLowerArm"},
    {"RightLowerArm", "RightHand"},
    {"LowerTorso", "LeftUpperLeg"},
    {"LeftUpperLeg", "LeftLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"},
    {"LowerTorso", "RightUpperLeg"},
    {"RightUpperLeg", "RightLowerLeg"},
    {"RightLowerLeg", "RightFoot"}
}

local function createSkeletonLines(count)
    local lines = {}
    for i = 1, count do
        local line = Drawing.new("Line")
        line.Visible = false
        line.Color = SKELETON_COLOR
        line.Thickness = 1.5
        line.Transparency = 1
        table.insert(lines, line)
    end
    return lines
end

local function removeSkeleton(player)
    if skeletonContainer[player] then
        for _, line in pairs(skeletonContainer[player]) do
            line:Remove()
        end
        skeletonContainer[player] = nil
    end
end

local function hideSkeleton(player)
    if skeletonContainer[player] then
        for _, line in pairs(skeletonContainer[player]) do
            line.Visible = false
        end
    end
end

local function renderSkeleton()
    if not SKELETON_ENABLED then
        for player, _ in pairs(skeletonContainer) do
            removeSkeleton(player)
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                local hrp = character:FindFirstChild("HumanoidRootPart")

                if humanoid and hrp and humanoid.Health > 0 then
                    local shouldRender = true
                    for _, teamName in ipairs(EXCLUDED_TEAMS) do
                        if player.Team and player.Team.Name == teamName then
                            shouldRender = false
                            break
                        end
                    end

                    if shouldRender then
                        local isR15 = character:FindFirstChild("UpperTorso") ~= nil
                        local connections = isR15 and R15_CONNECTIONS or R6_CONNECTIONS
                        local requiredLines = #connections

                        if not skeletonContainer[player] or #skeletonContainer[player] ~= requiredLines then
                            removeSkeleton(player)
                            skeletonContainer[player] = createSkeletonLines(requiredLines)
                        end

                        local lines = skeletonContainer[player]
                        local renderedCount = 0

                        for _, conn in ipairs(connections) do
                            renderedCount = renderedCount + 1
                            local partA = character:FindFirstChild(conn[1])
                            local partB = character:FindFirstChild(conn[2])

                            if partA and partB then
                                local posA, onScreenA = Camera:WorldToViewportPoint(partA.Position)
                                local posB, onScreenB = Camera:WorldToViewportPoint(partB.Position)

                                if posA.Z > 0 and posB.Z > 0 then
                                    local line = lines[renderedCount]
                                    line.Color = SKELETON_COLOR
                                    line.From = Vector2.new(posA.X, posA.Y)
                                    line.To = Vector2.new(posB.X, posB.Y)
                                    line.Visible = true
                                else
                                    lines[renderedCount].Visible = false
                                end
                            else
                                lines[renderedCount].Visible = false
                            end
                        end
                    else
                        removeSkeleton(player)
                    end
                else
                    hideSkeleton(player)
                end
            else
                removeSkeleton(player)
            end
        end
    end
end

pageObjects["VISUALS"]:AddToggle("left", "Esp Skeleton", function(state)
    SKELETON_ENABLED = state
    if not SKELETON_ENABLED then
        renderSkeleton()
    end
    print("Esp Skeleton:", state)
end)

pageObjects["VISUALS"]:AddDropdown("right", "Skeleton Color", {"White", "Red", "Green", "Blue", "Yellow", "Purple"}, "White", function(selected)
    SKELETON_COLOR = ColorList[selected] or Color3.fromRGB(255, 255, 255)
    print("Selected Skeleton Color:", selected)
end)

RunService.RenderStepped:Connect(renderSkeleton)
Players.PlayerRemoving:Connect(removeSkeleton)

local DISTANCE_ENABLED = false
local DISTANCE_COLOR = Color3.fromRGB(255, 255, 255)
local DISTANCE_FORMAT = "Studs"
local distanceContainer = {}

local function createDistanceText()
    local text = Drawing.new("Text")
    text.Visible = false
    text.Color = DISTANCE_COLOR
    text.Size = 9
    text.Center = true
    text.Outline = true
    text.OutlineColor = Color3.fromRGB(0, 0, 0)
    text.Transparency = 1
    return text
end

local function removeDistance(player)
    if distanceContainer[player] then
        distanceContainer[player]:Remove()
        distanceContainer[player] = nil
    end
end

local function hideDistance(player)
    if distanceContainer[player] then
        distanceContainer[player].Visible = false
    end
end

local function renderDistance()
    if not DISTANCE_ENABLED then
        for player, _ in pairs(distanceContainer) do
            removeDistance(player)
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                local humanoid = character:FindFirstChild("Humanoid")

                if hrp and humanoid and humanoid.Health > 0 then
                    local shouldRender = true
                    for _, teamName in ipairs(EXCLUDED_TEAMS) do
                        if player.Team and player.Team.Name == teamName then
                            shouldRender = false
                            break
                        end
                    end

                    if shouldRender then
                        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3.5, 0))

                        if not distanceContainer[player] then
                            distanceContainer[player] = createDistanceText()
                        end

                        local textObj = distanceContainer[player]
                        textObj.Color = DISTANCE_COLOR

                        if screenPos.Z > 0 then
                            local distanceStuds = (hrp.Position - Camera.CoordinateFrame.Position).Magnitude
                            local displayText = ""

                            if DISTANCE_FORMAT == "Studs" then
                                displayText = string.format("[%.0f studs]", distanceStuds)
                            elseif DISTANCE_FORMAT == "Meter" then
                                local meters = distanceStuds * 0.28
                                displayText = string.format("[%.0f m]", meters)
                            elseif DISTANCE_FORMAT == "Feet" then
                                local feet = distanceStuds * 0.92
                                displayText = string.format("[%.0f ft]", feet)
                            end

                            textObj.Text = displayText
                            textObj.Position = Vector2.new(screenPos.X, screenPos.Y)
                            textObj.Visible = true
                        else
                            hideDistance(player)
                        end
                    else
                        removeDistance(player)
                    end
                else
                    hideDistance(player)
                end
            else
                removeDistance(player)
            end
        end
    end
end

pageObjects["VISUALS"]:AddToggle("left", "Esp Distance", function(state)
    DISTANCE_ENABLED = state
    if not DISTANCE_ENABLED then
        renderDistance()
    end
    print("Esp Distance:", state)
end)

pageObjects["VISUALS"]:AddDropdown("right", "Distance Format", {"Studs", "Meter", "Feet"}, "Studs", function(selected)
    DISTANCE_FORMAT = selected
    print("Selected Distance Format:", selected)
end)

pageObjects["VISUALS"]:AddDropdown("right", "Distance Color", {"White", "Red", "Green", "Blue", "Yellow", "Purple"}, "White", function(selected)
    DISTANCE_COLOR = ColorList[selected] or Color3.fromRGB(255, 255, 255)
    print("Selected Distance Color:", selected)
end)

RunService.RenderStepped:Connect(renderDistance)
Players.PlayerRemoving:Connect(removeDistance)

pageObjects["MISC"]:AddColumnTitles("MOVEMENT", "SETTINGS")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local SPEED_ENABLED = false
local SPEED_VALUE = 16
local SPEED_MODE = "CFrame" -- Default diset ke CFrame agar jalan normal tapi cepat

local function onHeartbeat(dt)
    if not SPEED_ENABLED then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    
    if not hrp or not humanoid then return end
    
    if SPEED_MODE == "CFrame" then
        -- Jalan normal seperti biasa, tapi posisi digeser lebih cepat (tidak mengubah animasi)
        if humanoid.MoveDirection.Magnitude > 0 then
            hrp.CFrame = hrp.CFrame + (humanoid.MoveDirection * (SPEED_VALUE * dt * 3))
        end
    elseif SPEED_MODE == "Velocity" then
        local currentVelocity = hrp.Velocity
        local moveDir = humanoid.MoveDirection.Unit
        if humanoid.MoveDirection.Magnitude > 0 then
            hrp.Velocity = Vector3.new(moveDir.X * SPEED_VALUE, currentVelocity.Y, moveDir.Z * SPEED_VALUE)
        end
    elseif SPEED_MODE == "WalkSpeed" then
        humanoid.WalkSpeed = SPEED_VALUE
    end
end

pageObjects["MISC"]:AddToggle("left", "Speed Hack", function(state)
    SPEED_ENABLED = state
    if not state and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
        end
    end
    print("Speed Hack:", state)
end)

pageObjects["MISC"]:AddSlider("right", "Speed Value", 16, 150, 16, function(value)
    SPEED_VALUE = value
    print("Speed Value:", value)
end)

pageObjects["MISC"]:AddDropdown("right", "Speed Mode", {"CFrame", "Velocity", "WalkSpeed"}, "CFrame", function(selected)
    SPEED_MODE = selected
    print("Speed Mode:", selected)
end)

RunService.Heartbeat:Connect(onHeartbeat)

local JUMP_POWER_ENABLED = false
local JUMP_POWER_VALUE = 50 -- Default lompatan Roblox (umumnya 50)

local function onHeartbeat()
    if not JUMP_POWER_ENABLED then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    -- Pastikan menggunakan JumpPower (bukan JumpHeight)
    if humanoid.UseJumpPower then
        humanoid.JumpPower = JUMP_POWER_VALUE
    else
        humanoid.UseJumpPower = true
        humanoid.JumpPower = JUMP_POWER_VALUE
    end
end

-- Integrasi UI Library (Ditempatkan di halaman Visuals)
pageObjects["MISC"]:AddToggle("left", "Jump Power", function(state)
    JUMP_POWER_ENABLED = state
    if not state and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = 50 -- Reset ke default Roblox saat dimatikan
        end
    end
    print("Jump Power:", state)
end)

pageObjects["MISC"]:AddSlider("right", "Jump Value", 50, 300, 50, function(value)
    JUMP_POWER_VALUE = value
    print("Jump Power Value:", value)
end)

RunService.Heartbeat:Connect(onHeartbeat)

local INFINITE_JUMP_ENABLED = false

-- Deteksi input tombol lompat (Spasi atau tombol lompat mobile)
UserInputService.JumpRequest:Connect(function()
    if not INFINITE_JUMP_ENABLED then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        -- Memicu lompatan langsung secara instan di udara
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Integrasi UI Library (Ditempatkan di halaman Visuals/Movement)
pageObjects["MISC"]:AddToggle("left", "Infinite Jump", function(state)
    INFINITE_JUMP_ENABLED = state
    print("Infinite Jump:", state)
end)

local NOCLIP_ENABLED = false

local function onStepped()
    if not NOCLIP_ENABLED then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    -- Menonaktifkan tabrakan (CanCollide) pada semua bagian tubuh karakter agar bisa menembus objek/tembok
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

-- Integrasi UI Library (Ditempatkan di halaman Visuals)
pageObjects["MISC"]:AddToggle("left", "NoClip", function(state)
    NOCLIP_ENABLED = state
    
    -- Jika dimatikan, bagian tubuh karakter akan kembali normal (CanCollide diatur otomatis oleh game/mesin fisika)
    print("NoClip:", state)
end)

RunService.Stepped:Connect(onStepped)

local GRAVITY_ENABLED = false
local GRAVITY_VALUE = 196.2 -- Default gravitasi Roblox (196.2)

-- Integrasi UI Library (Ditempatkan di halaman Visuals)
pageObjects["MISC"]:AddToggle("left", "Custom Gravity", function(state)
    GRAVITY_ENABLED = state
    if not state then
        -- Kembalikan ke gravitasi normal Roblox saat dimatikan
        Workspace.Gravity = 196.2
    else
        Workspace.Gravity = GRAVITY_VALUE
    end
    print("Custom Gravity:", state)
end)

pageObjects["MISC"]:AddSlider("right", "Gravity Value", 0, 500, 196.2, function(value)
    GRAVITY_VALUE = value
    if GRAVITY_ENABLED then
        Workspace.Gravity = value
    end
    print("Gravity Value:", value)
end)

pageObjects["BRUTAL"]:AddColumnTitles("EXPLOITX", "SETTINGS")

RunService.RenderStepped:Connect(renderEsp)
Players.PlayerRemoving:Connect(removeEsp)
