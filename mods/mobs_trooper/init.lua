
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

-- Check for translation method
local S
if minetest.get_translator ~= nil then
	S = minetest.get_translator("mobs_translate") -- 5.x translation function
else
	if minetest.get_modpath("intllib") then
		dofile(minetest.get_modpath("intllib") .. "/init.lua")
		if intllib.make_gettext_pair then
			S = intllib.make_gettext_pair() -- new gettext method
		else
			S = intllib.Getter() -- old text file method
		end
	else -- boilerplate function
		S = function(str, ...)
			local args = {...}
			return str:gsub("@%d+", function(match)
				return args[tonumber(match:sub(2))]
			end)
		end
	end
end

mobs.intllib_trooper = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_trooper = true
	input:close()
	input = nil
end


-- Imperials
dofile(path .. "trooper.lua")
--dofile(path .. "imperial_officer.lua")


-- Load custom spawning
if mobs.custom_spawn_trooper then
	dofile(path .. "spawn.lua")
end


print ("[MOD] Mobs Redo Monsters loaded")
