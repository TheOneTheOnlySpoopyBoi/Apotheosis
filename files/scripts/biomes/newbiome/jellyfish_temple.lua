CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xffc812e3, "spawn_pearl")

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end
function spawn_items( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function spawn_lamp( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_candles( x, y ) end
function spawn_potions( x, y ) end
function spawn_wands( x, y ) end

function init( x, y, w, h )
	local pw = GetParallelWorldPosition(x,y)
	if pw == 0 and ModIsEnabled("noita-mapcap") == false then
		--LoadPixelScene( "mods/Apotheosis/files/biome_impl/dev_test/demo_scene.png", "", x, y, "", true )
		LoadPixelScene( "mods/Apotheosis/files/biome_impl/jellyfish_temple.png", "mods/Apotheosis/files/biome_impl/jellyfish_temple_visual.png", x, y, "mods/Apotheosis/files/biome_impl/jellyfish_temple_background.png", true )
	end
end

function spawn_pearl(x, y)
	EntityLoad("mods/Apotheosis/files/entities/items/pickups/orb_jellyfish_pearl.xml",x,y)
end