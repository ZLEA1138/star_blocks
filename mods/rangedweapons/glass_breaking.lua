minetest.register_craftitem("rangedweapons:glass_shards", {
		description = "Glass Shards",
	inventory_image = "glass_shards.png",
})
minetest.register_craft({
	output = "vessels:glass_fragments",
	recipe = {
		{"rangedweapons:glass_shards", "rangedweapons:glass_shards", "rangedweapons:glass_shards"},
	}
})

--minetest.register_node("rangedweapons:broken_glass", {
--	description = "Broken glass",
--	drawtype = "glasslike",
--	tiles = {
--		"glass_broken.png"
--	},
--	paramtype = "light",
--	walkable = false,
--	is_ground_content = false,
--	liquidtype = "source",
--	liquid_alternative_flowing = "rangedweapons:broken_glass",
--	liquid_alternative_source = "rangedweapons:broken_glass",
--	liquid_viscosity = 7,
--	use_texture_alpha = 160,
--	liquid_range= 0,
--	liquid_renewable = false,
--	damage_per_second = 2,
--	groups = {oddly_breakable_by_hand = 3},
--})

minetest.register_node("rangedweapons:broken_glass", {
	description = "Broken Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"glass_broken.png"},
	use_texture_alpha = "clip", -- only needed for stairs API
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})