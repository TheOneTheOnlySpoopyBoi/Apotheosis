local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x,y = EntityGetTransform( root_id )

local players = EntityGetInRadiusWithTag( x, y, 300, "player_unit" )

if ( #players > 0 ) then
	EntityLoad( "data/entities/animals/boss_meat/boss_meat.xml", x, y )
	EntityKill( root_id )
end