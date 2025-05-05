if game.PlaceId ~= 113792966928441 then
    game.Players.LocalPlayer:Kick("Not Blox Only") return
end

local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Setting/refs/heads/main/427daa95-6994-4738-805e-c1c4c5b577c7.txt"))()
local v2 = v1:AddWindows()
local v3 = v2:T({ Name = "\70\97\114\109" })
local v4 = v3:AddSection("Left", { Name = "" })
local v5 = false

v4:AddToggle({
    Name = "\70\97\114\109 \67\104\101\115\116 \84\80",
    Callback = function(v6)
        v5 = v6
        if v5 then
            task.spawn(function()
                local v7 = game.Players.LocalPlayer
                local v8 = v7.Character or v7.CharacterAdded:Wait()
                local v9 = v8:WaitForChild("HumanoidRootPart")
                local v10 = workspace:WaitForChild("ChestModels")
                local v11 = {"GoldChest", "DiamondChest", "SilverChest"}
                local function v12()
                    local v13 = {}
                    for _, v14 in pairs(v10:GetChildren()) do
                        for _, v15 in ipairs(v11) do
                            if v14.Name == v15 then
                                local v16 = v14.PrimaryPart or v14:FindFirstChildWhichIsA("BasePart")
                                if v16 then
                                    table.insert(v13, v16)
                                end
                            end
                        end
                    end
                    return v13
                end
                while v5 do
                    for _, v17 in ipairs(v12()) do
                        if not v5 then break end
                        if v17 and v17:IsDescendantOf(workspace) then
                            v9.CFrame = v17.CFrame + Vector3.new(0, 5, 0)
                            task.wait(1.2)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

v4:AddButton({
    Name = "\84\105\116\108\101\115",
    Callback = function()
        local v18 = game.Players.LocalPlayer
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
        v18.PlayerGui.Main.Titles.Visible = true
    end
})

local v19 = v2:T({ Name = "\84\97\98\32\100\105\99\104\32\99\104\117\121\787;" })
local v20 = v19:AddSection("Left", { Name = "Islands" })
local v21 = {
    ["\272\7843\32\72\111\7843\32\66\259\110\103"] = Vector3.new(-5444, 16, -5245),
    ["\272\7845\117\32\116\114\432\147\110\103"] = Vector3.new(3755, 15, -3497),
    ["\86\432\417\110\103"] = Vector3.new(-4, 19, 2821),
    ["\72\7907\110"] = Vector3.new(-3058, 239, -10188),
    ["\84\104\117\7927\110\32\109\97"] = Vector3.new(923, 125, 32853),
    ["\78\103\104\xC4\83"] = Vector3.new(-5398, 48, -737),
    ["\75\104\117\32\118\7921\99"] = Vector3.new(-2267, 73, -2686),
    ["\76\226\187\147\32\98\259\110\103"] = Vector3.new(5988, 294, -6648),
    ["\272\7843\32\105\110\100\114\97"] = Vector3.new(-26820, 7, 385),
    ["\272\7843\32\116\114\7901\105"] = Vector3.new(-262, 49326, -35270),
    ["\78\250\105\32\116\117\121\787"] = Vector3.new(793, 412, -5251),
    ["\81\117\225\110\32\99\224\32\112\104\234"] = Vector3.new(-385, 73, 297)
}
for v22, v23 in pairs(v21) do
    v20:AddButton({
        Name = v22,
        Callback = function()
            local v24 = game.Players.LocalPlayer
            local v25 = v24.Character or v24.CharacterAdded:Wait()
            v25:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v23 + Vector3.new(0, 5, 0))
        end
    })
end

v20:AddButton({ Name = "Teleport to Sea 1", Callback = function() if game.PlaceId ~= 2753915549 then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain") end end })
v20:AddButton({ Name = "Teleport to Sea 2", Callback = function() if game.PlaceId ~= 4442272183 then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") end end })
v20:AddButton({ Name = "Teleport to Sea 3", Callback = function() if game.PlaceId ~= 7449423635 then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") end end })

local v26 = v2:T({ Name = "Shop" })
local v27 = v26:AddSection("Left", { Name = "\67\7911\32\104\224\110\103" })

local function v28(...) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(...) end

v27:AddButton({ Name = "Reset Stats", Callback = function() v28("BlackbeardReward", "Refund", "1") v28("BlackbeardReward", "Refund", "2") end })
v27:AddButton({ Name = "Race Reroll", Callback = function() v28("BlackbeardReward", "Reroll", "1") v28("BlackbeardReward", "Reroll", "2") end })

local v29 = false
v27:AddToggle({
    Name = "Auto Random Fruit",
    Callback = function(v30)
        v29 = v30
        if v29 then
            task.spawn(function()
                while v29 do
                    pcall(function() v28("Cousin", "Buy") end)
                    task.wait(0.001)
                end
            end)
        end
    end
})

v27:AddButton({ Name = "Buy GodHuman", Callback = function() v28("BuyGodhuman") end })

local v31 = v2:T({ Name = "Setting" })
local v32 = v31:AddSection("Left", { Name = "Fast Attack" })
local v33 = false

local function v34()
    for _, v35 in pairs(getgc(true)) do
        if type(v35) == "function" and getfenv(v35).script and debug.getinfo(v35).name == "attack" then
            return v35
        end
    end
end

v32:AddToggle({
    Name = "Fast Attack",
    Callback = function(v36)
        v33 = v36
        if v33 then
            task.spawn(function()
                local v37 = v34()
                while v33 do
                    pcall(function()
                        local v38 = game.Players.LocalPlayer
                        local v39 = v38.Character or v38.CharacterAdded:Wait()
                        local v40 = v39:FindFirstChildOfClass("Tool")
                        if v40 and v37 then v37() end
                    end)
                    task.wait(0.01)
                end
            end)
        end
    end
})
