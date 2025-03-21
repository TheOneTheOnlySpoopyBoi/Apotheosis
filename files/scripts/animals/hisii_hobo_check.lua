dofile_once("data/scripts/lib/utilities.lua")

function material_area_checker_success( pos_x, pos_y )
	local entity_id = GetUpdatedEntityID()
	local x,y = EntityGetTransform(entity_id)

	SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )

	
	-- Copi: 
	--  Removed spells from pool which have been disabled from copi's things for now. TODO: Revisit this file and remake the loot system possibly?

    -- Conga: Finally made this more compatiable and fixed hobos from spawning invalid apotheosism spells, they never got the memo to use CAPITALS in their spell name instead of lowercase too apparently
    -- Note: since potion to sea no longer exists, it's replaced with sea_mimic here

    --Default Options
    local opts = {"ROCKET_TIER_2", "GRENADE_TIER_2", "SPITTER_TIER_2", "SPITTER_TIER_3", "LIGHT_BULLET_TRIGGER", "LIGHT_BULLET_TRIGGER_2", "DISC_BULLET", "ROCKET", "GRENADE", "SWAPPER_PROJECTILE", "LIGHT", "BUCKSHOT", "SHIELD_FIELD", "SEA_LAVA", "FREEZE", "BALL_LIGHTNING", "AIR_BULLET", "CHAOS_POLYMORPH_FIELD", "LIFETIME", "LIFETIME_DOWN", "HEAVY_SPREAD", "TINY_GHOST", "DYNAMITE", "BLOOD_MAGIC", "MANA_REDUCE", "CHAINSAW", "RECHARGE", "HOMING_SHOOTER", "BLOODLUST", "DELAYED_SPELL", "APOTHEOSIS_BOMB_GIGA", "SEA_MIMIC", "APOTHEOSIS_AQUA_MINE", "APOTHEOSIS_ALT_FIRE_TELEPORT_SHORT", "BURST_8"}

    if ModIsEnabled("copis_things") then
        local copi_spells = {"COPITH_SUMMON_HAMIS", "COPITH_ARCANE_TURRET", "COPITH_ANCHORED_SHOT", "COPITH_LUNGE", "COPITH_SLOW", "COPITH_CONCRETEBALL", "COPITH_SLOW_BULLET_TIMER_N", "COPITH_AUTO_FRAME", "COPITH_ZAP", "COPITH_SCATTER_6", "COPITH_CAUSTIC_CLAW", "COPITH_LUMINOUS_BLADE", "COPITH_ASTRAL_VORTEX", "COPITH_LARPA_FORWARDS"}
        for k=1,#copi_spells do
            table.insert(opts,copi_spells[k])
        end
    end
    if ModIsEnabled("variaAddons") then
        local varia_spells = {"VARIA_SLASH", "VARIA_BULLET", "VARIA_BULLET_TRIGGER", "VARIA_SHOTGUN_SHELL", "VARIA_CRIT_ON_CHARM", "VARIA_GATLING_RAY_ENEMY", "VARIA_RE_ADDED_CHARM_FIELD", "VARIA_JUMPER_BLAST", "VARIA_LUKKI_BOMB", "VARIA_CRESCENT_WAVE_POISON", "VARIA_BLINK", "VARIA_BEES" }
        for k=1,#varia_spells do
            table.insert(opts,varia_spells[k])
        end
    end

    if HasFlagPersistent( "apotheosis_card_unlocked_fire_lukki_spell" ) then
        table.insert(opts, "APOTHEOSIS_FIRE_CHARGE")
    end

    local count = 3
	
	-- reward
	EntityLoad("data/entities/particles/image_emitters/magical_symbol_hobo_money.xml", x, y)
	GamePlaySound( "data/audio/Desktop/projectiles.snd", "player_projectiles/crumbling_earth/create", x, y)

    for i = 1, count do
        local rnd = Random(1, #opts)
        CreateItemActionEntity(opts[rnd], pos_x - 8 * count + (i - 0.5) * 16, pos_y)
        table.remove(opts, rnd)
    end
    
	local has_already_found_battery = GameHasFlagRun("apotheosis_temp_battery_donated")

    if (Random(1,10) == 10) and (has_already_found_battery == false) then
		EntityLoad( "mods/Apotheosis/files/entities/items/wands/custom/mana_battery.xml", x, y - 16 )
        GameAddFlagRun( "apotheosis_temp_battery_donated" )
    end
    

    --GamePrint("Hobo Richified")

	-- cleanup
	EntityLoad("data/entities/animals/hisii_hobo_rich.xml", x, y)
    EntityKill(entity_id)
	
    if not (ModIsEnabled("raksa") or ModIsEnabled("conjurer_reborn")) then
	    AddFlagPersistent( "apotheosis_card_unlocked_donated_beggar" )
    end

end

--Donate super rare liquid to a beggar, special big heart statue and better rewards?
--What liquid?
--Divine Liquid? (lol)