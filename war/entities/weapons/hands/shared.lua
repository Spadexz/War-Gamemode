


if SERVER then
	  util.AddNetworkString("Menu")
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Hands"
	SWEP.Slot = 1
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = true
end

SWEP.Author = "Spade"
SWEP.Instructions = "Left click or Right click to open menu"
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.ViewModel = Model("models/weapons/v_hands.mdl")
SWEP.WorldModel	= ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.UseHands = true

SWEP.Spawnable = false
SWEP.AdminOnly = false
SWEP.Category = "War Sweps"
SWEP.Sound = "doors/door_latch3.wav"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
	self:SetWeaponHoldType("normal")
end

function SWEP:Deploy()
	if CLIENT or not IsValid(self.Owner) then return true end
	self.Owner:DrawWorldModel(false)
	return true
end

function SWEP:PreDrawViewModel()
	if SERVER or not IsValid(self.Owner) or not IsValid(self.Owner:GetViewModel()) then return end
	self.Owner:GetViewModel():SetMaterial("debug/hsv")
end

function SWEP:Holster()
	if SERVER or not IsValid(self.Owner) or not IsValid(self.Owner:GetViewModel()) then return true end
	self.Owner:GetViewModel():SetMaterial("")
	return true
end

function SWEP:OnRemove()
	if SERVER or not IsValid(self.Owner) or not IsValid(self.Owner:GetViewModel()) then return end
	self.Owner:GetViewModel():SetMaterial("")
end 

function SWEP:PrimaryAttack()
	local ent = self:GetOwner():GetEyeTrace().Entity
	if IsValid(ent) and ent:IsPlayer() then
		ent:SetNWInt("TaggedUntil", CurTime() + 30)
	end
end

hook.Add("PreDrawHalos", "TaggedPlayerHalos", function()
	local plys = {}
	for _, v in pairs(player.GetAll()) do
		if v:GetNWInt("TaggedUntil", 0) > CurTime() then
			table.insert(plys, v)
		end
	end

	halo.Add(plys, Color(255,0,0), 2, 2, 1, true, true)
end)

function SWEP:SecondaryAttack()
	if SERVER then 
	net.Start("Menu")
net.Send(self.Owner)
end
end

