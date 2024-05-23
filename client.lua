print("client")
local QBCore = exports["qb-core"]:GetCoreObject()


RegisterCommand(config.commandName ,function(source,args)
    local ped = GetPlayerServerId(PlayerId())
    print(ped)
    if ped then
        local menu = {
            {
                header = 'Tienda de carro el buen cuyo',
                isMenuHeader = true,
            }
        }
    
        for i, v in ipairs(config.cars) do
            table.insert(menu, {
                header = v.name,
                txt = "Cuesta: "..v.price.."$",
                params = {
                    isServer = true,
                    event = 'store-car:server:buy',
                    args = {
                        car = v.model,
                        src = ped,
                        price = v.price
                    }
                }
            })
        end
    
        exports['qb-menu']:openMenu(menu)
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
    local Player = QBCore.Functions.GetPlayerData()
    local cors = GetEntityCoords(PlayerPedId())
    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
         local veh = NetToVeh(netId)
         TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
    end, args.model, cors, true)
end)