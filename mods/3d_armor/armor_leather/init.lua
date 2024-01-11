
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = minetest.get_translator(minetest.get_current_modname())

--- Leather
--
--  Requires setting `armor_material_leather`.
--
--  @section leather

if armor.materials.leather then
	--- Leather Helmet
	--
	--  @helmet 3d_armor:helmet_leather
	--  @img 3d_armor_inv_helmet_leather.png
	--  @grp armor_head 1
	--  @grp armor_heal 0
	--  @grp armor_use 2000
	--  @grp flammable 1
	--  @armorgrp fleshy 5
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp choppy 3
	--  @damagegrp crumbly 2
	--  @damagegrp level 1
	armor:register_armor(":3d_armor:helmet_leather", {
		description = S("Leather Helmet"),
		inventory_image = "3d_armor_inv_helmet_leather.png",
		groups = {armor_head=1, armor_heal=0, armor_use=2000, flammable=1},
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
	})
	--- Leather Chestplate
	--
	--  @chestplate 3d_armor:chestplate_leather
	--  @img 3d_armor_inv_chestplate_leather.png
	--  @grp armor_torso 1
	--  @grp armor_heal 0
	--  @grp armor_use 2000
	--  @grp flammable 1
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp choppy 3
	--  @damagegrp crumbly 2
	--  @damagegrp level 1
	armor:register_armor(":3d_armor:chestplate_leather", {
		description = S("Leather Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_leather.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=2000, flammable=1},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
	})
	--- Leather Leggings
	--
	--  @leggings 3d_armor:leggings_leather
	--  @img 3d_armor_inv_leggings_leather.png
	--  @grp armor_legs 1
	--  @grp armor_heal 0
	--  @grp armor_use 1000
	--  @grp flammable 1
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp choppy 3
	--  @damagegrp crumbly 2
	--  @damagegrp level 1
	armor:register_armor(":3d_armor:leggings_leather", {
		description = S("Leather Leggings"),
		inventory_image = "3d_armor_inv_leggings_leather.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=2000, flammable=1},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
	})
	--- Leather Boots
	--
	--  @boots 3d_armor:boots_leather
	--  @img 3d_armor_inv_boots_leather.png
	--  @grp armor_feet 1
	--  @grp armor_heal 0
	--  @grp armor_use 2000
	--  @grp flammable 1
	--  @armorgrp fleshy 5
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp choppy 3
	--  @damagegrp crumbly 2
	--  @damagegrp level 1
	armor:register_armor(":3d_armor:boots_leather", {
		description = S("Leather Boots"),
		inventory_image = "3d_armor_inv_boots_leather.png",
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
		groups = {armor_feet=1, armor_heal=0, armor_use=2000, flammable=1},
	})
	local leather_armor_fuel = {
		helmet = 6,
		chestplate = 8,
		leggings = 7,
		boots = 5
	}
	for armor, burn in pairs(leather_armor_fuel) do
		minetest.register_craft({
			type = "fuel",
			recipe = "3d_armor:" .. armor .. "_leather",
			burntime = burn,
		})
	end

	--- Crafting
	--
	--  @section craft

	--- Craft recipes for helmets, chestplates, leggings, boots, & shields.
	--
	--  @craft armor
	--  @usage
	--  Key:
	--  - m: material
	--    - leather:    group:leather
	--    - cactus:  default:cactus
	--    - steel:   default:steel_ingot
	--    - bronze:  default:bronze_ingot
	--    - diamond: default:diamond
	--    - gold:    default:gold_ingot
	--    - mithril: moreores:mithril_ingot
	--    - crystal: ethereal:crystal_ingot
	--    - nether:  nether:nether_ingot
	--
	--  helmet:        chestplate:    leggings:
	--  ┌───┬───┬───┐  ┌───┬───┬───┐  ┌───┬───┬───┐
	--  │ m │ m │ m │  │ m │   │ m │  │ m │ m │ m │
	--  ├───┼───┼───┤  ├───┼───┼───┤  ├───┼───┼───┤
	--  │ m │   │ m │  │ m │ m │ m │  │ m │   │ m │
	--  ├───┼───┼───┤  ├───┼───┼───┤  ├───┼───┼───┤
	--  │   │   │   │  │ m │ m │ m │  │ m │   │ m │
	--  └───┴───┴───┘  └───┴───┴───┘  └───┴───┴───┘
	--
	--  boots:         shield:
	--  ┌───┬───┬───┐  ┌───┬───┬───┐
	--  │   │   │   │  │ m │ m │ m │
	--  ├───┼───┼───┤  ├───┼───┼───┤
	--  │ m │   │ m │  │ m │ m │ m │
	--  ├───┼───┼───┤  ├───┼───┼───┤
	--  │ m │   │ m │  │   │ m │   │
	--  └───┴───┴───┘  └───┴───┴───┘

	local s = "leather"
	local m = armor.materials.leather
	minetest.register_craft({
		output = "3d_armor:helmet_"..s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "3d_armor:chestplate_"..s,
		recipe = {
			{m, "", m},
			{m, m, m},
			{m, m, m},
		},
	})
	minetest.register_craft({
		output = "3d_armor:leggings_"..s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{m, "", m},
		},
	})
	minetest.register_craft({
		output = "3d_armor:boots_"..s,
		recipe = {
			{m, "", m},
			{m, "", m},
		},
	})
end
