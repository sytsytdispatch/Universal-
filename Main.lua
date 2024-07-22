local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
print("successfully injected Key system")
local Window = Rayfield:CreateWindow({
   Name = "Universal plus+",
   LoadingTitle = "Universal Plus is loading..",
   LoadingSubtitle = "by Sirius and sytsytdispatch",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Blackyhub121"
   },
   Discord = {
      Enabled = false,
      Invite = "Cf3cmK5uwB",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Verify you are not a bot",
      Subtitle = "The key is on the side",
      Note = "Key: VERIFY123",
      FileName = "Blackyhub1212",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"VERIFY123"}
   }
})
print("User is a Human")
local Tab = Window:CreateTab("Local Player", nil)
local TPTab = Window:CreateTab("Teleportation", nil) -- Title, Image
local AETab = Window:CreateTab("ESP and Aimbot", nil) -- Title, Image

print("Successfully injected Universal++")
local Slider1 = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 150},
   Increment = 10,
   Suffix = "Are you the flash?",
   CurrentValue = 16,
   Flag = "Slider1",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local Slider2 = Tab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 200},
   Increment = 10,
   Suffix = "How high can ya go?",
   CurrentValue = 50,
   Flag = "Slider2",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local Button = Tab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
      infiniteJumpEnabled = not infiniteJumpEnabled -- Toggle the boolean

      if infiniteJumpEnabled then
         -- Enable infinite jump (no delay)
         game:GetService("UserInputService").JumpRequest:connect(function()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
         end)
         print("Infinite Jump Enabled")
      else
         -- Disable infinite jump (normal delay)
         game:GetService("UserInputService").JumpRequest:disconnect()
         print("Infinite Jump Disabled")
      end
   end
})

local Button = Tab:CreateButton({
   Name = "Shift to ZOOM",
   Callback = function()
   -- Define the player and initial walking speed
local player = game.Players.LocalPlayer
local walkingSpeed = 16  -- Default walking speed

-- Function to handle key press events
local function onKeyPress(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        -- Increase walking speed when Shift is pressed
        player.Character.Humanoid.WalkSpeed = 100
    end
end

-- Function to handle key release events
local function onKeyRelease(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        -- Reset walking speed when Shift is released
        player.Character.Humanoid.WalkSpeed = walkingSpeed
    end
end

-- Connect key press and release events
game:GetService("UserInputService").InputBegan:Connect(onKeyPress)
game:GetService("UserInputService").InputEnded:Connect(onKeyRelease)

   end,
})

    local Button = TPTab:CreateButton({
   Name = "CNTL + click to TP",
   Callback = function()
   local UIS = game:GetService("UserInputService")

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()


function GetCharacter()
   return game.Players.LocalPlayer.Character
end

function Teleport(pos)
   local Char = GetCharacter()
   if Char then
       Char:MoveTo(pos)
   end
end


UIS.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
       Teleport(Mouse.Hit.p)
   end
end)
   end,
})


local Button = TPTab:CreateButton({
   Name = "TP to nearest person (press V)",
   Callback = function()
   -- Define the key you want to use for teleporting
local teleportKey = Enum.KeyCode.V

-- Function to calculate distance between two points
local function distance(pos1, pos2)
    return (pos1 - pos2).magnitude
end

-- Function to find the nearest player
local function findNearestPlayer()
    local players = game.Players:GetPlayers()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local myPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    for _, player in ipairs(players) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local playerPosition = character.HumanoidRootPart.Position
                local dist = distance(myPosition, playerPosition)
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

-- Teleport function
local function teleportToNearestPlayer()
    local nearestPlayer = findNearestPlayer()
    if nearestPlayer then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(nearestPlayer.Character.HumanoidRootPart.Position)
        end
    else
        print("No other players found.")
    end
end

-- Bind the teleport function to the key press
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == teleportKey then
        teleportToNearestPlayer()
    end
end)

   end,
})

Rayfield:Notify({
   Title = "Universal++",
   Content = "Welcome to Universal ++!",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "got it!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Slider = Tab:CreateSlider({
   Name = "Spin Speed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Currently bugged, reset to stop",
   CurrentValue = 0,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 -- Parameters
local spinSpeed = (Value)  -- Initial spin speed (adjust as needed)
local character = game.Players.LocalPlayer.Character
local humanoid = character:WaitForChild("Humanoid")

-- Function to make the character spin
local function spinCharacter()
    while true do
        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
        wait(0.1 / spinSpeed)  -- Adjust speed based on spinSpeed
    end
end

-- Call the function to start spinning
spinCharacter()

   end,
})

local Button = AETab:CreateButton({
   Name = "Head ESP (z to toggle)",
   Callback = function()
   -- Constants
local ESPActive = false  -- Variable to track if ESP is active

-- Function to handle head highlighting
local function HighlightHeads()
    if ESPActive then
        for _, player in ipairs(game.Players:GetPlayers()) do
            -- Skip the local player
            if player ~= game.Players.LocalPlayer then
                -- Get player's character
                local character = player.Character
                if character then
                    -- Get player's head
                    local head = character:FindFirstChild("Head")
                    if head then
                        -- Check if head already has a highlight
                        local existingHighlight = head:FindFirstChild("HeadHighlight")
                        if not existingHighlight then
                            -- Create a highlight effect
                            local highlight = Instance.new("BoxHandleAdornment")
                            highlight.Name = "HeadHighlight"
                            highlight.Size = head.Size * 1.1  -- Slightly bigger than the head
                            highlight.Adornee = head
                            highlight.ZIndex = 1
                            highlight.AlwaysOnTop = true
                            highlight.Transparency = 0.5
                            -- Set color based on team
                            if player.Team == game.Players.LocalPlayer.Team then
                                highlight.Color3 = Color3.new(0, 1, 0)  -- Green for same team
                            else
                                highlight.Color3 = Color3.new(1, 0, 0)  -- Red for different team
                            end
                            highlight.Parent = head
                        end
                    end
                end
            end
        end
    else
        -- Remove all existing highlights if ESP is toggled off
        for _, player in ipairs(game.Players:GetPlayers()) do
            local character = player.Character
            if character then
                local head = character:FindFirstChild("Head")
                if head then
                    local existingHighlight = head:FindFirstChild("HeadHighlight")
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                end
            end
        end
    end
end

-- Function to toggle ESP
local function ToggleESP()
    ESPActive = not ESPActive
    if ESPActive then
        HighlightHeads()  -- Call to activate ESP
    else
        HighlightHeads()  -- Call to deactivate ESP (removes highlights)
    end
end

-- Create the button to toggle ESP
local Button = AETab:CreateButton({
    Name = "Head ESP",
    Callback = ToggleESP,
})


   end,
})

local Button = AETab:CreateButton({
   Name = "Aimbot coming soon :)",
   Callback = function()
   print("Aimbot coming soon...")
   end,
})
