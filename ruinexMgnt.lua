print("ruinexMGNT started")
ruinexScriptHolder = Instance.new("Folder", game.ServerScriptService)--make a folder for instances
ruinexScriptHolder.Name="ruinexScriptHolder"
game.ReplicatedStorage.ruinexBorn.OnServerEvent:Connect(function(player)--when the player starts/respawns...
	local newRuinexInst = game.ServerScriptService.ruinexBaseInst:Clone()--ready a new instance
	newRuinexInst.Parent = game.ServerScriptService.ruinexScriptHolder
	newRuinexInst.Name = "ruinexInst:"..player.Name
	newRuinexInst.Disabled = false

end)
game.ReplicatedStorage.ruinexDied.OnServerEvent:Connect(function(player)--when a player dies
	player.Theme:Stop()--kill the music
	player.Theme.Parent = nil
	game.ServerScriptService.ruinexScriptHolder:GetChildren()--destory their ruinex instance
	for ruinexInstNo, ruinexInst in ipairs(game.ServerScriptService.ruinexScriptHolder:GetChildren()) do
		if string.sub(ruinexInst.Name, 12) == player.Name then
			ruinexInst:Destroy()
		end
	end
end)