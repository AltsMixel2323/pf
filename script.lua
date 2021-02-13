userlink = "https://raw.githubusercontent.com/AltsMixel2323/pf/kp/user"
usernames = game:HttpGet(userlink, true)
current = game.Players.LocalPlayer.Name
if string.find(usernames,current) then -- whitelist

useridlink = "https://raw.githubusercontent.com/AltsMixel2323/pf/kp/userid"
userids = game:HttpGet(useridlink, true)
currentid = game.Players.LocalPlayer.UserId
if string.find(userids,currentid) then
 shared.VerifyStatus = "Verified :white_check_mark:"
else
 shared.VerifyStatus = "Verifyn't :warning:"
end
loadstring(game:HttpGet(('https://raw.githubusercontent.com/AltsMixel2323/pf/kp/discordid')))()

if game.PlaceId == 4520749081 then
 shared.WorldType = "First Sea"
elseif game.PlaceId == 6381829480 then
 shared.WorldType = "Second Sea"
elseif game.PlaceId == 5931540094 then
 shared.WorldType = "Raid"
end
shared.PlayerName = game.Players.LocalPlayer.Name
shared.PlayerUserID = game.Players.LocalPlayer.UserId
local http_request = http_request
if syn then
 http_request = syn.request
elseif SENTINEL_V2 then
 function http_request(tb)
  return {
   StatusCode = 200;
   Body = request(tb.Url, tb.Method, (tb.Body or ''))
  }
 end
end
local HttpServ = game:GetService('HttpService')
local Webhook = "https://discord.com/api/webhooks/810023710810701845/YCceUM1J6xbd5N7EIdtBfaUXBrQ_TvHS7fRRc6a1RpedgUe1r1Jm37Ueueo6DstbnLNw"
local data = {
 ["content"] = "",
 ["embeds"] = {{
  ["title"] = "Private Features Executed",
  ["fields"] = {
   {
    ["name"] = "Name",
    ["value"] = shared.PlayerName,
	["inline"] = true
   },
   {
    ["name"] = "UserID",
    ["value"] = shared.PlayerUserID,
	["inline"] = true
   },
   {
    ["name"] = "Type of World",
    ["value"] = shared.WorldType,
	["inline"] = true
   },
   {
    ["name"] = "Verify Status",
    ["value"] = shared.VerifyStatus,
	["inline"] = true
   },
   {
    ["name"] = "Discord ID",
    ["value"] = shared.DiscordID,
	["inline"] = true
   }
  },
  ["type"] = "rich",
  ["color"] = tonumber(0xBDCF46),
 }}
}
local newdata = HttpServ:JSONEncode(data)
local headers = {
 ["content-type"] = "application/json"
}
local request_payload = {Url=Webhook, Body=newdata, Method="POST", Headers=headers}
http_request(request_payload)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AltsegoD/GUILibs/egoD/Azure", true))()

local WeaponList = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
 if v:IsA("Tool") then
  table.insert(WeaponList,v.Name)
 end
end
local Player = game.Players.LocalPlayer
local mouse = Player:GetMouse()

local window = library:CreateTab("King Piece PF", "King Piece Private Feature", true)
window:CreateLabel(("Welcome " .. game.Players.LocalPlayer.Name))
if game.PlaceId == 4520749081 then
window:CreateDropDown("Select Weapon", WeaponList, function(PFWeaponDropdown)
    shared.pfweapon = PFWeaponDropdown
end)
window:CreateToggle("Monster Farm", false, function(ToggleMonsterFarm)
   shared.togglemonsterfarm = ToggleMonsterFarm
if shared.togglemonsterfarm == false then
 game:getService("RunService"):UnbindFromRenderStep("MonsterFarmNoclip")
end
if shared.togglemonsterfarm == true then
 if not shared.pfweapon then
  game.StarterGui:SetCore("SendNotification", {
  Title = "Weapon not found!";
  Text = "Please put ur weapon name";
  Duration = 20;
  })
 end
 if shared.togglemobfarm == true then
  game.StarterGui:SetCore("SendNotification", {
  Title = "Disable Mob Farm";
  Text = "Please disable Boss Farm or Monster Farm will not work!";
  Duration = 20;
  })
 end
 if shared.togglebossfarm == true then
  game.StarterGui:SetCore("SendNotification", {
  Title = "Disable Boss Farm";
  Text = "Please disable Boss Farm or Monster Farm will not work!";
  Duration = 20;
  })
 end
 if shared.togglemobaura == true then
  game.StarterGui:SetCore("SendNotification", {
  Title = "Disable Mob Aura";
  Text = "Please disable Mob Aura or Monster Farm will not work!";
  Duration = 20;
  })
 end
 if shared.togglebossaura == true then
  game.StarterGui:SetCore("SendNotification", {
  Title = "Disable Boss Aura";
  Text = "Please disable Boss Aura or Monster Farm will not work!";
  Duration = 20;
  })
 end
 game:getService("RunService"):BindToRenderStep("MonsterFarmNoclip",0,function()
  if not game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid") then
   return
  end
  game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
 end)
end
while shared.togglemonsterfarm == true and wait() do
 Player.Character:WaitForChild("HumanoidRootPart").CFrame = game.workspace.SpawnPoints.Spawn11.CFrame
 wait(2)
 repeat wait()
  if game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"]:FindFirstChild("HumanoidRootPart") then
   if game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].Humanoid.Health ~= 0 then
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
     if v.Name == shared.pfweapon then
      Player.Character:WaitForChild("Humanoid"):EquipTool(v)
     end
    end
	if shared.autobuso == true then
     AutoBuso()
    end
	if shared.mode == "Under" then
	 Player.Character:WaitForChild("HumanoidRootPart").CFrame = game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].HumanoidRootPart.CFrame*CFrame.new(0,-shared.distance,0)*CFrame.Angles(-80,math.rad(0),0)
	elseif shared.mode == "Behind" then
	 Player.Character:WaitForChild("HumanoidRootPart").CFrame = game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].HumanoidRootPart.CFrame*CFrame.new(0,0,shared.distance)
    elseif shared.mode == "Above" then
	 Player.Character:WaitForChild("HumanoidRootPart").CFrame = game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].HumanoidRootPart.CFrame*CFrame.new(0,shared.distance,0)*CFrame.Angles(80,math.rad(0),0)
    else
	 Player.Character:WaitForChild("HumanoidRootPart").CFrame = game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].HumanoidRootPart.CFrame*CFrame.new(0,0,shared.distance)
	end
	if shared.togglenocdaf == false then
	 game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,500))
     function UseSkill()
      if shared.autoz == true and workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(shared.pfweapon):FindFirstChild("Z") then
       workspace[game.Players.LocalPlayer.Name][shared.pfweapon].Z:InvokeServer(CFrame.new(game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].HumanoidRootPart.Position))
      end
      if shared.autox == true and workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(shared.pfweapon):FindFirstChild("X") then
       workspace[game.Players.LocalPlayer.Name][shared.pfweapon].X:InvokeServer(CFrame.new(game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].HumanoidRootPart.Position))
      end
	  if shared.autoc == true and workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(shared.pfweapon):FindFirstChild("C") then
       workspace[game.Players.LocalPlayer.Name][shared.pfweapon].C:InvokeServer(CFrame.new(game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].HumanoidRootPart.Position))
      end
      if shared.autov == true and workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(shared.pfweapon):FindFirstChild("V") then
       workspace[game.Players.LocalPlayer.Name][shared.pfweapon].V:InvokeServer(CFrame.new(game.workspace.Monster.Boss["Shadow Master [Lv. 1600]"].HumanoidRootPart.Position))
      end
	 end
	 spawn(UseSkill)
	end
   end
  end
 until game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or game.workspace.Monster.Boss:FindFirstChild("Monster [Lv. 2500]") or shared.togglemonsterfarm == false
 if game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") then
  repeat wait()
   Player.Character:WaitForChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Gem"))
   wait(.5)
   Player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(game.workspace.Island["K - Zombie Island"].SummonAltar.Position) + Vector3.new(0,0,2)
  until game.workspace.Monster.Boss:FindFirstChild("Monster [Lv. 2500]") or shared.togglemonsterfarm == false
 end
 wait(3)
 repeat wait()
  if game.workspace.Monster.Boss:FindFirstChild("Monster [Lv. 2500]") then
   if game.workspace.Monster.Boss["Monster [Lv. 2500]"].Humanoid.Health ~= 0 then
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
     if v.Name == shared.pfweapon then
      Player.Character:WaitForChild("Humanoid"):EquipTool(v)
     end
    end
	if shared.autobuso == true then
     AutoBuso()
    end
	if shared.mode == "Under" then
	 Player.Character.HumanoidRootPart.CFrame = game.workspace.Monster.Boss["Monster [Lv. 2500]"].HumanoidRootPart.CFrame*CFrame.new(0,-shared.distance-30,0)*CFrame.Angles(-80,math.rad(0),0)
	elseif shared.mode == "Behind" then
	 Player.Character.HumanoidRootPart.CFrame = game.workspace.Monster.Boss["Monster [Lv. 2500]"].HumanoidRootPart.CFrame*CFrame.new(0,0,shared.distance+30)
    elseif shared.mode == "Above" then
	 Player.Character.HumanoidRootPart.CFrame = game.workspace.Monster.Boss["Monster [Lv. 2500]"].HumanoidRootPart.CFrame*CFrame.new(0,shared.distance+30,0)*CFrame.Angles(80,math.rad(0),0)
    else
	 Player.Character.HumanoidRootPart.CFrame = game.workspace.Monster.Boss["Monster [Lv. 2500]"].HumanoidRootPart.CFrame*CFrame.new(0,0,shared.distance+30)
	end
	if shared.togglenocdaf == false then
	 game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,500))
	 function UseSkill()
	  if shared.autoz == true and workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(shared.pfweapon):FindFirstChild("Z") then
       workspace[game.Players.LocalPlayer.Name][shared.pfweapon].Z:InvokeServer(CFrame.new(game.workspace.Monster.Boss["Monster [Lv. 2500]"].HumanoidRootPart.Position))
      end
      if shared.autox == true and workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(shared.pfweapon):FindFirstChild("X") then
       workspace[game.Players.LocalPlayer.Name][shared.pfweapon].X:InvokeServer(CFrame.new(game.workspace.Monster.Boss["Monster [Lv. 2500]"].HumanoidRootPart.Position))
      end
      if shared.autoc == true and workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(shared.pfweapon):FindFirstChild("C") then
       workspace[game.Players.LocalPlayer.Name][shared.pfweapon].C:InvokeServer(CFrame.new(game.workspace.Monster.Boss["Monster [Lv. 2500]"].HumanoidRootPart.Position))
      end
      if shared.autov == true and workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(shared.pfweapon):FindFirstChild("V") then
       workspace[game.Players.LocalPlayer.Name][shared.pfweapon].V:InvokeServer(CFrame.new(game.workspace.Monster.Boss["Monster [Lv. 2500]"].HumanoidRootPart.Position))
      end
	 end
	 spawn(UseSkill)
	end
   end
  end
 until not game.workspace.Monster.Boss:FindFirstChild("Monster [Lv. 2500]") or game.workspace.Monster.Boss["Monster [Lv. 2500]"].Humanoid.Health <= 0 or shared.togglemonsterfarm == false
end
end)
end
window:CreateToggle("Spam Soru", function(ToggleWindAround)
   shared.togglewindaround = ToggleWindAround
local windaroundcoord = game.workspace[game.Players.LocalPlayer.Name].HumanoidRootPart
while shared.togglewindaround == true and wait () do
 game.Players.LocalPlayer.Backpack.Soru.RemoteSoru:FireServer(CFrame.new(windaroundcoord.Position.X, windaroundcoord.Position.Y-2, windaroundcoord.Position.Z))
end
end)
window:CreateLabel("")
window:CreateLabel("Sword Skill NoCooldown")
window:CreateDropDown("Select Weapon", WeaponList, function(MainSwordDropdown)
    shared.mainsword = MainSwordDropdown
end)
window:CreateDropDown("Select Skill", {"Z", "X"}, function(SkillDropdown)
    shared.skill = SkillDropdown
end)
window:CreateSlider("Use Cooldown",0,10, function(SliderUseCooldown)
    shared.usecooldown = SliderUseCooldown
end)
window:CreateToggle("Toggle", function(ToggleSkillNoCoolDown)
   shared.toggleskillnocooldown = ToggleSkillNoCoolDown
while shared.toggleskillnocooldown == true and wait() do
 function skillnocooldown()
  for i,v in pairs(game.Players.LocalPlayer.Inventory:GetChildren()) do
   if v.Name ~= shared.mainsword then
    shared.secondsword = v.Name
   end
  end
  game.ReplicatedStorage.Remotes.Functions.InventoryEq:InvokeServer(shared.mainsword)
  for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
   if v.Name == shared.mainsword then
    Player.Character:WaitForChild("Humanoid"):EquipTool(v)
   end
  end
  if shared.skill == "Z" then
   if not workspace[game.Players.LocalPlayer.Name]:FindFirstChild(shared.mainsword) then
    return skillnocooldown()
   end
   local pos = mouse.Hit
   workspace[game.Players.LocalPlayer.Name][shared.mainsword].Z:InvokeServer(CFrame.new(pos.X, pos.Y, pos.Z))
  end
  if shared.skill == "X" then
   if not workspace[game.Players.LocalPlayer.Name]:FindFirstChild(shared.mainsword) then
    return skillnocooldown()
   end
   local pos = mouse.Hit
   workspace[game.Players.LocalPlayer.Name][shared.mainsword].X:InvokeServer(CFrame.new(pos.X, pos.Y, pos.Z))
  end
  game.ReplicatedStorage.Remotes.Functions.InventoryEq:InvokeServer(shared.secondsword)
  wait(shared.usecooldown)
 end
 skillnocooldown()
end
end)
if game.PlaceId == 4520749081 or game.PlaceId == 6381829480 then
window:CreateToggle("SNC Auto Farm", function(ToggleNoCDAF)
   shared.togglesncaf = ToggleNoCDAF
if shared.togglesncaf == true then
 shared.togglenocdaf = true
elseif shared.togglesncaf == false then
 shared.togglenocdaf = false
end
end)
end
window:CreateLabel("Lib: Azure UI | Toggle: P")
window:CreateLabel("TurtleScript KP Private")

else
 game.Players.LocalPlayer:Kick("You are not whitelisted")
end -- whitelist private feature
