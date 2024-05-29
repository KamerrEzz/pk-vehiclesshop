local QBCore = exports["qb-core"]:GetCoreObject()
print("server")

RegisterNetEvent("store-car:server:buy", function(args)
    print(json.encode(args))
    local Player = QBCore.Functions.GetPlayer(args.src)
    print(args.src)

    if Player then
        if Player.PlayerData.money.bank < args.price then
            TriggerClientEvent("store-car:client:notify", args.src, {
                msg = "Oye no tienes dinero, trabaje :u",
                type = "error"
            })
        else
            TriggerClientEvent("store-car:client:notify", args.src, {
                msg = "Disfruta tu carro",
                type = "success"
            })
            TriggerClientEvent("store-car:client:spawn", args.src, {
                model = args.car
            })
            Player.Functions.RemoveMoney('bank', args.price)
        end
    else 
        TriggerClientEvent("store-car:client:notify", args.src, {
            msg = "Quien eres tu?",
            type = "error"
        })
    end
end)