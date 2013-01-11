--FALLING ITEMS MOD (PLUGIN)
--BY:           Bas080
--DESCRIPTION:  Make defined nodes fall when "connected" node is dug

--HOW TO USE (for modders who want falling nodes capability for there mod)
--Add to groups groups = { snappy = 3,flammable=2, floored=1 },
--Add "floored=1" to groups to make node fall when bottom node is dug
--Add "attached=1" to groups to make node fall when no node is "touching" the node.

--check for attached item
local dx = {0, 0, 0, 0, 1, -1}
local dy = {0, 0, 1, -1, 0, 0}
local dz = {1, -1, 0, 0, 0, 0}

minetest.register_on_dignode(function (pos, node, player)
  
  --check for attached nodes
  for i = 1, 6 do
    local p = {x = pos.x + dx[i], y = pos.y + dy[i] , z = pos.z + dz[i]}
    local n = minetest.env:get_node(p)
    if minetest.get_item_group(n.name, "attached") ~= 0 then
      for ii = 1, 6 do
        local ptwo = {x = p.x + dx[ii], y = p.y + dy[ii] , z = p.z + dz[ii]}
        local ntwo = minetest.env:get_node(ptwo)
        if ntwo.name ~= "air" then
          print("found attached node")
          return
        end
      end
      minetest.env:remove_node(p)
      minetest.env:add_item(p, n.name)
    end
  end
  
  --check for floored item
  local p = {x = pos.x, y = pos.y+1, z = pos.z}
  local n = minetest.env:get_node(p)
  if minetest.get_item_group(n.name, "floored") ~= 0 then
    minetest.env:remove_node(p)
    minetest.env:add_item(p, n.name)
  end
end)


minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
  --check if node has floor else fall
  if minetest.get_item_group(newnode.name, "floored") ~= 0 then
    print("placed floored node")
    local p = {x = pos.x, y = pos.y-1, z = pos.z}
    local n = minetest.env:get_node(p)
    if n.name == "air" or n.name == "default:water_source" or n.name == "default:water_flowing" then
      minetest.env:remove_node(pos)
      minetest.env:add_item(pos, newnode.name)
    end
  end
end)
