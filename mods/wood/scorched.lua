-- VARIABLES
local choppy = 2



-- NODES
-- trunk
minetest.register_node("wood:scorched_tree", {
	description = "Scorched Tree",
	tiles = {
		"scorched_tree_top.png",
		"scorched_tree_top.png",
		"scorched_tree.png"
	},
	groups = {tree = 1, choppy = choppy, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})



-- ITEMS



-- ENTITIES



-- TOOLS