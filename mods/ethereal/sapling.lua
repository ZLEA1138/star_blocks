
local S = ethereal.intllib

-- Bamboo Sprout
minetest.register_node("ethereal:bamboo_sprout", {
	description = S("Bamboo Sprout"),
	drawtype = "plantlike",
	tiles = {"bamboo_sprout.png"},
	inventory_image = "bamboo_sprout.png",
	wield_image = "bamboo_sprout.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {
		food_bamboo_sprout = 1, snappy = 3, attached_node = 1, flammable = 2,
		dig_immediate = 3, ethereal_sapling = 1, sapling = 1,
	},
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 0, 4 / 16}
	},
	on_use = minetest.item_eat(2),
	grown_height = 11,
})

-- Register Saplings
local register_sapling = function(name, desc, texture, height)

	minetest.register_node(name .. "_sapling", {
		description = S(desc .. " Sapling"),
		drawtype = "plantlike",
		tiles = {texture .. ".png"},
		inventory_image = texture .. ".png",
		wield_image = texture .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {
			snappy = 2, dig_immediate = 3, flammable = 2,
			ethereal_sapling = 1, attached_node = 1, sapling = 1
		},
		sounds = default.node_sound_leaves_defaults(),
		grown_height = height
	})
end

register_sapling("ethereal:mushroom", "Giant Mushroom", "mushroom_sapling", 11)
register_sapling("ethereal:bush", "Bush", "bush_sapling", 3)


local add_tree = function (pos, ofx, ofy, ofz, schem, replace)
	-- check for schematic
	if not schem then
		print (S("Schematic not found"))
		return
	end
	-- remove sapling and place schematic
	minetest.swap_node(pos, {name = "air"})
	minetest.place_schematic(
		{x = pos.x - ofx, y = pos.y - ofy, z = pos.z - ofz},
		schem, 0, replace, false)
end

local path = minetest.get_modpath("ethereal") .. "/schematics/"

-- grow tree functions
function ethereal.grow_uneti_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.uneti_tree)
end

function ethereal.grow_brylark_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.brylark_tree)
end

function ethereal.grow_mushroom_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.mushroom)
end

function ethereal.grow_palm_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.palm_tree)
end

function ethereal.grow_wroshyr_tree(pos)
	add_tree(pos, 7, 0, 7, ethereal.wroshyr_tree)
end

function ethereal.grow_jogan_tree(pos)
	add_tree(pos, 1, 0, 1, ethereal.jogan_tree)
end

function ethereal.grow_bamboo_tree(pos)
	add_tree(pos, 1, 0, 1, ethereal.bamboo_tree)
end

function ethereal.grow_pine_tree(pos)
	add_tree(pos, 3, 0, 3, ethereal.pine_tree)
end

function ethereal.grow_gnarltree(pos)
	add_tree(pos, 3, 0, 3, ethereal.gnarl_tree)
end

function ethereal.grow_bush(pos)
	add_tree(pos, 1, 0, 1, ethereal.bush)
end

-- check if sapling has enough height room to grow
local enough_height = function(pos, height)

	local nod = minetest.line_of_sight(
		{x = pos.x, y = pos.y + 1, z = pos.z},
		{x = pos.x, y = pos.y + height, z = pos.z})

	if not nod then
		return false -- obstructed
	else
		return true -- can grow
	end
end

local grow_sapling = function(pos, node)

	local under =  minetest.get_node({
		x = pos.x,
		y = pos.y - 1,
		z = pos.z
	}).name

	if not minetest.registered_nodes[node.name] then
		return
	end

	local height = minetest.registered_nodes[node.name].grown_height

	-- do we have enough height to grow sapling into tree?
	if not height or not enough_height(pos, height) then
		return
	end

	-- Check if Ethereal Sapling is growing on correct substrate
	if node.name == "wood:uneti_tree_sapling"
	and minetest.get_item_group(under, "soil") > 0 then
		ethereal.grow_uneti_tree(pos)

	elseif node.name == "wood:jogan_tree_sapling"
	and minetest.get_item_group(under, "soil") > 0 then
		ethereal.grow_jogan_tree(pos)

	elseif node.name == "wood:brylark_tree_sapling"
	and minetest.get_item_group(under, "soil") > 0 then
		ethereal.grow_brylark_tree(pos)

	elseif node.name == "ethereal:mushroom_sapling"
	and under == "ethereal:fungus_dirt" then
		ethereal.grow_mushroom_tree(pos)

	elseif node.name == "wood:palm_sapling"
	and under == "default:sand" then
		ethereal.grow_palm_tree(pos)

	elseif node.name == "wood:wroshyr_sapling"
	and minetest.get_item_group(under, "soil") > 0 then
		ethereal.grow_wroshyr_tree(pos)

	elseif node.name == "wood:pine_tree_sapling"
	and minetest.get_item_group(under, "soil") > 0 then
		ethereal.grow_pine_tree(pos)

	elseif node.name == "ethereal:bamboo_sprout"
	and under == "ethereal:bamboo_dirt" then
		ethereal.grow_bamboo_tree(pos)

	elseif node.name == "wood:gnarltree_sapling"
	and minetest.get_item_group(under, "soil") > 0 then
		ethereal.grow_gnarltree_tree(pos)

	elseif node.name == "ethereal:bush_sapling"
	and minetest.get_item_group(under, "soil") > 0 then
		ethereal.grow_bush(pos)
	end
end

-- Grow saplings
minetest.register_abm({
	label = "Ethereal grow sapling",
	nodenames = {"group:ethereal_sapling"},
	interval = 10,
	chance = 50,
	catch_up = false,
	action = function(pos, node)

		local light_level = minetest.get_node_light(pos) or 0

		if light_level < 13 then
			return
		end

		grow_sapling(pos, node)
	end
})
