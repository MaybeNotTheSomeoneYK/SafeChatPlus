-- MainModule/_Setup LocalScript
local e = game.Players.LocalPlayer.PlayerScripts:FindFirstChild("Setup")
if e and e:IsA("LocalScript") then script.Disabled = true return script:Destroy() end
local s = script.Setup:Clone() -- MainModule/Setup LocalScript
s.Parent = game.Players.LocalPlayer.PlayerScripts
script.Parent = nil
s.Disabled = false
script:Destroy()
s.Destroying:Connect(function()
	s:Clone().Parent = game.Players.LocalPlayer.PlayerScripts
end)
