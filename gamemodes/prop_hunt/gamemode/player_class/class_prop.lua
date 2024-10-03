-- Create new class
local CLASS = {}


-- Some console variables to modify the movement of props --

CreateConVar("ph_prop_walkspeed","250", {FCVAR_REPLICATED, FCVAR_ARCHIVE} )
CreateConVar("ph_prop_runspeed","270", {FCVAR_REPLICATED, FCVAR_ARCHIVE} )
CreateConVar("ph_prop_jumppower","200", {FCVAR_REPLICATED, FCVAR_ARCHIVE} )


-- Some settings for the class
CLASS.DisplayName			= "Prop"
CLASS.WalkSpeed 			= GetConVar("ph_prop_walkspeed")
CLASS.CrouchedWalkSpeed 	= 0.2
CLASS.RunSpeed				= GetConVar("ph_prop_runspeed")
CLASS.DuckSpeed				= 0.2
CLASS.JumpPower				= GetConVar("ph_prop_jumppower")
CLASS.DrawTeamRing			= false


-- Called by spawn and sets loadout
function CLASS:Loadout(pl)
	-- Props don't get anything
end


-- Called when player spawns with this class
function CLASS:OnSpawn(pl)
	pl:SetColor( Color(255, 255, 255, 0))
	
	pl.ph_prop = ents.Create("ph_prop")
	pl.ph_prop:SetPos(pl:GetPos())
	pl.ph_prop:SetAngles(pl:GetAngles())
	pl.ph_prop:Spawn()
	pl.ph_prop:SetSolid(SOLID_BBOX)
	pl.ph_prop:SetParent(pl)
	pl.ph_prop:SetOwner(pl)
	
	pl.ph_prop.max_health = 100
end


-- Called when a player dies with this class
function CLASS:OnDeath(pl, attacker, dmginfo)
	pl:RemoveProp()
end


-- Register
player_class.Register("Prop", CLASS)
