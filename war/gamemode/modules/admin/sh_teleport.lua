function bring (ply, text, public)
local newang = (calling_ply:GetPos() - newpos):Angle()
local players = player.GetAll()
if ( string.sub( text, 1, 6 ) == "!bring" ) then
	players:SetPos( newpos )
	players:SetEyeAngles( newang )
	players:SetLocalVelocity( Vector( 0, 0, 0 ) ) -- Stop!
end

hook.Add( "PlayerSay", "Bring", bring )