function hidehud(name) -- Removing the default HUD
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", })do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideOurHud:D", hidehud)

surface.CreateFont( "Ammo", {
 font = "Default",
 size = 65,
 weight = 800,
 antialias = true
})

surface.CreateFont( "HealthText", {
 font = "Default",
 size = 35,
 weight = 800,
 antialias = true
})

function Glow(speed,r,g,b,a)
	if speed then
		color = {}
		color.r = math.sin(RealTime()*(speed or 1))*r
		color.b = math.sin(RealTime()*(speed or 1))*g
		color.g = math.sin(RealTime()*(speed or 1))*b
		color.a = a or 255
		return color.r, color.b, color.g, color.a
	end
end

local function DrawArmor()
	local ply = LocalPlayer()
	local armor = ply:Armor()
	local ar = Material("icon16/shield.png")
	if armor > 0 then 
			surface.SetMaterial(ar)
		surface.SetDrawColor(255,255,255,245)
		surface.DrawTexturedRect(125,ScrH()-100,85,85)
		draw.RoundedBox(0,125,ScrH()-15,math.Clamp(armor,0,100)*0.8,10,Color(0,219,252,240))
		draw.RoundedBox(0,125,ScrH()-15,80,10,Color(30,30,30,220))
	if armor == 100 then
		draw.DrawText(armor.."%", "HealthText", 125,ScrH()-80, Color( 12, 12, 12, 255 ))
	elseif armor < 100 then
		draw.DrawText(armor.."%", "HealthText", 135,ScrH()-80, Color( 12, 12, 12, 255 ))
end
end
end
local function DrawHealth()
local ply = LocalPlayer()
local health,armor = ply:Health(),ply:Armor()
local hp = Material("icon16/heart.png")
local ar = Material("icon16/shield.png")
if health > 0 then 
			surface.SetMaterial(hp)
		surface.SetDrawColor(155 + health,255,255,245)
		surface.DrawTexturedRect(20,ScrH()-95,85,85)
		draw.RoundedBox(0,20,ScrH()-15,math.Clamp(health,0,100)*0.8,10,Color(255,50,50,240))
		draw.RoundedBox(0,20,ScrH()-15,80,10,Color(30,30,30,220))
	if health == 100 then
		draw.SimpleText(health.."%", "HealthText", 20,ScrH()-80, Color(155 + health,255,255,245) )
	elseif health < 100 then
		draw.SimpleText(health.."%", "HealthText", 30,ScrH()-80, Color(155 + health,255,255,245) )
end 
end 
end

function DrawTeam ()
	local col = team.GetColor( LocalPlayer():Team() )

draw.SimpleText( team.GetName( LocalPlayer():Team() ), "HealthText", ScrW()/2, ScrH()-80, Color(Glow(1, col.r, col.g, col.b)) )


end


local function DrawLine2(x,y,w,h,x2,y2,w2,h2)
	surface.SetDrawColor(0,0,0,255)
	surface.SetDrawColor(61,61,61,255)
end

local function DrawAmmo()
	local ply = LocalPlayer()
	
	if !IsValid(ply:GetActiveWeapon()) then return end
	if (ply:GetActiveWeapon():Clip1() == NULL or ply:GetActiveWeapon() == "Camera") then return end
	local mag_left = LocalPlayer():GetActiveWeapon():Clip1()
	local mag_extra = LocalPlayer():GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()) // Current Ammunition outside the mag
	
	if (ply:GetActiveWeapon():GetClass() == "weapon_physcannon") then
		return false
	elseif mag_left == -1 then
		return false
	elseif mag_extra >= 0 then
		draw.RoundedBox(0,ScrW()-300,ScrH()-90,220,80,Color(38,38,38,255)) // Background
		draw.RoundedBox(0,ScrW()-290,ScrH()-80,95,60,Color(54,54,54,255)) // Mag Left
		if mag_left > 0 then
		draw.DrawText(mag_left,"Ammo",ScrW()-240,ScrH()-85,color_white,TEXT_ALIGN_CENTER)
	elseif mag_left == 0 then
		draw.DrawText(mag_left,"Ammo",ScrW()-240,ScrH()-85, Color(255,0,0,255),TEXT_ALIGN_CENTER)
	end
		// Left
		DrawLine2(290,80,290,20,289,80,289,20)
		
		// Right
		DrawLine2(195,80,195,20,196,80,196,20)	
		
		// Top
		DrawLine2(290,80,195,80,288,79,195,79)
		
		// Bottom
		DrawLine2(290,20,195,20,288,21,195,21)

		draw.RoundedBox(0,ScrW()-185,ScrH()-80,95,60,Color(54,54,54,255)) // Mag Extra
		if mag_extra > 0 then
		draw.DrawText(mag_extra,"Ammo",ScrW()-135,ScrH()-85,color_white,TEXT_ALIGN_CENTER)
	elseif mag_extra == 0 then
		draw.DrawText(mag_extra,"Ammo",ScrW()-135,ScrH()-85, Color(255,0,0,255),TEXT_ALIGN_CENTER)
		// Left
		DrawLine2(185,80,185,20,184,80,184,20)
		
		// Right
		DrawLine2(90,80,90,20,91,80,91,20)	
		
		// Top
		DrawLine2(185,80,90,80,183,79,90,79)
		
		// Bottom
		DrawLine2(185,20,90,20,183,21,90,21)
	end
end
end

function WARHUD ()
	local ply = LocalPlayer()
	local health = ply:Health()
	if health > 0 then 
DrawAmmo()
DrawLine2()
DrawHealth()
DrawArmor()
DrawTeam()
end 
end
 
hook.Add("HUDPaint", "Main", WARHUD)

 