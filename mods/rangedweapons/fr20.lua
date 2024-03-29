minetest.register_tool("rangedweapons:fr20", {
	wield_scale = {x=3.0,y=3.0,z=3.0},
		description = "FR-20 Rotary Cannon",
--						.. core.colorize("#FFFFFF", "Ranged damage: 5\n")
--						.. core.colorize("#FFFFFF", "Accuracy: 50%\n")
--						.. core.colorize("#FFFFFF", "Knockback: 0\n")
--						.. core.colorize("#FFFFFF", "Critical chance: 14%\n")
--						.. core.colorize("#FFFFFF", "Critical efficiency: 3.0x\n")
--						.. core.colorize("#FFFFFF", "Rate of fire: 0.04\n")
--						.. core.colorize("#FFFFFF", "Enemy penetration: 30%"),
	range = 0,
    RW_powergun_capabilities = {
		automatic_gun = 1,
		power_damage = {fleshy=5,knockback=0},
		power_crit = 14,
		power_critEffc = 3.0,
		power_cooling = "rangedweapons:fr20",
		power_velocity = 60,
		power_accuracy = 50,
		power_cooldown = 0.04,
		power_projectiles = 1,
		power_sound = "laser1",
		power_glass_breaking = 1,
		power_door_breaking = 1,
		power_dps = 0,
		power_mob_penetration = 30,
		power_node_penetration = 0,
		power_consumption = 0,
		power_entity = "rangedweapons:shot_bullet",
		power_visual = "wielditem",
		power_texture = "rangedweapons:laser_bolt_blue",
		power_projectile_size = 0.075,
		has_sparks = 0,
		ignites_explosives = 1,
	},
	inventory_image = "fr20.png",
})