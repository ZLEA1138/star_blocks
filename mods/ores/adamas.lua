-- VARIABLES
local cracky = 1



-- NODES
-- ore
minetest.register_node("ores:stone_with_adamas", {
	description = "Adamas Ore",
	tiles = {"stone.png^adamas_ore.png"},
	groups = {cracky = cracky, level = 2},
	drop = {
		max_items = 1,
		items = {
			{
				rarity = 1,
				items = {"ores:adamas_crystal_blue"},
			},
			{
				rarity = 1,
				items = {"ores:adamas_crystal_green"},
			},
			{
				rarity = 10,
				items = {"ores:adamas_crystal_purple"},
			},
			{
				rarity = 10,
				items = {"ores:adamas_crystal_yellow"},
			},
		},
	},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
})



-- ITEMS
-- adamas crystal
minetest.register_craftitem("ores:adamas_crystal_green", {
    description = "Adamas Crystal",
    stack_max = 1,
    inventory_image = "adamas_crystal.png"
})
wielded_light.register_item_light("ores:adamas_crystal_green", 7)

minetest.register_craftitem("ores:adamas_crystal_blue", {
    description = "Adamas Crystal",
    stack_max = 1,
    inventory_image = "adamas_crystal.png"
})
wielded_light.register_item_light("ores:adamas_crystal_blue", 7)

minetest.register_craftitem("ores:adamas_crystal_yellow", {
    description = "Adamas Crystal",
    stack_max = 1,
    inventory_image = "adamas_crystal.png"
})
wielded_light.register_item_light("ores:adamas_crystal_yellow", 7)

minetest.register_craftitem("ores:adamas_crystal_purple", {
    description = "Adamas Crystal",
    stack_max = 1,
    inventory_image = "adamas_crystal.png"
})
wielded_light.register_item_light("ores:adamas_crystal_purple", 7)

minetest.register_craftitem("ores:adamas_crystal_red", {
    description = "Raging Adamas Crystal",
    stack_max = 1,
    inventory_image = "adamas_crystal_red.png"
})
wielded_light.register_item_light("ores:adamas_crystal_red", 7)

minetest.register_craftitem("ores:adamas_crystal_white", {
    description = "Healed Adamas Crystal",
    stack_max = 1,
    inventory_image = "adamas_crystal_white.png"
})
wielded_light.register_item_light("ores:adamas_crystal_white", 7)



-- ENTITIES



-- TOOLS