---- Export 
ESX = exports["es_extended"]:getSharedObject()
-- target
local Target = exports.ox_target

local isZone = false
local isMarker = true
local isZoneMarker = false
local isWashZoneMarker = false
local isMeltingZoneMarker = false


RegisterNetEvent('esx-sidejob:client:progressbar')
AddEventHandler('esx-sidejob:client:progressbar', function(duration, position, label, useWhileDead, canCancel, move, car, sprint, mouse, boolean)
    lib.progressBar({
        duration = duration,  
        position = position,  
        label = label,  
        useWhileDead = useWhileDead, 
        canCancel = canCancel, 
        disable = {
            move = move,  
            car = car,  
            sprint = sprint,
            mouse = mouse,
            boolean = boolean
        }
    })
end)

RegisterNetEvent('esx-sidejob:client:progresscircle')
AddEventHandler('esx-sidejob:client:progresscircle', function(duration, position, label, useWhileDead, canCancel, move, car, sprint, mouse, boolean)
    lib.progressCircle({
        duration = duration,  
        position = position,  
        label = label,  
        useWhileDead = useWhileDead, 
        canCancel = canCancel, 
        disable = {
            move = move,  
            car = car,  
            sprint = sprint,
            mouse = mouse,
            boolean = boolean
        }
    })
end)


RegisterNetEvent('esx-sidejob:client:progresscircleAnime')
AddEventHandler('esx-sidejob:client:progresscircleAnime', function(duration, position, label, useWhileDead, canCancel, move, car, sprint, mouse, boolean, dict, clip)
    lib.progressCircle({
        duration = duration,  
        position = position,  
        label = label,  
        useWhileDead = useWhileDead, 
        canCancel = canCancel, 
        disable = {
            move = move,  
            car = car,  
            sprint = sprint,
            mouse = mouse,
            boolean = boolean
        }, 
        anim = {
            dict = dict,
            clip = clip
        },
    })
end)



if Config.Marker then
    Citizen.CreateThread(function()
        local markers = {}
        if isMarker then
            for _, v in pairs(Config.MarkerStone) do
                local marker = lib.marker.new({
                    type = v.markerType,
                    coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                    width = v.width, 
                    height = v.height, 
                    color = { 
                        r = v.color.r, 
                        g = v.color.g, 
                        b = v.color.b, 
                        a = v.color.a 
                    },
        
                })
                table.insert(markers, marker)
            end
        end

        while true do
            Citizen.Wait(1) 
            local playerPed = PlayerPedId() 
            local playerCoords = GetEntityCoords(playerPed)  
            local isMarker = true
            for _, marker in pairs(markers) do
                local markerCoords = marker.coords  
                local distance = #(playerCoords - markerCoords)  
                if distance <= .5 then
                    isMarker = false
                    break  
                end
            end
            for _, marker in pairs(markers) do
                if isMarker then
                    marker:draw()
                end
            end
        end
    end)
end





local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(1)
    end
end


function startAnim(dict, set, bonIndex, model, xPos, yPos, zPos, xRot, yRot, zRot, Msg)
    if isAnim then return end

    local animDict = dict
    local animName = set
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local bon = GetPedBoneIndex(playerPed, bonIndex)  -- 57005
    local modelHandle = CreateObject(model, coords.x, coords.y, coords.z, true, false, false)
    
    if modelHandle ~= nil and DoesEntityExist(modelHandle) then
        Citizen.CreateThread(function()
            isAnim = true

            loadAnimDict(animDict)
            while isAnim do
                AttachEntityToEntity(modelHandle, playerPed, bon, xPos, yPos, zPos, xRot, yRot, zRot, true, true, false, true, 1, true)
                TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
                if Config.Progress then 
                    TriggerEvent('esx-sidejob:client:progressbar', 9000, 'bottom', Msg, false, true, true, true, true, false, true)
                else
                    TriggerEvent('esx-sidejob:client:progresscircle', 9000, 'bottom', Msg, false, true, true, true, true, false, true)
                end
                Wait(9000)
                ClearPedTasks(playerPed)
                DetachEntity(modelHandle, true, true)
                DeleteEntity(modelHandle)
                isAnim = false
            end
        end)
    end
end

-- Text UI
RegisterNetEvent('esx-sidejob:client:text-showUI')
AddEventHandler('esx-sidejob:client:text-showUI', function(text_ui, position,  borderRadius, backgroundColor, color)
    Wait(500)
    lib.showTextUI(text_ui, {
        position = position,
        style = {
            borderRadius =  borderRadius,
            backgroundColor = backgroundColor,
            color = color
        }
    })
end)

RegisterNetEvent('esx-sidejob:client:text-hideUI')
AddEventHandler('esx-sidejob:client:text-hideUI', function()
    lib.hideTextUI()
end)


if Config.Fishing then
    CreateThread(function()
        while true do
            Wait(1)
            if isZone then
                if IsControlJustReleased(0, 38) then  
                    TriggerEvent('esx-sidejob:client:text-hideUI')
                    TriggerEvent('esx-sidejob:client:StartFishing')
                end  
            end   

            if isZoneMarker then
                if IsControlJustReleased(0, 38) then  
                    TriggerEvent('esx-sidejob:client:text-hideUI')
                    TriggerEvent('esx-sidejob:client:StartMiningStone')
                end  
            end   
            if isWashZoneMarker then
                if IsControlJustReleased(0, 38) then  
                    TriggerEvent('esx-sidejob:client:text-hideUI')
                    TriggerEvent('esx-sidejob:client:StartWashStone')
                end  
            end   
            if isMeltingZoneMarker then
                if IsControlJustReleased(0, 38) then  
                    TriggerEvent('esx-sidejob:client:text-hideUI')
                    TriggerEvent('esx-sidejob:client:StartMeltingStone')
                end  
            end   
        end
    end)
end


if Config.UseTarget then
    local distanceToPick = function(playerPed, targetCoords)
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - targetCoords)
        return distance <= 2.0
    end



    Citizen.CreateThread(function()


     
        -- Apple
        for _, v in pairs(Config.AppleTress) do
            Target:addBoxZone({
                coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                size = v.size,
                rotation = v.heading,
                debugPoly = drawZones,
                options = {
                    {
                    name = 'Picking Apple',
                    event = "esx-sidejob:client:StartfarmApple",
                    icon = "fa fa-sign-language",
                    label = Config.LabelTarget["PickApple"],
                    canInteract = function()
                        local playerPed = PlayerPedId() 
                        local targetCoords = vec3(v.coords.x, v.coords.y, v.coords.z)
                        return distanceToPick(playerPed, targetCoords)
                    end
                    }
                } 
            })
        end
        

        --- Orange
        for _, v in pairs(Config.Orange) do
            Target:addBoxZone({
                coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                size = v.size,
                rotation = v.heading,
                debugPoly = drawZones,
                options = {
                    {
                    name = 'Picking Orange',
                    event = "esx-sidejob:client:StartfarmOrange",
                    icon = "fa fa-sign-language",
                    label = Config.LabelTarget["PickOrange"],
                    canInteract = function()
                        local playerPed = PlayerPedId() 
                        local targetCoords = vec3(v.coords.x, v.coords.y, v.coords.z)
                        return distanceToPick(playerPed, targetCoords)
                    end
                    }
                } 
            })
        end

        --- Guava
        for _, v in pairs(Config.Guava) do
            Target:addBoxZone({
                coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                size = v.size,
                rotation = v.heading,
                debugPoly = drawZones,
                options = {
                    {
                    name = 'Picking Guava',
                    event = "esx-sidejob:client:StartfarmGuava",
                    icon = "fa fa-sign-language",
                    label = Config.LabelTarget["PickGuava"],
                    canInteract = function()
                        local playerPed = PlayerPedId() 
                        local targetCoords = vec3(v.coords.x, v.coords.y, v.coords.z)
                        return distanceToPick(playerPed, targetCoords)
                    end
                    }
                } 
            })
        end

        --- Mango
        for _, v in pairs(Config.Mango) do
            Target:addBoxZone({
                coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                size = v.size,
                rotation = v.heading,
                debugPoly = drawZones,
                options = {
                    {
                    name = 'Picking Mango',
                    event = "esx-sidejob:client:StartfarmMango",
                    icon = "fa fa-sign-language",
                    label = Config.LabelTarget["PickMango"],
                    canInteract = function()
                        local playerPed = PlayerPedId() 
                        local targetCoords = vec3(v.coords.x, v.coords.y, v.coords.z)
                        return distanceToPick(playerPed, targetCoords)
                    end
                    }
                } 
            })
        end

        --- Tomato
        for _, v in pairs(Config.Tomato) do
            Target:addBoxZone({
                coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                size = v.size,
                rotation = v.heading,
                debugPoly = drawZones,
                options = {
                    {
                    name = 'Picking Tomato',
                    event = "esx-sidejob:client:StartfarmTomato",
                    icon = "fa fa-sign-language",
                    label = Config.LabelTarget["PickTomato"],
                    canInteract = function()
                        local playerPed = PlayerPedId() 
                        local targetCoords = vec3(v.coords.x, v.coords.y, v.coords.z)
                        return distanceToPick(playerPed, targetCoords)
                    end
                    }
                } 
            })
        end

         ---- Lamber
        for _, v in pairs(Config.Lamber) do
            Target:addBoxZone({
                coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                size = v.size,
                rotation = v.heading,
                debugPoly = drawZones,
                options = {
                    {
                    name = 'Picking Tomato',
                    event = "esx-sidejob:client:StartfarmLamber",
                    icon = "fa fa-sign-language",
                    label = Config.LabelTarget["PickTomato"],
                    canInteract = function()
                        local playerPed = PlayerPedId() 
                        local targetCoords = vec3(v.coords.x, v.coords.y, v.coords.z)
                        return distanceToPick(playerPed, targetCoords)
                    end
                    }
                } 
            })
        end

        ----- Process Lumber -----
        exports.ox_target:addBoxZone({
            coords = Config.lumberProcess.coords,  
            size = Config.lumberProcess.size,          
            rotation = Config.lumberProcess.heading,  
            debug = false,
            options = {
                {
                    name = 'Process Lumber',
                    event = 'esx-sidejob:client:ProcesLumber',
                    icon = "fa-solid fa-money-bill-wave",
                    label = Config.LabelTarget["LumberProcess"],
                    canInteract = function()
                        local playerPed = PlayerPedId() 
                        local targetCoords = Config.lumberProcess.coords 
                        return distanceToPick(playerPed, targetCoords)
                    end
                },
            }
        })


        ----- Sell Item ----------
        exports.ox_target:addBoxZone({
            coords = Config.SellitemJob.coords,  
            size = Config.SellitemJob.size,          
            rotation = Config.SellitemJob.heading,  
            debug = false,
            options = {
                {
                    name = 'Sell Food',
                    event = 'esx-sidejob:client:ListSellItemSidejob',
                    icon = "fa-solid fa-money-bill-wave",
                    label = Config.LabelTarget["SellItem"],
                    canInteract = function()
                        local playerPed = PlayerPedId() 
                        local targetCoords = Config.SellitemJob.coords 
                        return distanceToPick(playerPed, targetCoords)
                    end
                },
            }
        })



        --- Fish Zone
        for k, v in pairs(Config.ZoneFish) do
            local FishZone = PolyZone:Create(v.zones, {
                name = v.label,
                minZ = v.minz,
                maxZ = v.maxz,
                debugPoly = false
            })
            FishZone:onPlayerInOut(function(isPointInside)
                if isPointInside then
                    TriggerEvent('esx-sidejob:client:text-showUI', '[E] - Fishing', "left-center", 0, '#000000', 'white')
                    isZone = true
                else
                    TriggerEvent('esx-sidejob:client:text-hideUI')
                    isZone = false  
                end
            end)
        end


        for k, v in pairs(Config.ZoneMiningStone) do
            local MiningStoneZone = PolyZone:Create(v.zones, {
                name = v.label,
                minZ = v.minz,
                maxZ = v.maxz,
                debugPoly = false
            })
            MiningStoneZone:onPlayerInOut(function(isPointInside)
                if isPointInside then
                    TriggerEvent('esx-sidejob:client:text-showUI',  '[E] - Mining' ,"left-center", 0, '#000000', 'white')
                    isZoneMarker = true
                else
                    TriggerEvent('esx-sidejob:client:text-hideUI')
                    isZoneMarker = false  
                end
            end)
        end


        for k, v in pairs(Config.StoneWash) do
            local WashStoneZone = PolyZone:Create(v.zones, {
                name = v.label,
                minZ = v.minz,
                maxZ = v.maxz,
                debugPoly = false
            })
            WashStoneZone:onPlayerInOut(function(isPointInside)
                if isPointInside then
                    TriggerEvent('esx-sidejob:client:text-showUI',  '[E] - Wash Stone' ,"left-center", 0, '#000000', 'white')
                    isWashZoneMarker = true
                else
                    TriggerEvent('esx-sidejob:client:text-hideUI')
                    isWashZoneMarker = false  
                end
            end)
        end


        for k, v in pairs(Config.MeltingWash) do
            local MeltingStoneZone = PolyZone:Create(v.zones, {
                name = v.label,
                minZ = v.minz,
                maxZ = v.maxz,
                debugPoly = false
            })
            MeltingStoneZone:onPlayerInOut(function(isPointInside)
                if isPointInside then
                    TriggerEvent('esx-sidejob:client:text-showUI',  '[E] - Melting Stone' ,"left-center", 0, '#000000', 'white')
                    isMeltingZoneMarker = true
                else
                    TriggerEvent('esx-sidejob:client:text-hideUI')
                    isMeltingZoneMarker = false  
                end
            end)
        end

        

        

        
    end)
end




if Config.BlipsAndPeds then
    Citizen.CreateThread(function()

        -- Blips
        for _, v in pairs(Config.AllBlips) do
            local AllBlip = AddBlipForCoord(v.coords)
            SetBlipSprite(AllBlip, v.SetBlipSprite)      
            SetBlipDisplay(AllBlip, 4)                   
            SetBlipScale(AllBlip, v.SetBlipScale)      
            SetBlipColour(AllBlip, v.SetBlipColour)      
            SetBlipAsShortRange(AllBlip, true)          
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.BlipName)      
            EndTextCommandSetBlipName(AllBlip)
        end     

        for _, v in ipairs(Config.PedPeplo) do
            local modelHash = GetHashKey(v.model)
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Wait(500)
            end
            local x, y, z, heading = v.coords.x, v.coords.y, v.coords.z, v.coords.w
            local ped = CreatePed(4, modelHash, x, y, z, heading, false, true)
            SetEntityInvincible(ped, true) 
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetPedFleeAttributes(ped, 0, false)
            TaskStartScenarioInPlace(ped, v.scenario, 0, true)
            -- -- Freeze the ped in place after starting the scenario
            -- Wait(1000)
            -- FreezeEntityPosition(ped, true)
        end

    end)
end




--------
------------------------------------- APPLE FARM --------------------------------------------------------
RegisterNetEvent('esx-sidejob:client:StartfarmApple')
AddEventHandler('esx-sidejob:client:StartfarmApple', function()
    ESX.TriggerServerCallback('esx-sidejob:server:getitemshortknife', function(ShortKnife)
        if ShortKnife then
            if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'q', 'e',})
            if success then
                startAnim('amb@prop_human_movie_bulb@base', 'base', 57005, `w_me_switchblade`, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartPickingApple"])
                Wait(9000)
                TriggerServerEvent("esx-sidejob:server:AppleRewards")
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorUi"], "error", 2000)
            end
        else
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ShortKnife"], "error", 2000)
        end
    end)
end)





-- --------------------------------------------- Orange FARM --------------------------------------------------------
RegisterNetEvent('esx-sidejob:client:StartfarmOrange')
AddEventHandler('esx-sidejob:client:StartfarmOrange', function()
    ESX.TriggerServerCallback('esx-sidejob:server:getitemshortknife', function(ShortKnife)
        if ShortKnife then
            if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'q', 'e',})
            if success then
                startAnim('amb@prop_human_movie_bulb@base', 'base', 57005, `w_me_switchblade`, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartPickingOrange"] )
                Wait(9000)
                TriggerServerEvent("esx-sidejob:server:OrangeRewards")
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorUi"], "error", 2000)
            end
        else
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ShortKnife"], "error", 2000)
        end
    end)
end)



--------------------------------------------- Guava FARM --------------------------------------------------------
RegisterNetEvent('esx-sidejob:client:StartfarmGuava')
AddEventHandler('esx-sidejob:client:StartfarmGuava', function()
    ESX.TriggerServerCallback('esx-sidejob:server:getitemshortknife', function(ShortKnife)
        if ShortKnife then
            if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'q', 'e',})
            if success then
                startAnim('amb@prop_human_movie_bulb@base', 'base', 57005, `w_me_switchblade`, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartPickingGauva"] )
                Wait(9000)
                TriggerServerEvent("esx-sidejob:server:GauvaRewards")
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorUi"], "error", 2000)
            end
        else
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ShortKnife"], "error", 2000)
        end
    end)
end)



--------------------------------------------- Mango FARM --------------------------------------------------------
RegisterNetEvent('esx-sidejob:client:StartfarmMango')
AddEventHandler('esx-sidejob:client:StartfarmMango', function()
    ESX.TriggerServerCallback('esx-sidejob:server:getitemshortknife', function(ShortKnife)
        if ShortKnife then
            if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'q', 'e',})
            if success then
                startAnim('amb@prop_human_movie_bulb@base', 'base', 57005, `w_me_switchblade`, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartPickingMango"] )
                Wait(9000)
                TriggerServerEvent("esx-sidejob:server:MangoRewards")
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorUi"], "error", 2000)
            end
        else
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ShortKnife"], "error", 2000)
        end
    end)
end)




--------------------------------------------- Tomato FARM --------------------------------------------------------
RegisterNetEvent('esx-sidejob:client:StartfarmTomato')
AddEventHandler('esx-sidejob:client:StartfarmTomato', function()
    ESX.TriggerServerCallback('esx-sidejob:server:getitemshortknife', function(ShortKnife)
        if ShortKnife then
            if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000)  end 
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'q', 'e',})
            if success then
                startAnim('missmechanic', 'work_base', 57005, `w_me_switchblade`, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartPickingTomato"] )
                Wait(9000)
                TriggerServerEvent("esx-sidejob:server:TomatoRewards")
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorUi"], "error", 2000)
            end
        else
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ShortKnife"], "error", 2000)
        end
    end)
end)






--------------------------------------------- lamber FARM --------------------------------------------------------
RegisterNetEvent('esx-sidejob:client:StartfarmLamber')
AddEventHandler('esx-sidejob:client:StartfarmLamber', function()
    ESX.TriggerServerCallback('esx-sidejob:server:getitemaxe', function(Axe)
        if Axe then
            if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'q', 'e',})
            if success then
                startAnim('melee@hatchet@streamed_core', 'plyr_rear_takedown_b', 57005, `w_me_battleaxe`, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartPickingLambar"] )
                Wait(9000)
                TriggerServerEvent("esx-sidejob:server:LumberReward")
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorUi"], "error", 2000)
            end
        else
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Axe"], "error", 2000)
        end
    end)
end)



-- ------------------------------------- Fishing -------------------------------------


function loseBait()
    local chancelost = math.random(1, 100)
    if chancelost <= 70 then
        TriggerServerEvent("esx-sidejob:server:removeFishingBaitLost")
    end
end

function loseGrod()
    local chancelost = math.random(1, 100)
    if chancelost <= 30 then
        TriggerServerEvent("esx-sidejob:server:removeFishingFishingrod")
    end
end






RegisterNetEvent('esx-sidejob:client:StartFishing')
AddEventHandler('esx-sidejob:client:StartFishing', function(args)
    ESX.TriggerServerCallback('esx-sidejob:server:getitemfishingrod', function(FishingGrod)
        if FishingGrod then
            ESX.TriggerServerCallback('esx-sidejob:server:getitemfishbait', function(FishBait)
                if FishBait then
                    if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
                    if IsPedSwimming(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Swimming"], 'error', 2000) end 
                    local success = lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'q', 'e',})
                    if success then
                        startAnim('amb@world_human_stand_fishing@idle_a', 'idle_c',  18905, `prop_fishing_rod_01`, 0.1, 0.05, 0, 40.0, 80.0, 160.0,   Config.LabelBar["StartFishing"])
                        Wait(9000)
                        TriggerEvent("esx-sidejob:client:FishingReward")
                    else
                        TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorUi"], "error", 2000)
                    end
                else
                    TriggerEvent('esx-sidejob:client:text-showUI', '[E] - Fishing', "left-center", 0, '#000000', 'white')
                    TriggerEvent('gjayz-notify:showNotification', Config.LabelError["FishBait"], "error", 2000)
                 end
                
                 TriggerEvent('esx-sidejob:client:text-showUI','[E] - Fishing', "left-center", 0, '#000000', 'white')
            end)
        else
            TriggerEvent('esx-sidejob:client:text-showUI',"left-center", 0, '#000000', 'white')
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["FishingGrod"], "error", 2000)
        end
    end)
end)


RegisterNetEvent('esx-sidejob:client:FishingReward')
AddEventHandler('esx-sidejob:client:FishingReward', function()
    local luck = math.random(1, 100)
    if luck >= 95 and luck <= 100 then
        TriggerServerEvent("esx-sidejob:server:YellowfinRewards")
        loseBait()
        loseGrod()
    elseif  luck >= 85 and luck <= 95 then
        TriggerServerEvent("esx-sidejob:server:SalmonRewards")
        loseBait()
        loseGrod()
    elseif  luck >= 60 and luck <= 85 then
        TriggerServerEvent("esx-sidejob:server:PigfishRewards")
        loseBait()
        loseGrod()
    elseif  luck >= 35 and luck <= 60 then
        TriggerServerEvent("esx-sidejob:server:StripedbassRewards")
        loseBait()
        loseGrod()
    else
        TriggerEvent('gjayz-notify:showNotification', Config.LabelError["FishRewardError"], "error", 2000)
        loseBait()
        loseGrod()
    end
end)




-------------------------------------------------------------Maning ----------------------------------------------------
RegisterNetEvent('esx-sidejob:client:StartMiningStone')
AddEventHandler('esx-sidejob:client:StartMiningStone', function(args)
    ESX.TriggerServerCallback('esx-sidejob:server:getitempickaxe', function(pickAxe)
        if pickAxe then
            if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1}, 'easy'}, {'q', 'e',})
            if success then
                startAnim('melee@hatchet@streamed_core', 'plyr_rear_takedown_b',  57005, `prop_tool_pickaxe`,0.1, 0.05, 0, 40.0, 80.0, 160.0, Config.LabelBar["StartMiningStone"])
                Wait(9000)
                TriggerServerEvent("esx-sidejob:server:MiningStoneRewards")
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorUi"], "error", 2000)
            end

        else
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["PickAxe"], "error", 2000)
            TriggerEvent('esx-sidejob:client:text-miningStoneshowUI', '[E] - Mining', "left-center", 0, '#000000', 'white')
        end
        TriggerEvent('esx-sidejob:client:text-showUI','[E] - Mining', "left-center", 0, '#000000', 'white')
    end)
end)


RegisterNetEvent('esx-sidejob:client:StartWashStone')
AddEventHandler('esx-sidejob:client:StartWashStone', function(args)
    ESX.TriggerServerCallback('esx-sidejob:server:getitemstone', function(stone)
        if stone then
            ESX.TriggerServerCallback('esx-sidejob:server:getiten5stone', function(fstone)
                if fstone then
                    if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
                    startAnim('amb@world_human_gardener_plant@male@idle_a', 'idle_b', 57005, `prop_rock_5_smash1`, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartWashStone"] )
                    Wait(9000)
                    TriggerServerEvent("esx-sidejob:server:WashstoneRewards")
                else
                    TriggerEvent('esx-sidejob:client:text-showUI','[E] - Wash Stone', "left-center", 0, '#000000', 'white')
                    TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorStoneEnough"], "error", 2000)
 
                 end
                 TriggerEvent('esx-sidejob:client:text-showUI','[E] - Wash Stone', "left-center", 0, '#000000', 'white')
            end)
        else
            TriggerEvent('esx-sidejob:client:text-showUI','[E] - Wash Stone', "left-center", 0, '#000000', 'white')
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorStone"], "error", 2000)
        end
    end)
end)

RegisterNetEvent('esx-sidejob:client:StartMeltingStone')
AddEventHandler('esx-sidejob:client:StartMeltingStone', function(args)
    ESX.TriggerServerCallback('esx-sidejob:server:getitemwashstone', function(washstone)
        if washstone then
            ESX.TriggerServerCallback('esx-sidejob:server:getitemwash3stone', function(wash3stone)
                if wash3stone then
                    if IsPedInAnyVehicle(PlayerPedId(), false) then return TriggerEvent('gjayz-notify:showNotification', Config.LabelError["Driving"], 'error', 2000) end 
                    startAnim('missmechanic', 'work2_in', 57005, `prop_rock_5_smash1`, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartMeltingStone"] )
                    Wait(9000)
                    TriggerServerEvent("esx-sidejob:server:MiningRewards")
                else
                    TriggerEvent('esx-sidejob:client:text-showUI','[E] - Melting Stone', "left-center", 0, '#000000', 'white')
                    TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorWashStoneEnough"], "error", 2000)
                end
                TriggerEvent('esx-sidejob:client:text-showUI','[E] - Melting Stone', "left-center", 0, '#000000', 'white')
            end)
        else
            TriggerEvent('esx-sidejob:client:text-showUI','[E] - Melting Stone', "left-center", 0, '#000000', 'white')
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ErrorWashStone"], "error", 2000)
        end
        TriggerEvent('esx-sidejob:client:text-showUI','[E] - Melting Stone', "left-center", 0, '#000000', 'white')
    end)
end)





-------------------------------------------- Sell Item Ui ------------------------------------------------

RegisterNetEvent('esx-sidejob:client:ProcesLumber')
AddEventHandler('esx-sidejob:client:ProcesLumber', function(src)
    lib.registerContext({
        id = 'Process_Lumber',
        title = Config.LabelTitle['LumberProcess'],
        options = {
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["Woodplank"],
                description = 'Wood Plank',
                event = 'esx-sidejob:client:ProcessLumber',
            },  
        },
    })
    lib.showContext('Process_Lumber')
end)



RegisterNetEvent('esx-sidejob:client:ListSellItemSidejob')
AddEventHandler('esx-sidejob:client:ListSellItemSidejob', function(src)
    lib.registerContext({
        id = 'Farm_List',
        title = Config.LabelTitle['SellItem'],
        options = {
            {
                icon = "fa-solid fa-circle-dollar-to-slot",
                title =  Config.LabelTitle['Fruit'],
                description = 'Farm Fuits',
                event = 'esx-sidejob:client:SellItemFruit',
            },  
            {
                icon = "fa-solid fa-circle-dollar-to-slot",
                title = Config.LabelTitle['Lumber'],
                description = 'Farm Lumber',
                event = 'esx-sidejob:client:SellItemLumber',
            },  
            {
                icon = "fa-solid fa-circle-dollar-to-slot",
                title = Config.LabelTitle['Fish'],
                description = 'Farm Fish',
                event = 'esx-sidejob:client:SellItemFish',
            },  
            {
                icon = "fa-solid fa-circle-dollar-to-slot",
                title = Config.LabelTitle['Stone'],
                description = 'Farm Stone',
                event = 'esx-sidejob:client:SellItemStone',
            },  

        },
    })
    lib.showContext('Farm_List')
end)



RegisterNetEvent('esx-sidejob:client:SellItemFruit')
AddEventHandler('esx-sidejob:client:SellItemFruit', function(src)
    lib.registerContext({
        id = 'Sell_Fruit',
        title = Config.LabelTitle['SellItem'],
        options = {
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellApple"],
                description = 'Apple',
                args = 1,
                event = 'esx-sidejob:client:SellItemFruits',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellOrange"],
                description = 'Orange',
                args = 2,
                event = 'esx-sidejob:client:SellItemFruits',
            },
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellGuava"],
                description = 'Guava',
                args = 3,
                event = 'esx-sidejob:client:SellItemFruits',
            },
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellMango"],
                description = 'Mango',
                args = 4,
                event = 'esx-sidejob:client:SellItemFruits',
            },
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellTomato"],
                description = 'Tomato',
                args = 5,
                event = 'esx-sidejob:client:SellItemFruits',
            },
        },
    })
    lib.showContext('Sell_Fruit')
end)





RegisterNetEvent('esx-sidejob:client:SellItemLumber')
AddEventHandler('esx-sidejob:client:SellItemLumber', function(src)
    lib.registerContext({
        id = 'Sell_Lumber',
        title = Config.LabelTitle['SellItem'],
        options = {
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellWoodplank"],
                description = 'WoodPlank',
                args = 1,
                event = 'esx-sidejob:client:SellItemLumbers',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellTreebark"],
                description = 'Treebark',
                args = 2,
                event = 'esx-sidejob:client:SellItemLumbers',
            }, 
        },
    })
    lib.showContext('Sell_Lumber')
end)

RegisterNetEvent('esx-sidejob:client:SellItemFish')
AddEventHandler('esx-sidejob:client:SellItemFish', function(src)
    lib.registerContext({
        id = 'Sell_Fish',
        title = Config.LabelTitle['SellItem'],
        options = {
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellYellowPin"],
                description = 'Yellowpin',
                args = 1,
                event = 'esx-sidejob:client:SellItemFishs',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellSalmon"],
                description = 'Salmon',
                args = 2,
                event = 'esx-sidejob:client:SellItemFishs',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellPigfish"],
                description = 'Pigfish',
                args = 3,
                event = 'esx-sidejob:client:SellItemFishs',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellStripedbass"],
                description = 'Stripedbass',
                args = 4,
                event = 'esx-sidejob:client:SellItemFishs',
            },  
        },
    })
    lib.showContext('Sell_Fish')
end)


RegisterNetEvent('esx-sidejob:client:SellItemStone')
AddEventHandler('esx-sidejob:client:SellItemStone', function(src)
    lib.registerContext({
        id = 'Sell_Stone',
        title = Config.LabelTitle['SellItem'],
        options = {
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellCopper"],
                description = 'Copper',
                args = 1,
                event = 'esx-sidejob:client:SellItemStones',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellIron"],
                description = 'Iron',
                args = 2,
                event = 'esx-sidejob:client:SellItemStones',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellSteel"],
                description = 'Steel',
                args = 3,
                event = 'esx-sidejob:client:SellItemStones',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellEmerald"],
                description = 'Emerald',
                args = 4,
                event = 'esx-sidejob:client:SellItemStones',
            },  
            {
                icon = "fa-regular fa-money-bill-1",
                title = Config.LabelTitle["SellDiamond"],
                description = 'Diamond',
                args = 5,
                event = 'esx-sidejob:client:SellItemStones',
            },  
        },
    })
    lib.showContext('Sell_Stone')
end)
-------------------------------------------- Sell Item Ui ------------------------------------------------


-------------------------------- Sale ------------------------------------

RegisterNetEvent('esx-sidejob:client:SellItemFruits')
AddEventHandler('esx-sidejob:client:SellItemFruits', function(args)
    if args == 1 then
        ESX.TriggerServerCallback('esx-sidejob:server:SellInfoApple', function(Apple)
            if Apple then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellApple"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:AppleSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorApple"], "error", 2000)
            end
        end)

    elseif args == 2 then
        ESX.TriggerServerCallback('esx-sidejob:server:SellInfoOrange', function(Orange)
            if Orange then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellOrange"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:OrangeSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification',  Config.LabelError["SellErrorOrange"], "error", 2000)
            end
        end)
    elseif args == 3 then
        ESX.TriggerServerCallback('esx-sidejob:server:SellInfoGuava', function(Guava)
            if Guava then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0,  Config.LabelBar["StartSellGuava"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:GuavaSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification',  Config.LabelError["SellErrorGuava"], "error", 2000)
            end
        end)
    elseif args == 4 then
        ESX.TriggerServerCallback('esx-sidejob:server:SellInfoMango', function(Mango)
            if Mango then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellMango"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:MangoSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification',  Config.LabelError["SellErrorMango"], "error", 2000)
            end
        end)
    elseif args == 5 then
        ESX.TriggerServerCallback('esx-sidejob:server:SellInfoTomato', function(Tomato)
            if Tomato then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0,  Config.LabelBar["StartSellToamto"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:TomatoSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification',  Config.LabelError["SellErrorTomato"], "error", 2000)
            end
        end)
    end
end)


------------------------------------- Sell Lumber ------------------------------
RegisterNetEvent('esx-sidejob:client:SellItemLumbers')
AddEventHandler('esx-sidejob:client:SellItemLumbers', function(args)
    if args == 1 then
        ESX.TriggerServerCallback('esx-sidejob:server:SellInfoWoodplank', function(Woodplank)
            if Woodplank then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellWoodplank"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:WoodplankSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorWoodplank"], "error", 2000)
            end
        end)

    elseif args == 2 then
        ESX.TriggerServerCallback('esx-sidejob:server:SellInfoTreebark', function(Treebark)
            if Treebark then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0,  Config.LabelBar["StartSellTreebark"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:TreebarkSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorTreebark"], "error", 2000)
            end
        end)
    end
end)

-- ----------------------------------- SellFish -------------------------------------
RegisterNetEvent('esx-sidejob:client:SellItemFishs')
AddEventHandler('esx-sidejob:client:SellItemFishs', function(args)
    if args == 1 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemYellowPin', function(Yellowfin)
            if Yellowfin then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellYellowPin"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:YellowfinSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorYellowPin"], "error", 2000)
            end

        end)
    elseif args == 2 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemSalmon', function(Salmon)
            if Salmon then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellSalmon"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:SalmonSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorSalmon"], "error", 2000)
            end

        end)
    elseif args == 3 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemPigfish', function(Salmon)
            if Salmon then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellPigfish"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:PigfishSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorPigfish"], "error", 2000)
            end

        end)
    elseif args == 4 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemStripedbass', function(Stripedbass)
            if Stripedbass then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellStripedbass"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:StripedbassSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorStripedbass"], "error", 2000)
            end

        end)
    end

end)
-- ----------------------------------- Process -------------------------------------

RegisterNetEvent('esx-sidejob:client:ProcessLumber')
AddEventHandler('esx-sidejob:client:ProcessLumber', function(args)
    ESX.TriggerServerCallback('esx-sidejob:server:getitemLumber', function(Lumber)
        if Lumber then
            startAnim('missfam4', 'base', ``, 0.1, 0.05, 0.0, 40.0, 70.0, 20.0, Config.LabelBar["StartProcessLambar"])
            Wait(9000)
            TriggerServerEvent('esx-sidejob:server:LumberRewards', src)
        else
            TriggerEvent('gjayz-notify:showNotification', Config.LabelError["ProceessErrorLumber"], "error", 2000)
        end
    end)
end)


--------------------------------------------- Mining ------------------------------------------------

RegisterNetEvent('esx-sidejob:client:SellItemStones')
AddEventHandler('esx-sidejob:client:SellItemStones', function(args)
    if args == 1 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemCopper', function(copper)
            if copper then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellCopper"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:CopperSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorCopper"], "error", 2000)
            end
        end)
    elseif args == 2 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemIron', function(iron)
            if iron then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellIron"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:IronSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorIron"], "error", 2000)
            end
            
        end)
    elseif args == 3 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemSteel', function(steel)
            if steel then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellSteel"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:SteelSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorSteel"], "error", 2000)
            end
        end)
    elseif args == 4 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemEmerald', function(emerald)
            if emerald then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellEmerald"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:EmeraldSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorEmerald"], "error", 2000)
            end
        end)
    elseif args == 5 then
        ESX.TriggerServerCallback('esx-sidejob:server:getitemDiamond', function(diamond)
            if diamond then
                startAnim('missfam4', 'base',  18905, `p_amb_clipboard_01`, 0.25, 0.1, 0.1, 40.0, 100.0, 220.0, Config.LabelBar["StartSellDiamond"])
                Wait(9000)
                TriggerServerEvent('esx-sidejob:server:DiamondSellRewards', src)
            else
                TriggerEvent('gjayz-notify:showNotification', Config.LabelError["SellErrorDiamond"], "error", 2000)
            end
        end)
    end
end)

