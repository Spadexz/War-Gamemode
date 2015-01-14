

function HeadText (ply)
local BoneIndx = ply:LookupBone("ValveBiped.Bip01_Head1")
local BonePos, BoneAng = ply:GetBonePosition( BoneIndx )
local pos = BonePos + Vector(0,0,80) -- Place above head bone
local eyeang = LocalPlayer():EyeAngles().y - 90 -- Face upwards
local ang = Angle( 0, eyeang, 90 )

-- Start drawing 
cam.Start3D2D(pos, ang, 0.1)
	draw.DrawText( ply:Nick(), "Trebuchet24", 0, 400, Color(0,0,0), TEXT_ALIGN_CENTER )
cam.End3D2D()
end
hook.Add("PostPlayerDraw", "3d2d text", HeadText)

