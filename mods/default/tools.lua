-- mods/default/tools.lua

-- support for MT game translation.
local S = default.get_translator

-- The hand
-- Override the hand item registered in the engine in builtin/game/register.lua
minetest.override_item("", {
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

--
-- Picks
--

minetest.register_tool("default:pick_stone", {
	description = S("Stone Pickaxe"),
	inventory_image = "pick_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

--
-- Shovels
--

minetest.register_tool("default:shovel_stone", {
	description = S("Stone Shovel"),
	inventory_image = "shovel_stone.png",
	wield_image = "shovel_stone.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

--
-- Axes
--

minetest.register_tool("default:axe_stone", {
	description = S("Stone Axe"),
	inventory_image = "axe_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

--
-- Swords
--

minetest.register_tool("default:sword_stone", {
	description = S("Stone Sword"),
	inventory_image = "sword_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

--
-- Register Craft Recipies
--

local craft_ingreds = {
	stone = "group:stone"
}

for name, mat in pairs(craft_ingreds) do
	minetest.register_craft({
		output = "default:pick_".. name,
		recipe = {
			{mat, mat,           mat},
			{"",  "group:stick", ""},
			{"",  "group:stick", ""}
		}
	})

	minetest.register_craft({
		output = "default:shovel_".. name,
		recipe = {
			{mat},
			{"group:stick"},
			{"group:stick"}
		}
	})

	minetest.register_craft({
		output = "default:axe_".. name,
		recipe = {
			{mat, mat},
			{mat, "group:stick"},
			{"",  "group:stick"}
		}
	})

	minetest.register_craft({
		output = "default:sword_".. name,
		recipe = {
			{mat},
			{mat},
			{"group:stick"}
		}
	})
end