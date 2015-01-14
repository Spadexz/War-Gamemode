AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )




/*
	Spawning Section
*/

--Every Time the Player Spawns
 function PSpawn( ply )
  ply:SetArmor( 100 )
  ply:SetWalkSpeed( 200 )
  ply:SetRunSpeed( 300 )
  ply:Give("hands")
 end
 hook.Add( "PlayerSpawn", "Player is spawning shhh", PSpawn )
 -- when the Player Joins
local function InitialSpawny( ply )
	print( ply:GetName().." joined the server." )
	ply:SetTeam( 3 )
end
hook.Add( "PlayerInitialSpawn", "some_unique_name", InitialSpawny )
--When the Player Disconnects
function GM:PlayerDisconnected( ply )
	print(  ply:Nick() .. "Has Left The Game." )
end
/*
	Player Stuff
*/
-- Fall Damage
function GM:GetFallDamage( ply, speed )
    return ( speed / 10 )
end
--FlashLight
hook.Add("PlayerInitialSpawn", "Flashlight", function(ply)
     if(!ply:CanUseFlashlight())then
          ply:AllowFlashlight(true)
     end
end)

























