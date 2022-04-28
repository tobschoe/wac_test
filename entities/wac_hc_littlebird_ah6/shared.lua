
ENT.Base = "wac_hc_base"
ENT.Type = "anim"
ENT.Author = wac.author
ENT.Category = wac.aircraft.spawnCategory
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.PrintName = "Little Bird AH-6"

ENT.Model = "models/flyboi/littlebird/littlebirda_fb.mdl"

ENT.TopRotor = {
	model = "models/flyboi/littlebird/littlebirdrotorm_fb.mdl",
	pos = Vector(-10,0,100),
}

ENT.BackRotor = {
	dir = -1,
	model = "models/flyboi/littlebird/littlebirdt_fb.mdl",
	pos = Vector(-217,9,73), 
}

ENT.EngineForce = 40
ENT.Weight = 1444

ENT.SmokePos = Vector(-90,0,50)
ENT.FirePos = Vector(-50,0,100)

ENT.Seats = {
	{
		pos = Vector(22, 15, 49),
		exit = Vector(70,70,10),
		weapons = {"M134", "Hydra 70"}
	},
	{
		pos = Vector(22, -12, 49),
		exit = Vector(70,-70,10),
	},
}

ENT.Sounds = {
	Start = "wac/heli/h6_start.wav",
	Blades = "wac/heli/heli_loop_ext.wav",
	Engine = "wac/heli/heli_loop_int.wav",
	MissileAlert = "helicoptervehicle/missilenearby.mp3",
	MinorAlarm = "helicoptervehicle/minoralarm.mp3",
	LowHealth = "helicoptervehicle/lowhealth.mp3",
	CrashAlarm = "helicoptervehicle/crashalarm.mp3",
}

ENT.Weapons = {
	["M134"] = {
		class = "wac_pod_mg",
		info = {
			Pods = {
				Vector(40,40,30),
				Vector(40,-40,30),
			},
			Sounds = {
				shoot = "gred_emp/gau19/shoot.wav",
				stop = "gred_emp/gau19/stop.wav"
			},
			Ammo = 800,
			FireRate = 1000,
			BulletType = "wac_base_12mm",
			TracerColor = "Red",
		}
	},
	
	["Hydra 70"] = {
		class = "wac_pod_grocket",
		info = {
			Sequential = true,
			Pods = {
				Vector(69,64,-17),
				Vector(69,-64,-17)
			},
			Ammo = 32,
			FireRate = 200
		}
	},
}
