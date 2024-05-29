print("client")
local QBCore = exports["qb-core"]:GetCoreObject()


RegisterCommand(config.commandName ,function(source,args)
    local ped = GetPlayerServerId(PlayerId())
    local Player = QBCore.Functions.GetPlayerData()
    print(json.encode(Player, { indent = true}))
    if ped then
      SendNUIMessage({
        action = 'nui_principal',
        cars = config.cars,
        currentMoney = Player.money.bank
      })
      SetNuiFocus(true, true)
    else
        TriggerEvent('store-car:client:notify', {
            msg = "no hay jugador",
            type = "error"
        })
    end

end)

RegisterNetEvent("store-car:client:notify", function(args)
    QBCore.Functions.Notify(args.msg, args.type, 5000)
end)

RegisterNetEvent('store-car:client:spawn', function(args)
    local cors = GetEntityCoords(PlayerPedId())
    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
         local veh = NetToVeh(netId)
         TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
    end, args.model, cors, true)
end)

RegisterNUICallback('close', function(args, cb)
    
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "nui_hidden"
    })

    cb({})
end)

RegisterNUICallback('click', function(args, cb)
    TriggerServerEvent('store-car:server:buy', {
        car = args.model,
        src = GetPlayerServerId(PlayerId()),
        price = tonumber(args.price)
    })
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "nui_hidden"
    })
    cb({})
end)