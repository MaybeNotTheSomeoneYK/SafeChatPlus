-- MainModule/Setup LocalScript | MainModule/_Setup/Setup LocalScript
-- i am NOT going to copy the whole topbarplus modules here
--[[

> TopbarPlus was developed by ForeverHD and is actively maintained
thanks to HD Admin.

> You can get in touch with me on Discord via the social link here:
https://create.roblox.com/store/asset/92368439343389/TopbarPlus

> READ_ME is Script with RunContext set to 'Client' meaning you can
store it in ReplicatedStorage and Workspace and it will still run 
like a normal LocalScript. DO NOT PLACE place in StarterPlayerScripts
(because this is a Script with RunContext). You need to create a separate
LocalScript for anything under StarterPlayerScripts. 

> You're welcome to move `Icon` and require it yourself. You can
then delete this folder and READ_ME.

> Icon is a Package for when Roblox (hopefully soon) release
public packages. This for example will enable you to receive
automatic updates, and to compare code easily between changes

> Have feedback? Post it to devforum.roblox.com/t/topbarplus/1017485
which I actively monitor. Enjoy! ~ForeverHD June 2025

--]]



local Icon = require(script.Icon)
local remote = game:GetService("ReplicatedStorage"):WaitForChild("SafeChatRemote")
local keys = game:GetService("HttpService"):JSONDecode(game:GetService("ReplicatedStorage"):WaitForChild("MainModule"):GetAttribute("key"))
local tbl = {}
for i,v in keys do
	table.insert(tbl,i)
end
local function bind(q:any)
	if not table.find(tbl,q) then return print("unvalid") end
	print("sending")
	remote:InvokeServer(q)
end

local emotes = {}
local origin = Icon.new()

for i,v in tbl do
	emotes[i] = Icon.new()
		:setLabel(v)
		:bindEvent("selected",function()
			bind(v)
			origin:deselect()
		end)
end

origin:align("Center")
origin:setCaption("Emotion")
origin:setName("EmoteBtn")
origin:setLabel()
origin:setDropdown(emotes)
origin:setImage(11713358131, "Deselected")
origin:setImage(11713358131, "Selected")
