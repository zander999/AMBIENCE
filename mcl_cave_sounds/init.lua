local sound_status = 1


minetest.register_abm({
  nodenames = {"mcl_core:stone", "mcl_core:cobble", "mcl_core:sand", "mcl_core:dirt"},
  neighbors = {"air"},
  interval = 10,
  chance = 20,
  catch_up = false,
  action = function(pos, node, active_object_count, active_object_count_wider)
    if sound_status == 0 then
		return
	end
	

	local ppos
	for _,player in ipairs(minetest.get_connected_players()) do
		ppos = player:getpos()
	end
	
	if ppos.y > 0 then
		return
	end
	
	if vector.distance(pos,ppos) > 20 then
		return
	end
	
	if math.random(0,3) > 0 then
		sound_status = 0
        minetest.after(2,  function()
            sound_status = 1
        end) -- minetest.after() end
	
		return
	end
	print("play sound")
	minetest.sound_play("cave", {
	  pos = pos,
	  max_hear_distance = 21,
	  gain = 1 --0.2+1/#path*5,
	})
	
	sound_status = 0
    
      minetest.after(5,  function()

          sound_status = 1
        end) -- minetest.after() end
	

  end,
})
