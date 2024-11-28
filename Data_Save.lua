-- Modules & Services
local DS =  game:GetService("DataStoreService")
local DP = DS:GetDataStore("Data")
local PS = game:GetService("Players")

local Deafult = 0
local PDB = require(game:GetService("ReplicatedStorage").Pre_DB)

-- Main
PS.PlayerAdded:Connect(function(plr)
	local player_data = DP:GetAsync(tostring(plr.UserId))
	
	if player_data == nil then
		PDB[tostring(plr.UserId)] = Deafult
	else
		PDB[tostring(plr.UserId)] = player_data
	end
end)

PS.PlayerAdded:Connect(function(plr)
	if PDB[tostring((plr.UserId))] == nil then
		return
	else
		DP:SetAsync(tostring(plr.UserId))
		PDB[tostring(plr.UserId)] = nil
	end
end)