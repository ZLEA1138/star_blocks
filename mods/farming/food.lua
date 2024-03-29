
local S = farming.translate
local a = farming.recipe_items

-- sliced bread

minetest.register_craftitem("farming:bread_slice", {
	description = S("Sliced Bread"),
	inventory_image = "bread_slice.png",
	on_use = minetest.item_eat(1),
	groups = {food_bread_slice = 1, flammable = 2, compostability = 65}
})

minetest.register_craft({
	output = "farming:bread_slice 5",
	recipe = {{"group:food_bread", a.cutting_board}},
	replacements = {{"group:food_cutting_board", "farming:cutting_board"}}
})

-- toast

minetest.register_craftitem("farming:toast", {
	description = S("Toast"),
	inventory_image = "toast.png",
	on_use = minetest.item_eat(1),
	groups = {food_toast = 1, flammable = 2, compostability = 65}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "farming:toast",
	recipe = "farming:bread_slice"
})

-- toast sandwich

minetest.register_craftitem("farming:toast_sandwich", {
	description = S("Toast Sandwich"),
	inventory_image = "toast_sandwich.png",
	on_use = minetest.item_eat(4),
	groups = {flammable = 2, compostability = 85}
})

minetest.register_craft({
	output = "farming:toast_sandwich",
	recipe = {
		{"farming:bread_slice"},
		{"farming:toast"},
		{"farming:bread_slice"}
	}
})

-- filter sea water into river water

--minetest.register_craft({
--	output = a.bucket_river_water,
--	recipe = {
--		{"farming:hemp_fibre"},
--		{"farming:hemp_fibre"},
--		{a.bucket_water}
--	}
--})

--if farming.mcl then

--	minetest.register_craft({
--		output = "mcl_potions:river_water",
--		recipe = {
--			{"farming:hemp_fibre"},
--			{"mcl_potions:water"}
--		}
--	})
--end

-- glass of water

minetest.register_craftitem("farming:glass_water", {
	description = S("Glass of Water"),
	inventory_image = "water_glass.png",
	groups = {food_glass_water = 1, flammable = 3, vessel = 1}
})

minetest.register_craft({
	output = "farming:glass_water 4",
	recipe = {
		{a.drinking_glass, a.drinking_glass},
		{a.drinking_glass, a.drinking_glass},
		{a.bucket_river_water, ""}
	},
	replacements = {{a.bucket_river_water, a.bucket_empty}}
})

--minetest.register_craft({
--	output = "farming:glass_water 4",
--	recipe = {
--		{a.drinking_glass, a.drinking_glass},
--		{a.drinking_glass, a.drinking_glass},
--		{a.bucket_water, "farming:hemp_fibre"}
--	},
--	replacements = {{a.bucket_water, a.bucket_empty}}
--})

-- Sugar

minetest.register_craftitem("farming:sugar", {
	description = S("Sugar"),
	inventory_image = "sugar.png",
	groups = {food_sugar = 1, flammable = 3}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "farming:sugar 2",
	recipe = "default:reeds"
})

minetest.register_node("farming:sugar_cube", {
	description = S("Sugar Cube"),
	tiles = {"sugar_cube.png"},
	groups = {shovely = 1, handy = 1, crumbly = 2},
	floodable = true,
	sounds = farming.sounds.node_sound_gravel_defaults(),
	_mcl_hardness = 0.8,
	_mcl_blast_resistance = 1
})

minetest.register_craft({
	output = "farming:sugar_cube",
	recipe = {
		{a.sugar, a.sugar, a.sugar},
		{a.sugar, a.sugar, a.sugar},
		{a.sugar, a.sugar, a.sugar}
	}
})

minetest.register_craft({
	output = a.sugar .. " 9",
	recipe = {{"farming:sugar_cube"}}
})

-- Sugar caramel

minetest.register_craftitem("farming:caramel", {
	description = S("Caramel"),
	inventory_image = "caramel.png",
	groups = {compostability = 40}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 6,
	output = "farming:caramel",
	recipe = "group:food_sugar"
})

-- Salt

minetest.register_node("farming:salt", {
	description = S("Salt"),
	inventory_image = "salt.png",
	wield_image = "salt.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	tiles = {"salt.png"},
	groups = {food_salt = 1, vessel = 1, dig_immediate = 3,
			attached_node = 1},
	sounds = farming.sounds.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	-- special function to make salt crystals form inside water
	dropped_step = function(self, pos, dtime)

		self.ctimer = (self.ctimer or 0) + dtime
		if self.ctimer < 15.0 then return end
		self.ctimer = 0

		local needed

		if self.node_inside
		and self.node_inside.name == a.water_source then
			needed = 8

		elseif self.node_inside
		and self.node_inside.name == a.river_water_source then
			needed = 9
		end

		if not needed then return end

		local objs = core.get_objects_inside_radius(pos, 0.5)

		if not objs or #objs ~= 1 then return end

		local salt, ent = nil, nil

		for k, obj in pairs(objs) do

			ent = obj:get_luaentity()

			if ent and ent.name == "__builtin:item"
			and ent.itemstring == "farming:salt " .. needed then

				obj:remove()

				core.add_item(pos, "farming:salt_crystal")

				return false -- return with no further action
			end
		end
	end
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:salt",
	recipe = a.bucket_water,
	replacements = {{a.bucket_water, a.bucket_empty}}
})

-- Salt Crystal

minetest.register_node("farming:salt_crystal", {
	description = S("Salt crystal"),
	inventory_image = "salt_crystal.png",
	wield_image = "salt_crystal.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	light_source = 1,
	tiles = {"salt_crystal.png"},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = farming.sounds.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	_mcl_hardness = 0.8,
	_mcl_blast_resistance = 1
})

minetest.register_craft({
	output = "farming:salt 9",
	recipe = {
		{"farming:salt_crystal", a.mortar_pestle}
	},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})

minetest.register_craft({
	output = "farming:salt_crystal",
	recipe = {
		{"farming:salt", "farming:salt", "farming:salt"},
		{"farming:salt", "farming:salt", "farming:salt"},
		{"farming:salt", "farming:salt", "farming:salt"}
	}
})

-- Rose Water

minetest.register_node("farming:rose_water", {
	description = S("Rose Water"),
	inventory_image = "rose_water.png",
	wield_image = "rose_water.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	tiles = {"rose_water.png"},
	groups = {
		food_rose_water = 1, vessel = 1, dig_immediate = 3, attached_node = 1
	},
	sounds = farming.sounds.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	}
})

minetest.register_craft({
	output = "farming:rose_water",
	recipe = {
		{a.rose, a.rose, a.rose},
		{a.rose, a.rose, a.rose},
		{"group:food_glass_water", a.pot, a.glass_bottle}
	},
	replacements = {
		{"group:food_glass_water", a.drinking_glass},
		{"group:food_pot", "farming:pot"}
	}
})

-- Ring Cake (thanks to Bockwurst for making the donut images)

minetest.register_craftitem("farming:ringcake", {
	description = S("Ring Cake"),
	inventory_image = "ringcake.png",
	on_use = minetest.item_eat(4),
	groups = {compostability = 65}
})

minetest.register_craft({
	output = "farming:ringcake 3",
	recipe = {
		{"",                 "group:food_wheat", ""},
		{"group:food_wheat", "group:food_sugar", "group:food_wheat"},
		{"",                 "group:food_wheat", ""}
	}
})

--minetest.register_craftitem("farming:ringcake_chocolate", {
--	description = S("Chocolate Ring Cake"),
--	inventory_image = "ringcake_chocolate.png",
--	on_use = minetest.item_eat(6),
--	groups = {compostability = 65}
--})

--minetest.register_craft({
--	output = "farming:ringcake_chocolate",
--	recipe = {
--		{"group:food_cocoa"},
--		{"farming:ringcake"}
--	}
--})

minetest.register_craftitem("farming:ringcake_tavifruit", {
	description = S("Tavifruit Ring Cake"),
	inventory_image = "ringcake_tavifruit.png",
	on_use = minetest.item_eat(6),
	groups = {compostability = 65}
})

minetest.register_craft({
	output = "farming:ringcake_tavifruit",
	recipe = {
		{"group:food_tavifruit"},
		{"farming:ringcake"}
	}
})

-- Tavifruit Pie

minetest.register_craftitem("farming:tavifruit_pie", {
	description = S("Tavifruit Pie"),
	inventory_image = "tavifruit_pie.png",
	on_use = minetest.item_eat(6),
	groups = {compostability = 75}
})

minetest.register_craft({
	output = "farming:tavifruit_pie",
	recipe = {
		{a.flour, "group:food_sugar", "group:food_tavifruit"},
		{"",      a.baking_tray,      ""}
	},
	replacements = {{"group:food_baking_tray", "farming:baking_tray"}}
})

-- Cactus Juice

minetest.register_craftitem("farming:cactus_juice", {
	description = S("Cactus Juice"),
	inventory_image = "cactus_juice.png",
	groups = {vessel = 1, drink = 1, compostability = 55},

	on_use = function(itemstack, user, pointed_thing)

		if user then

			local num = math.random(5) == 1 and -1 or 2

			return minetest.do_item_eat(num, "vessels:drinking_glass",
					itemstack, user, pointed_thing)
		end
	end
})

minetest.register_craft({
	output = "farming:cactus_juice",
	recipe = {
		{a.juicer},
		{a.cactus},
		{a.drinking_glass}
	},
	replacements = {
		{"group:food_juicer", "farming:juicer"}
	}
})