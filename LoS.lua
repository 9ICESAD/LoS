--[[  
 ██████╗ ██╗   ██╗     ██████╗ ███╗   ██╗
██╔═══██╗╚██╗ ██╔╝    ██╔═══██╗████╗  ██║
██║   ██║ ╚████╔╝     ██║   ██║██╔██╗ ██║
██║▄▄ ██║  ╚██╔╝      ██║   ██║██║╚██╗██║
╚██████╔╝   ██║       ╚██████╔╝██║ ╚████║
 ╚══▀▀═╝    ╚═╝        ╚═════╝ ╚═╝  ╚═══╝
=== Script Made By 9ICE ===
🔥 ลิงปั่นไฟ GUI Edition 🔥
]]

-- UI Library ง่ายๆ จาก Roblox GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local AutoFarmButton = Instance.new("TextButton")
local SpeedButton = Instance.new("TextButton")
local JumpButton = Instance.new("TextButton")

-- Parent GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "Legend9ICEGui"

-- Frame
Frame.Size = UDim2.new(0, 200, 0, 250)
Frame.Position = UDim2.new(0, 20, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui

-- ปุ่ม Auto Farm
AutoFarmButton.Size = UDim2.new(0, 180, 0, 50)
AutoFarmButton.Position = UDim2.new(0, 10, 0, 20)
AutoFarmButton.Text = "🔄 Toggle Auto Orbs"
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.Parent = Frame

-- ปุ่ม Speed Hack
SpeedButton.Size = UDim2.new(0, 180, 0, 50)
SpeedButton.Position = UDim2.new(0, 10, 0, 80)
SpeedButton.Text = "⚡ Toggle Speed Hack"
SpeedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.Parent = Frame

-- ปุ่ม Jump Hack
JumpButton.Size = UDim2.new(0, 180, 0, 50)
JumpButton.Position = UDim2.new(0, 10, 0, 140)
JumpButton.Text = "🪂 Toggle Jump Hack"
JumpButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
JumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpButton.Parent = Frame

--== Variables ==--
local autoFarm = false
local speedHack = false
local jumpHack = false
local afkBypass = false

--== Functions ==--

-- Auto Collect Function
spawn(function()
	while true do wait(0.5)
		if autoFarm then
			for _, v in pairs(workspace:GetChildren()) do
				if v:FindFirstChild("TouchInterest") then
					pcall(function()
						firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
						firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
					end)
				end
			end
		end
	end
end)

-- Anti-AFK (เปิดตลอด)
if not afkBypass then
	afkBypass = true
	game:GetService("Players").LocalPlayer.Idled:Connect(function()
		game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
end

--== Button Events ==--

AutoFarmButton.MouseButton1Click:Connect(function()
	autoFarm = not autoFarm
	AutoFarmButton.Text = autoFarm and "✅ Auto Orbs: ON" or "🔄 Auto Orbs: OFF"
end)

SpeedButton.MouseButton1Click:Connect(function()
	speedHack = not speedHack
	local speed = speedHack and 200 or 16
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
	SpeedButton.Text = speedHack and "✅ Speed: ON" or "⚡ Speed: OFF"
end)

JumpButton.MouseButton1Click:Connect(function()
	jumpHack = not jumpHack
	local jump = jumpHack and 150 or 50
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
	JumpButton.Text = jumpHack and "✅ Jump: ON" or "🪂 Jump: OFF"
end)

--== Load Log ==
print("✅ GUI Script Legends of Speed By 9ICE Loaded!")