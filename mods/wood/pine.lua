-- VARIABLES
local choppy = 2



-- NODES
-- trunk
minetest.register_node("wood:pine_trunk", {
	description = "Pine Trunk",
	tiles = {
		"pine_trunk_top.png",
		"pine_trunk_top.png",
		"pine_trunk.png"
	},
	groups = {tree = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:pine_trunk",
	burntime = 30,
})

-- wood
minetest.register_node("wood:pine_wood", {
	description = "Pine Wood",
	tiles = {"pine_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "wood:pine_wood 4",
	recipe = {{"wood:pine_trunk"}},
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:pine_wood",
	burntime = 7,
})

-- needles
minetest.register_node("wood:pine_needles", {
	description = "Pine Needles",
	drawtype = "plantlike",
	tiles = {"pine_needles.png"},
	inventory_image = "pine_needles.png",
	wield_image = "pine_needles.png",
	paramtype = "light",
	walkable = wood.leafwalk,
	visual_scale = 1.4,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"wood:pine_sapling"}, rarity = 20},
			{items = {"wood:pine_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"wood:pine_trunk"},
	leaves = {"wood:pine_needles"},
	radius = 3
})

-- sapling
minetest.register_node("wood:pine_sapling", {
	description = "Pine Tree Sapling",
	drawtype = "plantlike",
	tiles = {"pine_tree_sapling.png"},
	inventory_image = "pine_tree_sapling.png",
	wield_image = "pine_tree_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {
		snappy = 2, dig_immediate = 3, flammable = 2,
		ethereal_sapling = 1, attached_node = 1, sapling = 1
	},
	sounds = default.node_sound_leaves_defaults(),
	grown_height = 14
})

-- stair
stairs.register_stair_and_slab(
	"pine_wood",
	"wood:pine_wood",
	{choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	{"pine_wood.png"},
	"Pine Wood Stair",
	"Pine Wood Slab",
	default.node_sound_wood_defaults()
)

-- fence/rail/gate
default.register_fence("wood:fence_pine", {
	description = "Pine Fence",
	texture = "pine_wood.png",
	material = "wood:pine_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	check_for_pole = true,
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.9, 0.5},
		}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_pine",
	burntime = 6,
})

default.register_fence_rail("wood:fence_rail_pine", {
	description = "Pine Fence Rail",
	texture = "pine_wood.png",
	material = "wood:pine_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.9, 0.5},
		}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_rail_pine",
	burntime = 6,
})

doors.register_fencegate("wood:fence_gate_pine", {
	description = "Pine Fence Gate",
	texture = "pine_wood.png",
	material = "wood:pine_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_gate_pine_closed",
	burntime = 6,
})