
local S = ethereal.intllib

-- mushroom trunk
minetest.register_node("ethereal:mushroom_trunk", {
	description = S("Giant Mushroom Trunk"),
	tiles = {
		"mushroom_trunk_top.png",
		"mushroom_trunk_top.png",
		"mushroom_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Bamboo (thanks to Nelo-slay on DeviantArt for the free Bamboo base image)
minetest.register_node("ethereal:bamboo", {
	description = S("Bamboo"),
	drawtype = "plantlike",
	tiles = {"bamboo.png"},
	inventory_image = "bamboo.png",
	wield_image = "bamboo.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {stick = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},--tree = 1
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ethereal:bamboo",
	burntime = 1,
})

-- bush stem
minetest.register_node("ethereal:bush_stem", {
	description = S("Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"bush_stem.png"},
	inventory_image = "bush_stem.png",
	wield_image = "bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_craft({
	output = "default:stick 4",
	recipe = {
		{"ethereal:bush_stem"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "ethereal:bush_stem",
	burntime = 7,
})
