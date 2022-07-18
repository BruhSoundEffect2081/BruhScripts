local mt = getrawmetatable(game)
make_writeable(mt)

local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "FireServer" and tostring(self) == "moddelteasdasd123" then
       return
    end
    return namecall(self, table.unpack(args))
end)

local sarah = game:GetService("Workspace").Sarah
function bruhbuttonfire(whatbutton)
    local events = { "MouseButton1Click", "MouseButton1Down", "Activated" }
    for i, v in next, events do 
        firesignal(whatbutton[v]) 
    end
end

local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()
local MainUI = UILibrary.Load("project kys")
local FirstPage = MainUI.AddPage("Home")

getgenv().t = false 
FirstPage.AddToggle("Hello", false, function(Value)
t = Value 
while t do 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = sarah.HumanoidRootPart.CFrame
    wait(15)
    local args = {
        [1] = "AddQuest",
        [2] = "Players."..game.Players.LocalPlayer.Name..".PlayerGui.Npc_Dialogue.LocalScript.Functions",
        [3] = math.huge,
        [4] = game:GetService("ReplicatedStorage").Player_Data.IamAwesomeLikeOreoz.Quest,
        [5] = {
            ["Current"] = "Help Sarah pick rice",
            ["List"] = {
                [1] = {
                    ["Name"] = "pick 4 strings of rice",
                    ["Progress"] = {
                        [1] = 0,
                        [2] = 4
                    }
                }
            }
        }
    }
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
    repeat task.wait() until #game.Workspace["StarterVillage_RiceStrings"]:GetChildren() >= 5
    for _,v in pairs(game.Workspace["StarterVillage_RiceStrings"]:GetChildren()) do 
        if v.Name ~= "Script" then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(1)
            fireproximityprompt(v.Rice_pick_proximity)
        end
    end
    wait(15)
    end
end)
