﻿
assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRALItem")
local roster = AceLibrary("Roster-2.1")

-- DO NOT translate these, use the locale tables below
local reagents = {
	PRIEST = "SacredCandle",
	MAGE = "ArcanePowder",
	DRUID = "WildThornroot",
	WARLOCK = "SoulShard",
	SHAMAN = "Ankh",
	PALADIN = "SymbolofDivinity",
	ROGUE = "FlashPowder",
}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Options for item checks."] = true,
	["Checks Disabled"] = true,
	["Items"] = true,
	["Reagents"] = true,
	["Close"] = true,
	["Refresh"] = true,
	["Name"] = true,
	["Item"] = true,
	["Amount"] = true,
	["Nr"] = true,
	["Perform item check"] = true,
	["Check the raid for an item."] = true,
	["<item>"] = true,
	["Perform reagent check"] = true,
	["Check the raid for reagents."] = true,
	["Leader/Item"] = true,

	SacredCandle = "Sacred Candle",
	ArcanePowder = "Arcane Powder",
	WildThornroot = "Wild Thornroot",
	Ankh = "Ankh",
	SymbolofDivinity = "Symbol of Divinity",
	FlashPowder = "Flash Powder",
	SoulShard = "Soul Shard",
} end )

L:RegisterTranslations("koKR", function() return {
	["Options for item checks."] = "아이템 확인에 대한 설정입니다.",
	["SacredCandle"] = "성스러운 양초",
	["ArcanePowder"] = "불가사의한 가루",
	["WildThornroot"] = "야생 가시",
	["Ankh"] = "십자가",
	["SymbolofDivinity"] = "신앙의 징표",
	["FlashPowder"] = "섬광 화약",
	["SoulShard"] = "영혼의 조각",
	["Checks Disabled"] = "확인 사용안함",
	["Items"] = "아이템",
	["Reagents"] = "재료",
	["Close"] = "닫기",
	["Refresh"] = "새로고침",
	["Name"] = "이름",
	["Item"] = "아이템",
	["Amount"] = "수량",
	["Nr"] = "갯수",
	["Perform item check"] = "아이템 확인 실시",
	["Check the raid for an item."] = "공격대원의 아이템을 확인합니다.",
	["<item>"] = "<아이템>",
	["Perform reagent check"] = "재료 확인 실시",
	["Check the raid for reagents."] = "공격대원의 재료를 확인합니다.",
	["Leader/Item"] = "공격대장/아이템",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Options for item checks."] = "物品检查选项。",
	["Checks Disabled"] = "禁止查询",
	["Items"] = "物品",
	["Reagents"] = "施法材料",
	["Close"] = "关闭",
	["Refresh"] = "刷新",
	["Name"] = "姓名",
	["Item"] = "物品",
	["Amount"] = "数量",
	["Nr"] = "数量",
	["Perform item check"] = "进行物品检查",
	["Check the raid for an item."] = "对团队进行物品检查。",
	["<item>"] = "<物品>",
	["Perform reagent check"] = "进行施法材料检查",
	["Check the raid for reagents."] = "对团队进行施法材料检查。",
	["Leader/Item"] = "团长/物品",

	["SacredCandle"] = "神圣蜡烛",
	["ArcanePowder"] = "魔粉",
	["WildThornroot"] = "野生刺藤",
	["Ankh"] = "十字章",
	["SymbolofDivinity"] = "神圣符印",
	["FlashPowder"] = "闪光粉",
	["SoulShard"] = "灵魂碎片",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Options for item checks."] = "物品檢查選項",
	["SacredCandle"] = "神聖蠟燭",
	["ArcanePowder"] = "魔粉",
	["WildThornroot"] = "野生羽蔓",
	["Ankh"] = "十字章",
	["SymbolofDivinity"] = "神聖符印",
	["FlashPowder"] = "閃光粉",
	["SoulShard"] = "靈魂碎片",
	["Checks Disabled"] = "檢查已停用",
	["Items"] = "物品",
	["Reagents"] = "施法材料",
	["Close"] = "關閉",
	["Refresh"] = "更新",
	["Name"] = "姓名",
	["Item"] = "物品",
	["Amount"] = "數量",
	["Nr"] = "數量",
	["Perform item check"] = "進行物品檢查",
	["Check the raid for an item."] = "對團隊進行物品檢查",
	["<item>"] = "<物品>",
	["Perform reagent check"] = "進行施法材料檢查",
	["Check the raid for reagents."] = "對團隊進行施法材料檢查",
	["Leader/Item"] = "Leader/Item",
} end )

L:RegisterTranslations("deDE", function() return {
	["Options for item checks."] = "Optionen f\195\188r Gegenstands-Check",
	["SacredCandle"] = "Hochheilige Kerze",
	["ArcanePowder"] = "Arkanes Pulver",
	["WildThornroot"] = "Wilder Dornwurz",
	["Ankh"] = "Ankh",
	["SymbolofDivinity"] = "Symbol der K\195\182nige",
	["FlashPowder"] = "Blitzstrahlpulver",
	["SoulShard"] = "Seelensplitter",
	["Checks Disabled"] = "Deaktiviere \195\156berpr\195\188fungen",
	["Items"] = "Gegenst\195\164nde",
	["Reagents"] = "Reagenzien",
	["Close"] = "Schlie\195\159en",
	["Refresh"] = "Erneuern",
	["Name"] = "Name",
	["Item"] = "Gegenstand",
	["Amount"] = "Anzahl",
	["Nr"] = "Nr",
	["Perform item check"] = "Starte eine Gegenstands-Check",
	["Check the raid for an item."] = "\195\156berpr\195\188ft die Schlachtgruppea auf einen Gegenstand.",
	["<item>"] = "<item>",
	["Perform reagent check"] = "Starte einen Reagenzien-Check",
	["Check the raid for reagents."] = "\195\156berpr\195\188ft die Schlachtgruppea auf Reagenzien.",
	["Leader/Item"] = "Anf\195\188hrer/Gegenstand",
} end )

L:RegisterTranslations("frFR", function() return {
	["Options for item checks."] = "Options concernant les vérifications des objets.",
	["Checks Disabled"] = "Vérifications désactivées.",
	["Items"] = "Objets",
	["Reagents"] = "Composants",
	["Close"] = "Fermer",
	["Refresh"] = "Rafraîchir",
	["Name"] = "Nom",
	["Item"] = "Objet",
	["Amount"] = "Quantité",
	["Nr"] = "N°",
	["Perform item check"] = "Vérifier un objet",
	["Check the raid for an item."] = "Vérifie la disponibilité d'un objet dans le raid.",
	["<item>"] = "<objet>",
	["Perform reagent check"] = "Vérifier les composants",
	["Check the raid for reagents."] = "Vérifie les composants du raid.",
	["Leader/Item"] = "Chef/Objet",

	SacredCandle = "Bougie sacrée",
	ArcanePowder = "Poudre des arcanes",
	WildThornroot = "Ronceterre sauvage",
	Ankh = "Ankh",
	SymbolofDivinity = "Symbole de divinité",
	FlashPowder = "Poudre aveuglante",
	SoulShard = "Fragment d'âme",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = oRA:NewModule("LeaderItem")
mod.leader = true
mod.name = L["Leader/Item"]
mod.consoleCmd = "item"
mod.consoleOptions = {
	type = "group",
	desc = L["Options for item checks."],
	name = L["Item"],
	handler = mod,
	args = {
		check = {
			type="text", name = L["Perform item check"],
			desc = L["Check the raid for an item."],
			get = false,
			set = "PerformItemCheck",
			validate = function(v)
				return v:find("(.+)")
			end,
			usage = L["<item>"],
			disabled = function() return not oRA:IsModuleActive(mod) or not oRA:IsValidRequest() end,
		},
		reagent = {
			type="execute", name = L["Perform reagent check"],
			desc = L["Check the raid for reagents."],
			func = "PerformReagentCheck",
			disabled = function() return not oRA:IsModuleActive(mod) or not oRA:IsValidRequest() end,
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

local items = nil

function mod:OnEnable()
	self:RegisterCheck("ITM", "oRA_ItemResponse")
	self:RegisterCheck("REA", "oRA_ReagentResponse")

	self:RegisterShorthand("raitem", "PerformItemCheck")
	self:RegisterShorthand("rareg", "PerformReagentCheck")
end

function mod:oRA_ItemResponse( msg, author)
	local numitems, itemname, requestby = select(3, msg:find("^ITM ([-%d]+) (.+) ([^%s]+)$"))
	if numitems and itemname and requestby and requestby == UnitName("player") then
		numitems = tonumber(numitems)
		if numitems == -1 then
			self:AddPlayer( author, L["Checks Disabled"], 0 )
		else
			self:AddPlayer( author, itemname, numitems )
		end
		oRA:UpdateWindow()
	end
end

function mod:oRA_ReagentResponse( msg, author)
	local numitems, requestby = select(3, msg:find("^REA ([^%s]+) ([^%s]+)$"))
	if numitems and requestby and requestby == UnitName("player") then
		numitems = tonumber(numitems)
		local u = roster:GetUnitObjectFromName( author )
		if u and u.class and u.class ~= "PET" then
			if reagents[u.class] then
				if numitems == -1 then
					self:AddPlayer( author, L["Checks Disabled"], 0 )
				else
					self:AddPlayer( author, L[reagents[u.class]], numitems )
				end
				oRA:UpdateWindow()
			end
		end
	end
end

---------------------------
--   Utility Functions   --
---------------------------

function mod:AddPlayer( nick, item, amount )
	table.insert(items, self:new(self.coloredNames[nick], item, amount or 0))
end

--------------------------
--   Command Handlers   --
--------------------------

local function RefreshItemCheck()
	mod:PerformReagentCheck( mod.item )
end

function mod:PerformItemCheck( item )
	if not oRA:IsPromoted() then return end
	local linkName = select(3, item:find("%[(.+)%]"))
	if linkName then item = linkName end

	items = self:del(items)
	items = self:new()

	self.item = item
	oRA:SendMessage( "ITMC " .. item )
	oRA:OpenWindow( L["Items"], items, RefreshItemCheck, L["Name"], 130, L["Item"], 130, L["Nr"], 30 )
end

local function RefreshReagentCheck()
	mod:PerformReagentCheck()
end

function mod:PerformReagentCheck()
	if not oRA:IsPromoted() then return end

	items = self:del(items)
	items = self:new()

	oRA:SendMessage( "REAC" )
	oRA:OpenWindow( L["Reagents"], items, RefreshReagentCheck, L["Name"], 130, L["Item"], 130, L["Nr"], 30 )
end

