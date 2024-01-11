
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = minetest.get_translator(minetest.get_current_modname())

--- Ferrum
--
--  Requires setting `armor_material_ferrum`.
--
--  @section ferrum

if armor.materials.ferrum then
	--- Ferrum Helmet
	--
	--  @helmet 3d_armor:helmet_ferrum
	--  @img 3d_armor_inv_helmet_ferrum.png
	--  @grp armor_head 1
	--  @grp armor_heal 0
	--  @grp armor_use 800
	--  @grp physics_speed -0.01
	--  @grp physica_gravity 0.01
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 2
	--  @damagegrp snappy 3
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 1
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:helmet_ferrum", {
		description = S("Ferrum Helmet"),
		inventory_image = "3d_armor_inv_helmet_ferrum.png",
		groups = {armor_head=1, armor_heal=0, armor_use=800,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	--- Ferrum Chestplate
	--
	--  @chestplate 3d_armor:chestplate_ferrum
	--  @img 3d_armor_inv_chestplate_ferrum.png
	--  @grp armor_torso 1
	--  @grp armor_heal 0
	--  @grp armor_use 800
	--  @grp physics_speed
	--  @grp physics_gravity
	--  @armorgrp fleshy
	--  @damagegrp cracky 2
	--  @damagegrp snappy 3
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 1
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:chestplate_ferrum", {
		description = S("Ferrum Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_ferrum.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=800,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	--- Ferrum Leggings
	--
	--  @leggings 3d_armor:leggings_ferrum
	--  @img 3d_armor_inv_leggings_ferrum.png
	--  @grp armor_legs 1
	--  @grp armor_heal 0
	--  @grp armor_use 800
	--  @grp physics_speed -0.03
	--  @grp physics_gravity 0.03
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 2
	--  @damagegrp snappy 3
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 1
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:leggings_ferrum", {
		description = S("Ferrum Leggings"),
		inventory_image = "3d_armor_inv_leggings_ferrum.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=800,
			physics_speed=-0.03, physics_gravity=0.03},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	--- Ferrum Boots
	--
	--  @boots 3d_armor:boots_ferrum
	--  @img 3d_armor_inv_boots_ferrum.png
	--  @grp armor_feet 1
	--  @grp armor_heal 0
	--  @grp armor_use 800
	--  @grp physics_speed -0.01
	--  @grp physics_gravity 0.01
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 2
	--  @damagegrp snappy 3
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 1
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:boots_ferrum", {
		description = S("Ferrum Boots"),
		inventory_image = "3d_armor_inv_boots_ferrum.png",
		groups = {armor_feet=1, armor_heal=0, armor_use=800,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})

	--- Crafting
	--
	--  @section craft

	--- Craft recipes for helmets, chestplates, leggings, boots, & shields.
	--
	--  @craft armor
	--  @usage
	--  Key:
	--  - m: material
	--    - wood:    group:wood
	--    - cactus:  default:cactus
	--    - ferrum:   default:ferrum_ingot
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

	local s = "ferrum"
	local m = armor.materials.ferrum
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
