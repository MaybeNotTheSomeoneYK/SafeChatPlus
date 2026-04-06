-- MainModule/Listener ServerScript
local keys = game:GetService("HttpService"):JSONDecode(game:GetService("ReplicatedStorage"):WaitForChild("MainModule"):GetAttribute("key"))
local tbl = {}
for i,v in keys do
	table.insert(tbl,i)
end
game:GetService("ReplicatedStorage"):WaitForChild("SafeChatRemote").OnServerInvoke = function(p,key:string)
	if not table.find(tbl,key) then return print("unvalid") end
	print("recieving")
	local random = keys[key][math.random(1,#keys[key])]
	game:GetService("Chat"):Chat(p.Character,random)
end
