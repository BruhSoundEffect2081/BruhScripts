repeat
    task.wait()
until game.Workspace.characters:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "made by Oreoz/BruhSoundEffect", HidePremium = false, IntroEnabled = false})
local Tab = Window:MakeTab({Name = "stuff",Icon = "rbxassetid://0",PremiumOnly = false})
local farm2Tab = Window:MakeTab({Name = "farm 2",Icon = "rbxassetid://0",PremiumOnly = false})
local tpTab = Window:MakeTab({Name = "tp stuff",Icon = "rbxassetid://0",PremiumOnly = false})
local weaponTab = Window:MakeTab({Name = "weapon stuff",Icon = "rbxassetid://0",PremiumOnly = false})

local codes = {"friendly","powerhouse"}

Tab:AddParagraph("FARM 1 INFO","farm 1 is better for leveling and farming money (max lvl in under 30 mins, and hundreds of thousands of yen per hour). read farm 2 info about farm 2")


local ot1 = {}
local ot2 = {}
local o1 = false
Tab:AddToggle({ Name = "farm 1", Default = false, Callback = function(Value)
    o1 = Value
    while o1 do 
        repeat
            task.wait()
        until game.Workspace.characters:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
        local ot1 = {}
        for _,v in pairs(game.Workspace.radiantNpcs:GetChildren()) do
            if v:IsA("Model") and v.Name == "vilStealPoint" then
                table.insert(ot1, v)
            end
        end
        local target = ot1[math.random(1,#ot1)]
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame
        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("openDialogue",{target})
        wait(0.2)
        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("vilStealPoint",{target})
        wait(0.5)
        for _,v in pairs(game.Workspace.miscObjects.vilStealPoint:GetChildren()) do
            if v:IsA("Model") and v.Name == "vilStealPoint" then
                if v.inUse.Value == true then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.zone.CFrame
                    wait(0.2)
                    game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("vilStealPointTurnIn",{v.case})
                end
            end
        end
        wait(1)
    end
end})


farm2Tab:AddParagraph("FARM 2 INFO","farm 1 is better for leveling max, and farming money. farm 2 is extemely complicated and laggy on low end PC's. in short, farm 2 will auto get quest, tp you to the quest area, kill shit (will click by default, but turn on moves if you have them), and repeat. i reccomend having the yoink all proximityprompts on if you want the souls. farm 2 was made specifically for souls :>")

local em = false 
local rm = false 
local fm = false 
local vm = false 
local tm = false 
local mf = false 

local o2 = false
farm2Tab:AddToggle({ Name = "farm 2", Default = false, Callback = function(Value)
    o2 = Value
    while o2 do 
        repeat
            task.wait()
        until game.Workspace.characters:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
        local ot2 = {}
        for _,v in pairs(game.Workspace.radiantNpcs:GetChildren()) do
            if v:IsA("Model") and v.Name == "heroSecurePoint" then
                table.insert(ot2, v)
            end
        end
        local qtarget2 = ot2[math.random(1,#ot2)]
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = qtarget2.HumanoidRootPart.CFrame
        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("openDialogue",{qtarget2})
        wait(0.4)
        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("heroSecurePoint",{qtarget2})
        wait(0.4)
        local inusesecurepointfound = false
        repeat 
            wait(1)
            for _,v in pairs(game.Workspace.miscObjects.heroSecurePoint:GetDescendants()) do
                if v.Name == "Airdrop" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Model.box.CFrame
                    inusesecurepointfound = true
                end
            end
        until inusesecurepointfound or not game.Players.LocalPlayer.PlayerGui.ScreenGui.questMsg.Visible
        wait(0.4)
        repeat
            repeat
                task.wait()
            until game.Workspace.characters:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart") and game.Workspace.characters:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid") or not game.Players.LocalPlayer.PlayerGui.ScreenGui.questMsg.Visible
            repeat
                wait(1)
                game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("togglePartner")
            until game.Workspace.characters:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChildWhichIsA("Tool")
            mf = false
            realtarget2 = nil
            for _,v in pairs(game.Workspace.characters:GetDescendants()) do
                if v.Name == "zombie" and v:IsA("Model") then
                    realtarget2 = v.Parent
                end
            end
            if realtarget2 ~= nil then
                game.Workspace.characters:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart")
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    v.Parent = game.Players.LocalPlayer.Character
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = realtarget2.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                if em then
                    if chaosmode then
                        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill1"})
                    else
                        if math.random(1,5) == 5 then
                            game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill1"})
                        end
                    end
                end
                if rm then
                    if chaosmode then
                        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill2"})
                    else
                        if math.random(1,5) == 5 then
                            game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill2"})
                        end
                    end
                end
                if fm then
                    if chaosmode then
                        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill3"})
                    else
                        if math.random(1,5) == 5 then
                            game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill3"})
                        end
                    end
                end
                if vm then
                    if chaosmode then
                    game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill4"})
                    else    
                        if math.random(1,5) == 5 then
                            game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill4"})
                        end
                    end
                end
                if tm then
                    if chaosmode then
                        wait(0.5)
                        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill5"})
                    else
                        if math.random(1,5) == 5 then
                            wait(0.5)
                            game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("useSkill",{"skill5"})
                        end
                    end
                end
                game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("melee",{false})
                wait()
            end
            wait()
        until not game.Players.LocalPlayer.PlayerGui.ScreenGui.questMsg.Visible
        wait()
    end
end})

farm2Tab:AddToggle({ Name = "chaos mode (spams moves)", Default = false, Callback = function(Value)
chaosmode = Value
end})

farm2Tab:AddToggle({ Name = "e move", Default = false, Callback = function(Value)
em = Value
end})

farm2Tab:AddToggle({ Name = "r move", Default = false, Callback = function(Value)
rm = Value
end})

farm2Tab:AddToggle({ Name = "f move", Default = false, Callback = function(Value)
fm = Value
end})

farm2Tab:AddToggle({ Name = "v move", Default = false, Callback = function(Value)
vm = Value
end})

farm2Tab:AddToggle({ Name = "t move", Default = false, Callback = function(Value)
tm = Value
end})

Tab:AddButton({Name = "codes",Callback = function()
    for i = 1,#codes do
        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("codeEnter",{codes[i]})
    end
end})

Tab:AddParagraph("yoink","use yoink all with farm 2 if you want souls")
getgenv().soult2 = false
Tab:AddToggle({ Name = "yoink all proximity prompts nearby", Default = false, Callback = function(Value)
soult2 = Value 
while soult2 do
    wait()
    for _,v in pairs(game.Workspace.special:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            fireproximityprompt(v)
        end
    end
end
end})

getgenv().soult = false
Tab:AddToggle({ Name = "yoink souls", Default = false, Callback = function(Value)
soult = Value 
while soult do
    if #game.Workspace.special:GetChildren() ~= 0 then
        for _,v in pairs(game.Workspace.special:GetChildren()) do
            if v.Name == "white" and hss then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Center.CFrame 
                fireproximityprompt(v.ProximityPrompt)
            elseif v.Name == "red" and rss then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Center.CFrame 
                fireproximityprompt(v.ProximityPrompt)
            end
            wait()
        end
    end
    wait()
end
end})

Tab:AddToggle({ Name = "white/human souls", Default = false, Callback = function(Value)
hss = Value
end})

Tab:AddToggle({ Name = "red souls", Default = false, Callback = function(Value)
rss = Value
end})

getgenv().autoreso = false
weaponTab:AddToggle({ Name = "auto resonate", Default = false, Callback = function(Value)
autoreso = Value 
while autoreso do 
    wait(0.3)
    game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("resonate",{true})
end
end})

weaponTab:AddButton({Name = "kill meister",Callback = function()
    for i = 1,25 do
        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("resonate",{false})
    end 
end})

tpTab:AddSection({Name = "Default TP's"})

tpTab:AddButton({Name = "Desert",Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(826.852478, -7.93378839, 213.161667, 0.999941766, -5.25698916e-08, -0.0107900938, 5.1859363e-08, 1, -6.61299566e-08, 0.0107900938, 6.55665389e-08, 0.999941766)
end})

tpTab:AddButton({Name = "High Land",Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381.877869, -8.31986818, 1211.42273, 0.999941766, 1.55132689e-08, -0.0107900938, -1.53035824e-08, 1, 1.95158041e-08, 0.0107900938, -1.93495406e-08, 0.999941766)
end})

tpTab:AddButton({Name = "DWMA",Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-316.658936, 93.29561, 502.138184, 0.999941766, -4.3162796e-08, -0.0107900938, 4.25795115e-08, 1, -5.42871632e-08, 0.0107900938, 5.38245644e-08, 0.999941766)
end})

tpTab:AddButton({Name = "Smallville",Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1043.50684, -12.2092262, 412.287445, 0.999941766, -1.61491513e-08, -0.0107900938, 1.59309632e-08, 1, -2.03071142e-08, 0.0107900938, 2.01340349e-08, 0.999941766)
end})

tpTab:AddSection({Name = "Custom TP's"})

tpTab:AddButton({Name = "Medusa Serpant",Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1158.13135, 27.3865776, -14.2587681, 0.901395321, 7.55439533e-09, -0.432997048, 1.15415846e-08, 1, 4.14735517e-08, 0.432997048, -4.23815365e-08, 0.901395321)
end})


spawn(function()
    while wait() do
        if game.Players.LocalPlayer.tempStats.partner.Value ~= nil then
            local partner = game.Players.LocalPlayer.tempStats.partner.Value
        end
    end
end)
