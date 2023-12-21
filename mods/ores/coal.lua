-- VARIABLES
local cracky = 3



-- NODES
-- ore
minetest.register_node("ores:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"stone.png^coal_ore.png"},
	groups = {cracky = cracky},
	drop = "ores:coal_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- block
minetest.register_node("ores:coal_block", {
	description = "Coal Block",
	tiles = {"coal_block.png"},
	is_ground_content = false,
	groups = {cracky = cracky},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = function(pos)
		pos.y = pos.y + 1
		if minetest.get_node(pos).name == "fire:permanent_flame" then
			minetest.remove_node(pos)
		end
	end,
	on_ignite = function(pos)
		local flame_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
		if minetest.get_node(flame_pos).name == "air" then
			minetest.set_node(flame_pos, {name = "fire:permanent_flame"})
		end
	end
})

minetest.register_craft({
	output = "ores:coal_block",
	recipe = {
		{"ores:coal_ingot", "ores:coal_ingot", "ores:coal_ingot"},
		{"ores:coal_ingot", "ores:coal_ingot", "ores:coal_ingot"},
		{"ores:coal_ingot", "ores:coal_ingot", "ores:coal_ingot"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "ores:coal_block",
	burntime = 370,
})



-- ITEMS
-- raw lump
minetest.register_craftitem("ores:coal_lump", {
	description = "Coal Lump",
	inventory_image = "coal_lump.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craft({
	output = "ores:coal_lump 9",
	recipe = {
		{"ores:coal_block"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "ores:coal_lump",
	burntime = 40,
})



-- ENTITIES



-- TOOLS