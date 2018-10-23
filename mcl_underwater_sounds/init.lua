local water_sound_status = 1

minetest.register_abm({
  nodenames = {"mcl_core:water_source"},
  neighbors = {"mcl_core:water_source"},
  interval = 20,
  chance = 1,
  catch_up = false,
  action = function(pos, node, active_object_count, active_object_count_wider)
    if water_sound_status == 0 then
		return
	end
	local ppos
	for _,player in ipairs(minetest.get_connected_players()) do
		ppos = player:getpos()
	end
	
	if vector.distance(pos,ppos) > 20 then
		return
	end
	
	water_sound_status = 0
    local daytime = minetest.get_timeofday()*24000

	if daytime > 5000 and daytime < 19250 then
	minetest.sound_play("underwater", {
	  pos = pos,
	  max_hear_distance = 1,
	  gain = 1
	})
	else
	minetest.sound_play("underwater", {
	  pos = pos,
	  max_hear_distance = 1,
	  gain = 1
	})
	end

      minetest.after(5,  function()

          water_sound_status = 1
        end) -- minetest.after() end

  end,
})
