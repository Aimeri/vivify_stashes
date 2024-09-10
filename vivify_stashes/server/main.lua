local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('vivify_stashes:server:addStash', function(stashName, label, maxweight, slots)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local data2 = { label = label, maxweight = maxweight, slots = slots }

    if Player then
        exports['qb-inventory']:OpenInventory(src, stashName, data2)
    end
end)

