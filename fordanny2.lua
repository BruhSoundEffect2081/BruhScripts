repeat
    task.wait()
until game.Workspace.characters:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "made by Oreoz#6390", HidePremium = false, IntroEnabled = false})
local Tab = Window:MakeTab({Name = "stuff",Icon = "rbxassetid://0",PremiumOnly = false})
local tpTab = Window:MakeTab({Name = "tp stuff",Icon = "rbxassetid://0",PremiumOnly = false})

local codes = {"friendly","powerhouse"}
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
        local ot2 = {}
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

Tab:AddButton({Name = "codes",Callback = function()
    for i = 1,#codes do
        game:GetService("ReplicatedStorage").remotes.remoteEvent:FireServer("codeEnter",{codes[i]})
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
