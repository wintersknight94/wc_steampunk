-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore, math, pairs
    = minetest, nodecore, math, pairs
-- LUALOCALS > ---------------------------------------------------------

local modname = minetest.get_current_modname()

local directions = {
    {x=0, y=1, z=0},	
    {x=0, y=-1, z=0},
    {x=1, y=0, z=0},	
    {x=-1, y=0, z=0},	
    {x=0, y=0, z=1},	
    {x=0, y=0, z=-1},	
}

nodecore.register_abm({
          label = "steam power",
          nodenames = {"group:dense_gas"},
          neighbors = {"group:door"},
          interval = 1,
          chance = 1,
          action = function(pos)
               for _, dir in pairs(directions) do
                    local outpos = vector.add(pos, dir)
                    nodecore.operate_door(outpos, nil, dir)
		          nodecore.set_node(pos, {name = "wc_steam:steam"})
		          nodecore.sound_play("nc_api_craft_hiss", {pos = pos, gain = 0.02, fade = 1})
               end
          end
    })


