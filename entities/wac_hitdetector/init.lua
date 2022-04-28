
include("shared.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

function CreateCustomRotorHitbox(ent, customBladeCollider) -- Custom added to CG's WAC by ventz
	local colliders = {}

	for k, v in pairs (customBladeCollider) do
		local min = -v.size * 0.5
		local max = v.size * 0.5
		
		table.insert(colliders, {
			Vector( min.x, min.y, min.z ),
			Vector( min.x, min.y, max.z ),
			Vector( min.x, max.y, min.z ),
			Vector( min.x, max.y, max.z ),
			Vector( max.x, min.y, min.z ),
			Vector( max.x, min.y, max.z ),
			Vector( max.x, max.y, min.z ),
			Vector( max.x, max.y, max.z ),
		})
	end

	ent:PhysicsInitMultiConvex(colliders)
	ent:SetSolid(SOLID_VPHYSICS)
	ent:SetMoveType(MOVETYPE_VPHYSICS)
	ent:EnableCustomCollisions(true)
end

function ENT:Initialize()
	if (self.customBladeCollider) then
		CreateCustomRotorHitbox(self, self.customBladeCollider)
	else
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
	end

	self:SetTrigger(true)
	local obb=self:OBBMaxs()
	self.RotorWidth=self:BoundingRadius()
	self.RotorHeight=obb.z
end

function ENT:StartTouch(e)
	self.BaseClass.StartTouch(e)
	if self.TouchFunc then
		self.TouchFunc(e, e:GetPos())
	end
end

function ENT:Think()
	local d = self.RotorWidth * 0.5

	for i=0,360, 45 do
		local trd={}
		trd.start=self:GetPos()
		trd.endpos=self:GetRight()*math.sin(i)*d+self:GetForward()*math.cos(i)*d+trd.start+self:GetUp()*self.RotorHeight
		trd.mask=MASK_SOLID_BRUSHONLY
		local tr=util.TraceLine(trd)
		if tr.Hit and !tr.HitSky and tr.HitWorld and self.TouchFunc then
			self.TouchFunc(tr.Entity, tr.HitPos)
		end
	end
end
