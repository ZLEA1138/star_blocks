
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = minetest.get_translator(minetest.get_current_modname())


--- Aurum
--
--  Requires `armor_material_aurum`.
--
--  @section aurum

if armor.materials.aurum then
	--- Aurum Helmet
	--
	--  @helmet 3d_armor:helmet_aurum
	--  @img 3d_armor_inv_helmet_aurum.png
	--  @grp armor_head 1
	--  @grp armor_heal 6
	--  @grp armor_use 300
	--  @grp physics_speed -0.02
	--  @grp physics_gravity 0.02
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 1
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 3
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:helmet_aurum", {
		description = S("Aurum Helmet"),
		inventory_image = "3d_armor_inv_helmet_aurum.png",
		groups = {armor_head=1, armor_heal=6, armor_use=300,
			physics_speed=-0.02, physics_gravity=0.02},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	--- Aurum Chestplate
	--
	--  @chestplate 3d_armor:chestplate_aurum
	--  @img 3d_armor_inv_chestplate_aurum.png
	--  @grp armor_torso 1
	--  @grp armor_heal 6
	--  @grp armor_use 300
	--  @grp physics_speed -0.05
	--  @grp physics_gravity 0.05
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 1
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 3
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:chestplate_aurum", {
		description = S("Aurum Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_aurum.png",
		groups = {armor_torso=1, armor_heal=6, armor_use=300,
			physics_speed=-0.05, physics_gravity=0.05},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	--- Aurum Leggings
	--
	--  @leggings 3d_armor:leggings_aurum
	--  @img 3d_armor_inv_leggings_aurum.png
	--  @grp armor_legs 1
	--  @grp armor_heal 6
	--  @grp armor_use 300
	--  @grp physics_speed -0.04
	--  @grp physics_gravity 0.04
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 1
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 3
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:leggings_aurum", {
		description = S("Aurum Leggings"),
		inventory_image = "3d_armor_inv_leggings_aurum.png",
		groups = {armor_legs=1, armor_heal=6, armor_use=300,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	--- Aurum Boots
	--
	--  @boots 3d_armor:boots_aurum
	--  @img 3d_armor_inv_boots_aurum.png
	--  @grp armor_feet 1
	--  @grp armor_heal 6
	--  @grp armor_use 300
	--  @grp physics_speed -0.02
	--  @grp physics_gravity 0.02
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 1
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 3
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:boots_aurum", {
		description = S("Aurum Boots"),
		inventory_image = "3d_armor_inv_boots_aurum.png",
		groups = {armor_feet=1, armor_heal=6, armor_use=300,
			physics_speed=-0.02, physics_gravity=0.02},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
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
	--    - steel:   default:steel_ingot
	--    - bronze:  default:bronze_ingot
	--    - diamond: default:diamond
	--    - aurum:    default:aurum_ingot
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

	local s = "aurum"
	local m = armor.materials.aurum
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
