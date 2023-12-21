
local S = ethereal.intllib

-- Bamboo Flooring
minetest.register_node("ethereal:bamboo_floor", {
	description = S("Bamboo Floor"),
	drawtype = "nodebox",
	tiles = {"bamboo_floor.png"},
	wield_image = "bamboo_floor.png",
	inventory_image = "bamboo_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = true,
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
		wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}
	},
	selection_box = {type = "wallmounted"},
	groups = {snappy = 3, choppy = 3 , flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

-- Craft Bamboo into Bamboo Flooring
minetest.register_craft({
	output = "ethereal:bamboo_floor 2",
	recipe = {
		{"ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo"}
	}
})

minetest.register_craft({
	output = "ethereal:bamboo_block",
	recipe = {
		{"ethereal:bamboo_floor"},
		{"ethereal:bamboo_floor"}
	}
})

-- Bamboo Block
minetest.register_node("ethereal:bamboo_block", {
	description = S("Bamboo Block"),
	tiles = {"bamboo_floor.png"},
	paramtype = "light",
	groups = {snappy = 3, choppy = 3 , flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	output = "ethereal:bamboo_block",
	recipe = {
		{"ethereal:bamboo", "ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo", "ethereal:bamboo"}
	}
})

-- Craft Bamboo into Paper
minetest.register_craft({
	output = "default:paper 6",
	recipe = {
		{"ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo"}
	}
})

if ethereal.xcraft == true then

-- X pattern craft recipes (5x 'a' in X pattern gives 5 of 'b')
local cheat = {
	{"default:cobble", "default:gravel", 5},
	{"default:gravel", "default:dirt", 5},
	{"default:dirt", "default:sand", 5},
	{"default:ice", "default:snow", 20},
	{"ethereal:dry_dirt", "default:desert_sand", 5},
	{"default:stone", "default:silver_sandstone", 5}
}

for n = 1, #cheat do

	minetest.register_craft({
		output = cheat[n][2] .. " " .. cheat[n][3],
		recipe = {
			{cheat[n][1], "", cheat[n][1]},
			{"", cheat[n][1], ""},
			{cheat[n][1], "", cheat[n][1]}
		}
	})
end

end -- END if

-- Paper (2x3 string = 4 paper)
--minetest.register_craft({
--	output = "default:paper 2",
--	recipe = {
--		{"farming:cotton", "farming:cotton", "farming:cotton"}
--	}
--})

-- Palm Wax
minetest.register_craftitem("ethereal:palm_wax", {
	description = S("Palm Wax"),
	inventory_image = "palm_wax.png",
	wield_image = "palm_wax.png"
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "ethereal:palm_wax",
	recipe = "ethereal:palm_leaves"
})


local function add_candle(col, dcol)

local rcol = ""

if col ~= "" then
	rcol = col
	col = "_" .. col
end

minetest.register_node("ethereal:candle" .. col, {
	description = S(dcol .. "Candle"),
	drawtype = "plantlike",
	inventory_image = "candle" .. col .. "_static.png",
	wield_image = "candle" .. col .. "_static.png",
	tiles = {
		{
			name = "candle" .. col .. ".png",
			animation = {
				type="vertical_frames",
				aspect_w = 32,
				aspect_h = 32,
				length = 1.0
			}
		}
	},
	paramtype = "light",
	light_source = 11,
	sunlight_propagates = true,
	walkable = false,
	groups = {candle = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0, 0.15 }
	}
})

	if col ~= "" then
		minetest.register_craft({
			output = "ethereal:candle" .. col,
			recipe = {
				{"group:candle", "dye:" .. rcol},
			}
		})
	end
end

add_candle("", "")
add_candle("black", "Black ") -- candle colour textures by wRothbard
add_candle("blue", "Blue ")
add_candle("brown", "Brown ")
add_candle("cyan", "Cyan ")
add_candle("dark_green", "Dark Green ")
add_candle("dark_grey", "Dark Grey ")
add_candle("green", "Green ")
add_candle("grey", "Grey ")
add_candle("magenta", "Magenta ")
add_candle("orange", "Orange ")
add_candle("pink", "Pink ")
add_candle("red", "Red ")
add_candle("violet", "Violet ")
add_candle("yellow", "Yellow ")

-- white candle recipe
minetest.register_craft({
	output = "ethereal:candle",
	recipe = {
		{"group:candle", "dye:white"}
	}
})

-- candle recipe
minetest.register_craft({
	output = "ethereal:candle 2",
	recipe = {
		{"farming:string"},
		{"ethereal:palm_wax"},
		{"ethereal:palm_wax"}
	}
})

-- Wooden Bowl
minetest.register_craftitem("ethereal:bowl", {
	description = S("Bowl"),
	inventory_image = "bowl.png",
	groups = {food_bowl = 1, flammable = 2}
})

minetest.register_craft({
	output = "ethereal:bowl 4",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""}
	}
})

-- stone Ladder
minetest.register_node("ethereal:stone_ladder", {
	description = S("Stone Ladder"),
	drawtype = "signlike",
	tiles = {"stone_ladder.png"},
	inventory_image = "stone_ladder.png",
	wield_image = "stone_ladder.png",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted"
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	legacy_wallmounted = true,
	sounds = default.node_sound_stone_defaults()
})

minetest.register_craft({
	output = "ethereal:stone_ladder 4",
	recipe = {
		{"group:stone", "", "group:stone"},
		{"group:stone", "group:stone", "group:stone"},
		{"group:stone", "", "group:stone"}
	}
})

-- Paper Wall
minetest.register_node("ethereal:paper_wall", {
	drawtype = "nodebox",
	description = S("Paper Wall"),
	tiles = {"paper_wall.png"},
	inventory_image = "paper_wall.png",
	wield_image = "paper_wall.png",
	paramtype = "light",
	groups = {snappy = 3},
	sounds = default.node_sound_wood_defaults(),
	walkable = true,
	is_ground_content = false,
	sunlight_propagates = true,
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 5/11, 0.5, 0.5, 8/16}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 5/11, 0.5, 0.5, 8/16}
		}
	}
})

minetest.register_craft({
	output = "ethereal:paper_wall",
	recipe = {
		{"group:stick", "default:paper", "group:stick"},
		{"group:stick", "default:paper", "group:stick"},
		{"group:stick", "default:paper", "group:stick"}
	}
})