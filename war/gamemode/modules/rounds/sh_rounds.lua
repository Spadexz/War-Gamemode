hook.Add( "PlayerSay", "PlayerSayExample", function( ply, text, team )
	if ( string.sub( text, 1, 11 ) == "/startround" ) then
	RoundStart() 
	end
end )