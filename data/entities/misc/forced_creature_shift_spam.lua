dofile_once("data/scripts/lib/utilities.lua")
dofile_once("mods/Apotheosis/files/scripts/magic/creature_shift_file.lua")

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

SetRandomSeed(pos_x + GameGetFrameNum(), pos_y)

-- spawn random eye particles
if ( rand(0,1) > 0.5 ) then
	function spawn( x,y )
		EntityLoad( "data/entities/particles/treble_eye.xml", x,y )
	end

	local x,y = pos_x + rand(-100,100), pos_y + rand(-80,80)
	local rad = rand(0,30)

	spawn(x,y)
	spawn( x + 40 + rad, y + 30 + rad )
	spawn( x - 40 - rad, y + 30 + rad )
end

-- shift materials
creature_shift( entity_id, pos_x, pos_y, true, true )