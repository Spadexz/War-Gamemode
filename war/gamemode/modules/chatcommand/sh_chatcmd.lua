commandTable = { }
ccmd = { }

function ccmd.AddCommand( command, func )

	commandTable[ command ] = func
	
end

function ccmd.FindPlayerByName( name )
	
	local foundPlayers = { }
	
	for k,v in pairs( player.GetAll() ) do
		if string.find( string.lower( v:Name() ), string.lower( name ), 0, true ) != nil then	
			table.insert( foundPlayers, v )
		end
	end
	
	if table.Count( foundPlayers ) == 1 then
		return foundPlayers[ 1 ]
	else
		return false
	end
	
end

hook.Add( "PlayerSay", "ChatCommandCheck", function( ply, text, team )

	local args = string.Explode( " ", text, false )
	
	for k,v in pairs( commandTable ) do
		if "/" .. k == args[1] then
			table.remove( args, 1 )
			return v( ply, args ) 
		end
	end
	
end )