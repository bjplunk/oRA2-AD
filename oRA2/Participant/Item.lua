
assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRAPItem")

local reagents = {
	PRIEST = 17029, -- "Sacred Candle"
	MAGE = 17020, -- "Arcane Powder",
	DRUID = 17026, -- "Wild Thornroot"
	WARLOCK = 6265, -- "SoulShard"
	SHAMAN = 17030, -- "Ankh"
	PALADIN = 17033, -- "SymbolofDivinity"
	ROGUE = 5140, -- "FlashPowder"
}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Item"] = true,
	["Options for item checks."] = true,
	["Participant/Item"] = true,
	["Disable Item Checks"] = true,
	["Disable Responding to Item Checks."] = true,
	["Disable Reagent Checks"] = true,
	["Disable Responding to Reagent Checks."] = true,
} end )

L:RegisterTranslations("koKR", function() return {
	["Item"] = "아이템",
	["Options for item checks."] = "아이템 확인에 대한 설정입니다.",
	["Participant/Item"] = "부분/아이템",
	["Disable Item Checks"] = "아이템 확인 무시",
	["Disable Responding to Item Checks."] = "아이템 확인에 대한 응답을 하지 않습니다.",
	["Disable Reagent Checks"] = "재료 확인 무시",
	["Disable Responding to Reagent Checks."] = "재료 확인에 대한 응답을 하지 않습니다.",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Item"] = "物品",
	["Options for item checks."] = "物品检查选项。",
	["Participant/Item"] = "成员/物品",
	["Disable Item Checks"] = "关闭物品检查",
	["Disable Responding to Item Checks."] = "停止回应物品检查。",
	["Disable Reagent Checks"] = "关闭施法材料检查",
	["Disable Responding to Reagent Checks."] = "停止回应施法材料检查。",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Item"] = "物品",
	["Options for item checks."] = "物品檢查選項",
	["Participant/Item"] = "隊員/物品",
	["Disable Item Checks"] = "停用檢查",
	["Disable Responding to Item Checks."] = "停止回應物品檢查。",
	["Disable Reagent Checks"] = "關閉物品檢查",
	["Disable Responding to Reagent Checks."] = "關閉物品檢查回應",	
} end )

L:RegisterTranslations("deDE", function() return {
	["Item"] = "Gegenstand",
	["Participant/Item"] = "Teilnehmer/Gegenstand",
	["Options for item checks."] = "Optionen f\195\188r Gegenstands-Check",
	["Disable Item Checks"] = "Deaktiviere Gegenstands-Checks",
	["Disable Responding to Item Checks."] = "Deaktiviert die Antwort auf Gegenstands-Checks",
	["Disable Reagent Checks"] = "Deaktiviere Reagenzien-Checks",
	["Disable Responding to Reagent Checks."] = "Deaktiviert die Antwort auf Reagenzien-Checks",
} end )

L:RegisterTranslations("frFR", function() return {
	["Item"] = "Objet",
	["Options for item checks."] = "Options concernant les vérifications des objets.",
	["Participant/Item"] = "Participant/Objet",
	["Disable Item Checks"] = "Désactiver les vérifications des objets",
	["Disable Responding to Item Checks."] = "Désactive l'envoi d'une réponse lors des vérifications des objets.",
	["Disable Reagent Checks"] = "Désactiver les vérifications des composants",
	["Disable Responding to Reagent Checks."] = "Désactive l'envoi d'une réponse lors des vérifications des composants.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = oRA:NewModule("ParticipantItem")
mod.defaults = {
	disable = false,
	reagentdisable = false,
}
mod.participant = true
mod.name = L["Participant/Item"]
mod.consoleCmd = "item"
mod.consoleOptions = {
	type = "group",
	desc = L["Options for item checks."],
	name = L["Item"],
	disabled = function() return not oRA:IsActive() end,
	args = {
		disableItem = {
			type = "toggle",
			name = L["Disable Item Checks"],
			desc = L["Disable Responding to Item Checks."],
			get = function() return mod.db.profile.disable end,
			set = function(v) mod.db.profile.disable = v end,
		},
		disableReagent = {
			type = "toggle",
			name = L["Disable Reagent Checks"],
			desc = L["Disable Responding to Reagent Checks."],
			get = function() return mod.db.profile.reagentdisable end,
			set = function(v) mod.db.profile.reagentdisable = v end,
		},
		
	}
}

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:RegisterCheck("ITMC", "oRA_ItemCheck")
	self:RegisterCheck("REAC", "oRA_ReagentCheck")
end

-------------------------
--   Event Handlers    --
-------------------------

function mod:oRA_ItemCheck( msg, author)
	if not oRA:IsValidRequest(author) then return end
	local itemname = select(3, msg:find("^ITMC (.+)$"))
	if itemname then
		if self.db.profile.disable then
			oRA:SendMessage("ITM -1 "..itemname.." "..author)
		else
			local numitems = GetItemCount(itemname)
			if numitems and numitems > 0 then
				oRA:SendMessage("ITM "..numitems.." "..itemname.." "..author)
			end
		end
	end
end

function mod:oRA_ReagentCheck(msg, author)
	if not oRA:IsValidRequest(author) then return end
	if self.db.profile.reagentdisable then 
		oRA:SendMessage("REA -1 "..author )
	else
		local numitems = self:GetReagents()
		if numitems and numitems > 0 then
			oRA:SendMessage("REA " .. numitems .. " " .. author )
		end
	end
end

-------------------------
--  Utility Functions  --
-------------------------

function mod:GetReagents()
	local class = select(2, UnitClass("player"))
	if reagents[class] then
		return GetItemCount(reagents[class])
	end
	return -1
end

