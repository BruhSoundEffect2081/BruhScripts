getgenv().executed = executed
if executed == false then 
	if game.Workspace:FindFirstChild("v") then
		for _,v in pairs(game.Workspace:GetChildren()) do 
			if v.Name == "v" then
				v:Destroy()
			end
		end
		for _,v in pairs(game.Workspace.PromptPurchase["Workspace"]:GetChildren()) do 
			if string.find(v.Name, "Gamepass") then
				v:Destroy()
			end
		end
	end
end
executed = true 

if game.Workspace:FindFirstChild("Handle") then game.Workspace:FindFirstChild("Handle").Name = "DominusFrigidus" end
if game.Workspace:FindFirstChild("Handle") then game.Workspace:FindFirstChild("Handle").Name = "MikuHair" end
if game.Workspace:FindFirstChild("MetalSpacialHorns") then game.Workspace:FindFirstChild("MetalSpacialHorns").Name = "MetalSpacialHorn" end
if game.Workspace:FindFirstChild("MetalSpacialHorns") then game.Workspace:FindFirstChild("MetalSpacialHorns").Name = "XXXXXXXXXXXXXXXXX" end
if game.Workspace:FindFirstChild("MetalSpacialHorns") then game.Workspace:FindFirstChild("MetalSpacialHorns").Name = "GreenSpacialHorn" end

local donutrainbow = Color3.fromHSV(1,1,1)

local playertable = {}

for _,v in pairs(game.Players:GetChildren()) do 
    table.insert(playertable,v.Name)
end

local LP = game.Players.LocalPlayer
local HRP = LP.Character.HumanoidRootPart
local DonutShopGiver = game.Workspace.Donutshop.DonutGiver

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
	Title = 'Mic Up | SpritzSploit | BruhSoundEffect#2081',
	Center = true, 
	AutoShow = true,
})

local Tabs = {
	Main = Window:AddTab('Donut'), 
	['UI Settings'] = Window:AddTab('UI Settings'),
}

local DonutBox = Tabs.Main:AddLeftGroupbox('Donut')
local PlayerBox = Tabs.Main:AddRightGroupbox('Player')
local MatTable = {}
local ColorTable = {}

DonutBox:AddButton('Get Random Donut', function()
	LP.Character.Humanoid.Health = 0 
	wait(0.9)
	LP.Character.HumanoidRootPart.CFrame = DonutShopGiver.CFrame
	wait(0.3)
	fireproximityprompt(DonutShopGiver.ProximityPrompt)
	wait(0.4)
	OldPos = LP.Character.HumanoidRootPart.CFrame
end)

DonutBox:AddButton('Goto Donut Giver', function()
	LP.Character.HumanoidRootPart.CFrame = DonutShopGiver.CFrame
end)

DonutBox:AddDivider()

DonutBox:AddDropdown('MaterialDropdown', {
	Values = {"Neon","SmoothPlastic"},
	Default = 1, 
	Multi = true, 
	Text = 'Donut Materials',
	Tooltip = 'Select Material For Donut',
})

DonutBox:AddDropdown('ColorDropdown', {
	Values =  {"Navy blue","Bright blue","Burnt Sienna","Deep orange","Dark orange","Bright bluish green","Medium Brown","Brown","Pink","Salmon","Dark indigo","Eggplant", "Lime green","Dark orange","Really black","Light stone grey"},
	Default = 13, 
	Multi = true, 
	Text = 'Donut Colors',
	Tooltip = 'Select Color For Donut',
})

Options.MaterialDropdown:OnChanged(function()
	MatTable = {}
	for key, value in next, Options.MaterialDropdown.Value do
		table.insert(MatTable, key)
	end
end)

Options.ColorDropdown:OnChanged(function()
	ColorTable = {}
	for key, value in next, Options.ColorDropdown.Value do
		table.insert(ColorTable, key)
	end
end)

DonutBox:AddDivider()
DonutBox:AddLabel('Stand Near the donut giver \n(Proximity prompt)')
DonutBox:AddDivider()
DonutBox:AddSlider('DFTimeSlider', {
	Text = 'Wait Timer',
	Default = 0.2,
	Min = 0.15,
	Max = 5,
	Rounding = 2,
	Compact = false,
})

local Number = Options.DFTimeSlider.Value
local DFWait = 0.2
Options.DFTimeSlider:OnChanged(function()
	DFWait = Options.DFTimeSlider.Value
end)

DonutBox:AddButton('Get Specific Donut', function()
	if #ColorTable == 0 or #MatTable == 0 then 
		GotDonut = true 
		print("No Color/Material Selected")
	end
	OldPos = LP.Character.HumanoidRootPart.CFrame
	GotDonut = false
	manualstopdonut = false
	donutnum = 0
	fireproximityprompt(DonutShopGiver.ProximityPrompt)
	while GotDonut == false do
		repeat 
			task.wait() 
			if GotDonut then 
			    manualstopdonut = true
			end
		until game.Players.LocalPlayer.Backpack:FindFirstChild("Donut") or manualstopdonut == true 
		for _,obj in next, game.Players.LocalPlayer.Backpack:GetChildren() do
			if obj.Name == "Donut" then
				local equip = game.Players.LocalPlayer.Backpack.Donut
				equip.Parent = game.Players.LocalPlayer.Character
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA('Tool') or v:IsA('HopperBin') then
				v:Destroy()
			end
		end
		repeat 
			fireproximityprompt(DonutShopGiver.ProximityPrompt)
			task.wait()
			if GotDonut then 
			    manualstopdonut = true
			end
		until game.Players.LocalPlayer.Backpack:FindFirstChild("Donut") or manualstopdonut
		wait(DFWait)
		for i = 1, #ColorTable do 
			print("#"..donutnum, tostring(LP.Backpack.Donut.ColorPart.BrickColor), tostring(LP.Backpack.Donut.ColorPart.Material))
			if GotDonut == false then 
				if tostring(LP.Backpack.Donut.ColorPart.BrickColor) == ColorTable[i] then
					for e = 1, #MatTable do 
						if tostring(LP.Backpack.Donut.ColorPart.Material) == "Enum.Material."..MatTable[e] then
							GotDonut = true
							wait(1)
							print("Got Donut")
							break
						end
					end
				end
				donutnum = donutnum + 1
			end
		end
	end
end)

DonutBox:AddButton('Stop Farm', function()
	OldPos = LP.Character.HumanoidRootPart.CFrame
	GotDonut = true
	manualstopdonut = true
end)

PlayerBox:AddSlider('SpeedSlider', {
	Text = 'WalkSpeed',
	Default = 16,
	Min = 0,
	Max = 200,
	Rounding = 0,
	Compact = false,
})

Options.SpeedSlider:OnChanged(function()
	LP.Character.Humanoid.WalkSpeed = Options.SpeedSlider.Value
end)

PlayerBox:AddButton('No AFK', function()
	local mt = getrawmetatable(game)
	make_writeable(mt)

	local namecall = mt.__namecall

	mt.__namecall = newcclosure(function(self, ...)
		local method = getnamecallmethod()
		local args = {...}

		if method == "FireServer" and tostring(self) == "AFK" then
			return false
		end
		return namecall(self, table.unpack(args))
	end)
end)

PlayerBox:AddButton('Break Spleef Blocks', function()
	OldPos = LP.Character.HumanoidRootPart.CFrame
	for _,x in pairs(game.Workspace:GetChildren()) do
		if string.find(x.Name, "SpleefMinigame") then
			for _,v in pairs(x:GetChildren()) do 
				for _,z in pairs(v:GetChildren()) do 
					if string.find(z.Name, "Fading") then
						task.wait()
						LP.Character.HumanoidRootPart.CFrame = z.CFrame * CFrame.new(0,1,0)
					end
				end
			end
		end
	end
	wait(0.1)
	LP.Character.HumanoidRootPart.CFrame = OldPos
end)

PlayerBox:AddButton('Inf Yield', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

PlayerBox:AddButton('Chat Spy / Auto Translate', function()
	loadstring(game:HttpGet('https://pastebin.com/raw/nFXDvzkH'))()
	loadstring(game:HttpGetAsync('https://i.qts.life/r/ChatInlineTranslator.lua', true))()
end)

PlayerBox:AddToggle('rainbowdonuts', {
	Text = 'Local Rainbow Donut All',
	Default = false, 
	Tooltip = 'makes all donuts rainbow locally', 
})

getgenv().rainbowdonutall = false
Toggles.rainbowdonuts:OnChanged(function()
	rainbowdonutall = Toggles.rainbowdonuts.Value 
	while rainbowdonutall == true do 
        task.wait()
        for _,v in pairs(game.Workspace:GetChildren()) do 
            if table.find(playertable, v.Name) then 
                if v:FindFirstChild("Donut") then 
                    v.Donut.ColorPart.Color = donutrainbow
                    task.wait()
                end
            end 
        end
	end
end)

PlayerBox:AddDivider()

PlayerBox:AddDropdown('GetHats', {
	Values = {"Gun","Valkyrie Helm giver","MetalSpacialHorn","GreenSpacialHorn","DominusFrigidus","EmporerUniverseCrown","MikuHair"},
	Default = 1,
	Multi = false,
	Text = 'Get Hats',
	Tooltip = 'get any hat fast',
})

local asmgwrh = false
Options.GetHats:OnChanged(function()
	if asmgwrh == true then
		OldPos = LP.Character.HumanoidRootPart.CFrame
		if Options.GetHats.Value == "Gun" then 
			LP.Character.HumanoidRootPart.CFrame = game.Workspace.ToolGrab.CFrame
			wait(0.2)
			fireproximityprompt(game.Workspace.ToolGrab.ProximityPrompt)
		else
			LP.Character.HumanoidRootPart.CFrame = game.Workspace[Options.GetHats.Value].CFrame
		end
		wait()
		LP.Character.HumanoidRootPart.CFrame = OldPos
	end
end)
asmgwrh = true 

PlayerBox:AddDivider()

local HT = {}

for _,v in pairs(game.Workspace:GetDescendants()) do 
	if v.Name == "HatHelperGuideGiverScript" or v.Name == "HatGiverScript" then 
		table.insert(HT, v.Parent.Name)
		v.Parent.CanCollide = false
		v.Parent.Transparency = 1
		if v.Parent:FindFirstChild("Mesh") then 
			v.Parent.Mesh:Destroy()
		end
		if v.Parent:FindFirstChild("Decal") then 
			v.Parent.Decal:Destroy()
		end
	end 
end

PlayerBox:AddToggle('getallhats', {
	Text = 'Get Tons of Hats',
	Default = false, 
	Tooltip = 'get all hats a lot', 
})

getgenv().gethatsgenv = false
Toggles.getallhats:OnChanged(function()
	gethatsgenv = Toggles.getallhats.Value 
	while gethatsgenv == true do 
		for i = 1, #HT do 
			game.Workspace[HT[i]].CFrame = HRP.CFrame
			task.wait(1/60)
			game.Workspace[HT[i]].CFrame = HRP.CFrame * CFrame.new(0,1,0)
		end
	end
end)

local hatnum = 0
PlayerBox:AddButton('Print Hat #', function()
	for _,v in pairs(game.Workspace[LP.Name]:GetChildren()) do 
		if v:IsA("Hat") then 
			hatnum = hatnum + 1
		end
	end
	print(hatnum)
	hatnum = 0
end)

spawn(function()
    while true do 
        wait()
        for i = 0,1,0.001*3 do
            donutrainbow = Color3.fromHSV(i,1,1)
            wait()
        end
    end
end)


Library:OnUnload(function() Library.Unloaded = true end)
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 
Library.ToggleKeybind = Options.MenuKeybind 
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])
