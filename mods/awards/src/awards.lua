-- Copyright (c) 2013-18 rubenwardy and Wuzzy. MIT.

local S = awards.translator

-- "The Saga"
awards.register_award("awards_begin", {
	title = S("The Saga Begins"),
	description = S("You have taken your first steps into this strange world."),
	icon = "awards_backpacker.png",
	difficulty = 0.01,
	trigger = {
		type = "join",
		target = 1
	}
})

awards.register_award("awards_punch_wood", {
	title = S("Woodpecker"),
	description = S("Break a block of wood."),
	icon = "awards_backpacker.png",
	difficulty = 0.03,
	trigger = {
		type = "dig",
		node = "group:tree",
		target = 1
	}
})

awards.register_award("federation_enemy", {
	title = S("Enemy of the Federation"),
	description = S("Kill a Federation trooper"),
	icon = "awards_backpacker.png",
	difficulty = 0.04
})

-- Bonus awards
awards.register_award("awards_eat_tavifruit", {
	title = S("Braver than most"),
	description = S("Eat a strange purple fruit."),
	icon = "awards_backpacker.png",
	difficulty = 1,
	secret = true,
	trigger = {
		type = "eat",
		item = "wood:tavifruit",
		target = 1
	}
})
