Config = Config or {}

-- this is of Script us False
Config.UseTarget = true
Config.BlipsAndPeds = true
Config.Fishing = true
Config.Marker = true

-- If your progress is true, your progress is a bar; if it is false, your progress is a circle.
Config.Progress = true



--- Price
Config.ApplePrice = 300
Config.OrangePrice = 300
Config.GauvaPrice = 300
Config.MangoPrice = 300
Config.TomatoPrice = 300

Config.WoodplankPrice = 300
Config.TreebarkPrice = 300


Config.YellowfinPrice = 1900
Config.SalmonPrice = 1900
Config.PigfishPrice = 300
Config.StripedbassPrice = 300



Config.CopperPrice = 1300
Config.IronPrice = 1300
Config.StellPrice = 2000
Config.EmeraldPrice = 2000
Config.DiamondPrice = 3000

--- Received 
Config.ReceivedFish = 1
Config.ReceivedOrange = math.random(1, 2)
Config.ReceivedApple = math.random(1, 2)
Config.ReceivedOrange = math.random(1, 2)
Config.ReceiveGauva = math.random(1, 2)
Config.ReceiveMango = math.random(1, 2)
Config.ReceiveTomato = math.random(1, 2)
Config.ReceiveLumber = math.random(1, 2)
Config.ReceivedStone = math.random(3, 4)
Config.ReceivedStonewWash = math.random(2, 3)


-- object
Config.Apple = 'apple'
Config.Orange = 'orange'
Config.Gauva = 'gauva'
Config.Mango = 'mango'
Config.Tomato = 'tomato'
Config.Lumber = 'lumber'
Config.PickAxe = 'pickaxe'
Config.Woodplank = 'woodplank'
Config.Treebark = 'treebark'
Config.Fishbait = 'fishbait'
Config.Fishingrod = 'fishingrod'




Config.Stone = 'stone'
Config.WashStone = 'washstone'
Config.Copper = 'copper'
Config.Iron = 'iron'
Config.Steel = 'steel'
Config.Emerald = 'emerald'
Config.Diamond = 'diamond'


Config.Yellowfin = 'yellowfin'
Config.Salmon = 'salmon'
Config.Pigfish = 'pigfish'
Config.Stripedbass = 'stripedbass'



--- oject use farm
Config.ShortKnife = 'shortknife'
Config.Axe = 'axe'






Config.LabelTitle  ={
    SellApple = 'Start Sell Item Apple',
    SellOrange = 'Start Sell Orange',
    SellGuava = 'Start Sell Guava',
    SellMango = 'Start Sell Mango',
    SellTomato = 'Start Sell Tomato',
    SellWoodplank = 'Start Sell Woodplank',
    SellTreebark = 'Start Sell Treebark',

    SellYellowPin = 'Start Sell Item YellowPin',
    SellSalmon = 'Start Sell Item Salmon',
    SellPigfish = 'Start Sell Item Pigfish',
    SellStripedbass = 'Start Sell Item Stripedbass',


    SellCopper = 'Start Sell Item Copper',
    SellIron = 'Start Sell Item Iron',
    SellSteel = 'Start Sell Item Steel',
    SellEmerald = 'Start Sell Item Emerald',
    SellDiamond = 'Start Sell Item Diamond',


    -- List 
    Fruit = 'Fruits Job Sell',
    Lumber = 'Lumber Job Sell',
    Fish = 'Fish Job Sell',
    Stone = 'Stone Job Sell',

    SellWoo = 'Start Sell Woodplank',
    -- sell
    SellItem = 'Sell Item List',

    SellFruit = 'Sell Fruit Item',


    LumberProcess = 'Process Lumber',
    Woodplank = 'Star Proceess Woodplank'
}

-- Label in Notify error
Config.LabelError = {
    ShortKnife = "You don't have Short Knife",

    Axe = "You don't have Axe",
    PickAxe = "You don't have Pick Axe",
    FishRewardError = "You don't have Get an Fish",
    
    FishBait = "You don't have FishBait",
    FishingGrod = "You don't have FishingGrod",


    ErrorUi = "Its Your Error",


    SellErrorApple = "You Don't Have Apple",
    SellErrorOrange = "You Don't Have Orange",
    SellErrorGuava = "You Don't Have Guava",
    SellErrorMango = "You Don't Have Mango",
    SellErrorTomato = "You Don't Have Tomato",
    SellErrorWoodplank = "You Don't Have Woodplank",
    SellErrorTreebark = "You Don't Have Treebark",



    SellErrorYellowPin = "You Don't Have YellowPin",
    SellErrorSolmon = "You Don't Have Solmon",
    SellErrorPigfish = "You Don't Have Pigfish",
    SellErrorStripedbass = "You Don't Have Stripedbass",


    SellErrorCopper = "You Don't Have Copper",
    SellErrorIron = "You Don't Have Iron",
    SellErrorSteel = "You Don't Have Steel",
    SellErrorEmerald = "You Don't Have Emerald",
    SellErrorDiamond = "You Don't Have Diamond",


    ProceessErrorLumber = "You Don't Have Lumber",
    ErrorLumberEnough = "You Don't Have Lumber",
    Driving = "You are driving now",
    Swimming = "You are Swimming now",

    FishbaitLost = "'Sory Your Fish Bait Is Lose!",


    ErrorStoneEnough = "You Don't Have enough Stone",
    ErrorStone = "You Don't Have Stone",
    ErrorWashStone = "You Don't Have Wash Stone",
    ErrorWashStoneEnough = "You Don't Have enough Wash Stone",
}

-- Label in Notify succes
Config.LabelSucces = {
    ReceivedApple = 'You have received an apple!',
    ReceivedOrange = 'You have received an orange!',
    ReceivedGuava = 'You have received an guava!',
    ReceivedMango = 'You have received an mango!',
    ReceivedTomato = 'You have received an tomato!',



    ReceivedYellowPin = 'You have received an YellowPin!',
    ReceivedSalmon = 'You have received an Salmon!',
    ReceivedPigfish = 'You have received an Pigfish!',
    ReceivedStripedbass = 'You have received an Stripedbass!',


    ReceivedLumber = 'You have received an lumber!',
    ReceivedLumberProcess = 'You have received an!',


    ReceivedStone = 'You have received an Stone!',
    ReceivedWashStone = "You have received an Wash Stone!",
    ReceivedCopper = "You have received an Copper!",
    ReceivedIron = "You have received an Iron!",
    ReceivedSteel = "You have received an Steel!",
    ReceivedEmerald = "You have received an Emerald!",
    ReceivedDiamond = "You have received an Diamond!",


    AppleSell = 'You Succes To Sell Apple',
    OrangeSell = 'You Succes To Sell Orange',
    GuavaSell = 'You Succes To Sell Guava',
    MangoSell = 'You Succes To Sell Mango',
    TomatoSell = 'You Succes To Sell Tomato',
    WoodplankSell = 'You Succes To Sell Woodplank',
    TreebarkSell = 'You Succes To Sell Woodplank',


    YellowfinSell = 'You Succes To Sell Yellowfin',
    SalmonSell = 'You Succes To Sell Salmon',
    PigfishSell = 'You Succes To Sell Pigfish',
    Stripedbass = 'You Succes To Sell Stripedbass',

    CopperSell = 'You Succes To Sell Copper',
    IronSell = 'You Succes To Sell Iron',
    SteelSell = 'You Succes To Sell Steel',
    EmeraldSell = 'You Succes To Sell Emerald',
    DiamondSell = 'You Succes To Sell Diamond',
    -- sell
    SellApple = "Start Sell Apple Item"
}
-- Label in Tagert
Config.LabelTarget = {
    PickApple = 'Picking Apple',
    PickOrange = 'Picking Orange',
    PickGuava = 'Picking Guava',
    PickMango = 'Picking Mango',
    PickTomato = 'Picking Tomato',


    LumberProcess = 'Lumber Item Process',

    SellItem = 'Sell SideJob Item'
}

-- Label in Progress Bar
Config.LabelBar = {
    StartPickingApple = 'Start Picking Apple',

    StartPickingOrange = 'Start Picking Orange',

    StartPickingGauva = 'Start Picking Gauva',

    StartPickingMango = 'Start Picking Mango',

    StartPickingTomato = 'Start Picking Tomato',

    StartPickingLambar = 'Start Picking Lamber',


    StartFishing = 'Start Fishing Now',
    StartProcessLambar = 'Start Process Lamber',



    StartSellApple = 'Start Sell an Apple',

    StartSellOrange = 'Start Sell an Orange',

    StartSellGuava = 'Start Sell an Guava',

    StartSellMango = 'Start Sell an Mango',

    StartSellToamto = 'Start Sell an Toamto',

    StartSellWoodplank = 'Start Sell an Wood Plank',

    StartSellTreebark = 'Start Sell an Treebark',



    StartMiningStone = 'Start an MiningStone',
    StartWashStone = 'Start an WashStone',
    StartMeltingStone = 'Start an Melting',


    StartSellCopper = 'Start Sell an Copper',
    StartSellIron = 'Start Sell an Iron',
    StartSellSteel = 'Start Sell an Steel',
    StartSellEmerald = 'Start Sell an Emerald',
    StartSellDiamond = 'Start Sell an Diamond',



    StartSellYellowPin = 'Start Sell an YellowPin',
    StartSellSalmon = 'Start Sell an Salmon',
    StartSellPigfish = 'Start Sell an Pigfish',
    StartSellStripedbass = 'Start Sell an Stripedbass',

}




------- Target Sell ------
Config.SellitemJob = {
    coords = vector3(343.15, -1297.78, 32.51), 
    heading = 340,            
    size = vec3(0.5, 3, 3),    
    label = "Sell Food", 
    
}

--- Ped
Config.PedPeplo = {
    {
        coords = vector4(343.08, -1297.85, 32.51, 156.46),  
        model = 'a_m_o_salton_01',  
        scenario = 'WORLD_HUMAN_AA_COFFEE' 
    },
    {
        coords = vector4(714.00, -716.42, 26.20, 180.06),  
        model = 'a_m_y_stwhi_01',  
        scenario = 'WORLD_HUMAN_CLIPBOARD' 
    },
}



---------------------------------------------------------

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print("---------------------------------------------------------------------------------------------")
    print("       ^Github ^5 --> ^https://github.com/Gjayz         "," ^Author Gjayz")
    print("       ^Main Github ^5 --> ^https://github.com/gjayz099         ","Gjayz SideJob")
    print("---------------------------------------------------------------------------------------------")
end)