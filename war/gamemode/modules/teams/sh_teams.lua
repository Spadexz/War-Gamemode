team.SetUp( 1, "Red", Color( 255, 0, 0 ) )
team.SetUp( 2, "Blue", Color( 0, 0,255 ) )
team.SetUp( 3, "Waiting", Color( 0, 0, 0 ) )

hook.Add('PlayerSpawn','Teamcolor', function(ply)
	local col = team.GetColor( ply:Team() )
	ply:SetPlayerColor( Vector( col.r/255, col.g/255, col.b/255 ) )
end)


hook.Add('InitialPlayerSpawn','Teamcolor', function(ply)
	local col = team.GetColor( ply:Team() )
	ply:SetPlayerColor( Vector( col.r/255, col.g/255, col.b/255 ) )
end)
function DefWeps (ply)
if ply:Team() == 1 then 
	ply:Give("weapon_csgo_knife2")
elseif ply:Team() == 2 then 
	ply:Give("weapon_csgo_knife")
end
end

hook.Add('PlayerSpawn','Default Weapons', DefWeps )

local function AntiFriendlyFire(ply, attacker)

	if ( attacker:IsPlayer()) and (attacker:Team() == ply:Team()) then
		return false
	end

end
hook.Add('PlayerShouldTakeDamage', "Anti Friend Fire", AntiFriendlyFire)


function MakeTeam (ply, tm)
ply:SetTeam(tm) 
ply:KillSilent() 
end



