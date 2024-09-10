local QBCore = exports['qb-core']:GetCoreObject()

local function addStashes()
    for _, stash in ipairs(Config.StashLocations) do
        local stashLocs = vector3(stash.location.x, stash.location.y, stash.location.z)

        local interactionData = {
            coords = stashLocs,
            distance = 2.0,
            interactDst = 2.0,
            id = stash.stashName,
            ignoreLos = true,
            options = {
                {
                    label = 'Open ' .. stash.label,
                    action = function()
                        TriggerServerEvent('vivify_stashes:server:addStash', stash.stashName, stash.label, stash.maxweight, stash.slots)
                    end,
                },
            }
        }

        if stash.job and stash.job ~= '' and stash.jobgrade and stash.jobgrade >= 0 then
            interactionData.groups = {
                [stash.job] = stash.jobgrade
            }
        end

        exports.interact:AddInteraction(interactionData)
    end
end

Citizen.CreateThread(function()
    addStashes()
end)
