local nether_sound_status = 1

minetest.register_abm({
  nodenames = {"mcl_nether:netherrack", "mcl_nether:glowstone", "mcl_nether:quartz_ore", "mcl_nether:magma", "mcl_nether:nether_brick"},
  neighbors = {"air"},
  interval = 20,
  chance = 20,
  catch_up = false,
  action = function(pos, node, active_object_count, active_object_count_wider)
    if nether_sound_status == 0 then
		return
	end
	local ppos
	for _,player in ipairs(minetest.get_connected_players()) do
		ppos = player:getpos()
	end
	
	if vector.distance(pos,ppos) > 20 then
		return
	end

	nether_sound_status = 0

	local dim = mcl_worlds.pos_to_dimension(pos)
	if dim == "nether" then
	minetest.sound_play("nether", {
	  pos = pos,
	  max_hear_distance = 20,
	  gain = 1
	})
	end

      minetest.after(5,  function()

          nether_sound_status = 1
        end) -- minetest.after() end

  end,
})

local end_sound_status = 1

minetest.register_abm({
  nodenames = {"mcl_end:end_stone", "mcl_end:end_bricks", "mcl_end:purpur_block", "mcl_end:end_rod", "mcl_end:purpur_pillar"},
  neighbors = {"air"},
  interval = 20,
  chance = 20,
  catch_up = false,
  action = function(pos, node, active_object_count, active_object_count_wider)
    if end_sound_status == 0 then
		return
	end
	local ppos
	for _,player in ipairs(minetest.get_connected_players()) do
		ppos = player:getpos()
	end
	
	if vector.distance(pos,ppos) > 20 then
		return
	end

	end_sound_status = 0

	local dim = mcl_worlds.pos_to_dimension(pos)
	if dim == "end" then
	minetest.sound_play("end", {
	  pos = pos,
	  max_hear_distance = 20,
	  gain = 1
	})
	end

      minetest.after(5,  function()

          end_sound_status = 1
        end) -- minetest.after() end

  end,
})

local creative_sound_status = 1

minetest.register_abm({
  nodenames = {"air"},
  neighbors = {"air"},
  interval = 20,
  chance = 20,
  catch_up = false,
  action = function(pos, node, active_object_count, active_object_count_wider)
    if creative_sound_status == 0 then
		return
	end
	local ppos
	for _,player in ipairs(minetest.get_connected_players()) do
		ppos = player:getpos()
	end
	
	if vector.distance(pos,ppos) > 20 then
		return
	end

	local dim = mcl_worlds.pos_to_dimension(pos)
	if dim == "end" then
		return
	end

	local dim = mcl_worlds.pos_to_dimension(pos)
	if dim == "nether" then
		return
	end

	creative_sound_status = 0

	if minetest.settings:get_bool("creative_mode") then
	minetest.sound_play("creative", {
	  pos = pos,
	  max_hear_distance = 20,
	  gain = 1
	})
	end

      minetest.after(5,  function()

          creative_sound_status = 1
        end) -- minetest.after() end

  end,
})

local survival_sound_status = 1

minetest.register_abm({
  nodenames = {"air"},
  neighbors = {"air"},
  interval = 20,
  chance = 20,
  catch_up = false,
  action = function(pos, node, active_object_count, active_object_count_wider)
    if survival_sound_status == 0 then
		return
	end
	local ppos
	for _,player in ipairs(minetest.get_connected_players()) do
		ppos = player:getpos()
	end
	
	if vector.distance(pos,ppos) > 20 then
		return
	end

	local dim = mcl_worlds.pos_to_dimension(pos)
	if dim == "end" then
		return
	end

	local dim = mcl_worlds.pos_to_dimension(pos)
	if dim == "nether" then
		return
	end

	survival_sound_status = 0

	if not minetest.settings:get_bool("creative_mode") then
	minetest.sound_play("survival", {
	  pos = pos,
	  max_hear_distance = 20,
	  gain = 1
	})
	end

      minetest.after(5,  function()

          survival_sound_status = 1
        end) -- minetest.after() end

  end,
})