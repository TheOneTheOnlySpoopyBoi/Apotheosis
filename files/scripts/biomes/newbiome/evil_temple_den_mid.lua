CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")
dofile( "mods/Apotheosis/files/scripts/biomes/newbiome/evil_temple_den.lua" )

function init( x, y, w, h )
	LoadPixelScene( "mods/Apotheosis/files/biome_impl/special_scenes/evil_temple_den_mid.png", "mods/Apotheosis/files/biome_impl/special_scenes/evil_temple_den_mid_visual.png", x, y, "mods/Apotheosis/files/biome_impl/special_scenes/evil_temple_den_mid_background.png", true )
end