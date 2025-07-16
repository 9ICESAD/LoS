--[[  
🔥 Modified by 9ICE 🐒🔥
Fix version - Speed, Jump, Auto Orbs + Anti-AFK
]]

local player = game.Players.LocalPlayer

-- รอให้ Character เกิดก่อน
if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
    player.CharacterAdded:Wait()
end

local char = player.Character
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")

-- Speed & Jump
hum.WalkSpeed = 100
hum.JumpPower = 100

-- Auto Collect Orbs / Rings / Gems
spawn(function()
    while wait(0.5) do
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    local part = v.Parent
                    if part and part:IsA("BasePart") then
                        firetouchinterest(hrp, part, 0)
                        firetouchinterest(hrp, part, 1)
                    end
                end
            end
        end)
    end
end)

-- Anti-AFK
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

print("✅ Script Fixed & Loaded - By 9ICE 🔥")
