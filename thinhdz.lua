
local MaruLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Setting/refs/heads/main/427daa95-6994-4738-805e-c1c4c5b577c7.txt"))()
local A = MaruLib:AddWindows()
local T1 = A:T({ Name = "Main", })

local I = T1:AddSection("Left", {
    Name = ""
})

-- Auto Farm Chest TP Toggle
local autofarm = false
I:AddToggle({
    Name = "Farm chest tp",
    Callback = function(state)
        autofarm = state
        if autofarm then
            task.spawn(function()
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")
                
                local chestFolder = workspace:WaitForChild("ChestModels")
                local chestNames = {"GoldChest", "DiamondChest", "SilverChest"}
                
                local function getAllChests()
                    local chests = {}
                    for _, chest in pairs(chestFolder:GetChildren()) do
                        for _, name in ipairs(chestNames) do
                            if chest.Name == name then
                                local part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")
                                if part then
                                    table.insert(chests, part)
                                end
                            end
                        end
                    end
                    return chests
                end
                
                while autofarm do
                    local chests = getAllChests()
                    for _, chest in ipairs(chests) do
                        if not autofarm then break end
                        if chest and chest:IsDescendantOf(workspace) then
                            hrp.CFrame = chest.CFrame + Vector3.new(0, 5, 0)
                            task.wait(1.2)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})