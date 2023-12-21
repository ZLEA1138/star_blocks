
-- Baked Clay (mesa biome is between 1 and 71)

--local add_stratum = function(y_min, y_max, node)

--	minetest.register_ore({
--		ore_type         = "stratum",
--		ore              = node,
--		wherein          = {"bakedclay:orange"},
--		clust_scarcity   = 1,
--		y_max            = y_max,
--		y_min            = y_min,
--		biomes = {"mesa"}
--	})
--end

--add_stratum(5, 10, "bakedclay:red")
--add_stratum(15, 20, "bakedclay:grey")
--add_stratum(25, 30, "bakedclay:red")
--add_stratum(35, 40, "bakedclay:grey")
--add_stratum(45, 50, "bakedclay:red")
--add_stratum(55, 60, "bakedclay:grey")


local add_ore = function(a, b, c, d, e, f, g)

	minetest.register_ore({
		ore_type = "scatter",
		ore = a,
		wherein = b,
		clust_scarcity = c,
		clust_num_ores = d,
		clust_size = e,
		y_min = f,
		y_max = g
	})
end


-- Coal
add_ore("ores:stone_with_coal", "default:desert_stone", 24*24*24, 27, 6, -31000, -16)

-- Ferrum (iron)
add_ore("ores:stone_with_ferrum", "default:desert_stone", 9*9*9, 5, 3, -63, -16)
add_ore("ores:stone_with_ferrum", "default:desert_stone", 24*24*24, 27, 6, -31000, -64)

-- Aurum (gold)
add_ore("ores:stone_with_aurum", "default:desert_stone", 15*15*15, 3, 2, -255, -64)
add_ore("ores:stone_with_aurum", "default:desert_stone", 13*13*13, 5, 3, -31000, -256)

-- Wolfram (tungsten)
add_ore("ores:stone_with_wolfram", "default:desert_stone", 17*17*17, 4, 3, -255, -128)
add_ore("ores:stone_with_wolfram", "default:desert_stone", 15*15*15, 4, 3, -31000, -256)

-- Cuprum (copper)
add_ore("ores:stone_with_cuprum", "default:desert_stone", 9*9*9, 5, 3, -31000, -64)

-- Stannum (tin)
add_ore("ores:stone_with_stannum", "default:desert_stone", 9*9*9, 5, 3, -31000, -64)

-- Coral Sand
--add_ore("ethereal:sandy", "default:sand", 10*10*10, 24, 4, -100, -10)
