local M = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Setting/refs/heads/main/427daa95-6994-4738-805e-c1c4c5b577c7.txt"))()
local A = M:AW()

-- MAIN TAB
local T1 = A:T({ N = "Main" })
local I = T1:AS("Left", { N = "" })

local af = false
I:AT({
N = "Farm chest tp",
CB = fn(state)
af = state
if af then
task.spawn(fn()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local hrp = c:WaitForChild("HumanoidRootPart")
local chestFolder = workspace:WaitForChild("ChestModels")
local chestNames = {"GoldChest", "DiamondChest", "SilverChest"}

local fn getAllChests()  
                local chests = {}  
                for _, chest in pairs(chestFolder:GetChildren()) do  
                    for _, name in ipairs(chestNames) do  
                        if chest.N == name then  
                            local part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")  
                            if part then  
                                table.insert(chests, part)  
                            end  
                        end  
                    end  
                end  
                return chests  
            end  

            while af do  
                local chests = getAllChests()  
                for _, chest in ipairs(chests) do  
                    if not af then break end  
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

I:AddButton({
N = "Titles",
CB = fn()
local Player = game.Players.LocalPlayer
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
Player.PlayerGui.Main.Titles.Visible = true
end
})

-- TELEPORT TAB
local T2 = A:T({ N = "Tab dịch chuyển" })
local TeleportSection = T2:AS("Left", { N = "Islands" })

local islands = {
["Đảo Hoả Băng"] = Vector3.new(-5444, 16, -5245),
["Đấu trường bóng tối"] = Vector3.new(3755, 15, -3497),
["Vương quốc hoa hồng"] = Vector3.new(-4, 19, 2821),
["Hòn đảo bị lãng quên"] = Vector3.new(-3058, 239, -10188),
["Thuyền ma"] = Vector3.new(923, 125, 32853),
["Nghĩa địa"] = Vector3.new(-5398, 48, -737),
["Khu vực xanh"] = Vector3.new(-2267, 73, -2686),
["Lâu đài băng giá"] = Vector3.new(5988, 294, -6648),
["Đảo đánh rip_indra"] = Vector3.new(-26820, 7, 385),
["Đảo trời"] = Vector3.new(-262, 49326, -35270),
["Núi tuyết"] = Vector3.new(793, 412, -5251),
["Quán cà phê"] = Vector3.new(-385, 73, 297)
}

for name, position in pairs(islands) do
TeleportSection:AddButton({
N = name,
CB = fn()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local hrp = c:WaitForChild("HumanoidRootPart")
hrp.CFrame = CFrame.new(position + Vector3.new(0, 5, 0))
end
})
end

TeleportSection:AddButton({
N = "Teleport to Sea 1",
CB = fn()
if game.PlaceId ~= 2753915549 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end
end
})

TeleportSection:AddButton({
N = "Teleport to Sea 2",
CB = fn()
if game.PlaceId ~= 4442272183 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end
})

TeleportSection:AddButton({
N = "Teleport to Sea 3",
CB = fn()
if game.PlaceId ~= 7449423635 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
end
})

-- SHOP TAB
local T3 = A:T({ N = "Shop" })
local Shop = T3:AS("Left", { N = "Cửa hàng" })

local fn FireRemote(...)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(...)
end

Shop:AddButton({
N = "Reset Stats",
CB = fn()
FireRemote("BlackbeardReward", "Refund", "1")
FireRemote("BlackbeardReward", "Refund", "2")
end
})

Shop:AddButton({
N = "Race Reroll",
CB = fn()
FireRemote("BlackbeardReward", "Reroll", "1")
FireRemote("BlackbeardReward", "Reroll", "2")
end
})

-- Auto Random Fruit nhanh hơn
local autoRandomFruit = false
Shop:AT({
N = "Auto Random Fruit",
CB = fn(state)
autoRandomFruit = state
if autoRandomFruit then
task.spawn(fn()
while autoRandomFruit do
pcall(fn()
FireRemote("Cousin", "Buy")
end)
task.wait(0.001) -- tốc độ random nhanh hơn
end
end)
end
end
})

Shop:AddButton({
N = "Buy GodHuman",
CB = fn()
FireRemote("BuyGodhuman")
end
})

-- SETTING TAB
local T4 = A:T({ N = "Setting" })
local SettingSection = T4:AS("Left", { N = "Fast Attack" })

local superFastAttack = false
local fn getAttackFunction()
for _, func in pairs(getgc(true)) do
if type(func) == "fn" and getfenv(func).script and debug.getinfo(func).name == "attack" then
return func
end
end
return nil
end

SettingSection:AT({
N = "Fast Attack",
CB = fn(state)
superFastAttack = state
if superFastAttack then
task.spawn(fn()
local attackFunc = getAttackFunction()
while superFastAttack do
pcall(fn()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local tool = c:FindFirstChildOfClass("Tool")
if tool and attackFunc then
attackFunc()
end
end)
task.wait(0.01)
end
end)
end
end
})
