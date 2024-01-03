--[ModestEssentials v1.0]
-- Made by gaymer#2093
-- discord.gg/kiddions

local first_100 = {
	0,
    800,
    2100,
    3800,
    6100,
    9500,
    12500,
    16000,
    19800,
    24000,
    28500,
    33400,
    38700,
    44200,
    50200,
    56400,
    63000,
    69900,
    77100,
    84700,
    92500,
    100700,
    109200,
    118000,
    127100,
    136500,
    146200,
    156200,
    166500,
    177100,
    188000,
    199200,
    210700,
    222400,
    234500,
    246800,
    259400,
    272300,
    285500,
    299000,
    312700,
    326800,
    341000,
    355600,
    370500,
    385600,
    401000,
    416600,
    432600,
    448800,
    465200,
    482000,
    499000,
    516300,
    533800,
    551600,
    569600,
    588000,
    606500,
    625400,
    644500,
    663800,
    683400,
    703300,
    723400,
    743800,
    764500,
    785400,
    806500,
    827900,
    849600,
    871500,
    893600,
    916000,
    938700,
    961600,
    984700,
    1008100,
    1031800,
    1055700,
    1079800,
    1104200,
    1128800,
    1153700,
    1178800,
    1204200,
    1229800,
    1255600,
    1281700,
    1308100,
    1334600,
    1361400,
    1388500,
    1415800,
    1443300,
    1471100,
    1499100,
    1527300,
    1555800,
    1584350 }

-- // Functions \\

function get_rp_required_for_rank(rank) -- Converts a rank number into required RP
	if rank <= 99 then
		return first_100[rank];
	end
	return get_rp_required_for_rank(rank-1) + 28500 + 50 * (rank - 99)
end

function GetMPX() -- Returns character slot number stat string
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		return mpx
end

function BoolToInt(boolhash) -- takes a boolean stat and returns value as integer
	local boolval = stats.get_bool(boolhash)
	if boolval == true then return 1
	else return 0
	end
end


-- // Menu Features \\

local ME = menu.add_submenu("Modest Essentials") -- Creates new submenu in Scripts


local SetRP = ME:add_submenu("Set Rank") -- Adds a new submenu in the root of the current submenu

SetRP:add_int_range("Set Rank", 1, 1, 8000, function() -- Adds new int range feature to submenu which sets your rp stat and prints to console
		return 0
	end, function(value)
		print("Setting Rank to level "..value)
		stats.set_int(GetMPX().."CHAR_SET_RP_GIFT_ADMIN", get_rp_required_for_rank(value))
end)
SetRP:add_action("[Join new Session to Apply]", function() end)


local CharStats = ME:add_submenu("Character Stats")

local statNum = 100

CharStats:add_action("Max Stamina", function()
	stats.set_int(GetMPX().."SCRIPT_INCREASE_STAM", statNum)
	print("Set Stamina to "..statNum)
end)

CharStats:add_action("Max Shooting", function()
	stats.set_int(GetMPX().."SCRIPT_INCREASE_SHO", statNum)
	print("Set Shooting to "..statNum)
end)

CharStats:add_action("Max Strength", function()
	stats.set_int(GetMPX().."SCRIPT_INCREASE_STRN", statNum)
	print("Set Strength to ".. statNum)
end)

CharStats:add_action("Max Stealth", function()
	stats.set_int(GetMPX().."SCRIPT_INCREASE_STL", statNum)
	print("Set Stealth to ".. statNum)
end)

CharStats:add_action("Max Flying", function()
	stats.set_int(GetMPX().."SCRIPT_INCREASE_FLY", statNum)
	print("Set Flying to "..statNum)
end)

CharStats:add_action("Max Driving", function()
	stats.set_int(GetMPX().."SCRIPT_INCREASE_DRIV", statNum)
	print("Set Driving to "..statNum)
end)

CharStats:add_action("Max Lung Capacity", function()
	stats.set_int(GetMPX().."SCRIPT_INCREASE_LUNG", statNum)
	print("Set Lung Capacity to "..statNum)
end)

CharStats:add_int_range("Set Mental State", 1, 0, 100, function()
	return 0
end, function(value)
	stats.set_int(GetMPX().."PLAYER_MENTAL_STATE", value)
end)


local AccRep = ME:add_submenu("Account Reports")

AccRep:add_action("[These Stats are READ ONLY]", function() end)
AccRep:add_int_range("Griefing Reports", 0, 0, 2147483647, function() return stats.get_int("MPPLY_GRIEFING") end, function(value) end)
AccRep:add_int_range("Game Exploits", 0, 0, 2147483647, function() return stats.get_int("MPPLY_GAME_EXPLOITS") end, function(value) end)
AccRep:add_int_range("Voice Chat Annoying", 0, 0, 2147483647, function() return stats.get_int("MPPLY_VC_ANNOYINGME") end, function(value) end)
AccRep:add_int_range("Voice Chat Hate", 0, 0, 2147483647, function() return stats.get_int("MPPLY_VC_HATE") end, function(value) end)
AccRep:add_int_range("Offensive Language", 0, 0, 2147483647, function() return stats.get_int("MPPLY_OFFENSIVE_LANGUAGE") end, function(value) end)
AccRep:add_int_range("Offensive Tagplate", 0, 0, 2147483647, function() return stats.get_int("MPPLY_OFFENSIVE_TAGPLATE") end, function(value) end)
AccRep:add_int_range("Offensive UGC", 0, 0, 2147483647, function() return stats.get_int("MPPLY_OFFENSIVE_UGC") end, function(value) end)
AccRep:add_int_range("Offensive Crew Name", 0, 0, 2147483647, function() return stats.get_int("MPPLY_BAD_CREW_NAME") end, function(value) end)
AccRep:add_int_range("Offensive Crew Motto", 0, 0, 2147483647, function() return stats.get_int("MPPLY_BAD_CREW_MOTTO") end, function(value) end)
AccRep:add_int_range("Offensive Crew Status", 0, 0, 2147483647, function() return stats.get_int("MPPLY_BAD_CREW_STATUS") end, function(value) end)
AccRep:add_int_range("Offensive Crew Emblem", 0, 0, 2147483647, function() return stats.get_int("MPPLY_BAD_CREW_EMBLEM") end, function(value) end)
AccRep:add_int_range("Friendly Commends", 0, 0, 2147483647, function() return stats.get_int("MPPLY_FRIENDLY") end, function(value) end)
AccRep:add_int_range("Helpful Commends", 0, 0, 2147483647, function() return stats.get_int("MPPLY_HELPFUL") end, function(value) end)

local NY = {}
NY[0] = "False"
NY[1] = "True"
AccRep:add_array_item("Marked As Cheater?", NY, function() return BoolToInt("MPPLY_IS_CHEATER") end, function(value) end)
AccRep:add_array_item("Marked As Bad Sport?", NY, function() return BoolToInt("MPPLY_WAS_I_BAD_SPORT") end, function(value) end)
AccRep:add_array_item("Marked as High Earner?,", NY, function() return BoolToInt("MPPLY_IS_HIGH_EARNER") end, function(value) end)