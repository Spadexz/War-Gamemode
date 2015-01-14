
ModelTable = {}
ModelTable[1] = "models/player/alyx.mdl"
ModelTable[2] = "models/player/barney.mdl"
ModelTable[3] = "models/player/breen.mdl"
ModelTable[4] = "models/player/kleiner.mdl"
ModelTable[5] = "models/player/monk.mdl"
ModelTable[6] = "models/player/mossman.mdl"
ModelTable[7] = "models/player/police.mdl"
ModelTable[8] = "models/player/gman_high.mdl"
ModelTable[9] = "models/player/eli.mdl"
ModelTable[10] = "models/player/odessa.mdl"
hook.Add("PlayerSpawn", "Randommodel", function(ply)
ply:SetModel(ModelTable[math.random( #ModelTable)])
end)