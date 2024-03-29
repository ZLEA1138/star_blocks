
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = minetest.get_translator(minetest.get_current_modname())
--- Aereus
--
--  Requires setting `armor_material_aereus`.
--
--  @section aereus

if armor.materials.aereus then
	--- Aereus Helmet
	--
	--  @helmet 3d_armor:helmet_aereus
	--  @img 3d_armor_inv_helmet_aereus.png
	--  @grp armor_head 1
	--  @grp armor_heal 6
	--  @grp armor_use 400
	--  @grp physics_speed -0.01
	--  @grp physics_gravity 0.01
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 1
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:helmet_aereus", {
		description = S("Aereus Helmet"),
		inventory_image = "3d_armor_inv_helmet_aereus.png",
		groups = {armor_head=1, armor_heal=6, armor_use=400,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
	})
	--- Aereus Chestplate
	--
	--  @chestplate 3d_armor:chestplate_aereus
	--  @img 3d_armor_inv_chestplate_aereus.png
	--  @grp armor_torso 1
	--  @grp armor_heal 6
	--  @grp armor_use 400
	--  @grp physics_speed -0.04
	--  @grp physics_gravity 0.04
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 1
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:chestplate_aereus", {
		description = S("Aereus Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_aereus.png",
		groups = {armor_torso=1, armor_heal=6, armor_use=400,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
	})
	--- Aereus Leggings
	--
	--  @leggings 3d_armor:leggings_aereus
	--  @img 3d_armor_inv_leggings_aereus.png
	--  @grp armor_legs 1
	--  @grp armor_heal 6
	--  @grp armor_use 400
	--  @grp physics_speed -0.03
	--  @grp physics_gravity 0.03
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 1
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:leggings_aereus", {
		description = S("Aereus Leggings"),
		inventory_image = "3d_armor_inv_leggings_aereus.png",
		groups = {armor_legs=1, armor_heal=6, armor_use=400,
			physics_speed=-0.03, physics_gravity=0.03},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
	})
	--- Aereus Boots
	--
	--  @boots 3d_armor:boots_aereus
	--  @img 3d_armor_inv_boots_aereus.png
	--  @grp armor_feet 1
	--  @grp armor_heal 6
	--  @grp armor_use 400
	--  @grp physics_speed -0.01
	--  @grp physics_gravity 0.01
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 1
	--  @damagegrp level 2
	armor:register_armor(":3d_armor:boots_aereus", {
		description = S("Aereus Boots"),
		inventory_image = "3d_armor_inv_boots_aereus.png",
		groups = {armor_feet=1, armor_heal=6, armor_use=400,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
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
	--    - aereus:  default:aereus_ingot
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

	local s = "aereus"
	local m = armor.materials.aereus
	minetest.register_craft({
		output = "3d_armor:helmet_"..s,
		recipe = {
			{m,  m,  m},
			{m,  "", m},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "3d_armor:chestplate_"..s,
		recipe = {
			{m, "", m},
			{m, m,  m},
			{m, m,  m},
		},
	})
	minetest.register_craft({
		output = "3d_armor:leggings_"..s,
		recipe = {
			{m, m,  m},
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
