local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_craftitem("simplecoins:coin_federation", {
	description = S("Federation Unit"),
	inventory_image = "coin_federation.png",
	stack_max = 9999,
	groups = { coinvalue=1 },
})

minetest.register_craftitem("simplecoins:coin_volfrem", {
	description = S("Vol'fremian D'ani"),
	inventory_image = "coin_volfrem.png",
	stack_max = 9999,
	groups = { coinvalue=1 },
})