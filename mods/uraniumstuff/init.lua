local ingot_name = "uraniumstuff:uran_ingot"
local stick_name = "default:stick"
local stone_name = "default:stone"
local stone_image = "stone.png"
local stone_sounds = nil

local MODNAME = minetest.get_current_modname()
local MODPATH = minetest.get_modpath(MODNAME)
local S = minetest.get_translator(MODNAME)

function get_setting(key, default)
	local value = minetest.settings:get("uraniumstuff." .. key)
	local num_value = tonumber(value)
	if value and not num_value then
		print("Invalid value for setting %s: %q. Using default %q.", key, value, default)
	end
	return num_value or default
end

local uses = get_setting("max_tool_uses", 400)
local full_punch_interval = get_setting("full_punch_interval", 0.3)
local damage_multiplier = get_setting("damage_multiplier", 1.5)
local radiation_damage = get_setting("radiation_damage", 5)
local allow_multitool = minetest.settings:get_bool("uraniumstuff.allow_multitool", true)
local allow_irradiating = minetest.settings:get_bool("uraniumstuff.allow_irradiating_mobs", true)
local allow_armor_damage = minetest.settings:get_bool("uraniumstuff.allow_armor_radiation", true)
local allow_tool_damage = minetest.settings:get_bool("uraniumstuff.allow_tool_radiation", true)
local leave_residue = minetest.settings:get_bool("uraniumstuff.leave_residue", true)

function round(num)
    return num + (2^52 + 2^51) - (2^52 + 2^51)
end

dofile(MODPATH .. "/goo.lua")

stone_sounds = default.node_sound_stone_defaults()


-- Ore generation

if not minetest.get_modpath("technic") then
    ingot_name = "uraniumstuff:uranium_ingot"
    
    minetest.register_node("uraniumstuff:stone_with_uran", {
	    description = S("Uran Ore"),
	    tiles = { stone_image .. "^uran_ore.png" },
	    is_ground_content = true,
	    groups = {cracky=3, radioactive=1},
	    sounds = stone_sounds,
	    drop = "uraniumstuff:uran_lump",
        light_source = 5,
    })

    local ORE_MIN = -80
    local ORE_MAX = -300
    local ORE_SCARCITY = 8*8*8*8*8
    if minetest.get_modpath("mcl_core") then
        local ORE_MIN = -10
        local ORE_MAX = -64
        local ORE_SCARCITY = 8*8*8*8
    end

    minetest.register_ore({
	    ore_type = "scatter",
	    ore = "uraniumstuff:stone_with_uran",
	    wherein = stone_name,
	    clust_scarcity = ORE_SCARCITY,
	    clust_num_ores = 2,
	    clust_size = 3,
	    y_min = ORE_MIN,
	    y_max = ORE_MAX,
	    --noise_params = uranium_params,
	    --noise_threshold = uranium_threshold,
    })

    minetest.register_node("uraniumstuff:uran_block", {
	    description = S("Uran Block"),
	    tiles = { "uran_block.png" },
	    is_ground_content = true,
	    groups = {cracky=1, level=2, radioactive=1},
	    sounds = stone_sounds,
        light_source = 5,
    })

    minetest.register_craftitem("uraniumstuff:uran_lump", {
	    description = S("Uran Lump"),
	    inventory_image = "uran_lump.png",
        light_source = 5,
    })

    minetest.register_craftitem("uraniumstuff:uran_ingot", {
	    description = S("Uran Ingot"),
	    inventory_image = "uran_ingot.png",
	    groups = {uranium_ingot=1},
        light_source = 5,
    })

    minetest.register_craft({
		output = "uraniumstuff:uran_block",
		recipe = {
			{ingot_name, ingot_name, ingot_name},
			{ingot_name, ingot_name, ingot_name},
			{ingot_name, ingot_name, ingot_name},
		}
	})

	minetest.register_craft({
		output = ingot_name.." 9",
		recipe = {
			{"uraniumstuff:uranium_block"}
		}
	})

    minetest.register_craft({
	    type = 'cooking',
	    recipe = "uraniumstuff:uran_lump",
	    output = "uraniumstuff:uran_ingot",
    })
end

-- Gems

if allow_armor_damage or allow_tool_damage then

    minetest.register_craftitem("uraniumstuff:uran_gem", {
        description = S("Uran Gem"),
        inventory_image = "uran_gem.png",
        light_source = 5,
    })

    minetest.register_craft({
        output = "uraniumstuff:uran_gem",
        recipe = {
            {"",         ingot_name, ""},
            {ingot_name, ingot_name, ingot_name},
            {"",         ingot_name, ""},
        }
    })

end
