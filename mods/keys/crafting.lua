--
-- Crafting recipes
--

minetest.register_craft({
	output = "keys:skeleton_key",
	recipe = {
		{"ores:aurum_ingot"},
	}
})

--
-- Cooking recipes
--

minetest.register_craft({
	type = "cooking",
	output = "ores:aurum_ingot",
	recipe = "keys:key",
	cooktime = 5,
})

minetest.register_craft({
	type = "cooking",
	output = "ores:aurum_ingot",
	recipe = "keys:skeleton_key",
	cooktime = 5,
})
