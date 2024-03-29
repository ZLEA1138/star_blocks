local S = minetest.get_translator(minetest.get_current_modname())

local lightstone_rules = {
	{x=0,  y=0,  z=-1},
	{x=1,  y=0,  z=0},
	{x=-1, y=0,  z=0},
	{x=0,  y=0,  z=1},
	{x=1,  y=1,  z=0},
	{x=1,  y=-1, z=0},
	{x=-1, y=1,  z=0},
	{x=-1, y=-1, z=0},
	{x=0,  y=1,  z=1},
	{x=0,  y=-1, z=1},
	{x=0,  y=1,  z=-1},
	{x=0,  y=-1, z=-1},
	{x=0,  y=-1, z=0},
}

function mesecon.lightstone_add(name, base_item, texture_off, texture_on, desc)
	if not desc then
		desc = name .. " Light Block"
	end
	minetest.register_node("mesecons_lightstone:light_block_" .. name .. "_off", {
		tiles = {texture_off},
		is_ground_content = false,
		groups = {cracky = 2, mesecon_effector_off = 1, mesecon = 2},
		description = desc,
		sounds = mesecon.node_sound.stone,
		mesecons = {effector = {
			rules = lightstone_rules,
			action_on = function (pos, node)
				minetest.swap_node(pos, {name = "mesecons_lightstone:light_block_" .. name .. "_on", param2 = node.param2})
			end,
		}},
		on_blast = mesecon.on_blastnode,
	})
	minetest.register_node("mesecons_lightstone:light_block_" .. name .. "_on", {
		tiles = {texture_on},
		is_ground_content = false,
		groups = {cracky = 2, not_in_creative_inventory = 1, mesecon = 2},
		drop = "mesecons_lightstone:light_block_" .. name .. "_off",
		light_source = minetest.LIGHT_MAX - 2,
		sounds = mesecon.node_sound.stone,
		mesecons = {effector = {
			rules = lightstone_rules,
			action_off = function (pos, node)
				minetest.swap_node(pos, {name = "mesecons_lightstone:light_block_" .. name .. "_off", param2 = node.param2})
			end,
		}},
		on_blast = mesecon.on_blastnode,
	})

	minetest.register_craft({
		output = "mesecons_lightstone:light_block_" .. name .. "_off",
		recipe = {
			{"",       base_item,                          ""},
			{base_item,"mesecons_gamecompat:torch",        base_item},
			{"",       "group:mesecon_conductor_craftable",""}
		}
	})
end


mesecon.lightstone_add("red", "mesecons_gamecompat:dye_red", "light_block_red_off.png", "light_block_red_on.png", S("Red Light Block"))
mesecon.lightstone_add("green", "mesecons_gamecompat:dye_green", "light_block_green_off.png", "light_block_green_on.png", S("Green Light Block"))
mesecon.lightstone_add("blue", "mesecons_gamecompat:dye_blue", "light_block_blue_off.png", "light_block_blue_on.png", S("Blue Light Block"))
mesecon.lightstone_add("gray", "mesecons_gamecompat:dye_grey", "light_block_gray_off.png", "light_block_gray_on.png", S("Grey Light Block"))
mesecon.lightstone_add("darkgray", "mesecons_gamecompat:dye_dark_grey", "light_block_darkgray_off.png", "light_block_darkgray_on.png", S("Dark Grey Light Block"))
mesecon.lightstone_add("yellow", "mesecons_gamecompat:dye_yellow", "light_block_yellow_off.png", "light_block_yellow_on.png", S("Yellow Light Block"))
mesecon.lightstone_add("orange", "mesecons_gamecompat:dye_orange", "light_block_orange_off.png", "light_block_orange_on.png", S("Orange Light Block"))
mesecon.lightstone_add("white", "mesecons_gamecompat:dye_white", "light_block_white_off.png", "light_block_white_on.png", S("White Light Block"))
mesecon.lightstone_add("pink", "mesecons_gamecompat:dye_pink", "light_block_pink_off.png", "light_block_pink_on.png", S("Pink Light Block"))
mesecon.lightstone_add("magenta", "mesecons_gamecompat:dye_magenta", "light_block_magenta_off.png", "light_block_magenta_on.png", S("Magenta Light Block"))
mesecon.lightstone_add("cyan", "mesecons_gamecompat:dye_cyan", "light_block_cyan_off.png", "light_block_cyan_on.png", S("Cyan Lightstone"))
mesecon.lightstone_add("violet", "mesecons_gamecompat:dye_violet", "light_block_violet_off.png", "light_block_violet_on.png", S("Violet Light Block"))
