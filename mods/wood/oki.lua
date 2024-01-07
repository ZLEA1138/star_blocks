-- VARIABLES
local choppy = 2



-- NODES
-- trunk
minetest.register_node("wood:oki_trunk", {
	description = "Oki Trunk",
	tiles = {
		"oki_trunk_top.png",
		"oki_trunk_top.png",
		"oki_trunk.png"
	},
	groups = {tree = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:oki_trunk",
	burntime = 30,
})

-- wood
minetest.register_node("wood:oki_wood", {
	description = "Oki Wood",
	tiles = {"oki_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "wood:oki_wood 4",
	recipe = {{"wood:oki_trunk"}},
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:oki_wood",
	burntime = 7,
})

-- leaves
minetest.register_node("wood:oki_leaves", {
	description = "Oki Leaves",
	drawtype = "plantlike",
	tiles = {"oki_leaves.png"},
	inventory_image = "oki_leaves.png",
	wield_image = "oki_leaves.png",
	paramtype = "light",
	walkable = wood.leafwalk,
	visual_scale = 1.4,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"wood:oki_sapling"}, rarity = 25},
			{items = {"wood:oki_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"wood:oki_trunk"},
	leaves = {"wood:oki_leaves"},
	radius = 3
})

-- sapling
minetest.register_node("wood:oki_sapling", {
	description = "Oki Tree Sapling",
	drawtype = "plantlike",
	tiles = {"oki_tree_sapling.png"},
	inventory_image = "oki_tree_sapling.png",
	wield_image = "oki_tree_sapling.png",
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
	grown_height = 31
})

-- stair
stairs.register_stair_and_slab(
	"oki_wood",
	"wood:oki_wood",
	{choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	{"oki_wood.png"},
	"Oki Wood Stair",
	"Oki Wood Slab",
	default.node_sound_wood_defaults()
)

-- fence/rail/gate
default.register_fence("wood:fence_oki", {
	description = "Oki Fence",
	texture = "oki_wood.png",
	material = "wood:oki_wood",
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
	recipe = "wood:fence_oki",
	burntime = 9,
})

default.register_fence_rail("wood:fence_rail_oki", {
	description = "Oki Fence Rail",
	texture = "oki_wood.png",
	material = "wood:oki_wood",
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
	recipe = "wood:fence_rail_oki",
	burntime = 9,
})

doors.register_fencegate("wood:fence_gate_oki", {
	description = "Oki Fence Gate",
	texture = "oki_wood.png",
	material = "wood:oki_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_gate_oki_closed",
	burntime = 9,
})