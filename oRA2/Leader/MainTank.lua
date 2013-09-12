assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRALMainTank")
local tablet = AceLibrary("Tablet-2.0")
local paintchips = AceLibrary("PaintChips-2.0")
local roster = AceLibrary("Roster-2.1")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["MainTank"] = true,
	["Options for the maintanks."] = true,
	["Set Maintank"] = true,
	["Set a maintank."]= true,
	["<nr> <name>"] = true,
	["<nr>"] = true,
	["<name>"] = true,
	["Remove Maintank"] = true,
	["Remove a maintank."] = true,
	["Removed maintank: "] = true,
	["Set maintank: "] = true,
	["Leader/MainTank"] = true,
	["Broadcast"] = true,
	["Broadcast Maintanks"] = true,
	["Send the raid your maintanks."] = true,

	["(%S+)%s*(.*)"] = true,

	["Set target on a free mt-slot"] = true,
	["Free"] = true,
	["All"] = true,
	["Delete all Maintanks"] = true,
	["<Not Assigned>"] = true,
} end )

L:RegisterTranslations("koKR", function() return {
	["MainTank"] = "메인탱커",
	["Options for the maintanks."] = "메인탱커에 대한 설정입니다.",
	["Set Maintank"] = "메인탱커 지정",
	["Set a maintank."]= "메인탱커로 지정합니다.",
	["<nr> <name>"] = "<번호> <이름>",
	["<nr>"] = "<번호>",
	["<name>"] = "<이름>",
	["Remove Maintank"] = "메인탱커 삭제",
	["Remove a maintank."] = "메인탱커에서 삭제합니다.",
	["Removed maintank: "] = "메인탱커 삭제: ",
	["Set maintank: "] = "메인탱커 지정: ",
	["Leader/MainTank"] = "공격대장/메인탱커",
	["Broadcast"] = "알림",
	["Broadcast Maintanks"] = "메인탱커 알림",
	["Send the raid your maintanks."] = "메인탱커를 공격대에 알립니다.",

	["(%S+)%s*(.*)"] = "(%d+)%s*(.*)",

	["Set target on a free mt-slot"] = "대상을 공란에 지정합니다.",
	["All"] = "모두",
	["Delete all Maintanks"] = "모든 메인탱커를 삭제합니다.",
	["<Not Assigned>"] = "<지정되지 않음>",
} end )

L:RegisterTranslations("zhCN", function() return {
	["MainTank"] = "MT 目标",
	["Options for the maintanks."] = "MT 目标选项。",
	["Set Maintank"] = "设定 MT",
	["Set a maintank."]= "设定 MT。",
	["<nr> <name>"] = "<数量> <名字>",
	["<nr>"] = "<数量>",
	["<name>"] = "<名字>",
	["Remove Maintank"] = "移除 MT",
	["Remove a maintank."] = "移除 MT。",
	["Removed maintank: "] = "移除 MT：",
	["Set maintank: "] = "设定 MT：",
	["Leader/MainTank"] = "团长/MT",
	["Broadcast"] = "广播",
	["Broadcast Maintanks"] = "广播 MT",
	["Send the raid your maintanks."] = "向团队广播 MT。",

	["(%S+)%s*(.*)"] = "(%d+)%s*(.*)",

	["Set target on a free mt-slot"] = "设定当前目标为下一个空 MT 位置",
	["Free"] = "空",
	["All"] = "全部",
	["Delete all Maintanks"] = "移除所有 MT",
	["<Not Assigned>"] = "<还未设定>",
} end )

L:RegisterTranslations("zhTW", function() return {
	["MainTank"] = "主坦",
	["Options for the maintanks."] = "主坦選項",
	["Set Maintank"] = "設定主坦",
	["Set a maintank."]= "設定一位主坦",
	["<nr> <name>"] = "<數量> <名字>",
	["<nr>"] = "<數量>",
	["<name>"] = "<名字>",
	["Remove Maintank"] = "移除主坦",
	["Remove a maintank."] = "移除一位主坦",
	["Removed maintank: "] = "移除主坦",
	["Set maintank: "] = "設定主坦: ",
	["Leader/MainTank"] = "領隊/主坦",
	["Broadcast"] = "廣播",
	["Broadcast Maintanks"] = "廣播主坦",
	["Send the raid your maintanks."] = "向團隊廣播主坦",

	["(%S+)%s*(.*)"] = "(%d+)%s*(.*)",

	["Set target on a free mt-slot"] = "設定目標至空閒主坦位置",
	["All"] = "全部",
	["Delete all Maintanks"] = "移除所有主坦",
	["<Not Assigned>"] = "<未設定>",
} end )

L:RegisterTranslations("frFR", function() return {
	["Options for the maintanks."] = "Options concernant les maintanks.",
	["Set Maintank"] = "Ajouter un maintank",
	["Set a maintank."]= "Ajoute un maintank.",
	["<nr> <name>"] = "<n\194\176> <nom>",
	["<nr>"] = "<n\194\176>",
	["<name>"] = "<nom>",
	["Remove Maintank"] = "Enlever un maintank",
	["Remove a maintank."] = "Enl\195\168ve un maintank.",
	["Removed maintank: "] = "Maintank enlev\195\169 : ",
	["Set maintank: "] = "Maintank ajout\195\169 : ",
	["Leader/MainTank"] = "Chef/MainTank",
	["Broadcast"] = "Diffuser",
	["Broadcast Maintanks"] = "Diffuser les maintanks",
	["Send the raid your maintanks."] = "Envoye vos maintanks au raid.",

	["Set target on a free mt-slot"] = "Ajouter la cible \195\160 un emplacement libre des MTs",
	["All"] = "Tous",
	["Delete all Maintanks"] = "Supprimer tous les maintanks",

	["<Not Assigned>"] = "<Non assign\195\169>",
} end )

L:RegisterTranslations("deDE", function() return {
	["MainTank"] = "MainTank",
	["Options for the maintanks."] = "Optionen f\195\188r MainTanks.",
	["Set Maintank"] = "Setze MainTank",
	["Set a maintank."]= "F\195\188ge einen MainTank hinzu.",
	["<nr> <name>"] = "<Nr> <Name>",
	["<nr>"] = "<Nr>",
	["<name>"] = "<Name>",
	["Remove Maintank"] = "Entferne MainTank",
	["Remove a maintank."] = "Entferne einen MainTank aus der Liste",
	["Removed maintank: "] = "MainTank gel\195\182scht: ",
	["Set maintank: "] = "MainTank gesetzt: ",
	["Leader/MainTank"] = "Anf\195\188hrer/MainTank",
	["Broadcast"] = "Verbreiten",
	["Broadcast Maintanks"] = "Verbreite MainTanks",
	["Send the raid your maintanks."] = "Sende dem Schlachtzug deine MainTanks.",
	["(%S+)%s*(.*)"] = "(%S+)%s*(.*)",
	["Set target on a free mt-slot"] = "Setze das Ziel auf einen verf\195\188gbaren MainTank-Platz",
	["All"] = "Alle",
	["Delete all Maintanks"] = "L\195\182sche alle MainTanks",
	["<Not Assigned>"] = "<Nicht zugewiesen>",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local function validateSet(a, b)
	if b then -- We're in dewdrop.
		return b:find("^(%S+)$")
	else -- We're in AceConsole
		return a:find("^(%S+)$")
	end
end

local mod = oRA:NewModule("LeaderMT")
mod.leader = true
mod.name = L["Leader/MainTank"]
mod.consoleCmd = "mt"
mod.consoleOptions = {
	type = "group",
	desc = L["Options for the maintanks."],
	name = L["MainTank"],
	disabled = function() return not oRA:IsActive() end,
	args = {
		broadcast = {
			name = L["Broadcast Maintanks"], type = "execute",
			desc = L["Send the raid your maintanks."],
			func = function() mod:Broadcast() end,
			disabled = function() return not oRA:IsModuleActive(mod) or not oRA:IsValidRequest() end,
		},
		set = {
			name = L["Set Maintank"], type = "group",
			desc = L["Set a maintank."],
			disabled = function() return not oRA:IsModuleActive(mod) or not oRA:IsValidRequest() end,
			pass = true,
			get = function(key)
				if oRA.maintanktable[key] then
					return oRA.maintanktable[key]
				else
					return ""
				end
			end,
			set = function(key, value)
				mod:Set(tostring(key) .. " " .. value)
			end,
			args = {
				[1] = {
					name = "1.", type = "text", desc = L["Set Maintank"].." 1",
					validate = validateSet,
					usage = L["<name>"],
					order = 1,
				},
				[2] = {
					name = "2.", type = "text", desc = L["Set Maintank"].." 2",
					validate = validateSet,
					usage = L["<name>"],
					order = 2,
				},
				[3] = {
					name = "3.", type = "text", desc = L["Set Maintank"].." 3",
					validate = validateSet,
					usage = L["<name>"],
					order = 3,
				},
				[4] = {
					name = "4.", type = "text", desc = L["Set Maintank"].." 4",
					validate = validateSet,
					usage = L["<name>"],
					order = 4,
				},
				[5] = {
					name = "5.", type = "text", desc = L["Set Maintank"].." 5",
					validate = validateSet,
					usage = L["<name>"],
					order = 5,
				},
				[6] = {
					name = "6.", type = "text", desc = L["Set Maintank"].." 6",
					validate = validateSet,
					usage = L["<name>"],
					order = 6,
				},
				[7] = {
					name = "7.", type = "text", desc = L["Set Maintank"].." 7",
					validate = validateSet,
					usage = L["<name>"],
					order = 7,
				},
				[8] = {
					name = "8.", type = "text", desc = L["Set Maintank"].." 8",
					validate = validateSet,
					usage = L["<name>"],
					order = 8,
				},
				[9] = {
					name = "9.", type = "text", desc = L["Set Maintank"].." 9",
					validate = validateSet,
					usage = L["<name>"],
					order = 9,
				},
				[10] = {
					name = "10.", type = "text", desc = L["Set Maintank"].." 10",
					validate = validateSet,
					usage = L["<name>"],
					order = 10,
				},
				free = {
					name = L["Free"], type = "execute", desc = L["Set target on a free mt-slot"],
					func = function()
						if not UnitExists("target") then
							return
						end
						if not UnitInRaid("target") then
							return
						end
						local name = UnitName("target")
						for i=1, 10 do
							if not oRA.maintanktable[i] then
								mod:Set(i.." "..name)
								break
							end
						end
					end,
					order = 11,
				}
			}
		},
		remove = {
			name = L["Remove Maintank"], type = "group",
			desc = L["Remove a maintank."],
			disabled = function() return not oRA:IsModuleActive(mod) or not oRA:IsValidRequest() end,
			pass = true,
			func = function(key)
				if type(key) == "number" then
					mod:Remove(key)
				else
					for i = 1, 10 do
						mod:Remove(i)
					end
				end
			end,
			args = {
				[1] = {
					name = "1.", type = "execute", desc = L["Remove Maintank"].." 1",
					disabled = function() return not oRA.maintanktable[1] end,
					order = 1,
				},
				[2] = {
					name = "2.", type = "execute", desc = L["Remove Maintank"].." 2",
					disabled = function() return not oRA.maintanktable[2] end,
					order = 2,
				},
				[3] = {
					name = "3.", type = "execute", desc = L["Remove Maintank"].." 3",
					disabled = function() return not oRA.maintanktable[3] end,
					order = 3,
				},
				[4] = {
					name = "4.", type = "execute", desc = L["Remove Maintank"].." 4",
					disabled = function() return not oRA.maintanktable[4] end,
					order = 4,
				},
				[5] = {
					name = "5.", type = "execute", desc = L["Remove Maintank"].." 5",
					disabled = function() return not oRA.maintanktable[5] end,
					order = 5,
				},
				[6] = {
					name = "6.", type = "execute", desc = L["Remove Maintank"].." 6",
					disabled = function() return not oRA.maintanktable[6] end,
					order = 6,
				},
				[7] = {
					name = "7.", type = "execute", desc = L["Remove Maintank"].." 7",
					disabled = function() return not oRA.maintanktable[7] end,
					order = 7,
				},
				[8] = {
					name = "8.", type = "execute", desc = L["Remove Maintank"].." 8",
					disabled = function() return not oRA.maintanktable[8] end,
					order = 8,
				},
				[9] = {
					name = "9.", type = "execute", desc = L["Remove Maintank"].." 9",
					disabled = function() return not oRA.maintanktable[9] end,
					order = 9,
				},
				[10] = {
					name = "10.", type = "execute", desc = L["Remove Maintank"].." 10",
					disabled = function() return not oRA.maintanktable[10] end,
					order = 10,
				},
				["all"] = {
					name = L["All"], type="execute", desc = L["Delete all Maintanks"],
					order = 10,
				}
			}
		}
	}
}


------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	if not oRA.maintanktable then 
		oRA.maintanktable = oRA.db.profile.maintanktable or {}
	end
	self:RegisterEvent("oRA_SendVersion")
	self:RegisterEvent("oRA_MainTankUpdate")
	self:RegisterEvent("oRA_JoinedRaid", "oRA_MainTankUpdate")
	self:RegisterEvent("RosterLib_RosterChanged", "oRA_MainTankUpdate")
end

-------------------------------
--       Event Handlers      --
-------------------------------

function mod:oRA_SendVersion()
	if (not IsRaidLeader()) then return end
	self:Broadcast()
end

function mod:oRA_MainTankUpdate( maintanktable )
	if not maintanktable then maintanktable = oRA.maintanktable end
	for k = 1, 10, 1 do
		oRA.consoleOptions.args.mt.args.remove.args[k].name = tostring(k).."."
		oRA.consoleOptions.args.mt.args.set.args[k].name = tostring(k).."."
	end
	for k,v in pairs(maintanktable) do
		if oRA:IsValidRequest(v,true) then
			oRA.consoleOptions.args.mt.args.remove.args[k].name = tostring(k)..". "..v
			oRA.consoleOptions.args.mt.args.set.args[k].name = tostring(k)..". "..v
		end
	end
end

-------------------------------
--      Command Handlers     --
-------------------------------

function mod:Set( text )
	if not oRA:IsPromoted() then return end
	if not text or text == "" then return end
	local num, name = select(3, text:find(L["(%S+)%s*(.*)"])) -- split locals
	if not num then return end

	num = tonumber(num)
	if not name or name == "" then name = UnitName("target") end
	
	-- lower the name and upper the first letter, not for chinese and korean though
	if GetLocale() ~= "zhTW" and GetLocale() ~= "zhCN" and GetLocale() ~= "koKR" then
		local len = select(2, name:find("[%z\1-\127\194-\244][\128-\191]*"))
		name = name:sub(1, len):upper() .. name:sub(len + 1):lower()
	end

	if not oRA:IsValidRequest(name, true) then return end
	
	oRA:SendMessage( "SET " .. num .. " " .. name )
	self:Print(L["Set maintank: "] .. "[".. num .. "] [" .. name .."]")
end

function mod:Remove( num )
	if not oRA:IsPromoted() then return end
	if not num then return end
	num = tonumber(num)
	local name = oRA.maintanktable[num]
	if not name then return end
	oRA:SendMessage( "R "..name )
	self:Print(L["Removed maintank: "] .. num .." "..name )
end


function mod:Broadcast()
	for k,v in pairs(oRA.maintanktable) do
		if oRA:IsValidRequest(v,true) then oRA:SendMessage("SET "..k.." "..v) end
	end
end

function mod:TooltipClick( num )
	if not num then return end
	num = tonumber(num)
	local name = UnitName("target")
	if oRA.maintanktable[num] then
		if not name then self:Remove(num)
		else self:Set( num .." ".. name ) end	
	else
		if name then self:Set( num .." ".. name ) end
	end
end

------------------------------
--      Tooltip Updating    --
------------------------------

local na = "|cffcccccc"..L["<Not Assigned>"].."|r"
local notValid = setmetatable({}, {__index = function(self, key)
	self[key] = "|cffcccccc<"..key..">|r"
	return self[key]
end})

function mod:OnTooltipUpdate()
	if not oRA:IsPromoted() then return end
	local cat = tablet:AddCategory(
		"columns", 2,
		"text", "#",
		"text2", L["MainTank"],
		"child_func", self.TooltipClick,
		"child_arg1", self
	)
	for i = 1, 10 do
		local p = oRA.maintanktable[i]
		if p then
			if oRA:IsValidRequest( p, true ) then
				cat:AddLine("text", i, "text2", self.coloredNames[p], "arg2", i)
			else
				cat:AddLine( "text", i, "text2", notValid[p], "arg2", i)
			end
		else
			cat:AddLine( "text", i, "text2", na, "arg2", i)
		end
	end
end

