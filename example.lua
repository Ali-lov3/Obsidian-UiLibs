local repo = "https://raw.githubusercontent.com/Ali-lov3/Obsidian-UiLibs/refs/heads/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ali-lov3/Obsidian-UiLibs/refs/heads/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ali-lov3/Obsidian-UiLibs/refs/heads/main/addons/SaveManager.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles
Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true
local Window = Library:CreateWindow({
	Title = "mspaint",
	Footer = "version: example",
	Icon = 113064253322398,
	NotifySide = "Right",
	ShowCustomCursor = true,
})
local Tabs = {
	Main = Window:AddTab("Main", "user"),
	Key = Window:AddKeyTab("Key System"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}
local LeftGroupBox = Tabs.Main:AddLeftGroupbox("Groupbox", "boxes")
LeftGroupBox:AddToggle("MyToggle", {
	Text = "This is a toggle",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Default = true,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end,
})
	:AddColorPicker("ColorPicker1", {
		Default = Color3.new(1, 0, 0),
		Title = "Some color1",
		Transparency = 0,
		Callback = function(Value)
			print("[cb] Color changed!", Value)
		end,
	})
	:AddColorPicker("ColorPicker2", {
		Default = Color3.new(0, 1, 0),
		Title = "Some color2",
		Callback = function(Value)
			print("[cb] Color changed!", Value)
		end,
	})
Toggles.MyToggle:OnChanged(function()
	print("MyToggle changed to:", Toggles.MyToggle.Value)
end)
Toggles.MyToggle:SetValue(false)
LeftGroupBox:AddCheckbox("MyCheckbox", {
	Text = "This is a checkbox",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Default = true,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyCheckbox changed to:", Value)
	end,
})
Toggles.MyCheckbox:OnChanged(function()
	print("MyCheckbox changed to:", Toggles.MyCheckbox.Value)
end)
local MyButton = LeftGroupBox:AddButton({
	Text = "Button",
	Func = function()
		print("You clicked a button!")
	end,
	DoubleClick = false,
	Tooltip = "This is the main button",
	DisabledTooltip = "I am disabled!",
	Disabled = false,
	Visible = true,
	Risky = false,
})
local MyButton2 = MyButton:AddButton({
	Text = "Sub button",
	Func = function()
		print("You clicked a sub button!")
	end,
	DoubleClick = true,
	Tooltip = "This is the sub button",
	DisabledTooltip = "I am disabled!",
})
local MyDisabledButton = LeftGroupBox:AddButton({
	Text = "Disabled Button",
	Func = function()
		print("You somehow clicked a disabled button!")
	end,
	DoubleClick = false,
	Tooltip = "This is a disabled button",
	DisabledTooltip = "I am disabled!",
	Disabled = true,
})
LeftGroupBox:AddLabel("This is a label")
LeftGroupBox:AddLabel("This is a label\n\nwhich wraps its text!", true)
LeftGroupBox:AddLabel("This is a label exposed to Labels", true, "TestLabel")
LeftGroupBox:AddLabel("SecondTestLabel", {
	Text = "This is a label made with table options and an index",
	DoesWrap = true,
})
LeftGroupBox:AddLabel("SecondTestLabel", {
	Text = "This is a label that doesn't wrap it's own text",
	DoesWrap = false,
})
LeftGroupBox:AddDivider()
LeftGroupBox:AddSlider("MySlider", {
	Text = "This is my slider!",
	Default = 0,
	Min = 0,
	Max = 5,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
		print("[cb] MySlider was changed! New value:", Value)
	end,
	Tooltip = "I am a slider!",
	DisabledTooltip = "I am disabled!",
	Disabled = false,
	Visible = true,
})
local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
	print("MySlider was changed! New value:", Options.MySlider.Value)
end)
Options.MySlider:SetValue(3)
LeftGroupBox:AddSlider("MySlider2", {
	Text = "This is my custom display slider!",
	Default = 0,
	Min = 0,
	Max = 5,
	Rounding = 0,
	Compact = false,
	FormatDisplayValue = function(slider, value)
		if value == slider.Max then return 'Everything' end
		if value == slider.Min then return 'Nothing' end
	end,
	Tooltip = "I am a slider!",
	DisabledTooltip = "I am disabled!",
	Disabled = false,
	Visible = true,
})
LeftGroupBox:AddInput("MyTextbox", {
	Default = "My textbox!",
	Numeric = false,
	Finished = false,
	ClearTextOnFocus = true,
	Text = "This is a textbox",
	Tooltip = "This is a tooltip",
	Placeholder = "Placeholder text",
	Callback = function(Value)
		print("[cb] Text updated. New text:", Value)
	end,
})
Options.MyTextbox:OnChanged(function()
	print("Text updated. New text:", Options.MyTextbox.Value)
end)
local DropdownGroupBox = Tabs.Main:AddRightGroupbox("Dropdowns")
DropdownGroupBox:AddDropdown("MyDropdown", {
	Values = { "This", "is", "a", "dropdown" },
	Default = 1,
	Multi = false,
	Text = "A dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Searchable = false,
	Callback = function(Value)
		print("[cb] Dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true,
})
Options.MyDropdown:OnChanged(function()
	print("Dropdown got changed. New value:", Options.MyDropdown.Value)
end)
Options.MyDropdown:SetValue("This")
DropdownGroupBox:AddDropdown("MySearchableDropdown", {
	Values = { "This", "is", "a", "searchable", "dropdown" },
	Default = 1,
	Multi = false,
	Text = "A searchable dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Searchable = true,
	Callback = function(Value)
		print("[cb] Dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true,
})
DropdownGroupBox:AddDropdown("MyDisplayFormattedDropdown", {
	Values = { "This", "is", "a", "formatted", "dropdown" },
	Default = 1,
	Multi = false,
	Text = "A display formatted dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	FormatDisplayValue = function(Value)
		if Value == "formatted" then
			return "display formatted"
		end
		return Value
	end,
	Searchable = false,
	Callback = function(Value)
		print("[cb] Display formatted dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true,
})
DropdownGroupBox:AddDropdown("MyMultiDropdown", {
	Values = { "This", "is", "a", "dropdown" },
	Default = 1,
	Multi = true,
	Text = "A multi dropdown",
	Tooltip = "This is a tooltip",
	Callback = function(Value)
		print("[cb] Multi dropdown got changed:")
		for key, value in next, Options.MyMultiDropdown.Value do
			print(key, value)
		end
	end,
})
Options.MyMultiDropdown:SetValue({
	This = true,
	is = true,
})
DropdownGroupBox:AddDropdown("MyDisabledDropdown", {
	Values = { "This", "is", "a", "dropdown" },
	Default = 1,
	Multi = false,
	Text = "A disabled dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Callback = function(Value)
		print("[cb] Disabled dropdown got changed. New value:", Value)
	end,
	Disabled = true,
	Visible = true,
})
DropdownGroupBox:AddDropdown("MyDisabledValueDropdown", {
	Values = { "This", "is", "a", "dropdown", "with", "disabled", "value" },
	DisabledValues = { "disabled" },
	Default = 1,
	Multi = false,
	Text = "A dropdown with disabled value",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Callback = function(Value)
		print("[cb] Dropdown with disabled value got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true,
})
DropdownGroupBox:AddDropdown("MyVeryLongDropdown", {
	Values = {
		"This",
		"is",
		"a",
		"very",
		"long",
		"dropdown",
		"with",
		"a",
		"lot",
		"of",
		"values",
		"but",
		"you",
		"can",
		"see",
		"more",
		"than",
		"8",
		"values",
	},
	Default = 1,
	Multi = false,
	MaxVisibleDropdownItems = 12,
	Text = "A very long dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Searchable = false,
	Callback = function(Value)
		print("[cb] Very long dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true,
})
DropdownGroupBox:AddDropdown("MyPlayerDropdown", {
	SpecialType = "Player",
	ExcludeLocalPlayer = true,
	Text = "A player dropdown",
	Tooltip = "This is a tooltip",
	Callback = function(Value)
		print("[cb] Player dropdown got changed:", Value)
	end,
})
DropdownGroupBox:AddDropdown("MyTeamDropdown", {
	SpecialType = "Team",
	Text = "A team dropdown",
	Tooltip = "This is a tooltip",
	Callback = function(Value)
		print("[cb] Team dropdown got changed:", Value)
	end,
})
LeftGroupBox:AddLabel("Color"):AddColorPicker("ColorPicker", {
	Default = Color3.new(0, 1, 0),
	Title = "Some color",
	Transparency = 0,
	Callback = function(Value)
		print("[cb] Color changed!", Value)
	end,
})
Options.ColorPicker:OnChanged(function()
	print("Color changed!", Options.ColorPicker.Value)
	print("Transparency changed!", Options.ColorPicker.Transparency)
end)
Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140))
LeftGroupBox:AddLabel("Keybind"):AddKeyPicker("KeyPicker", {
	Default = "MB2",
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Auto lockpick safes",
	NoUI = false,
	Callback = function(Value)
		print("[cb] Keybind clicked!", Value)
	end,
	ChangedCallback = function(NewKey, NewModifiers)
		print("[cb] Keybind changed!", NewKey, table.unpack(NewModifiers or {}))
	end,
})
Options.KeyPicker:OnClick(function()
	print("Keybind clicked!", Options.KeyPicker:GetState())
end)
Options.KeyPicker:OnChanged(function()
	print("Keybind changed!", Options.KeyPicker.Value, table.unpack(Options.KeyPicker.Modifiers or {}))
end)
task.spawn(function()
	while task.wait(1) do
		local state = Options.KeyPicker:GetState()
		if state then
			print("KeyPicker is being held down")
		end
		if Library.Unloaded then
			break
		end
	end
end)
Options.KeyPicker:SetValue({ "MB2", "Hold" })
local KeybindNumber = 0
LeftGroupBox:AddLabel("Press Keybind"):AddKeyPicker("KeyPicker2", {
	Default = "X",
	Mode = "Press",
	WaitForCallback = false,
	Text = "Increase Number",
	Callback = function()
		KeybindNumber = KeybindNumber + 1
		print("[cb] Keybind clicked! Number increased to:", KeybindNumber)
	end
})
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox("Groupbox #2")
LeftGroupBox2:AddLabel(
	"This label spans multiple lines! We're gonna run out of UI space...\nJust kidding! Scroll down!\n\n\nHello from below!",
	true
)
local TabBox = Tabs.Main:AddRightTabbox()
local Tab1 = TabBox:AddTab("Tab 1")
Tab1:AddToggle("Tab1Toggle", { Text = "Tab1 Toggle" })
local Tab2 = TabBox:AddTab("Tab 2")
Tab2:AddToggle("Tab2Toggle", { Text = "Tab2 Toggle" })
Library:OnUnload(function()
	print("Unloaded!")
end)
Tabs.Key:AddLabel({
	Text = "Key: Banana",
	DoesWrap = true,
	Size = 16,
})
Tabs.Key:AddKeyBox(function(ReceivedKey)
	local Success = ReceivedKey == "Banana"
	print("Expected Key: Banana - Received Key:", ReceivedKey, "| Success:", Success)
	Library:Notify({
		Title = "Expected Key: Banana",
		Description = "Received Key: " .. ReceivedKey .. "\nSuccess: " .. tostring(Success),
		Time = 4,
	})
end)
Library:AddDraggableLabel("This is a Draggable Label")
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")
MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",
	Text = "Notification Side",
	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",
	Text = "DPI Scale",
	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)
		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddSlider("UICornerSlider", {
	Text = "Corner Radius",
	Default = Library.CornerRadius,
	Min = 0,
	Max = 20,
	Rounding = 0,
	Callback = function(value)
		Window:SetCornerRadius(value)
	end
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
