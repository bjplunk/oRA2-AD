
assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRAOVersion")
local roster = AceLibrary("Roster-2.1")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Version"] = true,
	["Options for version checks."] = true,
	["Refresh"] = true,
	["Close"] = true,
	["Unknown"] = true,
	["Name"] = true,
	["Optional/Version"] = true,
	["Perform version check"] = true,
	["Check the raid's versions."] = true,
	["CTRA"] = true,
	["oRA"] = true,
	["n/a"] = true,
} end )

L:RegisterTranslations("koKR", function() return {
	["Version"] = "버전",
	["Options for version checks."] = "버전 확인에 대한 설정입니다.",
	["Refresh"] = "새로고침",
	["Close"] = "닫기",
	["Unknown"] = "알 수 없음",
	["Name"] = "이름",
	["Optional/Version"] = "부가/버전",
	["Perform version check"] = "버전 확인 실시",
	["Check the raid's versions."] = "공격대의 버전을 확인합니다.",
	["CTRA"] = "공격대 도우미",
	["oRA"] = "oRA",
	["n/a"] = "없음",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Version"] = "版本",
	["Options for version checks."] = "版本检查选项。",
	["Refresh"] = "刷新",
	["Close"] = "关闭",
	["Unknown"] = "未知",
	["Name"] = "姓名",
	["Optional/Version"] = "选项/版本",
	["Perform version check"] = "进行版本检查",
	["Check the raid's versions."] = "检查团队版本。",
	["CTRA"] = "CTRA",
	["oRA"] = "oRA",
	["n/a"] = "n/a",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Version"] = "版本",
	["Options for version checks."] = "版本檢查選項",
	["Refresh"] = "更新",
	["Close"] = "關閉",
	["Unknown"] = "未知",
	["Name"] = "姓名",
	["Optional/Version"] = "可選/版本",
	["Perform version check"] = "進行版本檢查",
	["Check the raid's versions."] = "檢查團隊版本",
	["CTRA"] = "CTRA",
	["oRA"] = "oRA",
	["n/a"] = "無",
} end )

L:RegisterTranslations("frFR", function() return {
	--["Version"] = true,
	["Options for version checks."] = "Options concernant les v\195\169rifications des versions.",
	["Refresh"] = "Rafra\195\174chir",
	["Close"] = "Fermer",
	["Unknown"] = "Inconnu",
	["Name"] = "Nom",
	["Optional/Version"] = "Optionnel/Version",
	["Perform version check"] = "V\195\169rifier les versions",
	["Check the raid's versions."] = "V\195\169rifie les versions du raid.",
	--["CTRA"] = true,
	--["oRA"] = true,
	--["n/a"] = true,
} end )

L:RegisterTranslations("deDE", function() return {
	["Version"] = "Version",
	["Options for version checks."] = "Optionen f\195\188r den Versions-Check",
	["Refresh"] = "Erneuern",
	["Close"] = "Schlie\195\159en",
	["Unknown"] = "Unbekannt",
	["Name"] = "Name",
	["Optional/Version"] = "Wahlweise/Version",
	["Perform version check"] = "Versionen \195\188berpr\195\188fen",
	["Check the raid's versions."] = "\195\188berpr\195\188ft die oRA2 und CTRA Versionen des Schlachtzugs.",
	["CTRA"] = "CTRA",
	["oRA"] = "oRA2",
	["n/a"] = "n/a",
} end )
----------------------------------
--      Module Declaration      --
----------------------------------

local mod = oRA:NewModule("OptionalVersion")
mod.participant = true
mod.name = L["Optional/Version"]
mod.consoleCmd = "version"
mod.consoleOptions = {
	type = "execute",
	name = L["Perform version check"],
	desc = L["Check the raid's versions."],
	handler = mod,
	func = "PerformVersionCheck",
	disabled = function()
		return not oRA:IsModuleActive(mod)
	end,
}

------------------------------
--      Initialization      --
------------------------------

local versions = nil

function mod:OnEnable()
	self:RegisterShorthand("raver", "PerformVersionCheck")
	self:RegisterShorthand("raversion", "PerformVersionCheck")
end

-----------------------
--  Command Handlers --
-----------------------

local function RefreshVersion()
	mod:PerformVersionCheck()
end

local paintchips = nil
function mod:PerformVersionCheck()
	versions = self:del(versions)
	versions = self:new()

	if not paintchips then paintchips = AceLibrary("PaintChips-2.0") end

	for n, u in pairs(roster.roster) do
		if u and u.name and u.class ~= "PET" then
			local ctraversion = u.ora_ctraversion or L["n/a"]
			local oraversion = u.ora_version or L["n/a"]
			table.insert(versions, self:new(self.coloredNames[u.name], ctraversion, oraversion))
		end
	end
	oRA:OpenWindow( L["Version"], versions, RefreshVersion, L["Name"], 130, L["CTRA"], 80, L["oRA"], 80 )
end

