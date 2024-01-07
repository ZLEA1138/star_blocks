-- farming/hoes.lua

-- support for MT game translation.
local S = farming.get_translator

farming.register_hoe(":farming:hoe_wood", {
	description = S("Wooden Hoe"),
	inventory_image = "hoe_wood.png",
	max_uses = 30,
	material = "group:wood",
	groups = {hoe = 1, flammable = 2},
})

farming.register_hoe(":farming:hoe_stone", {
	description = S("Stone Hoe"),
	inventory_image = "hoe_stone.png",
	max_uses = 90,
	material = "group:stone",
	groups = {hoe = 1}
})

farming.register_hoe(":farming:hoe_ferrum", {
	description = S("Ferrum Hoe"),
	inventory_image = "hoe_ferrum.png",
	max_uses = 500,
	material = "ores:ferrum_ingot",
	groups = {hoe = 1}
})