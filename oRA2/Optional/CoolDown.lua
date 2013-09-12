assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRAOCoolDown")

local roster = AceLibrary("Roster-2.1")
local media = LibStub("LibSharedMedia-2.0")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["CoolDown Monitor"] = true,
	["Optional/CoolDown"] = true,
	["Options for CoolDown."] = true,
} end )

L:RegisterTranslations("koKR", function() return {
	["CoolDown Monitor"] = "재사용 대기시간 현황",
	["Optional/CoolDown"] = "부가/재사용 대기시간",
	["Options for CoolDown."] = "재사용 대기시간에 관한 설정입니다.",
} end )

L:RegisterTranslations("zhCN", function() return {
	["CoolDown Monitor"] = "冷却监视器",
	["Optional/CoolDown"] = "选择/冷却",
	["Options for CoolDown."] = "冷却监视器的选项。",
} end )

L:RegisterTranslations("zhTW", function() return {
	["CoolDown Monitor"] = "冷卻監視器",
	["Optional/CoolDown"] = "可選/冷卻",
	["Options for CoolDown."] = "冷卻監視器的選項",
} end )

L:RegisterTranslations("frFR", function() return {
	["CoolDown Monitor"] = "Surveillance des \"cooldowns\"",
	["Optional/CoolDown"] = "Optionnel/Temps de recharge",
	["Options for CoolDown."] = "Options concernant les temps de recharge.",
} end )

L:RegisterTranslations("deDE", function() return {
	["CoolDown Monitor"] = "CoolDown Monitor",
	["Optional/CoolDown"] = "Wahlweise/CoolDown",
	["Options for CoolDown."] = "Optionen f\195\188r den CoolDown-Monitor.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = oRA:NewModule("OptionalCooldown", "CandyBar-2.0")
mod.defaults = {
	scale = 1,
	hidden = false,
	lock = false,
}
mod.optional = true
mod.name = L["Optional/CoolDown"]
mod.consoleCmd = "cooldown"
mod.consoleOptions = {
	type = "group",
	desc = L["Options for CoolDown."],
	name = L["CoolDown Monitor"],
	disabled = function() return not oRA:IsActive() end,
	handler = mod,
	args = {
	}
}

------------------------------
--      Initialization      --
------------------------------


function mod:OnEnable()
	self.enabled = nil

	self:RegisterEvent("oRA_LeftRaid")	
	self:RegisterEvent("oRA_JoinedRaid")
	self:RegisterEvent("oRA_BarTexture")
	self:RegisterEvent("RosterLib_UnitChanged")
	
	self:OnProfileEnable()
end

function mod:OnDisable()
	self:DisableMonitor()
end

function mod:OnProfileEnable()
	if self.db.profile.cooldowns then	-- was moved to .realm 2007-07-14
		self.db.profile.cooldowns = nil
	end
		
	if not self.db.realm.cooldowns then 
		self.db.realm.cooldowns = {} 
	end
end

------------------------
--   Event Handlers   --
------------------------

function mod:oRA_JoinedRaid()
	if not self.enabled then
		self.enabled = true
		oRA:MakeDraggableWindow(L["CoolDown Monitor"], "oRACoolDownFrame", mod.consoleOptions, self.db.profile)			
		
		self:RegisterCheck("CD", "oRA_CoolDown")
	end
end

function mod:oRA_LeftRaid()
	self:DisableMonitor()
end

function mod:oRA_CoolDown(msg, author)
	local what, length = select(3, msg:find("^CD (%d+) (%d+)"))
	if author and what and tonumber(length) then
		self.db.realm.cooldowns[author] = time() + tonumber(length)*60
		self:StartCoolDown( author, tonumber(length)*60)
	end
end

function mod:oRA_BarTexture( texture )
	for key, val in pairs( self.db.realm.cooldowns) do
		self:SetCandyBarTexture( "oRAOCoolDown "..key, media:Fetch('statusbar', texture))
	end
end

function mod:RosterLib_UnitChanged(unitid, name)  -- required to make /reload work. also good if people re-join a raid though!
	if self.frame and self.frame:IsVisible() then
		local t = time()
		local val = self.db.realm.cooldowns[name]
		if val and t<val then
			self:StartCoolDown( name, val-t )
		end
	end
end

-------------------------
--  Utility Functions  --
-------------------------

function mod:DisableMonitor()
	self.enabled = nil
	if self.frame then
		self.frame:Hide()
	end
	self:StopAllCoolDowns()
	self:UnregisterCheck("CD")
end

function mod:StartAllCoolDowns()
	local t = time()
	for key, val in pairs(self.db.realm.cooldowns) do
		if t >= val then
			self.db.realm.cooldowns[key] = nil
			self:StopCoolDown( key )
		else
			self:StartCoolDown( key, val - t )
		end
	end
end

function mod:StopAllCoolDowns()
	local t = time()
	for key, val in pairs(self.db.realm.cooldowns) do
		if t >= val then self.db.realm.cooldowns[key] = nil end
		self:StopCoolDown( key )
	end
end

function mod:StartCoolDown( player, time )
	if not self.enabled or self.db.profile.hidden then return end
	local unit = roster:GetUnitObjectFromName( player )
	if not unit then return end
	local id = "oRAOCoolDown " .. player

	self:RegisterCandyBarGroup("oRAOCoolDownGroup")
	self:SetCandyBarGroupPoint("oRAOCoolDownGroup", "TOP", self.frame.title, "BOTTOM", 0, -5 )
	self:SetCandyBarOnSizeGroup("oRAOCoolDownGroup", self.OnSizeGroup, self)
	self:RegisterCandyBar( id, time, player, nil, unit.class)
	self:RegisterCandyBarWithGroup( id, "oRAOCoolDownGroup")
	self:SetCandyBarWidth( id, 150)
	self:SetCandyBarTexture( id, media:Fetch('statusbar', oRA.db.profile.bartexture))
	self:SetCandyBarScale( id, self.db.profile.scale or 1)
	self:StartCandyBar( id, true)
end

function mod:StopCoolDown( player )
	self:UnregisterCandyBar( "oRAOCoolDown "..player )
end

------------------------
--  Window Handling   --
------------------------

function mod:OnCreateFrame()	-- called by core window handler
	self.frame:SetWidth(175)
	self:OnSizeGroup(0)
end

function mod:OnToggleFrame(v)  -- called by core window handler
	if v then
		self:StartAllCoolDowns()
	else
		self:StopAllCoolDowns()
	end
end

function mod:OnSetScale(scale)  -- called by core window handler
	if self.frame then
		for key, val in pairs(self.db.realm.cooldowns) do
			if self:IsCandyBarRegistered( "oRAOCoolDown "..key ) then
				self:SetCandyBarScale( "oRAOCoolDown "..key, scale )
			end
		end
	end
	self.db.profile.scale = scale
end

function mod:OnSizeGroup(height)
	self.frame:SetHeight(28 + height)
end