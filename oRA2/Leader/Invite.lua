assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRALInvite")
local roster = AceLibrary("Roster-2.1")
local dewdrop = AceLibrary("Dewdrop-2.0")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Invite"] = true,
	["Leader/Invite"] = true,
	["<oRA> Sorry, the group is full."] = true,
	["Inviting: "] = true,
	["Autopromoting: "] = true,
	["Keyword inviting disabled."] = true,
	["Invitation keyword set to: "] = true,
	["To turn off keyword inviting set it to 'off'."] = true,
	["<oRA> Raid disbanding on request by: "] = true,
	["Disabling Auto-Promote for: "] = true,
	["Enabling Auto-Promote for: "] = true,
	["Autopromoting: "] = true,
	["You have no-one in your Auto-Promote list"] = true,
	["Options for invite."] = true,
	["Autopromote"] = true,
	["Set/Unset an autopromotion."] = true,
	["<name>"] = true,
	["Keyword"] = true,
	["Set/Unset an invitation keyword."] = true,
	["<keyword>"] = true,
	["Disband"] = true,
	["Disband the raid."] = true,
	["List"] = true,
	["List autopromotions."] = true,
	["Invite Guild"] = true,
	["Invite all characters of the specified level in the guild to raid."] = true,
	["Invite Zone"] = true,
	["Invite all characters in guild in your current zone to raid."] = true,
	["<level or empty>"] = true,
	["You are not in a guild."] = true,
	["All level %d or higher characters will be invited to raid in 10 seconds. Please leave your groups."] = true,
	["All characters in %s will be invited to raid in 10 seconds. Please leave your groups."] = true,
	["off"] = true,
} end )

L:RegisterTranslations("deDE", function() return {
	["Leader/Invite"] = "Anf\195\188hrer/Einladung",
	["<oRA> Sorry, the group is full."] = "<oRA2> Sorry, die Gruppe ist voll",
	["Inviting: "] = "Einladen von: ",
	["Autopromoting: "] = "Autobef\195\182rderung: ",
	["Keyword inviting disabled."] = "Einladungen per Schl\195\188sselwort deaktiviert.",
	["Invitation keyword set to: "] = "Einladungs-Schl\195\188sselwort gesetzt auf: ",
	["To turn off keyword inviting set it to 'off'."] = "Auf 'off' setzen um Schl\195\188sselwort-Einladungen zu deaktivieren",
	["<oRA> Raid disbanding on request by: "] = "<oRA2> Schlachtzug wird aufgel\195\182st auf Anforderung von: ",
	["Disabling Auto-Promote for: "] = "Autobef\195\182rdung deaktiviert f\195\188r: ",
	["Enabling Auto-Promote for: "] = "Autobef\195\182rdung aktiviert f\195\188r: ",
	["Autopromoting: "] = "Autobef\195\182rdung: ",
	["You have no-one in your Auto-Promote list"] = "Ihr habt niemanden in eurer Autobef\195\182rderungsliste",
	["Options for invite."] = "Optionen f\195\188r Schlachtzugs-Einladungen.",
	["Autopromote"] = "Autobef\195\182rdung",
	["Set/Unset an autopromotion."] = "Autobef\195\182rdung setzen/l\195\182schen",
	["Keyword"] = "Schl\195\188sselwort",
	["Set/Unset an invitation keyword."] = "Einladungs-Schl\195\188sselwort setzen/l\195\182schen",
	["Disband"] = "Aufl\195\182sen",
	["Disband the raid."] = "Schlachtzug aufl\195\182sen",
	["List"] = "Auflisten",
	["List autopromotions."] = "Autobef\195\182rderungen auflisten",
	["Invite Guild"] = "Gilde einladen",
	["Invite all characters of the specified level in the guild to raid."] = "Alle Gildenmitglieder mit angegebenen Level in den Schlachtzug einladen.",
	["Invite Zone"] = "Zone Einladen",
	["Invite all characters in guild in your current zone to raid."] = "Alle Gildenmitglieder in der angegebenen Zone in den Schlachtzug einladen.",
	["You are not in a guild."] = "Ihr seid in keiner Gilde.",
	["All level %d or higher characters will be invited to raid in 10 seconds. Please leave your groups."] = "Alle Charakter der Stufe %d und h\195\182her werden in 10 Sekunden in den Schlachtzug eingeladen. Bitte verlasst eure Gruppen.",
	["All characters in %s will be invited to raid in 10 seconds. Please leave your groups."] = "Alle Charakter in s% werden in 10 Sekunden in den Raid eingeladen. Bitte die Gruppen verlassen.",
	["off"] = "Aus",
} end )


L:RegisterTranslations("koKR", function() return {
	["Invite"] = "초대",
	["Leader/Invite"] = "공격대장/초대",
	["<oRA> Sorry, the group is full."] = "<oRA> 죄송합니다. 공격대의 정원이 찼습니다.",
	["Inviting: "] = "초대: ",
	["Autopromoting: "] = "자동승급: ",
	["Keyword inviting disabled."] = "키워드 초대 기능을 사용하지 않습니다.",
	["Invitation keyword set to: "] = "초대 키워드 설정: ",
	["To turn off keyword inviting set it to 'off'."] = "키워드를 '끔'으로 설정하면 키워드 초대 기능을 사용하지 않습니다.",
	["<oRA> Raid disbanding on request by: "] = "<oRA> 공격대 해산 요청: ",
	["Disabling Auto-Promote for: "] = "자동승급 사용안함: ",
	["Enabling Auto-Promote for: "] = "자동승급 사용: ",
	["Autopromoting: "] = "자동승급: ",
	["You have no-one in your Auto-Promote list"] = "자동승급 목록이 비어 있습니다.",
	["Options for invite."] = "초대에 대한 설정입니다.",
	["Autopromote"] = "자동승급",
	["Set/Unset an autopromotion."] = "자동승급 대상을 설정/해제 합니다.",
	["<name>"] = "<이름>",
	["Keyword"] = "키워드",
	["Set/Unset an invitation keyword."] = "초대 키워드를 설정/해제 합니다.",
	["<keyword>"] = "<키워드>",	
	["Disband"] = "해산",
	["Disband the raid."] = "공격대를 해산합니다.",
	["List"] = "목록",
	["List autopromotions."] = "자동승급 목록을 출력합니다.",
	["Invite Guild"] = "길드원 초대",
	["Invite all characters of the specified level in the guild to raid."] = "길드내 지정된 레벨의 길드원 모두를 공격대에 초대합니다.",
	["Invite Zone"] = "지역 초대",
	["Invite all characters in guild in your current zone to raid."] = "현재 지역 내의 모든 길드원을 공격대에 초대합니다.",
	["<level or empty>"] = "<레벨 혹은 빈칸>",
	["You are not in a guild."] = "길드에 속해 있지 않습니다.",
	["All level %d or higher characters will be invited to raid in 10 seconds. Please leave your groups."] = "10초 동안 %d 레벨 이상인 길드원들을 공격대에 초대합니다. 파티에서 나와 주세요.",
	["All characters in %s will be invited to raid in 10 seconds. Please leave your groups."] = "10초 동안 %s 내의 모든 길드원을 공격대에 초대합니다. 파티에서 나와 주세요.",
	["off"] = "끔",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Invite"] = "邀请",
	["Leader/Invite"] = "团长/邀请",
	["<oRA> Sorry, the group is full."] = "<oRA>抱歉，团队已满。",
	["Inviting: "] = "邀请：",
	["Autopromoting: "] = "自动提升：",
	["Keyword inviting disabled."] = "禁止关键字邀请。",
	["Invitation keyword set to: "] = "邀请关键字设置为：",
	["To turn off keyword inviting set it to 'off'."] = "要关掉关键词邀请的话，选择'关'。",
	["<oRA> Raid disbanding on request by: "] = "<oRA>解散团队请求：",
	["Disabling Auto-Promote for: "] = "禁止自动提升对：",
	["Enabling Auto-Promote for: "] = "允许自动提升对：",
	["Autopromoting: "] = "自动提升：",
	["You have no-one in your Auto-Promote list"] = "你的自动提升列表为空",
	["Options for invite."] = "邀请助手选项。",
	["Autopromote"] = "自动提升",
	["Set/Unset an autopromotion."] = "设定/取消自动提升。",
	["<name>"] = "<名字>",
	["Keyword"] = "关键字",
	["Set/Unset an invitation keyword."] = "设定/取消邀请关键字。",
	["<keyword>"] = "<关键词>",	
	["Disband"] = "解散",
	["Disband the raid."] = "解散团队。",
	["List"] = "列表",
	["List autopromotions."] = "自动提升列表。",
	["Invite Guild"] = "公会邀请",
	["Invite all characters of the specified level in the guild to raid."] = "邀请公会中所有特定级别的玩家、",
	["Invite Zone"] = "区域邀请",
	["Invite all characters in guild in your current zone to raid."] = "邀请公会中所有在你目前区域中的玩家。",
	["<level or empty>"] = "<等级或留空>",
	["You are not in a guild."] = "你不在一个公会中。",
	["All level %d or higher characters will be invited to raid in 10 seconds. Please leave your groups."] = "所有%d级或更高的玩家都将在10秒后邀请到团队中。请离开你当前队伍。",
	["All characters in %s will be invited to raid in 10 seconds. Please leave your groups."] = "所有在%s的玩家都将在10秒后邀请到团队中。请离开你当前队伍。",
	["off"] = "关闭",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Invite"] = "邀請",
	["Leader/Invite"] = "領隊/邀請",
	["<oRA> Sorry, the group is full."] = "<oRA>抱歉，團隊已滿。",
	["Inviting: "] = "正邀請：",
	["Autopromoting: "] = "自動提升: ",
	["Keyword inviting disabled."] = "禁止關鍵字邀請",
	["Invitation keyword set to: "] = "邀請關鍵字設置為：",
	["To turn off keyword inviting set it to 'off'."] = "要關掉關鍵詞邀請的話，選擇'關閉'",
	["<oRA> Raid disbanding on request by: "] = "<oRA>解散團隊請求：",
	["Disabling Auto-Promote for: "] = "禁止自動提升對：",
	["Enabling Auto-Promote for: "] = "允許自動提升對：",
	["Autopromoting: "] = "自動提升：",
	["You have no-one in your Auto-Promote list"] = "你的自動提升列表為空",
	["Options for invite."] = "邀請助手選項",
	["Autopromote"] = "自動提升",
	["Set/Unset an autopromotion."] = "設定/取消自動提升",
	["<name>"] = "<名字>",
	["Keyword"] = "關鍵字",
	["Set/Unset an invitation keyword."] = "設定/取消邀請關鍵字",
	["<keyword>"] = "關鍵詞",	
	["Disband"] = "解散",
	["Disband the raid."] = "解散團隊",
	["List"] = "列表",
	["List autopromotions."] = "自動提升列表",
	["Invite Guild"] = "公會邀請",
	["Invite all characters of the specified level in the guild to raid."] = "邀請公會中所有的特定等級玩家",
	["Invite Zone"] = "區域邀請",
	["Invite all characters in guild in your current zone to raid."] = "邀請公會中所有在你目前區域中的玩家",
	["<level or empty>"] = "<等級或留空>",
	["You are not in a guild."] = "你不在一個公會中",
	["All level %d or higher characters will be invited to raid in 10 seconds. Please leave your groups."] = "所有%d級人物都將在10秒後邀請到團隊中。請離開你當前隊伍",
	["All characters in %s will be invited to raid in 10 seconds. Please leave your groups."] = "所有在%s的玩家都將在10秒后邀請到團隊中。請離開你當前隊伍",
	["off"] = "關閉",
} end )

L:RegisterTranslations("frFR", function() return {
	["Invite"] = "Invitation",
	["Leader/Invite"] = "Chef/Invitation",
	["<oRA> Sorry, the group is full."] = "<oRA> Désolé, le groupe est complet.",
	["Inviting: "] = "Invitation : ",
	["Autopromoting: "] = "Promotion automatique : ",
	["Keyword inviting disabled."] = "Invitation par mot-clé désactivée.",
	["Invitation keyword set to: "] = "Mot-clé d'invitation défini à : ",
	["To turn off keyword inviting set it to 'off'."] = "Pour désactiver l'invitation par mot-clé, définissez ce dernier à 'off'.",
	["<oRA> Raid disbanding on request by: "] = "<oRA> Dissolution du raid à la demande de : ",
	["Disabling Auto-Promote for: "] = "Retrait de la promotion automatique pour : ",
	["Enabling Auto-Promote for: "] = "Ajout de la promotion automatique de : ",
	["Autopromoting: "] = "Promotion automatique : ",
	["You have no-one in your Auto-Promote list"] = "Vous n'avez personne dans votre liste des personnes promues automatiquement.",
	["Options for invite."] = "Options concernant les invitations.",
	["Autopromote"] = "Promotion automatique",
	["Set/Unset an autopromotion."] = "Ajoute/enlève une personne de la liste des personnes promues automatiquement.",
	["<name>"] = "<nom>",
	["Keyword"] = "Mot-clé",
	["Set/Unset an invitation keyword."] = "Détermine/enlève le mot-clé d'invitation.",
	["<keyword>"] = "<mot-clé>",
	["Disband"] = "Dissoudre",
	["Disband the raid."] = "Dissous le raid.",
	["List"] = "Liste",
	["List autopromotions."] = "Affiche la liste des personnes promues automatiquement.",
	["Invite Zone"] = "Inviter la zone",
	["Invite all characters in guild in your current zone to raid."] = "Invite tous les personnages de la guilde se trouvant dans votre zone actuelle dans le raid.",
	["Invite Guild"] = "Inviter la guilde",
	["Invite all characters of the specified level in the guild to raid."] = "Invite tous les personnages du niveau spécifié de la guilde dans le raid.",
	["<level or empty>"] = "<niveau ou laissez vide>",
	["You are not in a guild."] = "Vous n'êtes pas dans une guilde.",
	["All level %d or higher characters will be invited to raid in 10 seconds. Please leave your groups."] = "Tous les personnages de niveau %d ou supérieur seront invités dans le raid dans 10 secondes. Veuillez quitter vos groupes.",
	["All characters in %s will be invited to raid in 10 seconds. Please leave your groups."] = "Tous les personnages se trouvant dans la zone %s seront invités dans le raid dans 10 secondes. Veuillez quitter vos groupes.",
	--["off"] = true,
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = oRA:NewModule("LeaderInvite")
mod.defaults = {
	promotes = {},
	keyword = nil,
}
mod.leader = true
mod.name = L["Leader/Invite"]
mod.shouldEnable = true -- Prevents the module from disabling when out of raids.
mod.consoleCmd = "invite"
mod.consoleOptions = {
	type = "group",
	desc = L["Options for invite."],
	name = L["Invite"],
	handler = mod,
	args = {
		autopromote = {
			name = L["Autopromote"], type = "text",
			desc = L["Set/Unset an autopromotion."],
			usage = L["<name>"],
			get = false,
			set = "SetAutoPromote",
			get = false,
			validate = function(v)
				return v:find("(.*)")
			end,
		},
		list = {
			name = L["List"], type = "execute",
			desc = L["List autopromotions."],
			func = "ShowPromoteList",
		},
		disband = {
			name = L["Disband"], type = "execute",
			desc = L["Disband the raid."],
			func = "DisbandRaid",
			disabled = function(v) return not UnitInRaid("player") or not oRA:IsValidRequest(v) end,
		},
		keyword = {
			name = L["Keyword"], type = "text",
			desc = L["Set/Unset an invitation keyword."],
			usage = L["<keyword>"],
			get = function() return mod.db.profile.keyword or "" end,
			set = "SetKeyword",
			validate = function(v)
				return v:find("(.*)")
			end,
		},
		guild = {
			name = L["Invite Guild"], type = "text",
			desc = L["Invite all characters of the specified level in the guild to raid."],
			usage = L["<level or empty>"],
			get = false,
			set = "InviteGuild",
			validate = function(input)
				return (input == nil or input == "") or (tonumber(input) ~= nil and (tonumber(input) > 1 and tonumber(input) <= MAX_PLAYER_LEVEL))
			end,
		},
		zone = {
			name = L["Invite Zone"], type = "execute",
			desc = L["Invite all characters in guild in your current zone to raid."],
			func = "GInviteZone",
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

local peopleToInvite = {}

function mod:OnEnable()
	self:RegisterEvent("CHAT_MSG_WHISPER")
	self:RegisterEvent("CHAT_MSG_SYSTEM")
	self:RegisterEvent("oRA_JoinedRaid", "DoAutoPromotes")

	self:RegisterShorthand("rakw", "SetKeyword")
	self:RegisterShorthand("rakeyword", "SetKeyword")
	self:RegisterShorthand("radisband", "DisbandRaid")
	self:RegisterShorthand("rainvite", "InviteGuild")
	self:RegisterShorthand("razinvite", "GInviteZone")
end

----------------------
--  Event Handlers  --
----------------------

function mod:CHAT_MSG_WHISPER( msg, author )
	if self.db.profile.keyword and msg:lower() == self.db.profile.keyword:lower() then
		if GetNumPartyMembers() == 4 and GetNumRaidMembers() == 0 then
			ConvertToRaid()
			self:ScheduleEvent(InviteUnit, 2, author)
		else
			if GetNumRaidMembers() == 40 then
				SendChatMessage( L["<oRA> Sorry, the group is full."], "WHISPER", nil, author)
			else
				InviteUnit(author)
			end
		end
	end
end

function mod:DoAutoPromotes()
	if IsRaidLeader() then
		local counter = 1
		for unit in roster:IterateRoster() do
			if self.db.profile.promotes[unit.name:lower()] and unit.rank == 0 then
				self:Print( L["Autopromoting: "] .. unit.name )
				self:ScheduleEvent( PromoteToAssistant, counter, unit.name )
				counter = counter + 1
			end
		end
	end
end

local doActualInvites

local function partyMembersChanged()
	if GetNumPartyMembers() > 0 then
		ConvertToRaid()
		mod:UnregisterEvent("PARTY_MEMBERS_CHANGED")
		mod:ScheduleEvent("DoActualInvites", doActualInvites, 2)
	end
end

function doActualInvites()
	if not UnitInRaid("player") then
		local pNum = GetNumPartyMembers()
		if pNum == 0 then
			-- This means we have to first invite up to the party size (4), and
			-- then wait for someone to join before we convert to a party and
			-- invite the rest.
			mod:RegisterEvent("PARTY_MEMBERS_CHANGED", partyMembersChanged)
			for i = 1, 4 do
				local u = table.remove(peopleToInvite)
				if u then InviteUnit(u) end
			end
			-- We've invited as many people as we can, now we need to wait
			-- for a raid group.
			return
		end
	end
	-- Either we're in a raid, or we only want to invite enough people that
	-- we can fit in our group anyway.
	for i, v in ipairs(peopleToInvite) do
		InviteUnit(v)
	end
	for k in pairs(peopleToInvite) do
		peopleToInvite[k] = nil
	end
end

do
	local unitJoinedRaid = '^' .. ERR_RAID_MEMBER_ADDED_S:gsub("%%s", "(.-)") .. '$'
	function mod:CHAT_MSG_SYSTEM(msg)
		if UnitInRaid("player") then
			if msg == ERR_NEW_LEADER_YOU then
				self:DoAutoPromotes()
			elseif IsRaidLeader() then
				local name = select(3, msg:find(unitJoinedRaid))
				if name and self.db.profile.promotes[name:lower()] then
					self:Print( L["Autopromoting: "] .. name )
					self:ScheduleEvent( PromoteToAssistant, 2, name )
				end
			end
		end
	end
end

----------------------
-- Command Handlers --
----------------------

local function doGuildInvites(level, zone)
	local offline = GetGuildRosterShowOffline()
	local selection = GetGuildRosterSelection()
	SetGuildRosterShowOffline(0)
	SetGuildRosterSelection(0)
	GetGuildRosterInfo(0)

	local pName = UnitName("player")
	local numGuildMembers = GetNumGuildMembers()
	for i = 1, numGuildMembers, 1 do
		local name, _, _, unitLevel, _, unitZone, _, _, online = GetGuildRosterInfo(i)
		if level then
			if online and level <= unitLevel and name ~= pName then
				table.insert(peopleToInvite, name)
			end
		elseif zone then
			if online and zone == unitZone and name ~= pName then
				table.insert(peopleToInvite, name)
			end
		end
	end

	SetGuildRosterShowOffline(offline)
	SetGuildRosterSelection(selection)

	doActualInvites()
end

function mod:InviteGuild(level)
	if not IsInGuild() then
		self:Print(L["You are not in a guild."])
		return
	end

	if not UnitInRaid("player") and GetNumPartyMembers() > 0 and not IsPartyLeader() then
		self:Print(ERR_NOT_LEADER)
		return
	end

	-- Enable ourselves, so that we register for CHAT_MSG_SYSTEM, which will
	-- autoconvert to a raid group when the first player joins.
	oRA:ToggleModuleActive(self, true)

	if not level or not tonumber(level) or level == "" then level = MAX_PLAYER_LEVEL end
	level = tonumber(level)

	SendChatMessage(string.format(L["All level %d or higher characters will be invited to raid in 10 seconds. Please leave your groups."], level), "GUILD")
	self:ScheduleEvent(doGuildInvites, 10, level, nil)
end

function mod:GInviteZone()
	if not IsInGuild() then
		self:Print(L["You are not in a guild."])
		return
	end

	if not UnitInRaid("player") and GetNumPartyMembers() > 0 and not IsPartyLeader() then
		self:Print(ERR_NOT_LEADER)
		return
	end

	-- Enable ourselves, so that we register for CHAT_MSG_SYSTEM, which will
	-- autoconvert to a raid group when the first player joins.
	oRA:ToggleModuleActive(self, true)

	local currentZone = GetRealZoneText()
	SendChatMessage(string.format(L["All characters in %s will be invited to raid in 10 seconds. Please leave your groups."], currentZone), "GUILD")
	self:ScheduleEvent(doGuildInvites, 10, nil, currentZone)
end

function mod:SetKeyword( keyword )
	if keyword == nil or keyword == "" or keyword:lower() == L["off"] then
		self.db.profile.keyword = nil
		self:Print( L["Keyword inviting disabled."] )
	else
		self.db.profile.keyword = keyword
		self:Print( L["Invitation keyword set to: "] .. keyword )
		self:Print( L["To turn off keyword inviting set it to 'off'."])
	end
end

function mod:DisbandRaid()
	if not oRA:IsPromoted() then return end
	local pName = UnitName("player")
	SendChatMessage( L["<oRA> Raid disbanding on request by: "] .. pName, "RAID")
	for i = 1, GetNumRaidMembers() do
		local name, _, _, _, _, _, _, online = GetRaidRosterInfo(i)
		if online and name ~= pName then
			UninviteUnit(name)
		end
	end
	oRA:SendMessage("DB")
	LeaveParty()
	dewdrop:Close()
end

function mod:SetAutoPromote(pname)
	if pname ~= nil and pname ~= "" then
		pname = pname:lower()
		if self.db.profile.promotes[pname] then
			self.db.profile.promotes[pname] = nil
			self:Print( L["Disabling Auto-Promote for: "] .. pname )
		else
			self.db.profile.promotes[pname] = 1
			self:Print( L["Enabling Auto-Promote for: "] .. pname )
			local unit = roster:GetUnitObjectFromName(pname)
			if IsRaidLeader() and unit then
				self:Print( L["Autopromoting: "] .. pname )
				PromoteToAssistant( pname )
			end
		end
	end
end

function mod:ShowPromoteList()
	if next(self.db.profile.promotes) then
		local i = 0
		local list = ""
		self:Print( L["Autopromoting: "] )
		for name, yesno in pairs(self.db.profile.promotes) do
			i = i + 1
			list = list .. name .. " "
			if i == 5 then
				self:Print( list )
				i = 0
				list = ""
			end
		end
		if list ~= "" then
			self:Print( list )
		end
	else
		self:Print( L["You have no-one in your Auto-Promote list"] )
	end
end

