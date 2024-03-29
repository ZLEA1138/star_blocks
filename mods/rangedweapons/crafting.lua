----------------------------
----------------------------
if rweapons_gun_crafting == "true" then

end
----------------------------------
----------------------------------
if rweapons_other_weapon_crafting == "true" then

minetest.register_craft({
	output = "rangedweapons:barrel",
	recipe = {
		{"group:wood", "uraniumstuff:bucket_goo", "group:wood"},
		{"group:wood", "uraniumstuff:bucket_goo", "group:wood"},
	},
	replacements = {{"uraniumstuff:bucket_goo", "bucket:bucket_empty"}}
})

end
------------------------------------
------------------------------------
if rweapons_ammo_crafting == "true" then

end
-------------------------------------
-------------------------------------
if rweapons_item_crafting == "true" then

end