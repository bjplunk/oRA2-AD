-- Original implementation by:
-- brotherhobbes@gmail.com
-- Adapted further by Ammo

assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRALLoot")

local lootmethods = {
	["Need before greed"] = "needbeforegreed",
	["Free for all"] = "freeforall",
	["Round robin"] = "roundrobin",
	["Master looter"] = "master",
	["Group loot"] = "group",
}

local lootthresholds = {
	[ITEM_QUALITY2_DESC] = 2,
	[ITEM_QUALITY3_DESC] = 3,
	[ITEM_QUALITY4_DESC] = 4,
	[ITEM_QUALITY5_DESC] = 5,
	[ITEM_QUALITY6_DESC] = 6,
}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Loot"] = true,
	["Leader/Loot"] = true,
	["Options for loot."] = true,
	["Method"] = true,
	["Threshold"] = true,
	["Set the loot method."] = true,
	["Set the loot threshold."] = true,
	["Free for all"] = true,
	["Round robin"] = true,
	["Master looter"] = true,
	["Group loot"] = true,
	["Need before greed"] = true,
	["<method>"] = true,
	["<threshold>"] = true,
} end )

L:RegisterTranslations("zhCN", function() return {
	["Loot"] = "拾取",
	["Leader/Loot"] = "团长/拾取",
	["Options for loot."] = "拾取选项。",
	["Method"] = "方式",
	["Threshold"] = "品质",
	["Set the loot method."] = "设定拾取方式。",
	["Set the loot threshold."] = "设定拾取品质。",
	["Free for all"] = "自由拾取",
	["Round robin"] = "轮流拾取",
	["Master looter"] = "队长分配",
	["Group loot"] = "队伍分配",
	["Need before greed"] = "需求优先",
	["<method>"] = "<方式>",
	["<threshold>"] = "<品质>",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Loot"] = "拾取",
	["Leader/Loot"] = "Leader/Loot",
	["Options for loot."] = "拾取設定",
	["Method"] = "拾取方式",
	["Threshold"] = "品質",
	["Set the loot method."] = "設定拾取方式",
	["Set the loot threshold."] = "設定拾取品質",
	["Free for all"] = "自由拾取",
	["Round robin"] = "輪流拾取",
	["Master looter"] = "隊長分配",
	["Group loot"] = "隊伍分配",
	["Need before greed"] = "需求優先",
	["<method>"] = "<拾取>",
	["<threshold>"] = "<品質>",
} end )

L:RegisterTranslations("frFR", function() return {
	["Loot"] = "Butin",
	["Leader/Loot"] = "Chef/Butin",
	["Options for loot."] = "Options concernant le butin.",
	["Method"] = "M\195\169thode",
	["Threshold"] = "Seuil",
	["Set the loot method."] = "D\195\169termine la m\195\169thode de distribution du butin.",
	["Set the loot threshold."] = "D\195\169termine le seuil du butin.",
	["Free for all"] = "Acc\195\168s libre",
	["Round robin"] = "Chacun son tour",
	["Master looter"] = "Ma\195\174tre du butin",
	["Group loot"] = "Butin de groupe",
	["Need before greed"] = "Le besoin avant la cupidit\195\169",
	["<method>"] = "<m\195\169thode>",
	["<threshold>"] = "<seuil>",
} end )

L:RegisterTranslations("deDE", function() return {
	["Loot"] = "Loot",
	["Leader/Loot"] = "Anf\195\188hrer/Loot",
	["Options for loot."] = "Optionen f\195\188r das Erbeuten von Gegenst\195\164nden.",
	["Method"] = "Methode",
	["Threshold"] = "Schwelle",
	["Set the loot method."] = "Setze die Loot-Methode.",
	["Set the loot threshold."] = "Setze die Pl\195\188nder-Schwelle.",
	["Free for all"] = "Jeder gegen Jeden",
	["Round robin"] = "Reihum",
	["Master looter"] = "Pl\195\188ndermeister",
	["Group loot"] = "Pl\195\188ndern als Gruppe",
	["Need before greed"] = "Bedarf vor Gier",
	["<method>"] = "<Methode>",
	["<threshold>"] = "<Schwelle>",
} end )

L:RegisterTranslations("koKR", function() return {
	["Loot"] = "전리품",
	["Leader/Loot"] = "공격대장/전리품",
	["Options for loot."] = "전리품에 대한 설정입니다.",
	["Method"] = "방식",
	["Threshold"] = "품질 제한",
	["Set the loot method."] = "전리품 획득 방식을 설정합니다.",
	["Set the loot threshold."] = "전리품 획득 품질을 설정합니다.",
	["Free for all"] = "자유 획득",
	["Round robin"] = "차례대로 획득",
	["Master looter"] = "담당자가 획득",
	["Group loot"] = "주사위 굴림",
	["Need before greed"] = "주사위 굴림(착용자 우선)",
	["<method>"] = "<방식>",
	["<threshold>"] = "<품질>",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = oRA:NewModule("LeaderLoot")
mod.defaults = {
	method = L["Master looter"],
	threshold = ITEM_QUALITY2_DESC,
	master = UnitName("player"),
}
mod.leader = true
mod.name = L["Leader/Loot"]
mod.consoleCmd = "loot"
mod.consoleOptions = {
	type = "group",
	name = L["Loot"],
	desc = L["Options for loot."],
	disabled = function() return not oRA:IsActive() end,
	args = {
		method = {
			type = "text",
			name = L["Method"], desc = L["Set the loot method."],
			get = function() return mod.db.profile.method end,
			set = function(v) 
				mod.db.profile.method = v
				mod:SetLootMethod()
			end,
			validate = {
				L["Free for all"],
				L["Round robin"],
				L["Master looter"],
				L["Group loot"],
				L["Need before greed"],
			},
			usage = L["<method>"],
		},
		threshold = {
			type = "text",
			name = L["Threshold"], desc = L["Set the loot threshold."],
			get = function() return mod.db.profile.threshold end,
			set = function(v)
				mod.db.profile.threshold = v
				mod:SetLootMethod()
			end,
			validate = {
				ITEM_QUALITY2_DESC,
				ITEM_QUALITY3_DESC,
				ITEM_QUALITY4_DESC,
				ITEM_QUALITY5_DESC,
				ITEM_QUALITY6_DESC,
			},
			usage = L["<threshold>"], 
		},
	},
}

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:SetLootMethod()
end

----------------------
-- Command handlers --
----------------------

function mod:SetLootMethod()
	if not IsRaidLeader() then return end

	local method = self.db.profile.method
	local threshold = self.db.profile.threshold

	if not (method and L:HasReverseTranslation( method ) and lootmethods[L:GetReverseTranslation(method)]) then
		method = self.defaults.method
	end
	method = lootmethods[L:GetReverseTranslation(method)]

	if not threshold or not lootthresholds[threshold] then
		threshold = self.defaults.threshold
	end
	threshold = lootthresholds[threshold]

	-- SetLootMethod("method"[,"masterPlayer" or ,threshold])
	-- method  "group", "freeforall", "master", "neeedbeforegreed", "roundrobin".
	-- threshold  0 poor  1 common  2 uncommon  3 rare  4 epic  5 legendary  6 artifact    

	SetLootMethod(method, self.db.profile.master, threshold)
	if method == "master" or method == "group" then
		self:ScheduleEvent("oralootthreshold", SetLootThreshold, 3, threshold)
	end
end

