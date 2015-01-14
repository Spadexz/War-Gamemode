  util.AddNetworkString("Menu")
  util.AddNetworkString("m4")
  util.AddNetworkString("pistol")
  util.AddNetworkString("awp")
  util.AddNetworkString("PistolAmmo")
  util.AddNetworkString("RifleAmmo")
  util.AddNetworkString("AwpAmmo")
  util.AddNetworkString("Rteam")
  util.AddNetworkString("Bteam")
  
hook.Add('ShowSpare2', 'F4menu', function(ply)
net.Start("Menu")
net.Send(ply)
end)

  net.Receive("m4", function(l,c)
  c:Give('weapon_csgo_m4a1_s')
end)

    net.Receive("pistol", function(l,c)
  c:Give('weapon_csgo_usp')
end)

        net.Receive("awp", function(l,c)
  c:Give('weapon_csgo_awp')
end)


    net.Receive("RifleAmmo", function(l,c)
  c:GiveAmmo( 45, "smg1", false )
end)

        net.Receive("PistolAmmo", function(l,c)
  c:GiveAmmo( 40, "pistol", false )
end)

                net.Receive("AwpAmmo", function(l,c)
  c:GiveAmmo( 20, "357", false )
end)

        net.Receive("Rteam", function(l,c)
  c:SetTeam(1)
end)


    net.Receive("Bteam", function(l,c)
  c:SetTeam(2)
end)


   