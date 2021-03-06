assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRAPMainTank")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["MainTank"] = true,
	["Options for the maintanks."] = true,
	["The local maintank list has been refreshed."] = true,
	["Refresh Maintanks"] = true,
	["Refresh the local maintank list."] = true,
	["Participant/MainTank"] = true,
	["Notify deaths"] = true,
	["Notifies you when a main tank dies."] = true,
	["Tank %s has died!"] = true,

	maintankdies = "^([^%s]+) dies%.$",
} end )

L:RegisterTranslations("koKR", function() return {
	["MainTank"] = "메인탱커",
	["Options for the maintanks."] = "메인탱커에 대한 설정입니다.",
	["The local maintank list has been refreshed."] = "로컬 메인탱커 목록이 갱신되었습니다.",
	["Refresh Maintanks"] = "메인탱커 갱신",
	["Refresh the local maintank list."] = "로컬 메인탱커 목록을 갱신합니다.",
	["Participant/MainTank"] = "부분/메인탱커",
	["Notify deaths"] = "사망 알림",
	["Notifies you when a main tank dies."] = "메인탱커가 사망시 이를 알려줍니다.",
	["Tank %s has died!"] = "메인탱커 %s|1이;가; 죽었습니다!",

	maintankdies = "^([^%s]+)|1이;가; 죽었습니다%.$",
} end )

L:RegisterTranslations("zhCN", function() return {
	["MainTank"] = "MT 目标",
	["Options for the maintanks."] = "MT 选项。",
	["The local maintank list has been refreshed."] = "本地 MT 名单已刷新。",
	["Refresh Maintanks"] = "刷新 MT",
	["Refresh the local maintank list."] = "刷新本地 MT 名单。",
	["Participant/MainTank"] = "成员/MT 目标",
	["Notify deaths"] = "死亡通知",
	["Notifies you when a main tank dies."] = "当 MT 死亡时通知你。",
	["Tank %s has died!"] = "MT %s 已死亡！",

	maintankdies = "^(.+)死亡了。",
} end )

L:RegisterTranslations("zhTW", function() return {
	["MainTank"] = "主坦",
	["Options for the maintanks."] = "主坦選項",
	["The local maintank list has been refreshed."] = "個人主坦名單已更新",
	["Refresh Maintanks"] = "更新主坦",
	["Refresh the local maintank list."] = "更新個人主坦名單",
	["Participant/MainTank"] = "隊員/主坦",
	["Notify deaths"] = "死亡通知",
	["Notifies you when a main tank dies."] = "當主坦死亡時通知你",
	["Tank %s has died!"] = "主坦 %s 已死亡！",

	maintankdies = "^(.+)死亡了．",
} end )

L:RegisterTranslations("frFR", function() return {
	["Options for the maintanks."] = "Options concernant les maintanks.",
	["The local maintank list has been refreshed."] = "La liste locale des maintanks a \195\169t\195\169 rafra\195\174chie.",
	["Refresh Maintanks"] = "Rafra\195\174chir les maintanks",
	["Refresh the local maintank list."] = "Rafra\195\174chit la liste locale des maintanks.",
	["Participant/MainTank"] = "Participant/MainTank",
	["Notify deaths"] = "Annoncer les morts",
	["Notifies you when a main tank dies."] = "Pr\195\169viens quand un maintank meurt.",
	["Tank %s has died!"] = "Le tank %s est mort !",

	maintankdies = "^([^%s]+) meurt%.$",
} end )

L:RegisterTranslations("deDE", function() return {
	["MainTank"] = "MainTank",
	["Options for the maintanks."] = "Optionen f\195\188r MainTanks.",
	["The local maintank list has been refreshed."] = "Die lokale MainTank-Liste wurde erneuert.",
	["Refresh Maintanks"] = "Erneuere MainTank-Liste",
	["Refresh the local maintank list."] = "Erneuert die lokale MainTank-Liste.",
	["Participant/MainTank"] = "Teilnehmer/MainTank",
	["Notify deaths"] = "Melde MainTank-Tot",
	["Notifies you when a main tank dies."] = "Benachrichtigt dich wenn einer der MainTanks stirbt.",
	["Tank %s has died!"] = "MainTank %s ist gestorben!",

	maintankdies = "^([^%s]+) stirbt%.$",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------
local mod = oRA:NewModule("ParticipantMT")
mod.defaults = {
	notifydeath = false,
}
mod.participant = true
mod.name = L["Participant/MainTank"]
mod.consoleCmd = "mt"
mod.consoleOptions = {
	type = "group",
	desc = L["Options for the maintanks."],
	name = L["MainTank"],
	disabled = function() return not oRA:IsActive() end,
	args = {
		refresh = {
			name = L["Refresh Maintanks"], type = "execute",
			desc = L["Refresh the local maintank list."],
			func = function()
				mod:Refresh()
			end,
			disabled = function() return not oRA:IsModuleActive(mod) end,
		},
		notifydeath = {
			name = L["Notify deaths"], type = "toggle",
			desc = L["Notifies you when a main tank dies."],
			get = function() return mod.db.profile.notifydeath end,
			set = function(v) mod.db.profile.notifydeath = v end,
		},
	}
}


------------------------------
--      Initialization      --
------------------------------

function mod:OnRegister()
	if not oRA.maintanktable then
		oRA.maintanktable = oRA.db.profile.maintanktable or {}
	end
end

function mod:OnEnable()
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH")
	self:RegisterEvent("oRA_LeftRaid")
	self:RegisterCheck("SET", "oRA_SetMainTank")
	self:RegisterCheck("R", "oRA_RemoveMainTank")
end

------------------------------
--      Event Handlers       --
-------------------------------

local red = {1, 0, 0}
function mod:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
	if not self.db.profile.notifydeath then return end
	local tank = select(3, msg:find(L["maintankdies"]))
	if not tank then return end
	for k, name in pairs(oRA.maintanktable) do
		if name == tank then
			-- I'm pretty sure this is the same sound that CTRA uses, someone
			-- should confirm.
			if BigWigs then
				self:TriggerEvent("BigWigs_Message", L["Tank %s has died!"]:format(name), "Red", true, false)
			elseif RaidNotice_AddMessage and RaidWarningFrame then
				RaidNotice_AddMessage(RaidWarningFrame, L["Tank %s has died!"]:format(name), red)
			end
			PlaySound("igQuestFailed")
		end
	end
end

function mod:oRA_SetMainTank(msg, author)
	if not oRA:IsValidRequest( author, true ) then return end

	local num, name = select(3, msg:find("^SET (%d+) (.+)$"))
	if not num or not name then return end

	self:RemoveTank(name)

	oRA.maintanktable[tonumber(num)] = name
	oRA.db.profile.maintanktable = oRA.maintanktable
	self:TriggerEvent("oRA_MainTankUpdate", oRA.maintanktable)
end

function mod:oRA_RemoveMainTank(msg, author)
	if not oRA:IsValidRequest( author, true ) then return end

	local name = select(3, msg:find("^R (.+)$"))
	if not name then return end

	self:RemoveTank(name)
	
	self:TriggerEvent("oRA_MainTankUpdate", oRA.maintanktable)
end

function mod:oRA_LeftRaid()
	oRA.maintanktable = {}
	oRA.db.profile.maintanktable = nil
	self:TriggerEvent("oRA_MainTankUpdate", oRA.maintanktable )
end

-------------------------------
--     Utility Functions     --
-------------------------------

function mod:RemoveTank(name)
	if not name then return end
	for n, t in pairs(oRA.maintanktable) do
		if t == name then
			oRA.maintanktable[n] = nil
		end
	end
	oRA.db.profile.maintanktable = oRA.maintanktable
end

-------------------------------
--      Command Handlers     --
-------------------------------

function mod:Refresh()
	self:TriggerEvent("oRA_MainTankUpdate", oRA.maintanktable)
	self:Print(L["The local maintank list has been refreshed."])
end

