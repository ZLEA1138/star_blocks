-- VARIABLES
local choppy = 2



-- NODES
-- trunk
minetest.register_node("wood:marshtree_trunk", {
	description = "Marshtree Trunk",
	tiles = {
		"marshtree_trunk_top.png",
		"marshtree_trunk_top.png",
		"marshtree_trunk.png"
	},
	groups = {tree = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:marshtree_trunk",
	burntime = 30,
})

-- wood
minetest.register_node("wood:marshtree_wood", {
	description = "Marshtree Wood",
	tiles = {"marshtree_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "wood:marshtree_wood 4",
	recipe = {{"wood:marshtree_trunk"}},
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:marshtree_wood",
	burntime = 7,
})

-- leaves
minetest.register_node("wood:marshtree_leaves", {
	description = "Marshtree Leaves",
	drawtype = "plantlike",
	tiles = {"marshtree_leaves.png"},
	inventory_image = "marshtree_leaves.png",
	wield_image = "marshtree_leaves.png",
	paramtype = "light",
	walkable = wood.leafwalk,
	visual_scale = 1.4,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"wood:marshtree_sapling"}, rarity = 20},
			{items = {"wood:marshtree_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"wood:marshtree_trunk"},
	leaves = {"wood:marshtree_leaves"},
	radius = 3
})

-- sapling
minetest.register_node("wood:marshtree_sapling", {
	description = "Marshtree Sapling",
	drawtype = "plantlike",
	tiles = {"marshtree_sapling.png"},
	inventory_image = "marshtree_sapling.png",
	wield_image = "marshtree_sapling.png",
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
	grown_height = 7
})

-- stair
stairs.register_stair_and_slab(
	"marshtree_wood",
	"wood:marshtree_wood",
	{choppy = choppy, oddly_breakable_by_hand = 1, flammable = 3},
	{"marshtree_wood.png"},
	"Marshtree Wood Stair",
	"Marshtree Wood Slab",
	default.node_sound_wood_defaults()
)

-- fence/rail/gate
default.register_fence("wood:fence_marshtree", {
	description = "Marshtree Fence",
	texture = "marshtree_wood.png",
	material = "wood:marshtree_wood",
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
	recipe = "wood:fence_marshtree",
	burntime = 5,
})

default.register_fence_rail("wood:fence_rail_marshtree", {
	description = "Marshtree Fence Rail",
	texture = "marshtree_wood.png",
	material = "wood:marshtree_wood",
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
	recipe = "wood:fence_rail_marshtree",
	burntime = 5,
})

doors.register_fencegate("wood:fence_gate_marshtree", {
	description = "Marshtree Fence Gate",
	texture = "marshtree_wood.png",
	material = "wood:marshtree_wood",
	groups = {choppy = choppy, oddly_breakable_by_hand = 2, flammable = 2}
})

minetest.register_craft({
	type = "fuel",
	recipe = "wood:fence_gate_marshtree_closed",
	burntime = 5,
})