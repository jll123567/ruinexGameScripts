print("UserLogin:",script.Parent.Parent.Name)
create = LoadLibrary("RbxUtility").Create --Load Lib for client sound.
game.Players.LocalPlayer.CameraMaxZoomDistance = 30 --Make the camera nice and tight.
script.Parent.Parent.CharacterAdded:Connect(function()--When the player starts/respawns...
	game.ReplicatedStorage.ruinexBorn:FireServer()--let the server get a ruinex inst ready
	game.ReplicatedStorage.ruinexStart:FireServer(script.Parent.Parent:GetMouse().Hit)
end)
script.Parent.Parent.CharacterRemoving:Connect(function()--when the player dies
	game.ReplicatedStorage.ruinexDied:FireServer()--kill their instance
end)
script.Parent.Parent:GetMouse().Button1Down:Connect(function()--transfer mouse clicks
	game.ReplicatedStorage.ruinexClick:FireServer(script.Parent.Parent:GetMouse().Hit)
end)
script.Parent.Parent:GetMouse().KeyDown:Connect(function(k)--transfer keypresses
	game.ReplicatedStorage.ruinexKey:FireServer(k,script.Parent.Parent:GetMouse().Hit)
end)
game.ReplicatedStorage.ruinexSound.OnClientEvent:Connect(function(id, vol, pit)--Handle sound only the client should see
local sound=create("Sound"){
Parent=game.Players.LocalPlayer.Character,
SoundId="rbxassetid://"..id,
Volume=vol,
PlaybackSpeed=pit,
MaxDistance=66666666}
sound:Play()
game:GetService("Debris"):AddItem(sound,10)
return sound
end)