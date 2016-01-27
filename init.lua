dofile(minetest.get_modpath ("waynode") .. "/waynode.lua")
minetest.register_craft({
		output = "waynode:waynode",
		recipe = {
				{"default:glass", "default:glass", "default:glass"},
				{"default:gold_ingot", "default:mese_crystal", "default:gold_ingot"},
				{"default:glass", "default:glass", "default:glass"},
		}
})

minetest.register_privilege("waypoint", {
	description = "Allows the use of waypoints",
	give_to_singleplayer = true,
	default = false
})