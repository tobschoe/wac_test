
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(p, tr)
	if (!tr.Hit) then return end
	local e = ents.Create(ClassName)
	e:SetPos(tr.HitPos)
	e.EngineHealth = wacMedHeliMaxHealth   -- Maxiumum Health
	e.engineHealth = wacMedHeliSpawnHealth -- Spawn Health
	e.Owner = p
	e:Spawn()
	e:Activate()
	return e
end
