minetest.register_tool("rangedweapons:cfc38", {
	wield_scale = {x=1.9,y=1.9,z=1.25},
		description = "CFC-38 RCWS\n"
						.. "Configuration: Rifle\n"
--						.. core.colorize("#FFFFFF", "Ranged damage: 5\n")
--						.. core.colorize("#FFFFFF", "Accuracy: 85%\n")
--						.. core.colorize("#FFFFFF", "Knockback: 0\n")
--						.. core.colorize("#FFFFFF", "Critical chance: 9%\n")
--						.. core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n")
--						.. core.colorize("#FFFFFF", "Rate of fire: 0.25\n")
--						.. core.colorize("#FFFFFF", "Enemy penetration: 40%\n")
						.. core.colorize("#B0C4DE", "Right click to reconfigure weapon"),
	range = 0,
    RW_powergun_capabilities = {
		automatic_gun = 1,
		power_damage = {fleshy=7,knockback=0},
		power_crit = 9,
		power_critEffc = 2.0,
		power_cooling = "rangedweapons:cfc38",
		power_velocity = 60,
		power_accuracy = 85,
		power_cooldown = 0.25,
		power_projectiles = 1,
		power_sound = "laser1",
		power_glass_breaking = 1,
		power_door_breaking = 1,
		power_dps = 0,
		power_mob_penetration = 40,
		power_node_penetration = 0,
		power_consumption = 0,
		power_entity = "rangedweapons:shot_bullet",
		power_visual = "wielditem",
		power_texture = "rangedweapons:laser_bolt_blue",
		power_projectile_size = 0.075,
		has_sparks = 0,
		ignites_explosives = 1,
	},
	inventory_image = "cfc38.png",
	on_secondary_use = function(itemstack,player)
		minetest.sound_play("rangedweapons_handgun_mag_out", {player})
		itemstack:replace("rangedweapons:cfc38_sniper")
		return itemstack
	end
})

minetest.register_tool("rangedweapons:cfc38_sniper", {
	wield_scale = {x=1.9,y=1.9,z=1.25},
		description = "CFC-38 RCWS\n"
						.. "Configuration: Sniper\n"
--						.. core.colorize("#FFFFFF", "Ranged damage: 18\n")
--						.. core.colorize("#FFFFFF", "Accuracy: 100%\n")
--						.. core.colorize("#FFFFFF", "Knockback: 15\n")
--						.. core.colorize("#FFFFFF", "Critical chance: 30%\n")
--						.. core.colorize("#FFFFFF", "Critical efficiency: 3.0x\n")
--						.. core.colorize("#FFFFFF", "Rate of fire: 1.5\n")
--						.. core.colorize("#FFFFFF", "Enemy penetration: 40%\n")
--						.. core.colorize("#FFFFFF", "Node penetration: 10%\n")
						.. core.colorize("#B0C4DE", "Right click to reconfigure weapon"),
	range = 0,
	weapon_zoom = 7.5,
    RW_powergun_capabilities = {
		automatic_gun = 1,
		power_damage = {fleshy=18,knockback=15},
		power_crit = 30,
		power_critEffc = 3.0,
		power_cooling = "rangedweapons:cfc38_sniper",
		power_velocity = 100,
		power_accuracy = 100,
		power_cooldown = 1.5,
		power_projectiles = 1,
		power_sound = "laser3",
		power_glass_breaking = 1,
		power_door_breaking = 1,
		power_dps = 0,
		power_mob_penetration = 40,
		power_node_penetration = 10,
		power_consumption = 0,
		power_entity = "rangedweapons:shot_bullet",
		power_visual = "wielditem",
		power_texture = "rangedweapons:laser_bolt_blue",
		power_projectile_size = 0.075,
		has_sparks = 0,
		ignites_explosives = 1,
	},
	inventory_image = "cfc38_sniper.png",
	groups = {not_in_creative_inventory = 1},
	on_secondary_use = function(itemstack,player)
		minetest.sound_play("rangedweapons_handgun_mag_out", {player})
		itemstack:replace("rangedweapons:cfc38_ap")
		return itemstack
	end
})

minetest.register_tool("rangedweapons:cfc38_ap", {
	wield_scale = {x=1.9,y=1.9,z=1.25},
		description = "CFC-38 RCWS\n"
						.. "Configuration: Armor piercing\n"
--						.. core.colorize("#FFFFFF", "Ranged damage: 5\n")
--						.. core.colorize("#FFFFFF", "Accuracy: 85%\n")
--						.. core.colorize("#FFFFFF", "Knockback: 0\n")
--						.. core.colorize("#FFFFFF", "Critical chance: 9%\n")
--						.. core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n")
--						.. core.colorize("#FFFFFF", "Rate of fire: 0.25\n")
--						.. core.colorize("#FFFFFF", "Enemy penetration: 40%\n")
						.. core.colorize("#B0C4DE", "Right click to reconfigure weapon"),
	range = 0,
    RW_powergun_capabilities = {
		automatic_gun = 1,
		power_damage = {fleshy=15,knockback=25},
		power_crit = 9,
		power_critEffc = 3.0,
		power_cooling = "rangedweapons:cfc38_ap",
		power_velocity = 60,
		power_accuracy = 96,
		power_cooldown = 2,
		power_projectiles = 1,
		power_sound = "laser4",
		power_glass_breaking = 1,
		power_door_breaking = 1,
		power_dps = 0,
		power_mob_penetration = 40,
		power_node_penetration = 40,
		power_consumption = 0,
		power_entity = "rangedweapons:shot_bullet",
		power_visual = "wielditem",
		power_texture = "rangedweapons:laser_bolt_green",
		power_projectile_size = 0.075,
		has_sparks = 0,
		ignites_explosives = 1,
	},
	inventory_image = "cfc38_ap.png",
	groups = {not_in_creative_inventory = 1},
	on_secondary_use = function(itemstack,player)
		minetest.sound_play("rangedweapons_handgun_mag_out", {player})
		itemstack:replace("rangedweapons:cfc38")
		return itemstack
	end
})