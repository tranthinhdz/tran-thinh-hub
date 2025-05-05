local MaruLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Setting/refs/heads/main/427daa95-6994-4738-805e-c1c4c5b577c7.txt"))()
local A = MaruLib:AddWindows()

-- MAIN TAB
local T1 = A:T({ Name = "Main" })
local I = T1:AddSection("Left", { Name = "" })

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

I:AddButton({
Name = "Titles",
Callback = function()
local Player = game.Players.LocalPlayer
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
Player.PlayerGui.Main.Titles.Visible = true
end
})

-- TELEPORT TAB
local T2 = A:T({ Name = "Tab dịch chuyển" })
local TeleportSection = T2:AddSection("Left", { Name = "Islands" })

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
Name = name,
Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
hrp.CFrame = CFrame.new(position + Vector3.new(0, 5, 0))
end
})
end

TeleportSection:AddButton({
Name = "Teleport to Sea 1",
Callback = function()
if game.PlaceId ~= 2753915549 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end
end
})

TeleportSection:AddButton({
Name = "Teleport to Sea 2",
Callback = function()
if game.PlaceId ~= 4442272183 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
end
})

TeleportSection:AddButton({
Name = "Teleport to Sea 3",
Callback = function()
if game.PlaceId ~= 7449423635 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
end
})

-- SHOP TAB
local T3 = A:T({ Name = "Shop" })
local Shop = T3:AddSection("Left", { Name = "Cửa hàng" })

local function FireRemote(...)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(...)
end

Shop:AddButton({
Name = "Reset Stats",
Callback = function()
FireRemote("BlackbeardReward", "Refund", "1")
FireRemote("BlackbeardReward", "Refund", "2")
end
})

Shop:AddButton({
Name = "Race Reroll",
Callback = function()
FireRemote("BlackbeardReward", "Reroll", "1")
FireRemote("BlackbeardReward", "Reroll", "2")
end
})

-- Auto Random Fruit nhanh hơn
local autoRandomFruit = false
Shop:AddToggle({
Name = "Auto Random Fruit",
Callback = function(state)
autoRandomFruit = state
if autoRandomFruit then
task.spawn(function()
while autoRandomFruit do
pcall(function()
FireRemote("Cousin", "Buy")
end)
task.wait(0.001) -- tốc độ random nhanh hơn
end
end)
end
end
})

Shop:AddButton({
Name = "Buy GodHuman",
Callback = function()
FireRemote("BuyGodhuman")
end
})

-- SETTING TAB
local T4 = A:T({ Name = "Setting" })
local SettingSection = T4:AddSection("Left", { Name = "Fast Attack" })

local superFastAttack = false
local function getAttackFunction()
for _, func in pairs(getgc(true)) do
if type(func) == "function" and getfenv(func).script and debug.getinfo(func).name == "attack" then
return func
end
end
return nil
end

SettingSection:AddToggle({
Name = "Fast Attack",
Callback = function(state)
superFastAttack = state
if superFastAttack then
task.spawn(function()
local attackFunc = getAttackFunction()
while superFastAttack do
pcall(function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local tool = character:FindFirstChildOfClass("Tool")
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

