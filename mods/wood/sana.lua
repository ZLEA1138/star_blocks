-- VARIABLES
local choppy = 2



-- NODES
-- trunk
minetest.register_node("wood:sana_trunk", {
	description = "Sana Trunk",
	tiles = {
		"sana_trunk_top.png",
		"sana_trunk_top.png",
		"sana_trunk.png"
	},
	groups = {tree = 1, choppy = choppy, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:sana_trunk",
	burntime = 30,
})

-- wood
minetest.register_node("wood:sana_wood", {
	description = "Sana Wood",
	tiles = {"sana_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = choppy, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "wood:sana_wood 4",
	recipe = {{"wood:sana_trunk"}},
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:sana_wood",
	burntime = 7,
})

-- leaves
minetest.register_node("wood:sana_leaves", {
	description = "Sana Leaves",
	drawtype = "plantlike",
	tiles = {"sana_leaves.png"},
	inventory_image = "sana_leaves.png",
	wield_image = "sana_leaves.png",
	paramtype = "light",
	walkable = wood.leafwalk,
	visual_scale = 1.4,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, put_out_fire = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"wood:sana_sapling"}, rarity = 50},
			{items = {"wood:sana_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"wood:sana_trunk"},
	leaves = {"wood:sana_leaves"},
	radius = 3
})

-- sapling
minetest.register_node("wood:sana_sapling", {
	description = "Sana Tree Sapling",
	drawtype = "plantlike",
	tiles = {"sana_tree_sapling.png"},
	inventory_image = "sana_tree_sapling.png",
	wield_image = "sana_tree_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {
		snappy = 2, dig_immediate = 3, put_out_fire = 1,
		ethereal_sapling = 1, attached_node = 1, sapling = 1
	},
	sounds = default.node_sound_leaves_defaults(),
	grown_height = 7
})

-- stair
stairs.register_stair_and_slab(
	"sana_wood",
	"wood:sana_wood",
	{choppy = choppy, oddly_breakable_by_hand = 1, put_out_fire = 1},
	{"sana_wood.png"},
	"Sana Wood Stair",
	"Sana Wood Slab",
	default.node_sound_wood_defaults()
)

-- fence/rail/gate
default.register_fence("wood:fence_sana", {
	description = "Sana Fence",
	texture = "sana_wood.png",
	material = "wood:sana_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, put_out_fire = 1},
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
	recipe = "wood:fence_sana",
	burntime = 5,
})

default.register_fence_rail("wood:fence_rail_sana", {
	description = "Sana Fence Rail",
	texture = "sana_wood.png",
	material = "wood:sana_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, put_out_fire = 1},
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
	recipe = "wood:fence_rail_sana",
	burntime = 5,
})

doors.register_fencegate("wood:fence_gate_sana", {
	description = "Sana Fence Gate",
	texture = "sana_wood.png",
	material = "wood:sana_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, put_out_fire = 1}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_gate_sana_closed",
	burntime = 5,
})