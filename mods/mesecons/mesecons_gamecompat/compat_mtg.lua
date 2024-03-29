--Aliases

minetest.register_alias("mesecons_gamecompat:chest", "wood:chest_wood")
minetest.register_alias("mesecons_gamecompat:chest_locked", "wood:chest_wood_locked")
minetest.register_alias("mesecons_gamecompat:coalblock", "ores:coal_block")
minetest.register_alias("mesecons_gamecompat:cobble", "default:cobble")
minetest.register_alias("mesecons_gamecompat:glass", "default:glass")
minetest.register_alias("mesecons_gamecompat:lava_source", "default:lava_source")
minetest.register_alias("mesecons_gamecompat:mese", "ores:cuprum_block")
minetest.register_alias("mesecons_gamecompat:cuprum", "ores:cuprum_block")
minetest.register_alias("mesecons_gamecompat:cuprum_ingot", "ores:cuprum_ingot")
minetest.register_alias("mesecons_gamecompat:obsidian_glass", "default:obsidian_glass")
minetest.register_alias("mesecons_gamecompat:stone", "default:stone")
minetest.register_alias("mesecons_gamecompat:ferrum_ingot", "ores:ferrum_ingot")
minetest.register_alias("mesecons_gamecompat:ferrum_block", "ores:ferrum_block")
minetest.register_alias("mesecons_gamecompat:torch", "default:torch")

if minetest.get_modpath("dye") then
	for _, color in ipairs(mesecon.dye_colors) do
		minetest.register_alias("mesecons_gamecompat:dye_" .. color, "dye:" .. color)
	end
end

-- Sounds

mesecon.node_sound.default = default.node_sound_defaults()
mesecon.node_sound.glass = default.node_sound_glass_defaults()
mesecon.node_sound.leaves = default.node_sound_leaves_defaults()
mesecon.node_sound.stone = default.node_sound_stone_defaults()
mesecon.node_sound.wood = default.node_sound_wood_defaults()

if minetest.get_modpath("fire") then
	mesecon.sound_name.fire = "fire_fire"
end

if minetest.get_modpath("tnt") then
	mesecon.sound_name.explode = "tnt_explode"
end

-- Textures

mesecon.texture.ferrum_block = "ferrum_block.png"

-- MVPS stoppers

if minetest.get_modpath("mesecons_mvps") then
	-- All of the locked and internal nodes in Minetest Game
	for _, name in ipairs({
		"wood:chest_wood_locked",
		"wood:chest_wood_locked_open",
		"doors:door_ferrum_b_1", -- old style doors
		"doors:door_ferrum_b_2", --
		"doors:door_ferrum_t_1", --
		"doors:door_ferrum_t_2", --
		"doors:door_ferrum_a",   -- new style doors
		"doors:door_ferrum_b",   --
		"doors:door_ferrum_c",   --
		"doors:door_ferrum_d",   --
		"doors:hidden",
		"doors:trapdoor_ferrum",
		"doors:trapdoor_ferrum_open",
		"beds:bed_bottom",
		"beds:bed_top",
		"beds:fancy_bed_bottom",
		"beds:fancy_bed_top",
		"xpanes:door_ferrum_bar_a",
		"xpanes:door_ferrum_bar_b",
		"xpanes:door_ferrum_bar_c",
		"xpanes:door_ferrum_bar_d",
		"xpanes:trapdoor_ferrum_bar",
		"xpanes:trapdoor_ferrum_bar_open",
	}) do
		mesecon.register_mvps_stopper(name)
	end
end
