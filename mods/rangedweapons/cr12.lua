minetest.register_tool("rangedweapons:cr12", {
	wield_scale = {x=1.9,y=1.9,z=1.1},
		description = "" ..core.colorize("#35cdff", "CR-12 Shotgun\n")
						.. core.colorize("#FFFFFF", "Ranged damage: 10\n")
						.. core.colorize("#FFFFFF", "Accuracy: 40%\n")
						.. core.colorize("#FFFFFF", "Projectiles: 6\n")
						.. core.colorize("#FFFFFF", "Knockback: 7\n")
						.. core.colorize("#FFFFFF", "Critical chance: 8%\n")
						.. core.colorize("#FFFFFF", "Critical efficiency: 2.2x\n")
						.. core.colorize("#FFFFFF", "Rate of fire: 1\n")
						.. core.colorize("#FFFFFF", "Enemy penetration: 40%"),
	range = 0,
	inventory_image = "cr12.png",
RW_powergun_capabilities = {
		power_damage = {fleshy=10,knockback=7},
		power_crit = 8,
		power_critEffc = 2.2,
		power_cooling = "rangedweapons:cr12",
		power_velocity = 60,
		power_accuracy = 40,
		power_cooldown = 1,
		power_projectiles = 6,
		power_sound = "laser2",
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
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_powergun(itemstack, user)
return itemstack
	end,

})