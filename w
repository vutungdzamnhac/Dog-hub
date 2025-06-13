repeat wait()
until getgenv().LoadUi and getgenv().IslandCaller and getgenv().SettingManager 
local Title = "SAYGEX69" .. (getgenv().pờ nhe ti um and " [pờ nhe ti um]" or "")
local SubTitle = "saygex69.com,lenlut.blog,hentai.com"
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/FixedFluent.lua"))()
local UiSetting = Fluent.Options
local IslandCaller = IslandCaller or getgenv().IslandCaller
local SettingManager = getgenv().SettingManager 
local Window = getgenv().Window or Fluent:CreateWindow({
    Title = Title,
    SubTitle = SubTitle,
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 360),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})
local UiOrders = {"Main Farm","Stack Auto farm","Sub Farming","Status","Player-Status","Fruit","Local Player","Travel","Pvp-Visual","Raid-Material","RaceV4-Mirage","Sea Events","Shop","Setting","Webhook","Game-Server","One Click"}
local TabCollections = {
}
ElementsCollection = {}
for _,Name in pairs(UiOrders) do
    ElementsCollection[Name]={}
end

local UiIntilize = {
    ["Main Farm"] = {
        {Mode="Label",Title="Only Turn On 1 Farm At The Same Time"},
        {Mode="Toggle",Title="Auto Katakuri",Description="Turn On Auto Kill Cake Prince And Auto Kill Dough King By Default",Args={"Katakuri","Enable"}},
        {Mode="Toggle",Title="Auto Bone",Description="",Args={"Bone","Enable"}},
        {Mode="Toggle",Title="Kill Aura",Description="Farm Near Lv Mob Or Near Position",Args={"Kill Aura","Enable"}},
        {Mode="Toggle",Title="Fully Auto Dough King",Description="",Args={"Full Dough King","Enable"}},
        {Mode="Label",Title="Setting For Auto Farm"},
        {Mode="Label",Title="Anchor Position"},
        {Mode="Toggle",Title="TP Back Anchor Position",Description="If Exceed Anchor Position Will Tp Back To Anchor Position",Args={"Kill Aura","AnchorTPBack"}},
        {Mode="Button",Title="Set Anchor Position",Callback=function ()
            pcall(function ()
                getgenv().Setting["Kill Aura"].AnchorPosition = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
            end)
        end},
        {Mode="Dropdown",Title="Distace From Anchor",Table = (function ()
            local Table = {}
            for i=400,4000,400 do 
                table.insert(Table,i)
            end
            return Table
        end)(),Default=getgenv().Setting["Kill Aura"].DistanceFromAnchor/400,OnChange=function (state)
            getgenv().Setting["Kill Aura"].DistanceFromAnchor = state
        end},
        {Mode="Toggle",Title="Use Sword",Args = {"Mastery","Sword"}},
        {Mode="Toggle",Title="Sword Switcher",Description="Switch Sword When Have Enough Skills (Default) or Max Mastery",Args={"SwordSwitcher","Enable"}},
        {Mode="Toggle",Title="Only Switch Max Mastery",Description="Only Switch When Max Mastery",Args={"SwordSwitcher","MaxMastery"}},
        {Mode="Toggle",Title="Switch Sword When Low", Description = "Must Enable Use Sword", Args={"Mastery","Sword/Low"}},
        {Mode="Label",Title="Go To Setting To Select Skills"},
        {Mode="Toggle",Title="Mastery Farm",Description="Need Enable Auto Katakuri Or Bone", Args={"Mastery","Enable"}},
        {Mode="Toggle",Title ="Aimbot Camera " ,Description = "Aimbot for Mastery Using Camera", Args={"Mastery","Camera"}},
        {
            Mode = "Dropdown",
            Title = "Matery Health",
            Args = {"Mastery", "Health"},
            Table = {20,25,30,35,40,45,50},
            Default = (function ()
                local Default = {20,25,30,35,40,45,50}
                local Found = 1
                if not table.find(Default,getgenv().Setting.Mastery.Health) then 
                    getgenv().Setting.Mastery.Health = 30
                else
                    Found = table.find(Default,getgenv().Setting.Mastery.Health) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting.Mastery.Health = tonumber(value)
                SettingManager:Save()
            end
        },        
        {Mode="Toggle",Title="Mastery Fruit / Gun", Description = "Default Is Fruit, Turning On = Using Gun, Must Enable Mastery Farm",Args = {"Mastery","Fruit/Gun"}},
        {
            Mode = "Toggle",
            Title = "Disable Silent Aim",
            Args = {"Pvp", "DisableSilentAim"},
            OnChange = function(state)
                getgenv().Setting.Pvp.DisableSilentAim = state
                SettingManager:Save()
            end
        },
        {Mode="Button",Title="Fps Boost",Callback = getgenv().LiteFpsBoost}
    },
    ["Stack Auto farm"] = {
        {Mode="Label",Title="Can Turn On Many Auto Farm Cuz Stackable"},
        {Mode="Toggle",Title="Auto Elite",Description="Sea 3 Function Only",Args={"Elite","Enable"}},
        {Mode="Toggle",Title="Auto Pirate Raid",Description="Sea 3 Function Only",Args={"Pirate Raid","Enable"}},
        {Mode="Toggle",Title="Auto Open Haki Pad",Description="Sea 3 Function Only",Args={"Open Pad","Enable"}},
        {Mode="Toggle",Title="Auto Spawn chó admin",Description="Sea 3 Function Only", Args = {"Spawn Rip Indra","Enable"}},
        {Mode="Toggle",Title="Auto chó admin",Description = "Only Kill Rip Indra, Doesnt Do Anything Else",Args={"Rip Indra","Enable"}},
        {Mode="Toggle",Title="Auto Tushita",Descrition="Sea 3 Function only",Args={"Tushita","Enable"}},
        {Mode="Toggle",Title="Do Puzzle Electric Claw",Description="Sea 3 Function Only",Args={"Unlock Electric Claw","Enable"}},
        {Mode="Toggle",Title="Auto Dough King" ,Description="", Args = {"Dough King","Enable"}},
        {Mode="Toggle",Title="Auto Cake Prince",Description="",Args = {"Cake Prince","Enable"}},
        {Mode="Toggle",Title="Auto Spawn Soul Reaper",Args = {"Spawn Soul Reaper","Enable"}},
        {Mode="Toggle",Title="Auto Soul Reaper",Args = {"Soul Reaper","Enable"}},
        {
            Mode = "Dropdown",
            Title = "Select Boss To Snipe",
            Multi = true, 
            Table = AllBoss[tostring(game.PlaceId)],
            Default = getgenv().Setting.BossSniper.SelectedBoss or {},
            OnChange = function(state)
                local Values = {}
                for Value, State in pairs(state) do
                    if  type(Value) == "string" then
                        table.insert(Values, Value)
                    end
                end 
                

                getgenv().Setting.BossSniper.SelectedBoss = Values
                SettingManager:Save()
            end
        },     
        {Mode="Toggle",Title="Start Boss Snipe",Description="",Args={"BossSniper","Enable"}},
        {Mode="Toggle",Title="Auto Bartilo Quest",Description="Sea 2 Function",Args = {"Bartilo","Enable"}},
        {Mode="Toggle",Title="Auto Race Evolve",Description="Sea 2 Function, Need Bartilo Quest Finish",Args = {"Race Evolve","Enable"}},
        {Mode="Toggle",Title="Auto Factory",Description="Sea 2 Function Only",Args = {"Factory","Enable"}},
        {Mode="Toggle",Title="Auto Spawn Black Beard",Description="Sea 2 Function Only", Args = {"Spawn Black Beard","Enable"}},
        {Mode="Toggle",Title="Auto Black Beard",Description="Sea 2 Function Only", Args = {"Black Beard","Enable"}},
        {Mode="Toggle",Title="Auto Ghoul",Description="Travel To Sea2 and Stack Farming Until Have Ghoul", Args = {"Get Ghoul","Enable"}},
        {Mode="Toggle",Title="Auto Soul Guitar",Args = {"Soul Guitar","Enable"}},
        {Mode="Toggle",Title="Auto Soul Guitar Material",Args = {"Material Soul Guitar","Enable"}},
        {Mode="Toggle",Title="Auto CDK (DO NOT USE TESTING)",Args = {"CDK","Enable"}},
        
        --{Mode="Toggle",Title="Auto Collect Gift", Description="Sea 3 Function Event",Args = {"Winter Event","Enable"}}
    },
    ["Sub Farming"] = {
        {Mode="Label",Title="Disable All Stack + Main Farm Before Using"},
        {Mode="Button",Title="Upgrade Yoru V2",Description="Only useable if you have yoru",Callback=function()
            IslandCaller("YoruV2")
        end},
        {Mode="Toggle",Title="Yoru V3",Description="Auto Upgrade Yoru V3",Args = {"YoruV3","Enable"}},
        {Mode="Dropdown",Title="Select Player",Description="Select Account to upgrade together",Table=IslandCaller("__StrGetPlayers"),OnChange=function (state)
            getgenv().Setting["YoruV3"].SelectedPlayer = state
        end},
        {Mode="Button",Title="Refresh Players",Callback=function()
            ElementsCollection["Sub Farming"]["Select Player"]:SetValues(IslandCaller("__StrGetPlayers"))
        end},
        {Mode="Toggle",Title="Account To Upgrade Yoru V3",Description="Turn On This If This Is Account Want to Upgrade, do not if account to spawn Black Beard",Args = {"YoruV3","Upgrade"}},
        {Mode="Toggle",Title="Race Evolve Hop",Description="Turning On This Will Make Race Evolve Hopping For Faster Farming",Args = {"Race Evolve","Hop"}},
        {Mode="Toggle",Title="Black Beard Hop",Description="Auto Hop For Black Beard",Args={"Black Beard Hop","Enable"}},
        {Mode="Toggle",Title="Tushita Hop (Need All Haki Colors)",Description="Auto Chest + Auto Elite Till Find Cup And Spawn Then Get Tushita",Args={"Tushita Hop__1","Enable"}},
        {Mode="Toggle",Title="Hybrid Fruit Hop",Description="Pirate Raid + Collect Fruit Hop",Args={"Hybrid Fruit Hop","Enable"}},
        {Mode="Toggle",Title="Raid Fruit Hop",Description="Pirate Raid + Collect Fruit + Raid Hop" ,Args={"Raid Fruit Hop","Enable"}},
        {Mode="Toggle",Title="Auto Law",Description="Auto Farm Law",Args={"Law","Enable"}},
        {Mode="Toggle",Title="Auto Cyborg",Description="Auto Chest For Fist Then Auto Law",Args={"Fully Cyborg","Enable"}},
        {Mode="Toggle",Title="Auto Ghoul Hop",Description="Auto Find Torch + Ghoul (Very Rare, Dont Recommend)",Args={"Fully Ghoul","Enable"}},
        {Mode="Toggle",Title="Boss Snipe Hop",Description="",Args={"BossSniper","Hop"}},
        {Mode="Label",Title="Chest Count"},
        {Mode="Toggle",Title="Auto Chest",Description="Stop On God Chalice And Fist Of Darkness By Default",Args={"Collect Chest","Enable"}},
        {Mode="Toggle",Title="Auto Chest Hop",Description="Hop After x Chest",Args = {"Collect Chest","Hop"}},
        {
            Mode = "Dropdown",
            Title = "x Chest To Hop",
            Args = {"Collect Chest", "LimitChest"},
            Table = {20,25,30,35,40,45,50,60,70},
            Default = (function ()
                local Default = {20,25,30,35,40,45,50,60,70}
                local Found = 9
                if not table.find(Default,getgenv().Setting["Collect Chest"].LimitChest) then 
                    getgenv().Setting["Collect Chest"].LimitChest = 70
                else
                    Found = table.find(Default,getgenv().Setting["Collect Chest"].LimitChest) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting["Collect Chest"].LimitChest = tonumber(value)
                SettingManager:Save()
            end
        },        

        {Mode="Toggle",Title="Insta Tp Chest",Description="Have A Risk Of Getting Banned(Noone yet)",Args={"Collect Chest","InstaTP"}},
        {Mode="Toggle",Title="Auto Level Observation",Description="Farm Observation Level Till Max",Args={"Level Observation","Enable"}},
        {Mode="Toggle",Title="Level Observation Hop",Description="Hopping For leveling Observation",Args={"Level Observation","Hop"}},
        {Mode="Toggle",Title="Auto Observation V2",Description="Must Have Maxed Ken Haki + Finish Citizen Quest",Args = {"Evolve Observation","Enable"}},
        {Mode="Toggle",Title="Observation V2 Hop",Description="Hopping For Finding Materials To Get Evolve Faster",Args = {"Evolve Observation","Hop"}},
        {Mode="Toggle",Title="Auto Saber Hop",Args={"__SaberHop","Enable"}},
        {Mode="Toggle",Title="Auto Pole Hop",Args={"__PoleHop","Enable"}},
        {Mode="Toggle",Title="Auto Citizen Quest",Description="Must Be Level 1800 Above",Args = {"Citizen Quest","Enable"}},
        {Mode="Toggle",Title="Citizen Quest Hop",Description="",Args = {"Citizen Quest","Hop"}},
        {Mode="Toggle",Title="Auto Get Rainbow Haki",Description="",Args = {"Rainbow Haki","Enable"}},
        {Mode="Toggle",Title="Rainbow Haki Hop",Description="Hopping For Fast Getting Rainbow Haki",Args = {"Rainbow Haki","Hop"}},
    },
    ["Status"] = {
        {Mode="Label",Title="Client Time"},
        {Mode="Label",Title="Farming Status"},
        {Mode="Label",Title="Weapon Status [One Click]"},
        {Mode="Label",Title="Dimension Kill"},
        {Mode="Label",Title="Bribe Status"},
        {Mode="Label",Title="Elite Status"},
        {Mode="Label",Title="Mirage Status"},
        {Mode="Label",Title="Kitsune Status"},
        {Mode="Label",Title="FullMoon Status"},
    },
    ["Player-Status"] = {
        {Mode="Label",Title="W.I.P"}
    },
    ["Fruit"] = {
        {
            Mode = "Toggle",
            Title = "Auto Collect Fruit",
            Description = "Stackable With Auto Farm",
            Args = {"GetFruit", "Enable"},
            OnChange = function(state)
                getgenv().Setting.GetFruit.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Store Fruit",
            Args = {"Fruit", "AutoStore"},
            OnChange = function(state)
                getgenv().Setting.Fruit.AutoStore = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Snipe Fruit",
            Args = {"Fruit", "EnableSnipeFruit"},
            Description = "Auto Buy Fruit If In The List And You Dont Have Fruit In That List",
            OnChange = function(state)
                getgenv().Setting.Fruit.EnableSnipeFruit = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Snipe Mirage Fruit [Premium]",
            Description = "Stackable with Auto Farm, Snipe If In Mirage Fruit Stock And Mirage Dealer Appear",
            Args = {"Mirage Snipe Fruit", "Enable"},
            OnChange = function(state)
                getgenv().Setting["Mirage Snipe Fruit"].Enable = state
            end
            
        },
        {
            Mode = "Dropdown",
            Title = "Select Fruit To Snipe",
            Multi = true, 
            Table = FruitTable,
            Default = getgenv().Setting.Fruit.FruitsToSnipe or {},
            OnChange = function(state)
                local Values = {}
                for Value, State in pairs(state) do
                    if  type(Value) == "string" then
                        table.insert(Values, Value)
                    end
                end 
                

                getgenv().Setting.Fruit.FruitsToSnipe = Values
                SettingManager:Save()
            end
        }
    },
    ["Local Player"] = {
        --[[{
            Mode = "Button",
            Title = "Kick Player Safe Zone",
            Description = "Near Safe Zone + Need To Shit On Ship",
            Callback = KickPlayer
        },
        {
            Mode = "Button",
            Title = "Buy Ship",
            Description = "",
            Callback = function()
=
            end
        },

        {
            Mode = "Button",
            Title = "Fly",
            Description = "",
            Callback = function()
            end
        },
        {
            Mode = "Button",
            Title = "Stop Fly",
            Description = "",
            Callback = function()
            end
        },]]
        {
            Mode = "Button",
            Title = "Remove Enemies Skill Stun",
            Callback = function()
                IslandCaller("RemoveEnemiesStun")
            end
        },
        {
            Mode = "Toggle",
            Title = "No Clip",
            Args = {"LocalPlayer", "NoClip"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.NoClip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "No Clip Ship",
            Args = {"LocalPlayer", "NoClipShip"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.NoClipShip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Buso",
            Args = {"LocalPlayer", "AutoBuso"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.AutoBuso = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Enable Observation",
            Args = {"LocalPlayer", "AutoEnableObservation"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.AutoEnableObservation = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Water Walker",
            Args = {"LocalPlayer", "WaterWalker"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.WaterWalker = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Use Race V3",
            Args = {"LocalPlayer", "AutoUseV3"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.AutoUseV3 = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Use Race V4",
            Args = {"LocalPlayer", "AutoUseV4"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.AutoUseV4 = state
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Soru No CD",
            Args = {"LocalPlayer", "SoruNoCD"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.SoruNoCD = state
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Dash Modify",
            Args = {"LocalPlayer", "DashModify"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.DashModify = state
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Dash No CD",
            Args = {"LocalPlayer", "DashNoCD"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.DashNoCD = state
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Change Dash Rage",
            Args = {"LocalPlayer", "DoDashRange"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.DoDashRange = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Dropdown",
            Title = "Dash Range",
            Args = {"LocalPlayer", "DashRange"},
            Table = {100,150,200,250,300,500,750,1000},
            Default = (function ()
                local Default = {100,150,200,250,300,500,750,1000}
                local Found = 3
                if not table.find(Default,getgenv().Setting.LocalPlayer.DashRange) then 
                    getgenv().Setting.LocalPlayer.DashRange = 200 
                else
                    Found = table.find(Default,getgenv().Setting.LocalPlayer.DashRange) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting.LocalPlayer.DashRange = tonumber(value)
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Infinity Geppo",
            Args = {"LocalPlayer", "InfGeppo"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.InfGeppo = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Speed Hack",
            Args = {"LocalPlayer", "SpeedHack"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.SpeedHack = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Speed",
            Args = {"LocalPlayer", "Speed"},
            Default = getgenv().Setting.LocalPlayer.Speed,
            Min = 16,
            Max = 500,
            OnChange = function(value)
                getgenv().Setting.LocalPlayer.Speed = value
                SettingManager:Save()
            end
        }
    },
    ["Travel"] = {
        {Mode="Button",Title="Stop Tween",Callback=function() IslandCaller("StopTween") end},
        {Mode="Button",Title="Travel Sea 1",Callback=function ()
            IslandCaller("Travel","Sea1")
        end},
        {Mode="Button",Title="Travel Sea 2",Callback=function ()
            IslandCaller("Travel","Sea2")
        end},
        {Mode="Button",Title="Travel Sea 3",Callback=function ()
            IslandCaller("Travel","Sea3")
        end},
        {Mode="Dropdown",Title="Insta Tp Place",Table=(function ()
            local Tbl = {}
            for i,v in pairs(getgenv().IslandVariable.GatePos) do
                table.insert(Tbl,i)
            end
            return Tbl
        end)(),OnChange=function (state)
            if type(state) == "string" and getgenv().IslandVariable.GatePos[state] then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",getgenv().IslandVariable.GatePos[state])
            end
        end},
        {Mode="Dropdown",Title="Travel Place",Table=getgenv().IslandVariable.__Places,OnChange=function (state)
            getgenv().IslandVariable.SelectedPlace = state
        end},
        {Mode="Button",Title="Start Traveling",Callback=function ()
            IslandCaller("TweenSelectedPlace")
        end},
    },
    ["Pvp-Visual"] = {
        {Mode="Dropdown",Title="Select Player",Table=IslandCaller("__StrGetPlayers"),OnChange=function (state)
            SelectedPlayer = state
        end},
        {Mode="Button",Title="Refresh Players",Callback=function()
            ElementsCollection["Pvp-Visual"]["Select Player"]:SetValues(IslandCaller("__StrGetPlayers"))
        end},
        {
            Mode = "Toggle",
            Title = "Tween To Player",
            Args = {"TweenToPlayer"},
            OnChange = function(state)
                getgenv().Setting.TweenToPlayer = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Shoot Gun(100%)",
            Args = {"Pvp", "AutoShootGun"},
            OnChange = function(state)
                getgenv().Setting.Pvp.AutoShootGun = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Silent Aim Near Player",
            Args = {"Pvp", "SilentAimNear"},
            OnChange = function(state)
                getgenv().Setting.Pvp.SilentAimNear = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Kill Near Player [Premium]",
            Description = "Use Very Fast Attack",
            Args = {"Pvp", "AutoKillNear"},
            OnChange = function(state)
                getgenv().Setting.Pvp.AutoKillNear = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Only Shoot In Shootable Distance",
            Args = {"Pvp", "GunDistanceCheck"},
            OnChange = function(state)
                getgenv().Setting.Pvp.GunDistanceCheck = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Players",
            Args = {"ESP", "Player"},
            OnChange = function(state)
                getgenv().Setting.ESP.Player = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Boss",
            Args = {"ESP", "Boss"},
            OnChange = function(state)
                getgenv().Setting.ESP.Boss = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Chests",
            Args = {"ESP", "Chest"},
            OnChange = function(state)
                getgenv().Setting.ESP.Chest = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Island",
            Args = {"ESP", "Island"},
            OnChange = function(state)
                getgenv().Setting.ESP.Island = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Fruit",
            Args = {"ESP", "Fruit"},
            OnChange = function(state)
                getgenv().Setting.ESP.Fruit = state
                SettingManager:Save()
            end
        }
    },
    ["Raid-Material"] = {
        {
            Mode = "Label",
            Title = "Selected Material",
        },
        {
            Mode = "Toggle",
            Title = "Start Farming Material",
            Args = {"Material","Enable"},
            Callback = function (state)
                getgenv().Setting.Material.Enable = state
                SettingManager:Save()
            end
        },
        {Mode="Dropdown",Title="Materials",Table=getgenv().IslandVariable.MaterialName,OnChange=function (state)
            getgenv().Setting.Material.Select = state
            SettingManager:Save()        
        end},
        {
            Mode = "Label",
            Title = "Selected Chip",
            Content = getgenv().Setting.Raid.Select or ""
        },
        {Mode="Dropdown",Title="Select",Table={"Flame","Ice","Sand","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Bird: Phoenix","Dough"},OnChange=function (state)
            getgenv().Setting.Raid.Select = state
            SettingManager:Save()        
        end}, --Todo: Get Chips Data From Game
        {
            Mode = "Toggle",
            Title = "Enable Raid",
            Description = "Must Turn On This In Order To Raiding Works",
            Args = {"Raid", "Enable"},
            OnChange = function(state)
                getgenv().Setting.Raid.Enable = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "Select Current Fruit Chip",
            Callback = function()
                getgenv().Setting.Raid.Select = getgenv().IslandVariable.AutoChip[LP.Data.DevilFruit.Value] or ""
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "No Delay Next Island",
            Description = "May Get Reseted if You Turn Off This",
            Args = {"Raid", "NoDelay"},
            OnChange = function(state)
                getgenv().Setting.Raid.NoDelay = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Awaken",
            Args = {"Raid", "Awaken"},
            OnChange = function(state)
                getgenv().Setting.Raid.Awaken = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Unstore Fruit Under 1M",
            Args = {"Raid", "GetFruitUnder1M"},
            OnChange = function(state)
                getgenv().Setting.Raid.GetFruitUnder1M = state
                SettingManager:Save()
            end
        }
    },
    ["Sea Events"] = {
        {
            Mode = "Button",
            Title = "Tp Your Ship To Current Pos",
            Callback = function()
                IslandCaller("TPCurrentShip")
            end
        },
        {
            Mode = "Button",
            Title = "Remove Sea Terror Effect",
            Callback = function()
                if game.Lighting:FindFirstChild("SeaTerrorCC") then
                    game.Lighting.SeaTerrorCC:Destroy()
                end
            end
        },
        {
            Mode = "Button",
            Title = "Change Night Atmosphere",
            Callback = function()
                IslandCaller("NightAtmosphere")
            end
        },
        {
            Mode = "Button",
            Title = "Change Dark Atmosphere",
            Callback = function()
                IslandCaller("DarkAtmosphere")
            end
        },
        {
            Mode = "Toggle",
            Title = "Ship Speed Modifier",
            Args = {"SeaEvents", "ShipSpeedModifier"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.ShipSpeedModifier = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Ship Speed",
            Args = {"SeaEvents", "ShipSpeed"},
            Default = getgenv().Setting.SeaEvents.ShipSpeed,
            Min = 200,
            Max = 500,
            OnChange = function(value)
                getgenv().Setting.SeaEvents.ShipSpeed = value
                SettingManager:Save()
            end
        },
        {Mode="Dropdown",
        Title="Select Ship",
        Table={"PirateSloop","Swan Ship","Beast Hunter","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade"},
        Default = getgenv().Setting.SeaEvents.SelectShip 
        and table.find({"PirateSloop","SwanShip","Beast Hunter","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade"},getgenv().Setting.SeaEvents.SelectShip) or 1,
        OnChange=function (state)
            getgenv().Setting.SeaEvents.SelectShip = state
            SettingManager:Save()        
        end},
        {
            Mode = "Toggle",
            Title = "Start Farming Sea Event",
            Description = "For Farming Sharks, Piranha, Terror Shark, SeaBeast, Ship",
            Args = {"SeaEvents", "StartSeaEvents"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.StartSeaEvents = state
                SettingManager:Save()
            end
        },
       --[[ {
            Mode = "Toggle",
            Title = "Auto Spawn Ship",
            Description = "For Farming Sharks, Piranha, Terror Shark",
            Args = {"SeaEvents", "AutoBuyShip"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoBuyShip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Tp Ship To Zone 6",
            Description = "Insta TP Ship, Must Not Have Any Players In Ship Or Errors",
            Args = {"SeaEvents", "AutoTpShip"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoTpShip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Sit",
            Description = "Auto Sit At Your Ship",
            Args = {"SeaEvents", "AutoSit"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoSit = state
                SettingManager:Save()
            end
        },]]
        {
            Mode = "Toggle",
            Title = "Auto Terror Shark",
            Description = "Farm Terror Shark",
            Args = {"SeaEvents", "TerrorShark"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.TerrorShark = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Sea Beasts",
            Description = "Farm Sea Beasts",
            Args = {"SeaEvents", "SeaBeast"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.SeaBeast = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Ship",
            Description = "Farm Ship",
            Args = {"SeaEvents", "Ship"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.Ship = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Ignore Sea Beast",
            Description = "Fly To Ignore Sea Beast, Must Turn On Auto Sea beast",
            Args = {"SeaEvents", "IgnoreSeaBeast"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.IgnoreSeaBeast = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Ignore Ship",
            Description = "TP Ship Back So Ship Despawn, Must Turn On Auto Ship",
            Args = {"SeaEvents", "IgnoreShip"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.IgnoreShip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Shark",
            Description = "Farm Sharks",
            Args = {"SeaEvents", "Shark"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.Shark = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Piranha",
            Description = "Farm Piranha",
            Args = {"SeaEvents", "Piranha"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.Piranha = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Safe Mode",
            Args = {"SeaEvents", "SafeMode"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.SafeMode = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Escape Rough Sea",
            Args = {"SeaEvents", "AutoEscapeRoughSea"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoEscapeRoughSea = state
                SettingManager:Save()
            end
        },
        --[[{
            Mode = "Toggle",
            Title = "Only Farm Near",
            Description = "Only Farm Near Mobs So You Dont Have To Deal With Far Mobs That Aren't From Yours",
            Args = {"SeaEvents", "OnlyFarmNearMob"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.OnlyFarmNearMob = state
                SettingManager:Save()
            end
        },]]
        {
            Mode = "Label",
            Title = "Leviathan Section"
        },
        --{
         --   Mode = "Button",
           -- Title = "Tween Ship To Tiki",
        --    Description = "For Transporting Heart",
        --},
        {
            Mode = "Button",
            Title = "Tp To Frozen island",
            Description = "It Must Spawn First",
            Callback = function()
                IslandCaller("TPLeviathanIsland")
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Find Leviathan",
            Description = "Leviathan",
            Args = {"SeaEvents", "AutoFindLeviathan"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoFindLeviathan = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Leviathan",
            Description = "Leviathan",
            Args = {"SeaEvents", "Leviathan"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.Leviathan = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Multi Segments Attack",
            Description = "More",
            Args = {"SeaEvents", "MultiSegmentAttack"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.MultiSegmentAttack = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Label",
            Title = "Kitsune Section"
        },
        {
            Mode = "Button",
            Title = "Tween To Kitsune Island",
            Description = "",
            Callback = function()

            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Find Kitsune Island",
            Description = "Wait For Near Full Moon Then Enable This",
            Args = {"SeaEvents", "AutoFindKitsune"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoFindKitsune = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Start Kitsune When In Island",
            Args = {"SeaEvents", "AutoStartKitsune"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoStartKitsune = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Collect Azure Wisp",
            Args = {"SeaEvents", "AutoCollectKitsune"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoCollectKitsune = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Dropdown",
            Title = "Azure Trade Min",
            Args = {"SeaEvents", "AzureEmberLimit"},
            Table = {15,20,25,30},
            Default = (function ()
                local Default = {15,20,25,30}
                local Found = 3
                if not table.find(Default,getgenv().Setting.SeaEvents.AzureEmberLimit) then 
                    getgenv().Setting.SeaEvents.AzureEmberLimit = 25
                else
                    Found = table.find(Default,getgenv().Setting.SeaEvents.AzureEmberLimit) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting.SeaEvents.AzureEmberLimit = tonumber(value)
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Trade Azure Wisp",
            Args = {"SeaEvents", "AutoTradeKitsune"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoTradeKitsune = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Label",
            Title = "Sea Events Setting"
        },
        --[[
        {
            Mode = "Toggle",
            Title = "Spin Ship If In Farming",
            Description = "Safe Mode Ship",
            Args = {"SeaEvents", "SpinShipAttack"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.SpinShipAttack = state
                SettingManager:Save()
            end
        },]]
        {
            Mode = "Toggle",
            Title = "Spin Ship If Farming",
            Description = "Safe Mode Ship",
            Args = {"SeaEvents", "FlyShipFarm"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.FlyShipFarm = state
                SettingManager:Save()
            end
        },
       -- {
        --    Mode = "Toggle",
        --    Title = "Spin Ship If Idle",
        --    Description = "Safe Mode Ship",
        --    Args = {"SeaEvents", "SpinShipIdle"},
        --    OnChange = function(state)
        --        getgenv().Setting.SeaEvents.SpinShipIdle = state
        --        SettingManager:Save()
        --    end
        --},
        {
            Mode = "Slider",
            Title = "Spin Distance",
            Args = {"SeaEvents", "SpinDistance"},
            Default = getgenv().Setting.SeaEvents.SpinDistance,
            Min = 10,
            Max = 500,
            OnChange = function(value)
                getgenv().Setting.SeaEvents.SpinDistance = value
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Near Distance",
            Args = {"SeaEvents", "DistanceNearMob"},
            Default = getgenv().Setting.SeaEvents.DistanceNearMob or 300,
            Min = 300,
            Max = 1000,
            OnChange = function(value)
                getgenv().Setting.SeaEvents.DistanceNearMob = value
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Sea Beast Near Distance",
            Args = {"SeaEvents", "DistanceNearSeaBeast"},
            Default = getgenv().Setting.SeaEvents.DistanceNearSeaBeast or 300,
            Min = 300,
            Max = 2000,
            OnChange = function(value)
                getgenv().Setting.SeaEvents.DistanceNearSeaBeast = value
                SettingManager:Save()
            end
        }
    
    },
    ["RaceV4-Mirage"] = {
        {
            Mode = "Button",
            Title = "TP To Gear",
            Callback = function()
                IslandCaller("TweenGear")
            end
        },
        {
            Mode = "Button",
            Title = "TP To Advandced Fruit Dealer",
            Callback = function()
                IslandCaller("TweenFruitDealer")
            end
            
        },
        {
            Mode = "Button",
            Title = "Tween To Highest Place Mirage",
            Callback = function()
                pcall(function()
                    IslandCaller("TweenHighestPlace")
                end)
            end
        },
        {
            Mode = "Toggle",
            Title = "Fully Auto Unlock Race v4 Entrance",
            Args = {"FullyRaceV4_Entrance", "Enable"},
        },
        {
            Mode = "Label",
            Title = "Trial Status",
        },
        {
            Mode = "Toggle",
            Title = "Check Status + Upgrade Race V4",
            Args = {"RaceV4", "CheckStatus"},
            OnChange = function(state)
                getgenv().Setting.RaceV4.CheckStatus = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Start Trial With Team",
            Args = {"TrialTeam", "Enable"},
        },
        {Mode="Dropdown",Title="Team Trial Player 1",Table=IslandCaller("__StrGetPlayers"),Default=getgenv().Setting["TrialTeam"].TrialPlayer1,OnChange=function (state)
            getgenv().Setting["TrialTeam"].TrialPlayer1 = state
            SettingManager:Save()
        end},
        {Mode="Dropdown",Title="Team Trial Player 2",Table=IslandCaller("__StrGetPlayers"),Default=getgenv().Setting["TrialTeam"].TrialPlayer2,OnChange=function (state)
            getgenv().Setting["TrialTeam"].TrialPlayer2 = state
            SettingManager:Save()
        end},
        {Mode="Button",Title="Refresh Players",Callback=function()
            ElementsCollection["RaceV4-Mirage"]["Team Trial Player 1"]:SetValues(IslandCaller("__StrGetPlayers"))
            ElementsCollection["RaceV4-Mirage"]["Team Trial Player 2"]:SetValues(IslandCaller("__StrGetPlayers"))
        end},
        {
            Mode = "Toggle",
            Title = "Fully Auto Finish Trial [Premium]",
            Description = "Train, Auto Kill After Trial, Auto Activate Race",
            Args = {"FullyAutoTrial", "Enable"},
            OnChange = function(state)
                if IsPremium then
                    getgenv().Setting.FullyAutoTrial.Enable = state
                end
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Train",
            Args = {"AutoTrainTrial", "Enable"},
            OnChange = function(state)
                getgenv().Setting.AutoTrainTrial.Enable = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Finish Trial",
            Args = {"Trial", "Enable"},
            OnChange = function(state)
                getgenv().Setting.Trial.Enable = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Choose Gear",
            Args = {"Trial", "ChooseGear"},
            OnChange = function(state)
                getgenv().Setting.Trial.ChooseGear = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Kill After Trial [Premium]",
            Args = {"Trial", "AutoKill"},
            OnChange = function(state)
                getgenv().Setting.Trial.AutoKill = state
                SettingManager:Save()
            end
        },

        {
            Mode = "Toggle",
            Title = "Auto Look Moon",
            Args = {"Trial", "LookAtMoon"},
            OnChange = function(state)
                getgenv().Setting.Trial.LookAtMoon = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "TP To Temple Of Time",
            Callback = function()
                IslandCaller("TPTempleOfTime")
            end
        },
        {
            Mode = "Button",
            Title = "TP To Acient Clock",
            Callback = function()
                IslandCaller("TPAcientClock")
            end
        },
        {
            Mode = "Button",
            Title = "TP Current Race Entrance",
            Callback = function()
                IslandCaller("TPCurrentEntrance")
            end
        },
    },
    ["Shop"] = {
        {
            Mode = "Toggle",
            Title = "Auto Buy Bribe",
            Args = {"Shop", "AutoBuyBribe"},
            OnChange = function(state)
                getgenv().Setting.Shop.AutoBuyBribe = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Random Bone",
            Args = {"Shop", "AutoRandomBone"},
            OnChange = function(state)
                getgenv().Setting.Shop.AutoRandomBone = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Random Fruit",
            Args = {"Shop", "AutoRandomFruit"},
            OnChange = function(state)
                getgenv().Setting.Shop.AutoRandomFruit = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Buy Legendary Sword",
            Args = {"Shop", "AutoLegendarySword"},
            OnChange = function(state)
                getgenv().Setting.Shop.AutoLegendarySword = state
                SettingManager:Save()
            end
        },

        {
            Mode = "Toggle",
            Title = "Auto Buy Haki Color",
            Args = {"Shop", "HakiColor"},
            OnChange = function(state)
                getgenv().Setting.Shop.HakiColor = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Only Buy Legendary Haki Color",
            Args = {"Shop", "LegendaryHakiColor"},
            OnChange = function(state)
                getgenv().Setting.Shop.LegendaryHakiColor = state
                SettingManager:Save()
            end
        },
        
       --[[ {
            Mode = "Toggle",
            Title = "Auto Trade X2 Exp (Candy)",
            Args = {"Shop", "Candy X2 EXP"},
            OnChange = function(state)
                getgenv().Setting.Shop["Candy X2 EXP"] = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Trade 500 Fragments (Candy)",
            Args = {"Shop", "Candy 500 Fragments"},
            OnChange = ... (Còn 94 KB)
