-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local M = {}

function M.auto()
  launch_bullet = false
  msg.post("ui#gui", "error",{ errormessage = "" })
  if automatic == false then
    return
  end
  for i=1,1 do
    rand_pos = math.random(300, 1500)
  end
  pos = go.get_position()
  pos.y = 300
  go.set_position(pos)	
  pos.x = rand_pos

  launch_bullet = true


  if launch_bullet == true then
    go.animate(go.get_id(), "position.x", go.PLAYBACK_ONCE_FORWARD, pos.x, go.EASING_LINEAR, 0.5, 0, function()
      pos = go.get_position()		
      bullet = factory.create("/bullet#bulletfactory", pos)
      go.animate(bullet, "position.y", go.PLAYBACK_ONCE_FORWARD, 1200, go.EASING_LINEAR, 1, 0, function()
        go.delete(bullet)
      end)	
    end)
  else
    go.animate(go.get_id(), "position.x", go.PLAYBACK_ONCE_FORWARD, pos.x, go.EASING_INQUAD, 1,0)
  end	
end

return M