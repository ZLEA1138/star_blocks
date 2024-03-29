local S = minetest.get_translator(minetest.get_current_modname())

-- Glue and fiber
minetest.register_craftitem("mesecons_materials:glue", {
	image = "glue.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = S("Glue"),
})

minetest.register_craftitem("mesecons_materials:fiber", {
	image = "fiber.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = S("Fiber"),
})

minetest.register_craft({
	output = "mesecons_materials:glue 2",
	type = "cooking",
	recipe = "group:sapling",
	cooktime = 2
})

minetest.register_craft({
	output = "mesecons_materials:fiber 6",
	type = "cooking",
	recipe = "materials:glue",
	cooktime = 4
})

-- Keiso (silicon)
minetest.register_craftitem("mesecons_materials:keiso", {
	image = "keiso.png",
	on_place_on_ground = minetest.craftitem_place_item,
	description = S("Keiso"),
})

minetest.register_craft({
	output = "mesecons_materials:keiso 4",
	recipe = {
		{"group:sand", "group:sand"},
		{"group:sand", "ores:ferrum_ingot"},
	}
})
