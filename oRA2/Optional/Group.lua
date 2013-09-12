assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRAOGroup")
local roster = AceLibrary("Roster-2.1")
local playergroup = 0

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Group"] = true,
	["Optional/Group"] = true,
	["Options for Group."] = true,
	["%s has joined your group."] = true,
	["%s has left your group."] = true,
	["You have joined group %d."] = true,
	["Group Change"] = true,
	["Notify for group change."] = true,
	["Members Change"] = true,
	["Notify for group members change."] = true,
	["You are now in group %d."] = true,
	["%s has left your group."] = true,
	["%s has joined your group."] = true,
} end )

L:RegisterTranslations("zhCN", function() return {
	["Group"] = "队伍",
	["Optional/Group"] = "选择/队伍",
	["Options for Group."] = "队伍的选项。",
	["%s has joined your group."] = "%s加入了你的小队。",
	["%s has left your group."] = "%s离开了小队。",
	["You have joined group %d."] = "你加入了第%d小队。",
	["Group Change"] = "队伍更变",
	["Notify for group change."] = "提醒队伍更变。",
	["Members Change"] = "成员更变",
	["Notify for group members change."] = "提醒成员更变。",
	["You are now in group %d."] = "你现在是在第%d小队。",
	["%s has left your group."] = "%s离开了小队。",
	["%s has joined your group."] = "%s加入了小队。",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Group"] = "隊伍",
	["Optional/Group"] = "Optional/Group",
	["Options for Group."] = "設定隊伍",
	["%s has joined your group."] = "%s加入了小隊",
	["%s has left your group."] = "%s離開了小隊",
	["You have joined group %d."] = "你加入了第%d小隊",
	["Group Change"] = "隊伍變更",
	["Notify for group change."] = "隊伍變更時發出提醒",
	["Members Change"] = "成員變更",
	["Notify for group members change."] = "成員變更時發出提醒",
	["You are now in group %d."] = "你現在加入了第%d小隊",
	["%s has left your group."] = "%s離開了小隊",
	["%s has joined your group."] = "%s加入了小隊",
} end )

L:RegisterTranslations("koKR", function() return {
	["Group"] = "파티",
	["Optional/Group"] = "부가/파티",
	["Options for Group."] = "파티에 대한 설정입니다.",
	["%s has joined your group."] = "%s|1이;가; 파티에 참가했습니다.",
	["%s has left your group."] = "%s|1이;가; 파티를 떠났습니다.",
	["You have joined group %d."] = "%d 파티에 참가했습니다.",
	["Group Change"] = "파티 변경",
	["Notify for group change."] = "파티 변경 사항을 알립니다.",
	["Members Change"] = "파티원 변경",
	["Notify for group members change."] = "파티원 변경 사항을 알립니다.",
	["You are now in group %d."] = "현재 %d 파티 내에 있습니다.",
	["%s has left your group."] = "%s|1이;가; 파티를 떠났습니다.",
	["%s has joined your group."] = "%s|1이;가; 파티에 참가했습니다.",
} end )

L:RegisterTranslations("frFR", function() return {
	["Group"] = "Groupe",
	["Optional/Group"] = "Optionnel/Groupe",
	["Options for Group."] = "Options concernant votre groupe.",
	["%s has joined your group."] = "%s a rejoint votre groupe.",
	["%s has left your group."] = "%s a quitt\195\169 votre groupe.",
	["You have joined group %d."] = "Vous avez rejoint le groupe %d.",
	["Group Change"] = "Changement de groupe",
	["Notify for group change."] = "Vous pr\195\169viens quand vous \195\170tes chang\195\169 de groupe.",
	["Members Change"] = "Changement de membres",
	["Notify for group members change."] = "Vous pr\195\169viens quand la composition de votre groupe a chang\195\169.",
	["You are now in group %d."] = "Vous \195\170tes maintenant dans le groupe %d.",
	["%s has left your group."] = "%s a quitt\195\169 votre groupe.",
	["%s has joined your group."] = "%s a rejoint votre groupe.",
} end )

L:RegisterTranslations("deDE", function() return {
	["Group"] = "Gruppe",
	["Optional/Group"] = "Wahlweise/Gruppe",
	["Options for Group."] = "Optionen f\195\188r die Gruppen-Benachrichtigung",
	["%s has joined your group."] = "%s ist deiner Gruppe beigetretten.",
	["%s has left your group."] = "%s hat deine Gruppe verlassen",
	["You have joined group %d."] = "Du bist der Gruppe %d beigetretten.",
	["Group Change"] = "\195\132nderung der Gruppe",
	["Notify for group change."] = "Benachrichtigen wenn die Gruppe ge\195\164ndert wird.",
	["Members Change"] = "\195\132nderung der Mitglieder",
	["Notify for group members change."] = "Benachrichtigen wenn die Mitglieder deiner Gruppe ge\195\164ndert werden.",
	["You are now in group %d."] = "Du bist nun in Gruppe %d.",
	["%s has left your group."] = "%s hat deine Gruppe verlassen.",
	["%s has joined your group."] = "%s ist deiner Gruppe beigetretten.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = oRA:NewModule("OptionalGroup")
mod.defaults = {
	change = true,
	members = nil,
}
mod.optional = true
mod.name = L["Optional/Group"]
mod.consoleCmd = "group"
mod.consoleOptions = {
	type = "group",
	desc = L["Options for Group."],
	name = L["Group"],
	disabled = function() return not oRA:IsActive() end,
	args = {
		change = {
			type = "toggle", name = L["Group Change"],
			desc = L["Notify for group change."],
			get = function() return mod.db.profile.change end,
			set = function(v) mod.db.profile.change = v end,
		},
		members = {
			type = "toggle", name = L["Members Change"],
			desc = L["Notify for group members change."],
			get = function() return mod.db.profile.members end,
			set = function(v) mod.db.profile.members = v end,
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	local playerunit = roster:GetUnitObjectFromName(UnitName("player"))
	if not playerunit then
		playergroup = 0
	else
		playergroup = playerunit.subgroup or 0
	end
	self:RegisterEvent("RosterLib_UnitChanged")
end

------------------------
--   Event Handlers   --
------------------------

function mod:RosterLib_UnitChanged( id, name, class, subgroup, rank, oldname, oldid, oldclass, oldsubgroup, oldrank )
	if subgroup ~= oldsubgroup then
		if UnitName("player") == name and self.db.profile.change then
			playergroup = subgroup
			self:Print( string.format( L["You are now in group %d."], playergroup ) )
		elseif oldsubgroup == playergroup and self.db.profile.members then
			self:Print( string.format( L["%s has left your group."], oldname ) )
		elseif subgroup == playergroup and self.db.profile.members then
			self:Print( string.format( L["%s has joined your group."], name ) )
		end
	end
end

