minetest.register_tool("rangedweapons:fc37", {
	wield_scale = {x=1.75,y=1.75,z=1.20},
		description = "FC-37 Carbine\n"
						.. "Mode: Lethal\n"
--						.. core.colorize("#FFFFFF", "Ranged damage: 5\n")
--						.. core.colorize("#FFFFFF", "Accuracy: 85%\n")
--						.. core.colorize("#FFFFFF", "Knockback: 0\n")
--						.. core.colorize("#FFFFFF", "Critical chance: 9%\n")
--						.. core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n")
--						.. core.colorize("#FFFFFF", "Rate of fire: 0.25\n")
--						.. core.colorize("#FFFFFF", "Enemy penetration: 40%\n")
						.. core.colorize("#B0C4DE", "Right click to change mode"),
	range = 0,
    RW_powergun_capabilities = {
		automatic_gun = 1,
		power_damage = {fleshy=7,knockback=0},
		power_crit = 9,
		power_critEffc = 2.0,
		power_cooling = "rangedweapons:fc37",
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
	inventory_image = "fc37.png",
	on_secondary_use = function(itemstack,player)
		minetest.sound_play("rangedweapons_handgun_mag_out", {player})
		itemstack:replace("rangedweapons:fc37_training")
		return itemstack
	end
})

minetest.register_tool("rangedweapons:fc37_training", {
	wield_scale = {x=1.75,y=1.75,z=1.20},
		description = "FC-37 Carbine\n"
						.. "Mode: Training\n"
--						.. core.colorize("#FFFFFF", "Ranged damage: 1\n")
--						.. core.colorize("#FFFFFF", "Accuracy: 85%\n")
--						.. core.colorize("#FFFFFF", "Knockback: 0\n")
--						.. core.colorize("#FFFFFF", "Critical chance: 9%\n")
--						.. core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n")
--						.. core.colorize("#FFFFFF", "Rate of fire: 0.25\n")
--						.. core.colorize("#FFFFFF", "Enemy penetration: 40%\n")
						.. core.colorize("#B0C4DE", "Right click to change mode"),
	range = 0,
    RW_powergun_capabilities = {
		automatic_gun = 1,
		power_damage = {fleshy=1,knockback=0},
		power_crit = 9,
		power_critEffc = 2.0,
		power_cooling = "rangedweapons:fc37_training",
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
		power_texture = "rangedweapons:laser_bolt_blue_training",
		power_projectile_size = 0.075,
		has_sparks = 0,
		ignites_explosives = 0,
	},
	inventory_image = "fc37_training.png",
	groups = {not_in_creative_inventory = 1},
	on_secondary_use = function(itemstack,player)
		minetest.sound_play("rangedweapons_handgun_mag_out", {player})
		itemstack:replace("rangedweapons:fc37")
		return itemstack
	end
})