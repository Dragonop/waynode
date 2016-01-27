local function get_waypoint_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
			"size[5,3]" ..
			"button_exit[1,2;3,1;waypoint;Place Waypoint]" ..
			"field[1,1.5;4,1;waypoint_name;Waypoint name:;]"
	return formspec
end

minetest.register_node("waynode:waynode", {
		drawtype = "glasslike",
		description = "Waynode",
		tiles = {"waynode_waynode.png"},
		groups = {cracky = 1, oddly_breakable_by_hand = 3},
		light_source = 1, 
		paramtype = "light",
		
		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			meta:set_string("owner", placer:get_player_name() or "")
			meta:set_string("infotext", "Waypoint (set by " .. meta:get_string("owner") .. ")")
	end,
		
		on_rightclick = function(pos, node, clicker)
		local meta = minetest.get_meta(pos)
			minetest.show_formspec(
				clicker:get_player_name(),
				"waynode:waynode",
				get_waypoint_formspec(pos)
			)
	end,
		
		on_receive_fields = function(pos, formname, fields, sender)
			minetest.add_entity(pos, "waynode:waypoint")
	end
})


--[[
minetest.show_formspec(name, "waynode:waynode", formspec)
				"size[5,3]" ..
				"button_exit[1,2;3,1;waypoint;Place Waypoint]" ..
				"field[1,1.5;5.5,1;waypoint_name;Waypoint name:;]"

]]--

--[[
minetest.register_entity{("waynode:waynode")} ]]--

--waypoint
local entity = minetest.add_entity(pos, "waynode:waypoint")
minetest.register_chatcommand("waypoint", {
	params = "pos, name",
	description = "Add a waypoint",
	privs = { waypoint = true },
	func = function(pos, param, entity)
	end,
})

minetest.register_entity("waynode:waypoint", {
		initial_properties = {
			physical = true,
			collisionbox = {-1,-1,-1,1,1,1},
			visual = "cube",
			groups = ("fleshy = 100")
		}
})