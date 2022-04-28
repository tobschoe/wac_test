-- Variable for Maximum helicopter health
wacSmallHeliMaxHealth = 100     -- Littlebirds, KA52 etc;
wacMedHeliMaxHealth = 150       -- Most helicopters
wacBigHeliMaxHealth = 250       -- Blackfoot

-- Variable for the amount of health the helicopter spawns with 
--(slightly higher to account for helicopter being damaged on spawn)
wacSmallHeliSpawnHealth = 110   -- Littlebirds, KA52 etc;
wacMedHeliSpawnHealth = 160     -- Most helicopters
wacBigHeliSpawnHealth = 260     -- Blackfoot

--[[
    NOTE: This version of WAC has shit naming conventions.
    ent.EngineHealth = wacMedHeliMaxHealth   -- Maxiumum Health
	ent.engineHealth = wacMedHeliSpawnHealth -- Spawn Health
]]--