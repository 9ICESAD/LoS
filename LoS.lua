--[[  
   ██████╗ ██╗   ██╗     ██████╗ ███╗   ██╗
  ██╔═══██╗╚██╗ ██╔╝    ██╔═══██╗████╗  ██║
  ██║   ██║ ╚████╔╝     ██║   ██║██╔██╗ ██║
  ██║▄▄ ██║  ╚██╔╝      ██║   ██║██║╚██╗██║
  ╚██████╔╝   ██║       ╚██████╔╝██║ ╚████║
   ╚══▀▀═╝    ╚═╝        ╚═════╝ ╚═╝  ╚═══╝
     === Modified & Rebranded By 9ICE ===
 🔥 สคริปต์แม่งรวบของเก่า ทำใหม่ เท่ขึ้น 🔥
]]

-- Speed & Jump Hack
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100

-- Auto Touch (Orbs/Rings/Gems)
spawn(function()
    while wait(0.2) do
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                local part = v.Parent
                if part and part:IsA("BasePart") then
                    pcall(function()
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, part, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, part, 1)
                    end)
                end
            end
        end
    end
end)

-- Anti-AFK
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

print("✅ Script Loaded - By 9ICE 🔥")
