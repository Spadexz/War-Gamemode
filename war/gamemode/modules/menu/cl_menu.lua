

net.Receive("Menu", function(l,c, ply)
local dermp = vgui.Create( "DFrame" )
         dermp:SetTitle("Faction Menu")
		 dermp:SetSkin("stronghold")
         dermp:SetDraggable(true)
         dermp:SetDeleteOnClose(false)
         dermp:SetKeyboardInputEnabled(true)
         dermp:SetMouseInputEnabled(true)
         dermp:MakePopup()
         dermp:SetSize(ScrW() /2, 500)
         dermp:SetPos(ScrW() / 2 - (dermp:GetWide() / 2), 50)
         dermp:Center() 

         local line = 30
         local tab = 0
    local PropertySheet = vgui.Create( "DPropertySheet", dermp )
        PropertySheet:SetPos( 5, 30 )
        PropertySheet:SetSize( 330, 365 )
       
        local SheetItemOne = vgui.Create( "DPanel", PropertySheet )		 
		SheetItemOne:SetPos( 2, 2 )
		        local SheetItemTwo = vgui.Create( "DPanel", PropertySheet )		 
		SheetItemTwo:SetPos( 4, 2 )
		        local SheetItemThree = vgui.Create( "DPanel", PropertySheet )		 
		SheetItemThree:SetPos( 6, 2 )
		local cover = vgui.Create( "DFrame", dermp )
				cover:SetSize( 2, 10 )
				cover:SetPos( 4.0, 48 )
				cover:ShowCloseButton( false )
				cover:SetDraggable( false )
				function cover:Paint()
				draw.RoundedBox( 0, 0, 0, 8, 10, Color( 108, 111, 114 ) )
			end
				local cover2 = vgui.Create( "DFrame", dermp )
				cover2:SetSize( 2, 10 )
				cover2:SetPos( 4.0, 48 )
				cover2:ShowCloseButton( false )
				cover2:SetDraggable( false )
				function cover2:Paint()
				draw.RoundedBox( 0, 0, 0, 8, 10, Color( 108, 111, 114 ) )
			end

							local cover3 = vgui.Create( "DFrame", dermp )
				cover3:SetSize( 2, 10 )
				cover3:SetPos( 4.0, 48 )
				cover3:ShowCloseButton( false )
				cover3:SetDraggable( false )
				function cover3:Paint()
				draw.RoundedBox( 0, 0, 0, 8, 10, Color( 108, 111, 114 ) )
			end
        local team = vgui.Create("DButton", SheetItemOne)
         team:SetSize(150, 30)
         team:SetPos(0, 5) //315
         team:SetText("Team Red")
                 team.DoClick = function()
                    net.Start( "RTeam" )
		 			net.SendToServer() 
		 		end

	    local teamb = vgui.Create("DButton", SheetItemOne)
         teamb:SetSize(150, 30)
         teamb:SetPos(150, 5) //315
         teamb:SetText("Team Blue")
                 teamb.DoClick = function()
                    net.Start( "BTeam" )
		 			net.SendToServer() 
                 end

        	    local pistol = vgui.Create("DButton", SheetItemTwo)
        pistol:SetSize(300, 30)
         pistol:SetPos(5, 5) //315
         pistol:SetText("Pistol")
                 pistol.DoClick = function()
                    net.Start( "pistol" )
		 			net.SendToServer() 
                 end
                 	    local m4 = vgui.Create("DButton", SheetItemTwo)
         m4:SetSize(300, 30)
         m4:SetPos(5, 35) //315
         m4:SetText("M4A1")
                 m4.DoClick = function()
                    net.Start( "m4" )
		 			net.SendToServer() 
                 end

                               	    local awp = vgui.Create("DButton", SheetItemTwo)
         awp:SetSize(300, 30)
         awp:SetPos(5, 65) //315
         awp:SetText("Awp")
                 awp.DoClick = function()
                    net.Start( "awp" )
		 			net.SendToServer() 
                 end

                                  	    local pistolammo = vgui.Create("DButton", SheetItemThree)
         pistolammo:SetSize(300, 30)
         pistolammo:SetPos(5, 5) //315
         pistolammo:SetText("Pistol Ammo")
                 pistolammo.DoClick = function()
                    net.Start( "PistolAmmo" )
		 			net.SendToServer() 
                 end

                                  	    local m4ammo = vgui.Create("DButton", SheetItemThree)
         m4ammo:SetSize(300, 30)
         m4ammo:SetPos(5, 35) //315
         m4ammo:SetText("Rifle Ammo")
                 m4ammo.DoClick = function()
                    net.Start( "RifleAmmo" )
		 			net.SendToServer() 
                 end

                                                   	    local awpammo = vgui.Create("DButton", SheetItemThree)
         awpammo:SetSize(300, 30)
         awpammo:SetPos(5, 65) //315
         awpammo:SetText("Sniper Ammo")
                 awpammo.DoClick = function()
                    net.Start( "AwpAmmo" )
		 			net.SendToServer() 
                 end
				 
				 
	PropertySheet:AddSheet( "Teams", SheetItemOne, "gui/silkicons/user", 
	false, false, "" )
		PropertySheet:AddSheet( "Guns", SheetItemTwo, "gui/silkicons/user", 
	false, false, "" )

		PropertySheet:AddSheet( "Ammo", SheetItemThree, "gui/silkicons/user", 
	false, false, "" )	
	end)