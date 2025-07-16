-- GUI By 9ICE 🐒🔥 - Fix UI หาย

-- รอ PlayerGui ชัวร์ๆ
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- UI ที่ไม่หายตอนรีเซ็ต
local screen = Instance.new("ScreenGui")
screen.Name = "LoS_GUI_By_9ICE"
screen.ResetOnSpawn = false -- 💥 จุดสำคัญ
screen.Parent = gui

-- Frame เท่ๆ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0, 20, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 2
frame.Parent = screen

-- ปุ่มเปิด/ปิด Auto Orbs
local autoBtn = Instance.new("TextButton")
autoBtn.Size = UDim2.new(0, 180, 0, 50)
autoBtn.Position = UDim2.new(0, 10, 0, 20)
autoBtn.Text = "🔄 Toggle Auto Orbs"
autoBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
autoBtn.TextColor3 = Color3.new(1, 1, 1)
autoBtn.Parent = frame

-- ฟังก์ชัน Auto Touch
local running = false
local loop

autoBtn.MouseButton1Click:Connect(function()
    running = not running
    autoBtn.Text = running and "✅ Auto Orbs: ON" or "🔄 Auto Orbs: OFF"
    if running then
        loop = game:GetService("RunService").RenderStepped:Connect(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    local part = v.Parent
                    if part and part:IsA("BasePart") then
                        pcall(function()
                            firetouchinterest(player.Character.HumanoidRootPart, part, 0)
                            firetouchinterest(player.Character.HumanoidRootPart, part, 1)
                        end)
                    end
                end
            end
        end)
    else
        if loop then loop:Disconnect() end
    end
end)

print("✅ UI Loaded - ลิงปั่นไฟ by 9ICE 🐒🔥")
