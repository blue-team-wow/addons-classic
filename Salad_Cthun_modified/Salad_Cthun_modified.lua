local moreMelee = {
	[1] = {-17,62}, --melee        		--
	[2] = {-32,54}, --melee   		-|
	[3] = {-48,114}, --healer/ranged	-|Group 1
	[4] = {-72,168}, --ranged     		-|
	[5] = {-94,220}, --ranged           --
	--group 2
	[6] = {17,62},
	[7] = {32,54},
	[8] = {48,114},
	[9] = {72,168},
	[10] = {94,220},
	--group 3
	[11] = {-62,17},
	[12] = {-54,32},
	[13] = {-114,48},
	[14] = {-168,72},
	[15] = {-220,94},
	--group 4
	[16] = {62,17},
	[17] = {54,32},
	[18] = {114,48},
	[19] = {168,72},
	[20] = {220,94},
	--group 5
	[21] = {-62,-17},
	[22] = {-54,-32},
    [23] = {-114,-48},
	[24] = {-168,-72},
	[25] = {-220,-94},
	--group 6
	[26] = {62,-17},
	[27] = {54,-32},
	[28] = {114,-48},
	[29] = {168,-72},
	[30] = {220,-94},
	--group 7
	[31] = {-17,-62},
	[32] = {-32,-54},
	[33] = {-48,-114},
	[34] = {-72,-168},
	[35] = {-94,-220},
	--group 8
	[36] = {17,-62},
	[37] = {32,-54},
	[38] = {48,-114},
	[39] = {72,-168},
	[40] = {94,-220},
}

local lessMelee = {
	[1] = {-26,59}, --melee        		--
	[2] = {-48,113}, --melee/ranged	-|
	[3] = {-99,153}, --healer/ranged	-|Group 1
	[4] = {-44,177},--ranged     		-|
	[5] = {-93,215}, --ranged           --
	--group 2
	[6] = {26,59},
	[7] = {48,113},
	[8] = {99,153},
	[9] = {44,177},
	[10] = {93,215},
	--group 3
	[11] = {-59,26},
	[12] = {-113,48},
	[13] = {-153,99},
	[14] = {-177,44},
	[15] = {-215,93},
	--group 4
	[16] = {59,26},
	[17] = {113,48},
	[18] = {153,99},
	[19] = {177,44},
	[20] = {215,93},
	--group 5
	[21] = {-59,-26},
	[22] = {-113,-48},
	[23] = {-153,-99},
	[24] = {-177,-44},
	[25] = {-215,-93},
	--group 6
	[26] = {59,-26},
	[27] = {113,-48},
	[28] = {153,-99},
	[29] = {177,-44},
	[30] = {215,-93},
	--group 7
	[31] = {-26,-59},
	[32] = {-48,-113},
	[33] = {-99,-153},
	[34] = {-44,-177},
	[35] = {-93,-215},
	--group 8
	[36] = {26,-59},
	[37] = {48,-113},
	[38] = {99,-153},
	[39] = {44,-177},
	[40] = {93,-215},
}


local dotPos = {}



local classColors = {
	["warrior"] = {0.68, 0.51, 0.33},
	["rogue"] = {1.0, 0.96, 0.31},
	["mage"] = {0.21, 0.60, 0.74},
	["warlock"] = {0.48, 0.41, 0.69},
	["hunter"] = {0.47, 0.73, 0.25},
	["priest"] = {1.0, 1.00, 1.00},
	["paladin"] = {0.96, 0.55, 0.73},
	["druid"] = {1.0, 0.49, 0.04},
	["shaman"] = {0.0, 0.34, 0.77}
}


local Salad_PlayerName,_ = UnitName("player")
local backdrop = {
	bgFile = "Interface\\AddOns\\Salad_Cthun_modified\\Images\\background.tga",
	--bgFile = "Interface\\AddOns\\Salad_Cthun_modified\\Images\\bg.blp",
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile = false,
	edgeSize = 32,
	insets = {
		left = 12,
		right = 12,
		top = 12,
		bottom = 12
	}
}

local frame = CreateFrame("Frame", "Cthun_room", UIParent)
frame:EnableMouse(true)
frame:SetMovable(true)
frame:SetHeight(534)
frame:SetWidth(534)
frame:SetPoint("CENTER", 0, 0)
frame:SetBackdrop(backdrop)
frame:SetAlpha(1.00)
frame:SetUserPlaced(true)
frame:SetFrameStrata("HIGH")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:SetScript("OnEvent", function()
	fillGrid()
end)
frame:Hide()



local eye = CreateFrame("Frame", "Cthun", UIParent)
frame:SetMovable(true)
eye:SetPoint("CENTER", frame, "CENTER",0,0)
eye:SetHeight(133.5)
eye:SetWidth(133.5)
eye:SetAlpha(1.00)
eye:SetFrameStrata("DIALOG")
eye:SetBackdrop({bgFile = "Interface\\AddOns\\Salad_Cthun_modified\\Images\\eye.blp"})
eye:Hide()

local Salad_Slider = CreateFrame("Slider", "MySlider1", frame, "OptionsSliderTemplate")
Salad_Slider:SetPoint("BOTTOM", frame, "BOTTOMRIGHT", -80, 20)
Salad_Slider:SetMinMaxValues(0.05, 1.00)
Salad_Slider:SetValue(1.00)
Salad_Slider:SetValueStep(0.05)
getglobal(Salad_Slider:GetName() .. 'Low'):SetText('5%')
getglobal(Salad_Slider:GetName() .. 'High'):SetText('100%')
getglobal(Salad_Slider:GetName() .. 'Text'):SetText('Opacity')
Salad_Slider:SetScript("OnValueChanged", function(self)
	local value = Salad_Slider:GetValue()
	frame:SetAlpha(value)
	eye:SetAlpha(value)
end)

local Salad_Header = CreateFrame("Frame", "Salad_Header", frame)
Salad_Header:SetPoint("TOP", frame, "TOP", 0, 12)
Salad_Header:SetWidth(256)
Salad_Header:SetHeight(64)
Salad_Header:SetBackdrop({
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Header"
})

local drag = CreateFrame("Frame", nil, frame)
drag:SetWidth(256)
drag:SetHeight(64)
drag:SetPoint("TOP", frame, "TOP", 0, 12)
drag:EnableMouse(true)
drag:SetScript("OnMouseDown", function()
	frame:StartMoving()
end)

drag:SetScript("OnMouseUp", function()
	frame:StopMovingOrSizing()
end)

drag:SetScript("OnHide", function()
	frame:StopMovingOrSizing()
end)


local button = CreateFrame("Button", "Close_button", frame)
button:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
button:SetHeight(32)
button:SetWidth(32)
button:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
button:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
button:SetScript("OnLoad",
		function()
			button:RegisterForClicks("AnyUp")
		end
)
button:SetScript("OnClick",
		function()
			frame:Hide();
			eye:Hide();
		end
)

local check_frame = CreateFrame("Frame")
check_frame:RegisterEvent("PLAYER_ENTERING_WORLD")
check_frame:SetScript("OnEvent", function(self, event, arg1)
	if  event == "PLAYER_ENTERING_WORLD" then
		local title = ""
		if DotFrameType then
			dotPos = moreMelee
			title = "Up to 16 Melee"
		else
			dotPos = lessMelee
			title = "Up to 8 Melee"
		end
		local Salad_Fontstring = Salad_Header:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		Salad_Fontstring:SetPoint("CENTER", Salad_Header, "CENTER", 0, 12)
		Salad_Fontstring:SetText(title)
		local function BTN1() DotFrameType = true ReloadUI() end
		local function BTN2() DotFrameType = false ReloadUI() end
		local button1 = CreateFrame("Button", "Change_button1", frame,"UIPanelButtonTemplate")
		button1:SetPoint("TOPLEFT", frame, "TOPLEFT", 35, -5)
		button1:SetHeight(28)
		button1:SetWidth(28)
		button1:SetText("16")
		--button1:SetNormalTexture("Interface\\GossipFrame\\BinderGossipIcon")
		button1:SetScript("OnLoad",
				function()
					button:RegisterForClicks("AnyUp")
				end
		)
		button1:SetScript("OnClick",BTN1)
		button1:SetScript("OnEnter",
				function()
					button:RegisterForClicks("AnyUp")
				end
		)
		local button2 = CreateFrame("Button", "Change_button2", frame,"UIPanelButtonTemplate")
		button2:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -5)
		button2:SetHeight(28)
		button2:SetWidth(28)
		button2:SetText("8")
		--button2:SetNormalTexture("Interface\\GossipFrame\\BinderGossipIcon")
		button2:SetScript("OnLoad",
				function()
					button:RegisterForClicks("AnyUp")
				end
		)
		button2:SetScript("OnClick",BTN2)
		button2:SetScript("OnEnter",
				function()
					button:RegisterForClicks("AnyUp")
				end
		)
	for i=1,40 do
	dot = CreateFrame("Button", "Dot_"..i, frame)
	--dot:RegisterEvent("PLAYER_ENTERING_WORLD")
	dot:SetPoint("CENTER", frame, "CENTER", dotPos[i][1], dotPos[i][2])
	dot:EnableMouse(true)
	dot:SetFrameLevel(dot:GetFrameLevel()+3)
	tooltip = CreateFrame("GameTooltip", "Tooltip_"..i, nil, "GameTooltipTemplate")
	local texdot = dot:CreateTexture("Texture_"..i, "OVERLAY")
	dot.texture = texdot
	texdot:SetAllPoints(dot)
	texdot:SetTexture("Interface\\AddOns\\Salad_Cthun_modified\\Images\\playerdot2.tga")
	texdot:Hide()
	dot:SetScript("OnEnter", function()
		tooltip:SetOwner(dot, "ANCHOR_RIGHT")
		tooltip:SetText("Empty")
		tooltip:Show()
	end)
	dot:SetScript("OnLeave", function()
		tooltip:Hide()
	end)
end
	end
end)

function newDot(dot, tooltip, texture, name, class)
	if (Salad_PlayerName == name) then
		dot:SetWidth(36)
		dot:SetHeight(36)
		--dot:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_2")
	else
		dot:SetWidth(20)
		dot:SetHeight(20)
	end

	if name ~= "Empty" then
		texture:SetVertexColor(classColors[class][1], classColors[class][2], classColors[class][3], 1.0)
		texture:Show()
	else
		texture:Hide()
	end

	dot:SetScript("OnEnter", function()
		tooltip:SetOwner(dot, "ANCHOR_RIGHT")
		tooltip:SetText(name)
		tooltip:Show()
	end)

	dot:SetScript("OnLeave", function()
		tooltip:Hide()
	end)
end

local dotRes = {{{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"}}, -- group 1
				{{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"}}, -- group 2
				{{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"}}, --    |
				{{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"}}, --    |
				{{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"}}, --    |
				{{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"}}, --    |
				{{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"}}, --    |
				{{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"},{"Empty","Empty"}}} -- group 8

function getRaidInfo()
	local tab = {}
	for i=1,40 do
		local name,_,subgroup,_,_,class = GetRaidRosterInfo(i);
		if  (class == "ROGUE" or  class == "WARRIOR") then
			if dotRes[subgroup][1][1] == "Empty" or dotRes[subgroup][1][1] == name then
				dotRes[subgroup][1] = {name, class}
				tab[i] = true
			elseif dotRes[subgroup][2][1] == "Empty" or dotRes[subgroup][2][1] == name then
				dotRes[subgroup][2] = {name, class}
				tab[i] = true
			end
		elseif (class == "PRIEST" or class == "PALADIN" or class == "DRUID" or class == "SHAMAN") then
			if dotRes[subgroup][3][1] == "Empty" or dotRes[subgroup][3][1] == name then
				dotRes[subgroup][3] = {name, class}
				tab[i] = true
			elseif dotRes[subgroup][4][1] == "Empty" or dotRes[subgroup][4][1] == name then
				dotRes[subgroup][4] = {name, class}
				tab[i] = true
			end
		elseif (class == "MAGE" or class == "HUNTER") then
			if dotRes[subgroup][5][1] == "Empty" or dotRes[subgroup][5][1] == name then
				dotRes[subgroup][5] = {name, class}
				tab[i] = true
			elseif dotRes[subgroup][4][1] == "Empty" or dotRes[subgroup][4][1] == name then
				dotRes[subgroup][4] = {name, class}
				tab[i] = true
			end
		elseif ( class == "WARLOCK" ) then
			if dotRes[subgroup][4][1] == "Empty" or dotRes[subgroup][4][1] == name then
				dotRes[subgroup][4] = {name, class}
				tab[i] = true
			elseif dotRes[subgroup][5][1] == "Empty" or dotRes[subgroup][5][1] == name then
				dotRes[subgroup][5] = {name, class}
				tab[i] = true
			end
		end
	end
	for i=1,40 do
		if not tab[i] then
			local name,_,subgroup,_,_,class = GetRaidRosterInfo(i);
			if (class == "PRIEST" or class == "PALADIN" or class == "DRUID" or class == "SHAMAN") then
				if dotRes[subgroup][5][1] == "Empty" or dotRes[subgroup][5][1] == name then
					dotRes[subgroup][5] = {name, class}
				elseif dotRes[subgroup][2][1] == "Empty" or dotRes[subgroup][2][1] == name then
					dotRes[subgroup][2] = {name, class}
				else
					dotRes[subgroup][1] = {name, class}
				end
			elseif (class == "ROGUE" or  class == "WARRIOR") then
				if dotRes[subgroup][3][1] == "Empty" or dotRes[subgroup][3][1] == name then
					dotRes[subgroup][3] = {name, class}
				elseif dotRes[subgroup][4][1] == "Empty" or dotRes[subgroup][4][1] == name then
					dotRes[subgroup][4] = {name, class}
				else
					dotRes[subgroup][5] = {name, class}
				end
			elseif ( class == "WARLOCK" ) then
				if dotRes[subgroup][3][1] == "Empty" or dotRes[subgroup][3][1] == name then
					dotRes[subgroup][3] = {name, class}
				elseif dotRes[subgroup][2][1] == "Empty" or dotRes[subgroup][2][1] == name then
					dotRes[subgroup][2] = {name, class}
				else
					dotRes[subgroup][1] = {name, class}
				end
			elseif (class == "MAGE" or class == "HUNTER") then
				if dotRes[subgroup][3][1] == "Empty" or dotRes[subgroup][3][1] == name then
					dotRes[subgroup][3] = {name, class}
				elseif dotRes[subgroup][2][1] == "Empty" or dotRes[subgroup][2][1] == name then
					dotRes[subgroup][2] = {name, class}
				else
					dotRes[subgroup][1] = {name, class}
				end
			end
		end
	end
end

function fillGrid()
	wipeReserves()
	getRaidInfo()
	for i=1,8 do
		for j=1,5 do
			local x = ((i-1)*5)+j
			newDot(_G["Dot_"..x], _G["Tooltip_"..x], _G["Texture_"..x], dotRes[i][j][1], strlower(dotRes[i][j][2]))
		end
	end
end

function wipeReserves()
	for i=1,8 do
		for j=1,5 do
			for k=1,2 do
				dotRes[i][j][k] = "Empty"
			end
		end
	end
end
SLASH_SALAD1 = "/CT";

local function HandleSlashCommands(str)
	if (str == "help") then
		print("|cffffff00Commands:");
		print("|cffffff00   /salad |cff00d2d6help |r|cffffff00-- show this help menu");
		print("|cffffff00   /salad -- open cthun map");
	elseif (str == "fill" or str == "" or str == nil) then
		frame:Show();
		eye:Show();
		fillGrid()
	else
		print("|cffffff00Command not found");
	end
end

SlashCmdList.SALAD = HandleSlashCommands;
