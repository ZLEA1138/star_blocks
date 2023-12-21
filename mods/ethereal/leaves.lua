
local S = ethereal.intllib

-- set leaftype (value inside init.lua)
local leaftype = "plantlike"
local leafscale = 1.4

if ethereal.leaftype ~= 0 then
	leaftype = "allfaces_optional"
	leafscale = 1.0
end

-- bamboo leaves
minetest.register_node("ethereal:bamboo_leaves", {
	description = S("Bamboo Leaves"),
	drawtype = leaftype,
	visual_scale = 1.4,
	tiles = {"bamboo_leaves.png"},
	inventory_image = "bamboo_leaves.png",
	wield_image = "bamboo_leaves.png",
	paramtype = "light",
	walkable = ethereal.leafwalk,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:bamboo_sprout"}, rarity = 10},
			{items = {"ethereal:bamboo_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- bush leaves
minetest.register_node("ethereal:bush_leaves", {
	description = S("Bush Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"bush_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:bush_sapling"}, rarity = 5},
			{items = {"ethereal:bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- mushroom cap
minetest.register_node("ethereal:mushroom_cap", {
	description = S("Mushroom Cap"),
	tiles = {"mushroom_cap.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:mushroom_sapling"}, rarity = 20},
			{items = {"ethereal:mushroom_cap"}}
		}
	},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	type = "fuel",
	recipe = "ethereal:mushroom_cap",
	burntime = 10,
})

-- mushroom pore (spongelike material found inside giant shrooms)
minetest.register_node("ethereal:mushroom_pore", {
	description = S("Mushroom Pore"),
	tiles = {"mushroom_pore.png"},
	groups = {
		snappy = 3, cracky = 3, choppy = 3, oddly_breakable_by_hand = 3,
		flammable = 2, disable_jump = 1, fall_damage_add_percent = -100
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	type = "fuel",
	recipe = "ethereal:mushroom_pore",
	burntime = 3,
})

-- hedge block
minetest.register_node("ethereal:bamboo_bush", {
	description = S("Bamboo Bush"),
	tiles = {"bamboo_bush.png"},
	walkable = true,
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "ethereal:bamboo_bush",
	recipe = {
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "ethereal:bamboo_leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "ethereal:bamboo_bush",
	burntime = 1,
})

-- leaf decay
default.register_leafdecay({
	trunks = {"ethereal:bamboo"},
	leaves = {"ethereal:bamboo_leaves"},
	radius = 2
})

default.register_leafdecay({
	trunks = {"ethereal:bush_stem"},
	leaves = {"ethereal:bush_leaves"},
	radius = 3
})
