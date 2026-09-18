local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "NEOW_PREMIUM"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local function new(class, props, parent)
	local obj = Instance.new(class)
	for property, value in pairs(props or {}) do
		obj[property] = value
	end
	obj.Parent = parent
	return obj
end

local function tween(obj, time, properties)
	return TweenService:Create(
		obj,
		TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		properties
	)
end

local function round(parent, radius)
	return new("UICorner", {
		CornerRadius = UDim.new(0, radius)
	}, parent)
end

local function outline(parent, transparency)
	return new("UIStroke", {
		Color = Color3.fromRGB(255, 255, 255),
		Transparency = transparency or 0.9,
		Thickness = 1
	}, parent)
end

local main = new("Frame", {
	Name = "Main",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.new(0.78, 0, 0.72, 0),
	BackgroundColor3 = Color3.fromRGB(17, 17, 19),
	BorderSizePixel = 0,
	ClipsDescendants = true
}, gui)

round(main, 14)
outline(main, 0.82)

new("UISizeConstraint", {
	MinSize = Vector2.new(350, 300),
	MaxSize = Vector2.new(1050, 680)
}, main)

local header = new("Frame", {
	Name = "Header",
	Size = UDim2.new(1, 0, 0, 62),
	BackgroundColor3 = Color3.fromRGB(23, 23, 26),
	BorderSizePixel = 0
}, main)

local headerLine = new("Frame", {
	Position = UDim2.new(0, 0, 1, -1),
	Size = UDim2.new(1, 0, 0, 1),
	BackgroundColor3 = Color3.fromRGB(38, 38, 42),
	BorderSizePixel = 0
}, header)

local brand = new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 20, 0, 10),
	Size = UDim2.new(0, 180, 0, 22),
	Text = "NEOW PREMIUM",
	TextColor3 = Color3.fromRGB(245, 245, 245),
	TextSize = 16,
	Font = Enum.Font.GothamBold,
	TextXAlignment = Enum.TextXAlignment.Left
}, header)

local domain = new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 20, 0, 33),
	Size = UDim2.new(0, 180, 0, 17),
	Text = "neoblox.biz.id",
	TextColor3 = Color3.fromRGB(125, 125, 132),
	TextSize = 10,
	Font = Enum.Font.GothamMedium,
	TextXAlignment = Enum.TextXAlignment.Left
}, header)

local minimize = new("TextButton", {
	Name = "Minimize",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(1, -72, 0.5, 0),
	Size = UDim2.fromOffset(34, 34),
	BackgroundColor3 = Color3.fromRGB(28, 28, 32),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "—",
	TextColor3 = Color3.fromRGB(170, 170, 175),
	TextSize = 18,
	Font = Enum.Font.GothamMedium,
	AutoButtonColor = false
}, header)

round(minimize, 8)

local maximize = new("TextButton", {
	Name = "Maximize",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(1, -42, 0.5, 0),
	Size = UDim2.fromOffset(34, 34),
	BackgroundColor3 = Color3.fromRGB(28, 28, 32),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "□",
	TextColor3 = Color3.fromRGB(170, 170, 175),
	TextSize = 15,
	Font = Enum.Font.GothamMedium,
	AutoButtonColor = false
}, header)

round(maximize, 8)

local close = new("TextButton", {
	Name = "Close",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(1, -12, 0.5, 0),
	Size = UDim2.fromOffset(34, 34),
	BackgroundColor3 = Color3.fromRGB(28, 28, 32),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "×",
	TextColor3 = Color3.fromRGB(180, 180, 185),
	TextSize = 22,
	Font = Enum.Font.GothamMedium,
	AutoButtonColor = false
}, header)

round(close, 8)

local body = new("Frame", {
	Name = "Body",
	Position = UDim2.new(0, 0, 0, 62),
	Size = UDim2.new(1, 0, 1, -62),
	BackgroundTransparency = 1
}, main)

local sidebar = new("Frame", {
	Name = "Sidebar",
	Size = UDim2.new(0, 178, 1, 0),
	BackgroundColor3 = Color3.fromRGB(20, 20, 23),
	BorderSizePixel = 0
}, body)

local sidebarPadding = new("UIPadding", {
	PaddingTop = UDim.new(0, 14),
	PaddingLeft = UDim.new(0, 10),
	PaddingRight = UDim.new(0, 10)
}, sidebar)

local search = new("TextBox", {
	Name = "Search",
	Size = UDim2.new(1, 0, 0, 38),
	BackgroundColor3 = Color3.fromRGB(29, 29, 33),
	BorderSizePixel = 0,
	ClearTextOnFocus = false,
	PlaceholderText = "Search",
	PlaceholderColor3 = Color3.fromRGB(105, 105, 112),
	Text = "",
	TextColor3 = Color3.fromRGB(235, 235, 238),
	TextSize = 11,
	Font = Enum.Font.Gotham,
	TextXAlignment = Enum.TextXAlignment.Left
}, sidebar)

round(search, 9)
outline(search, 0.9)

new("UIPadding", {
	PaddingLeft = UDim.new(0, 13),
	PaddingRight = UDim.new(0, 10)
}, search)

local nav = new("Frame", {
	Name = "Navigation",
	Position = UDim2.new(0, 0, 0, 50),
	Size = UDim2.new(1, 0, 1, -50),
	BackgroundTransparency = 1
}, sidebar)

local info = new("TextButton", {
	Name = "Info",
	Size = UDim2.new(1, 0, 0, 40),
	BackgroundColor3 = Color3.fromRGB(39, 39, 44),
	BorderSizePixel = 0,
	Text = "Info",
	TextColor3 = Color3.fromRGB(240, 240, 243),
	TextSize = 12,
	Font = Enum.Font.GothamMedium,
	TextXAlignment = Enum.TextXAlignment.Left,
	AutoButtonColor = false
}, nav)

round(info, 9)

new("UIPadding", {
	PaddingLeft = UDim.new(0, 13)
}, info)

local content = new("Frame", {
	Name = "Content",
	Position = UDim2.new(0, 178, 0, 0),
	Size = UDim2.new(1, -178, 1, 0),
	BackgroundColor3 = Color3.fromRGB(17, 17, 19),
	BorderSizePixel = 0
}, body)

local contentTitle = new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 23, 0, 19),
	Size = UDim2.new(1, -46, 0, 27),
	Text = "Info",
	TextColor3 = Color3.fromRGB(245, 245, 247),
	TextSize = 21,
	Font = Enum.Font.GothamBold,
	TextXAlignment = Enum.TextXAlignment.Left
}, content)

local contentSubtitle = new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 24, 0, 48),
	Size = UDim2.new(1, -48, 0, 18),
	Text = "Information",
	TextColor3 = Color3.fromRGB(120, 120, 127),
	TextSize = 10,
	Font = Enum.Font.GothamMedium,
	TextXAlignment = Enum.TextXAlignment.Left
}, content)

local scroll = new("ScrollingFrame", {
	Name = "Scroll",
	Position = UDim2.new(0, 20, 0, 77),
	Size = UDim2.new(1, -40, 1, -92),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ScrollBarThickness = 3,
	ScrollBarImageColor3 = Color3.fromRGB(100, 100, 105),
	ScrollBarImageTransparency = 0.45,
	CanvasSize = UDim2.new(0, 0, 0, 0)
}, content)

local list = new("UIListLayout", {
	Padding = UDim.new(0, 10),
	SortOrder = Enum.SortOrder.LayoutOrder
}, scroll)

local welcome = new("Frame", {
	Name = "Welcome",
	LayoutOrder = 1,
	Size = UDim2.new(1, 0, 0, 145),
	BackgroundColor3 = Color3.fromRGB(26, 26, 30),
	BorderSizePixel = 0
}, scroll)

round(welcome, 11)
outline(welcome, 0.91)

local welcomeTitle = new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 20, 0, 25),
	Size = UDim2.new(1, -40, 0, 30),
	Text = "NEOW PREMIUM",
	TextColor3 = Color3.fromRGB(245, 245, 247),
	TextSize = 23,
	Font = Enum.Font.GothamBold,
	TextXAlignment = Enum.TextXAlignment.Left
}, welcome)

local welcomeText = new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 21, 0, 61),
	Size = UDim2.new(1, -42, 0, 42),
	Text = "Welcome to NEOW PREMIUM.\nA clean and modern experience by neoblox.biz.id.",
	TextColor3 = Color3.fromRGB(145, 145, 152),
	TextSize = 11,
	Font = Enum.Font.Gotham,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextYAlignment = Enum.TextYAlignment.Top
}, welcome)

local version = new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(1, -75, 0, 17),
	Size = UDim2.fromOffset(55, 18),
	Text = "V1.0",
	TextColor3 = Color3.fromRGB(105, 105, 112),
	TextSize = 9,
	Font = Enum.Font.GothamMedium,
	TextXAlignment = Enum.TextXAlignment.Right
}, welcome)

local website = new("Frame", {
	Name = "Website",
	LayoutOrder = 2,
	Size = UDim2.new(1, 0, 0, 92),
	BackgroundColor3 = Color3.fromRGB(25, 25, 29),
	BorderSizePixel = 0
}, scroll)

round(website, 10)
outline(website, 0.91)

new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 18, 0, 14),
	Size = UDim2.new(1, -36, 0, 20),
	Text = "Website",
	TextColor3 = Color3.fromRGB(235, 235, 238),
	TextSize = 13,
	Font = Enum.Font.GothamBold,
	TextXAlignment = Enum.TextXAlignment.Left
}, website)

new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 18, 0, 41),
	Size = UDim2.new(1, -36, 0, 20),
	Text = "neoblox.biz.id",
	TextColor3 = Color3.fromRGB(145, 145, 152),
	TextSize = 11,
	Font = Enum.Font.Gotham,
	TextXAlignment = Enum.TextXAlignment.Left
}, website)

local status = new("Frame", {
	Name = "Status",
	LayoutOrder = 3,
	Size = UDim2.new(1, 0, 0, 92),
	BackgroundColor3 = Color3.fromRGB(25, 25, 29),
	BorderSizePixel = 0
}, scroll)

round(status, 10)
outline(status, 0.91)

new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 18, 0, 14),
	Size = UDim2.new(1, -36, 0, 20),
	Text = "Status",
	TextColor3 = Color3.fromRGB(235, 235, 238),
	TextSize = 13,
	Font = Enum.Font.GothamBold,
	TextXAlignment = Enum.TextXAlignment.Left
}, status)

new("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 18, 0, 41),
	Size = UDim2.new(1, -36, 0, 20),
	Text = "NEOW PREMIUM is ready.",
	TextColor3 = Color3.fromRGB(145, 145, 152),
	TextSize = 11,
	Font = Enum.Font.Gotham,
	TextXAlignment = Enum.TextXAlignment.Left
}, status)

local function updateCanvas()
	scroll.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 10)
end

list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
updateCanvas()

local function buttonHover(button, normal, hovered)
	button.MouseEnter:Connect(function()
		tween(button, 0.15, {
			BackgroundColor3 = hovered
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		tween(button, 0.15, {
			BackgroundColor3 = normal
		}):Play()
	end)
end

buttonHover(
	info,
	Color3.fromRGB(39, 39, 44),
	Color3.fromRGB(47, 47, 53)
)

buttonHover(
	minimize,
	Color3.fromRGB(28, 28, 32),
	Color3.fromRGB(39, 39, 44)
)

buttonHover(
	maximize,
	Color3.fromRGB(28, 28, 32),
	Color3.fromRGB(39, 39, 44)
)

buttonHover(
	close,
	Color3.fromRGB(28, 28, 32),
	Color3.fromRGB(50, 34, 34)
)

local minimized = false
local maximized = false
local savedSize = main.Size
local savedPosition = main.Position

minimize.MouseButton1Click:Connect(function()
	if minimized then
		minimized = false
		body.Visible = true

		tween(main, 0.25, {
			Size = maximized and UDim2.fromScale(0.92, 0.88) or savedSize
		}):Play()
	else
		minimized = true
		body.Visible = false

		tween(main, 0.25, {
			Size = UDim2.new(main.Size.X.Scale, main.Size.X.Offset, 0, 62)
		}):Play()
	end
end)

maximize.MouseButton1Click:Connect(function()
	if minimized then
		return
	end

	if maximized then
		maximized = false

		tween(main, 0.3, {
			Size = savedSize,
			Position = savedPosition
		}):Play()
	else
		savedSize = main.Size
		savedPosition = main.Position
		maximized = true

		tween(main, 0.3, {
			Size = UDim2.fromScale(0.92, 0.88),
			Position = UDim2.fromScale(0.5, 0.5)
		}):Play()
	end
end)

close.MouseButton1Click:Connect(function()
	tween(main, 0.2, {
		Size = UDim2.fromOffset(0, 0)
	}):Play()

	task.wait(0.2)
	gui:Destroy()
end)

local dragging = false
local dragStart
local startPosition

header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPosition = main.Position
	end
end)

header.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not dragging then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
	end
end)

local searchData = {
	{
		name = "Info",
		description = "Information about NEOW PREMIUM"
	},
	{
		name = "Website",
		description = "neoblox.biz.id"
	},
	{
		name = "Status",
		description = "Current hub status"
	}
}

local resultsContainer = new("Frame", {
	Name = "SearchResults",
	Position = UDim2.new(0, 0, 0, 50),
	Size = UDim2.new(1, 0, 1, -50),
	BackgroundTransparency = 1,
	Visible = false
}, nav)

local resultsLayout = new("UIListLayout", {
	Padding = UDim.new(0, 6),
	SortOrder = Enum.SortOrder.LayoutOrder
}, resultsContainer)

local function clearResults()
	for _, child in ipairs(resultsContainer:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
end

local function createResult(item, order)
	local result = new("TextButton", {
		Name = "Result",
		LayoutOrder = order,
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = Color3.fromRGB(30, 30, 34),
		BorderSizePixel = 0,
		Text = item.name,
		TextColor3 = Color3.fromRGB(225, 225, 228),
		TextSize = 11,
		Font = Enum.Font.GothamMedium,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutoButtonColor = false
	}, resultsContainer)

	round(result, 8)

	new("UIPadding", {
		PaddingLeft = UDim.new(0, 13)
	}, result)

	buttonHover(
		result,
		Color3.fromRGB(30, 30, 34),
		Color3.fromRGB(43, 43, 48)
	)
end

search:GetPropertyChangedSignal("Text"):Connect(function()
	local query = search.Text:lower():match("^%s*(.-)%s*$")

	clearResults()

	if query == "" then
		info.Visible = true
		resultsContainer.Visible = false
		return
	end

	info.Visible = false
	resultsContainer.Visible = true

	local order = 0

	for _, item in ipairs(searchData) do
		if item.name:lower():find(query, 1, true)
			or item.description:lower():find(query, 1, true) then

			order += 1
			createResult(item, order)
		end
	end
end)

info.MouseButton1Click:Connect(function()
	contentTitle.Text = "Info"
	contentSubtitle.Text = "Information"
end)

local camera = workspace.CurrentCamera

local function responsive()
	local viewport = camera.ViewportSize

	if viewport.X < 600 then
		main.Size = UDim2.new(0.94, 0, 0.78, 0)
		sidebar.Size = UDim2.new(0, 145, 1, 0)
		content.Position = UDim2.new(0, 145, 0, 0)
		content.Size = UDim2.new(1, -145, 1, 0)

		brand.TextSize = 14
		domain.TextSize = 9

		contentTitle.TextSize = 18
	else
		main.Size = UDim2.new(0.78, 0, 0.72, 0)
		sidebar.Size = UDim2.new(0, 178, 1, 0)
		content.Position = UDim2.new(0, 178, 0, 0)
		content.Size = UDim2.new(1, -178, 1, 0)

		brand.TextSize = 16
		domain.TextSize = 10

		contentTitle.TextSize = 21
	end
end

camera:GetPropertyChangedSignal("ViewportSize"):Connect(responsive)
responsive()
