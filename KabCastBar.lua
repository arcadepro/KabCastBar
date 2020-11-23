--[[ local ver 	= GetAddOnMetadata("KabCastBar","Version")
local title = GetAddOnMetadata("KabCastBar","Title")
local notes = GetAddOnMetadata("KabCastBar","Notes") --]]
local f = CreateFrame("Frame", "myFrame", UIParent)

-- get class colors
--[[ local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local class, classcaps, classindex = UnitClass("player") -- None = 0, -- Warrior = 1,-- Paladin = 2,-- Hunter = 3,-- Rogue = 4,-- Priest = 5,-- DeathKnight = 6,-- Shaman = 7,-- Mage = 8,-- Warlock = 9,-- Monk = 10,-- Druid = 11, -- Demonhunter = 12
local color = RAID_CLASS_COLORS[classcaps]
ChatFrame1:AddMessage(class, color.r, color.g, color.b) --]]

local classtableDB = {
	WARRIOR		= {x = 0, y = -307},
	PALADIN		= {x = 0, y = -445},
	HUNTER		= {x = 0, y = -162},
	ROGUE		= {x = 0, y = -445},
	PRIEST		= {x = 0, y = -445},
	DEATHKNIGHT	= {x = 0, y = -309},
	SHAMAN		= {x = 0, y = -346},
	MAGE		= {x = 0, y = -188},
	WARLOCK		= {x = 0, y = -188},
	MONK		= {x = 0, y = -445},
	DRUID		= {x = 0, y = -350},
	DEMONHUNTER = {x = 0, y = -445}
}

-- eg. classtable[WARRIOR]
local class, classcaps, classindex = UnitClass("player") -- None = 0, -- Warrior = 1,-- Paladin = 2,-- Hunter = 3,-- Rogue = 4,-- Priest = 5,-- DeathKnight = 6,-- Shaman = 7,-- Mage = 8,-- Warlock = 9,-- Monk = 10,-- Druid = 11, -- Demonhunter = 12
local coords = classtableDB[classcaps] or {x=0, y=0}

f:SetScript("OnEvent", function(self, event, name, ...)
	--if not name == "KabCastBar" then return end
	if event == "ARCHAEOLOGY_SURVEY_CAST" then
		ArcheologyDigsiteProgressBar:ClearAllPoints()
		ArcheologyDigsiteProgressBar:SetPoint("CENTER", UIParent, "CENTER", 0, -380)
		ArcheologyDigsiteProgressBar:SetScale(1.0)
		ArcheologyDigsiteProgressBar.SetPoint = function() end
--[[ 	elseif event == "UNIT_POWER_BAR_SHOW" or event == "UNIT_POWER_BAR_HIDE" then
		--PlayerPowerBarAlt:EnableMouse(false)
		print("lol")
		--PlayerPowerBarAlt:SetParent(f)
		PlayerPowerBarAlt:ClearAllPoints()
		PlayerPowerBarAlt:SetPoint("CENTER", 400, 400) -- x,y from table
		--PlayerPowerBarAlt.ignoreFramePositionManager = true
		--PlayerPowerBarAlt:SetScale(0.85)
		PlayerPowerBarAlt.SetPoint = function() end --]]
	elseif event == "PLAYER_ENTERING_WORLD" then
		f:UnregisterEvent("PLAYER_ENTERING_WORLD")
		CastingBarFrame:EnableMouse(false)
		CastingBarFrame:ClearAllPoints()
		CastingBarFrame:SetPoint("CENTER", UIParent, "CENTER", coords.x, coords.y) -- x,y from table
		CastingBarFrame:SetScale(1.0)
		CastingBarFrame.SetPoint = function() end

		ToggleFramerate()
		FramerateLabel:SetAlpha(0)
		--FramerateLabel:ClearAllPoints()
		FramerateText:ClearAllPoints()
		FramerateText:SetTextColor(0,1,0)
		FramerateText:SetScale(0.65)
		--FramerateLabel:SetPoint("RIGHT",nil"CENTER",0,-445)
		FramerateText:SetPoint("LEFT",PlayerFrame,"RIGHT",-276,64)
		--FramerateText:SetPoint = function() end


		if classcaps == "ROGUE" then
			ComboPointPlayerFrame:EnableMouse(false)
			ComboPointPlayerFrame.Combo1:EnableMouse(false)
			ComboPointPlayerFrame.Combo2:EnableMouse(false)
			ComboPointPlayerFrame.Combo3:EnableMouse(false)
			ComboPointPlayerFrame.Combo4:EnableMouse(false)
			ComboPointPlayerFrame.Combo5:EnableMouse(false)
			ComboPointPlayerFrame.Background:SetAlpha(0)
			ComboPointPlayerFrame:ClearAllPoints()
			--RuneFrame:SetParent(UIParent)
			ComboPointPlayerFrame:SetPoint("CENTER",UIParent,"CENTER",0,-176)
			ComboPointPlayerFrame:SetScale(0.90)
			ComboPointPlayerFrame.SetPoint = function() end
		end
		if classcaps == "MONK" then
			MonkHarmonyBarFrame:EnableMouse(false)
			MonkStaggerBar:EnableMouse(false)
			--MonkHarmonyBarFrame.Background:SetAlpha(0)
			MonkStaggerBar:ClearAllPoints()
			MonkStaggerBar:SetPoint("CENTER",UIParent,"CENTER",0,-136)
			MonkStaggerBar:SetScale(1.20)
			MonkStaggerBar.SetPoint = function() end
			MonkHarmonyBarFrame:ClearAllPoints()
			MonkHarmonyBarFrame:SetPoint("CENTER",UIParent,"CENTER",0,-176)
			MonkHarmonyBarFrame:SetScale(0.90)
			MonkHarmonyBarFrame.SetPoint = function() end
		end
		if classcaps == "DEATHKNIGHT" then
			RuneFrame:EnableMouse(false)
			RuneFrame.Rune1:EnableMouse(false)
			RuneFrame.Rune2:EnableMouse(false)
			RuneFrame.Rune3:EnableMouse(false)
			RuneFrame.Rune4:EnableMouse(false)
			RuneFrame.Rune5:EnableMouse(false)
			RuneFrame.Rune6:EnableMouse(false)
			RuneFrame:ClearAllPoints()
			--RuneFrame:SetParent(UIParent)
			RuneFrame:SetPoint("CENTER",UIParent,"CENTER",6,-176)
			RuneFrame:SetScale(0.90)
			RuneFrame.SetPoint = function() end
		end
		if classcaps == "WARLOCK" then
			WarlockPowerFrame:EnableMouse(false)
			WarlockPowerFrame:ClearAllPoints()
			WarlockPowerFrame:SetPoint("CENTER",UIParent,"CENTER",0,-178)
			WarlockPowerFrame:SetScale(0.90)
			WarlockPowerFrame.SetPoint = function() end
		end
		f:SetParent(nil)
	end
		--print (coords.x, coords.y)
end)

--f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("ARCHAEOLOGY_SURVEY_CAST")
--[[ f:RegisterEvent("UNIT_POWER_BAR_SHOW")
f:RegisterEvent("UNIT_POWER_BAR_HIDE") --]]
