

minetest.register_tool("rangedweapons:dlt19x_uld", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	range = 0,
		description = "" ..core.colorize("#35cdff","DLT-19x targeting blaster\n") ..core.colorize("#FFFFFF", "Ranged damage:18 + 35/sec of bullet lifetime\n")..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "knockback: 15\n") ..core.colorize("#FFFFFF", "Critical chance: 30%\n") ..core.colorize("#FFFFFF", "Critical efficiency: x3\n") ..core.colorize("#FFFFFF", "Ammunition: 7.62mm round/308.Winchester rounds\n") ..core.colorize("#FFFFFF", "Rate of fire: 1.0\n") ..core.colorize("#FFFFFF", "Reload time: 2.0\n") ..core.colorize("#FFFFFF", "Zoom: 12x\n") ..core.colorize("#be0d00", "Right-click to eject empty bullet shell\n") ..core.colorize("#FFFFFF", "Clip size: 10/10\n") ..core.colorize("#FFFFFF", "Enemy penetration:30%\n") ..core.colorize("#FFFFFF", "Block penetration:10%\n") ..core.colorize("#FFFFFF", "Gun type: Rifle\n") ..core.colorize("#FFFFFF", "Bullet velocity: 75"),
	groups = {not_in_creative_inventory = 1},
	inventory_image = "dlt19x.png",
	weapon_zoom = 7.5,
	on_use = function(user)
		minetest.sound_play("rangedweapons_empty", {user})
	end,
on_secondary_use = function(itemstack, user, pointed_thing)
eject_shell(itemstack,user,"rangedweapons:dlt19x_rld",1.0,"rangedweapons_rifle_reload_a")
return itemstack
end,
})


minetest.register_tool("rangedweapons:dlt19x_r", {
	rw_next_reload = "rangedweapons:dlt19x_rr",
	load_sound = "rangedweapons_rifle_reload_a",
	range = 0,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	description = "",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "dlt19x.png",
})
minetest.register_tool("rangedweapons:dlt19x_rr", {
	rw_next_reload = "rangedweapons:dlt19x",
	load_sound = "rangedweapons_rifle_reload_b",
	range = 0,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	description = "",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "dlt19x.png",
})


minetest.register_tool("rangedweapons:dlt19x_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	description = "",
	loaded_gun = "rangedweapons:dlt19x",
	loaded_sound = "rangedweapons_rifle_reload_b",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "dlt19x.png",
})


minetest.register_tool("rangedweapons:dlt19x", {
		description = "" ..core.colorize("#35cdff","DLT-19x targeting blaster\n") ..core.colorize("#FFFFFF", "Ranged damage:18 + 35/sec of bullet lifetime\n")..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "knockback: 15\n") ..core.colorize("#FFFFFF", "Critical chance: 30%\n") ..core.colorize("#FFFFFF", "Critical efficiency: x3\n") ..core.colorize("#FFFFFF", "Ammunition: 7.62mm round/308.Winchester rounds\n") ..core.colorize("#FFFFFF", "Rate of fire: 1.0\n") ..core.colorize("#FFFFFF", "Reload time: 2.0\n") ..core.colorize("#FFFFFF", "Zoom: 12x\n") ..core.colorize("#27a600", "The gun is loaded!\n") ..core.colorize("#FFFFFF", "Clip size: 10/10\n") ..core.colorize("#FFFFFF", "Enemy penetration:30%\n") ..core.colorize("#FFFFFF", "Block penetration:10%\n") ..core.colorize("#FFFFFF", "Gun type: Rifle\n") ..core.colorize("#FFFFFF", "Bullet velocity: 75"),
	range = 0,
	weapon_zoom = 7.5,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	inventory_image = "dlt19x.png",
RW_gun_capabilities = {
		power_damage = {fleshy=18,knockback=15},
		power_crit = 30,
		power_critEffc = 3.0,
		power_skill = {"rifle_skill",20},
		power_icon = "dlt19x.png",
		power_unloaded = "rangedweapons:dlt19x_r",
		power_cooling = "rangedweapons:dlt19x_uld",
		power_velocity = 75,
		power_accuracy = 100,
		power_cooldown = 1.0,
		power_reload = 2.0/4,
		power_projectiles = 1,
		has_shell = 0,
		power_durability = 700,
		power_dps = 35,
		power_mob_penetration = 30,
		power_node_penetration = 10,
		power_consumption = 0,
		gun_unload_sound = "rangedweapons_rifle_clip_out",
		power_sound = "rangedweapons_rifle_b",
		power_entity = "rangedweapons:shot_bullet",
		power_visual = "wielditem",
		power_texture = "rangedweapons:blaster_bolt_red",
		power_projectile_size = 0.075,
		power_glass_breaking = 1,
		power_door_breaking = 1,
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_gun(itemstack, user)
return itemstack
	end,

})

