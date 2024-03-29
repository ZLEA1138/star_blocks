minetest.register_tool("rangedweapons:cr15", {
	wield_scale = {x=1.75,y=1.75,z=1.3},
		description = "CR-15 Rifle",
--						.. core.colorize("#FFFFFF", "Ranged damage: 4\n")
--						.. core.colorize("#FFFFFF", "Accuracy: 75%\n")
--						.. core.colorize("#FFFFFF", "Knockback: 0\n")
--						.. core.colorize("#FFFFFF", "Critical chance: 11%\n")
--						.. core.colorize("#FFFFFF", "Critical efficiency: 2.75x\n")
--						.. core.colorize("#FFFFFF", "Rate of fire: 0.25\n")
--						.. core.colorize("#FFFFFF", "Enemy penetration: 40%"),
	range = 0,
    RW_powergun_capabilities = {
		automatic_gun = 1,
		power_damage = {fleshy=5,knockback=0},
		power_crit = 11,
		power_critEffc = 2.75,
		power_cooling = "rangedweapons:cr15",
		power_velocity = 60,
		power_accuracy = 75,
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
		power_texture = "rangedweapons:laser_bolt_red",
		power_projectile_size = 0.075,
		has_sparks = 0,
		ignites_explosives = 1,
	},
	inventory_image = "cr15.png",
})