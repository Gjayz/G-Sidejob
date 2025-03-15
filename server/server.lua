---- Export 
ESX = exports["es_extended"]:getSharedObject()
------------------- Export -----------------

-- Register server callback for checking ShortKnife in inventory
ESX.RegisterServerCallback('esx-sidejob:server:getitemshortknife', function(source, cb)

    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.ShortKnife).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-sidejob:server:getitemaxe', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Axe).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-sidejob:server:getitemfishbait', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Fishbait).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-sidejob:server:getitemfishingrod', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Fishingrod).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:getitempickaxe', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.PickAxe).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)




------------------------------------ Sell -------------------------------------------

ESX.RegisterServerCallback('esx-sidejob:server:SellInfoApple', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Apple).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:SellInfoOrange', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Orange).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:SellInfoGuava', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Gauva).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-sidejob:server:SellInfoMango', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Mango).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:SellInfoTomato', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Tomato).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:SellInfoWoodplank', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Woodplank).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:SellInfoTreebark', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Treebark).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-sidejob:server:getitemYellowPin', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Yellowfin).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-sidejob:server:getitemSalmon', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Salmon).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-sidejob:server:getitemPigfish', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Pigfish).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:getitemStripedbass', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Stripedbass).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:getitemCopper', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Copper).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-sidejob:server:getitemIron', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Iron).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-sidejob:server:getitemSteel', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Steel).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-sidejob:server:getitemEmerald', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Emerald).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-sidejob:server:getitemDiamond', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Diamond).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)






-------------------------------------- Process --------------------------------------
ESX.RegisterServerCallback('esx-sidejob:server:getitemLumber', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Lumber).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-sidejob:server:getitemstone', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Stone).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)


ESX.RegisterServerCallback('esx-sidejob:server:getiten5stone', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.Stone).count >= 5 then
            cb(true)
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('esx-sidejob:server:getitemwashstone', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.WashStone).count >= 1 then
            cb(true)
        else
            cb(false)
        end
    end
end)
ESX.RegisterServerCallback('esx-sidejob:server:getitemwash3stone', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)
    if Player ~= nil then
        if Player.getInventoryItem(Config.WashStone).count >= 3 then
            cb(true)
        else
            cb(false)
        end
    end
end)







----------------------------------------- Apple -----------------------------------------------

RegisterNetEvent("esx-sidejob:server:AppleRewards")
AddEventHandler("esx-sidejob:server:AppleRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceivedApple
    player.addInventoryItem(Config.Apple, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedApple"] .. ' ' .. amount, "success", 2000)
end)

RegisterNetEvent("esx-sidejob:server:AppleSellRewards")
AddEventHandler("esx-sidejob:server:AppleSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Apple)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.ApplePrice
            Player.removeInventoryItem(Config.Apple, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["AppleSell"], "success", 2000)
    end

end)

-- ----------------------------------------- Apple -----------------------------------------------

 


----------------------------------------- Orange -----------------------------------------------

RegisterNetEvent("esx-sidejob:server:OrangeRewards")
AddEventHandler("esx-sidejob:server:OrangeRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceivedOrange
    player.addInventoryItem(Config.Orange, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedOrange"] .. ' ' .. amount, "success", 2000)
end)


RegisterNetEvent("esx-sidejob:server:OrangeSellRewards")
AddEventHandler("esx-sidejob:server:OrangeSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Orange)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.OrangePrice
            Player.removeInventoryItem(Config.Orange, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["OrangeSell"], "success", 2000)
    end

end)

-- ----------------------------------------- Orange -----------------------------------------------


-- ----------------------------------------- Gauva -----------------------------------------------

RegisterNetEvent("esx-sidejob:server:GauvaRewards")
AddEventHandler("esx-sidejob:server:GauvaRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceiveGauva
    player.addInventoryItem(Config.Gauva, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedGuava"].. ' ' .. amount, "success", 2000)
end)


RegisterNetEvent("esx-sidejob:server:GuavaSellRewards")
AddEventHandler("esx-sidejob:server:GuavaSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Gauva)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.GauvaPrice
            Player.removeInventoryItem(Config.Gauva, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["GuavaSell"], "success", 2000)
    end

end)

-- ----------------------------------------- Gauva -----------------------------------------------


-- ----------------------------------------- Mango -----------------------------------------------

RegisterNetEvent("esx-sidejob:server:MangoRewards")
AddEventHandler("esx-sidejob:server:MangoRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceiveMango
    player.addInventoryItem(Config.Mango, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedMango"].. ' ' .. amount, "success", 2000)
end)


RegisterNetEvent("esx-sidejob:server:MangoSellRewards")
AddEventHandler("esx-sidejob:server:MangoSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Mango)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.MangoPrice
            Player.removeInventoryItem(Config.Mango, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["GuavaSell"], "success", 2000)
    end

end)

-- ----------------------------------------- Mango -----------------------------------------------




-- ----------------------------------------- Tomato -----------------------------------------------

RegisterNetEvent("esx-sidejob:server:TomatoRewards")
AddEventHandler("esx-sidejob:server:TomatoRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceiveTomato
    player.addInventoryItem(Config.Tomato, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedTomato"].. ' ' .. amount, "success", 2000)
end)


RegisterNetEvent("esx-sidejob:server:TomatoSellRewards")
AddEventHandler("esx-sidejob:server:TomatoSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Tomato)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.TomatoPrice
            Player.removeInventoryItem(Config.Tomato, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["TomatoSell"], "success", 2000)
    end

end)

-- ----------------------------------------- Tomato -----------------------------------------------




----------------------------------------- Lumber -----------------------------------------------

RegisterNetEvent("esx-sidejob:server:LumberRewards")
AddEventHandler("esx-sidejob:server:LumberRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = math.random(2, 5)  
    local remove = 5 
    local itemR = math.random(1, 2) == 1 and Config.Woodplank or Config.Treebark  
    local itemData = player.getInventoryItem(Config.Lumber)
    if itemData and itemData.count >= 5 then  
        player.removeInventoryItem(Config.Lumber, remove) 
        player.addInventoryItem(itemR, amount) 
    else
        TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelError["ErrorLumberEnough"], "error", 2000)
    end
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedLumberProcess"].. ' '.. itemR ..' ' .. amount, "success", 2000)
end) 


RegisterNetEvent("esx-sidejob:server:LumberReward")
AddEventHandler("esx-sidejob:server:LumberReward", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceiveLumber
    player.addInventoryItem(Config.Lumber, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedLumber"].. ' ' .. amount, "success", 2000)
end)




RegisterNetEvent("esx-sidejob:server:WoodplankSellRewards")
AddEventHandler("esx-sidejob:server:WoodplankSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Woodplank)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.WoodplankPrice
            Player.removeInventoryItem(Config.Woodplank, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["WoodplankSell"], "success", 2000)
    end

end)


RegisterNetEvent("esx-sidejob:server:TreebarkSellRewards")
AddEventHandler("esx-sidejob:server:TreebarkSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Treebark)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.TreebarkPrice
            Player.removeInventoryItem(Config.Treebark, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["TreebarkSell"], "success", 2000)
    end
end)


-- ----------------------------------------- Lumber -----------------------------------------------




-- ----------------------------------------- Fish -----------------------------------------------


------------------------------------------------ Lost -----------------------------------------
RegisterNetEvent('esx-sidejob:server:removeFishingBaitLost')
AddEventHandler('esx-sidejob:server:removeFishingBaitLost', function()
	local src = source
    local Player = ESX.GetPlayerFromId(src)
    Player.removeInventoryItem(Config.Fishbait, 1)
    -- TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelError["FishbaitLost"], "error", 2000)
end)

RegisterNetEvent('esx-sidejob:server:removeFishingFishingrod')
AddEventHandler('esx-sidejob:server:removeFishingFishingrod', function()
	local src = source
    local Player = ESX.GetPlayerFromId(src)
    Player.removeInventoryItem(Config.Fishingrod, 1)
    -- TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelError["FishbaitLost"], "error", 2000)
end)


------------------------------------------------ Lost -----------------------------------------



-- ----------------------------------------- Fish -----------------------------------------------

RegisterNetEvent("esx-sidejob:server:YellowfinRewards")
AddEventHandler("esx-sidejob:server:YellowfinRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceivedFish
    player.addInventoryItem(Config.Yellowfin, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedYellowPin"].. ' ' .. amount, "success", 2000)
end)


RegisterNetEvent("esx-sidejob:server:YellowfinSellRewards")
AddEventHandler("esx-sidejob:server:YellowfinSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Yellowfin)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.YellowfinPrice
            Player.removeInventoryItem(Config.Yellowfin, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["YellowfinSell"], "success", 2000)
    end
end)




RegisterNetEvent("esx-sidejob:server:SalmonRewards")
AddEventHandler("esx-sidejob:server:SalmonRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceivedFish
    player.addInventoryItem(Config.Salmon, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedSalmon"].. ' ' .. amount, "success", 2000)
end)

RegisterNetEvent("esx-sidejob:server:SalmonSellRewards")
AddEventHandler("esx-sidejob:server:SalmonSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Salmon)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.SalmonPrice
            Player.removeInventoryItem(Config.Salmon, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["SalmonSell"], "success", 2000)
    end
end)


RegisterNetEvent("esx-sidejob:server:PigfishRewards")
AddEventHandler("esx-sidejob:server:PigfishRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.PigfishPrice
    player.addInventoryItem(Config.Pigfish, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedPigfish"].. ' ' .. amount, "success", 2000)
end)


RegisterNetEvent("esx-sidejob:server:PigfishSellRewards")
AddEventHandler("esx-sidejob:server:PigfishSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Pigfish)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.PigfishPrice
            Player.removeInventoryItem(Config.Pigfish, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["PigfishSell"], "success", 2000)
    end
end)


RegisterNetEvent("esx-sidejob:server:StripedbassRewards")
AddEventHandler("esx-sidejob:server:StripedbassRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceivedFish
    player.addInventoryItem(Config.Stripedbass, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedStripedbass"].. ' ' .. amount, "success", 2000)
end)

RegisterNetEvent("esx-sidejob:server:StripedbassSellRewards")
AddEventHandler("esx-sidejob:server:StripedbassSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Stripedbass)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StripedbassPrice
            Player.removeInventoryItem(Config.Stripedbass, itemData.count)
        else
            break
        end  
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["Stripedbass"], "success", 2000)
    end
end)




-- ----------------------------------------- Fish -----------------------------------------------




------------------------------------------------ Mining -----------------------------------------

RegisterNetEvent("esx-sidejob:server:MiningStoneRewards")
AddEventHandler("esx-sidejob:server:MiningStoneRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = Config.ReceivedStone
    player.addInventoryItem(Config.Stone, amount)
    TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedStone"].. ' ' .. amount, "success", 2000)
end)



RegisterNetEvent("esx-sidejob:server:WashstoneRewards")
AddEventHandler("esx-sidejob:server:WashstoneRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local remove = 5 
    local amount = Config.ReceivedStone
    local itemData = player.getInventoryItem(Config.Stone)  
    if itemData and itemData.count >= remove then
        player.removeInventoryItem(Config.Stone, remove)
        player.addInventoryItem(Config.WashStone, amount)
        TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedWashStone"] .. ' ' .. amount, "success", 2000)
    end
end)


RegisterNetEvent("esx-sidejob:server:MiningRewards")
AddEventHandler("esx-sidejob:server:MiningRewards", function(src)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local remove = 3
    local luck = math.random(1, 100)
    local amount = Config.ReceivedStonewWash
    local itemData = player.getInventoryItem(Config.WashStone)  
    if  luck >= 75 and luck <= 100 then
        if itemData and itemData.count >= remove then
            player.removeInventoryItem(Config.WashStone, remove)
            player.addInventoryItem(Config.Copper, amount)
            TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedCopper"] .. ' ' .. amount, "success", 2000)
        end
    elseif  luck >= 45 and luck <= 70 then
        if itemData and itemData.count >= remove then
            player.removeInventoryItem(Config.WashStone, remove)
            player.addInventoryItem(Config.Iron, amount)
            TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedIron"] .. ' ' .. amount, "success", 2000)
        end
    elseif  luck >= 25 and luck <= 45 then  
        if itemData and itemData.count >= remove then
            player.removeInventoryItem(Config.WashStone, remove)
            player.addInventoryItem(Config.Steel, amount)
            TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedSteel"] .. ' ' .. amount, "success", 2000)
        end
    elseif  luck >= 10 and luck <= 25 then
        if itemData and itemData.count >= remove then
            player.removeInventoryItem(Config.WashStone, remove)
            player.addInventoryItem(Config.Emerald, amount)
            TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedEmerald"] .. ' ' .. amount, "success", 2000)
        end
    elseif  luck >= 1 and luck <= 10 then
        if itemData and itemData.count >= remove then
            player.removeInventoryItem(Config.WashStone, remove)
            player.addInventoryItem(Config.Diamond, amount)
            TriggerClientEvent('gjayz-notify:showNotification', src, Config.LabelSucces["ReceivedDiamond"] .. ' ' .. amount, "success", 2000)
        end
    end
end)






RegisterNetEvent("esx-sidejob:server:CopperSellRewards")
AddEventHandler("esx-sidejob:server:CopperSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Copper)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.CopperPrice
            Player.removeInventoryItem(Config.Copper, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["CopperSell"], "success", 2000)
    end
end)
RegisterNetEvent("esx-sidejob:server:IronSellRewards")
AddEventHandler("esx-sidejob:server:IronSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Iron)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.IronPrice
            Player.removeInventoryItem(Config.Iron, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["IronSell"], "success", 2000)
    end
end)
RegisterNetEvent("esx-sidejob:server:SteelSellRewards")
AddEventHandler("esx-sidejob:server:SteelSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Steel)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.StellPrice
            Player.removeInventoryItem(Config.Steel, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["SteelSell"], "success", 2000)
    end
end)
RegisterNetEvent("esx-sidejob:server:EmeraldSellRewards")
AddEventHandler("esx-sidejob:server:EmeraldSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Emerald)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.EmeraldPrice
            Player.removeInventoryItem(Config.Emerald, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["EmeraldSell"], "success", 2000)
    end
end)
RegisterNetEvent("esx-sidejob:server:DiamondSellRewards")
AddEventHandler("esx-sidejob:server:DiamondSellRewards", function(src)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local price = 0
    while true do
        local itemData = Player.getInventoryItem(Config.Diamond)
        if itemData and itemData.count >= 1 then
            price = itemData.count * Config.DiamondPrice
            Player.removeInventoryItem(Config.Diamond, itemData.count)
        else
            break
        end
        Player.addMoney(price)
        TriggerClientEvent('gjayz-notify:showNotification', src,  Config.LabelSucces["DiamondSell"], "success", 2000)
    end
end)
------------------------------------------------ Mining  -----------------------------------------