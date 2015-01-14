//
// Game-Mode Information
//
GM.Name             = "War";               // This is what the server-browser sees
GM.Author           = "Spade";                // Your name?
GM.Email            = "spadesrp@gmail.com";        // Your contact e-mail address
GM.Website          = "";    // Your web address

// Enumerations
//
local REALM_CLIENT  = 0;
local REALM_SERVER  = 1;
local REALM_SHARED  = 2;

//
// Helper-Function to reduce the amount of code repetition for including files..
// ( GM or GAMEMODE ).FolderName .. "/"
function IncludeFiles( _file, _realm )
    local _gmfolder = ( GM || GAMEMODE ).FolderName;

    // If no realm specified, error out...
    if ( !_realm ) then Error( "Realm unset, can't include: " .. _file ); end

    // The only time AddCSLuaFile is called, is by the SERVER. Keeping that in mind,
    //  when would we need the client to download the file? If it is REALM_SHARED or CLIENT file.
    if ( SERVER && ( _realm == REALM_CLIENT || _realm == REALM_SHARED ) ) then
        AddCSLuaFile( _gmfolder .. "/gamemode/modules/" .. _file );
    end

    // We call include many different ways: If the realm is REALM_SERVER and the SERVER executed the code,
    //  or if the realm is REALM_CLIENT and the CLIENT executed the code, or if the realm is REALM_SHARED meaning
    //  we don't need to check if SERVER or CLIENT as BOTH should include at that point.
    if ( ( SERVER && _realm == REALM_SERVER ) || ( CLIENT && _realm == REALM_CLIENT ) || ( ( CLIENT || SERVER ) && _realm == REALM_SHARED ) ) then
        include( _gmfolder .. "/gamemode/modules/" .. _file );
    end
end

//
// Other includes which are used by both the client and the server
//
// include( "..." ); // Fill these in as necessary as in cl_init.lua and init.lua

//
// Start adding your custom code here.
//
local _map = string.lower( game.GetMap( ) );


//
// Load Order is ALWAYS: SHARED code, then CLIENT/SERVER code then ADDONS then CONTENT
//


//
// SHARED
//
IncludeFiles( "teams/sh_teams.lua", REALM_SHARED );
IncludeFiles( "admin/sh_teleport.lua", REALM_SHARED );
IncludeFiles( "chatcommand/sh_chatcmd.lua", REALM_SHARED );

//
// CLIENT
//
IncludeFiles( "hud/cl_hud.lua", REALM_CLIENT );
IncludeFiles( "menu/cl_menu.lua", REALM_CLIENT );
IncludeFiles( "headtext/cl_head_text.lua", REALM_CLIENT );


//
// SERVER
//
IncludeFiles( "menu/sv_menu.lua", REALM_SERVER );
IncludeFiles( "model_randomizer/sv_rmodel.lua", REALM_SERVER );

//
// ADDONS
//
--IncludeFiles( "addons/drowning.lua", REALM_SHARED );


//
// CONTENT
//
--IncludeFiles( "content/maps/" .. _map .. "/config.lua", REALM_SHARED );
--IncludeFiles( "content/maps/" .. _map .. "/spawn_points.lua", REALM_SERVER );