-- Uncomment any print signs for debugging
ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('ak47_crime:useHandcuffs')
AddEventHandler('ak47_crime:useHandcuffs', function()
    local playerId = source
    --print("Server event ak47_crime:useHandcuffs triggered by player:", playerId)

    -- Fetch the player's inventory
    local inv = exports.ox_inventory:GetInventory(playerId)

    if inv and inv.items then
        --print("Inventory fetched successfully:", json.encode(inv))

        -- Assume handcuffs are present for the purpose of triggering the event
        local handcuffsPresent = true

        if handcuffsPresent then
            --print("Handcuffs assumed to be present. Triggering cuff event.")
            TriggerClientEvent('ak47_crime:cuff:hard', playerId)
            --print("Handcuffs used. Triggered cuff event for player:", playerId)
        else
            --print("Player does not have handcuffs.")
            TriggerClientEvent('chat:addMessage', {
                args = {"DEBUG", "You don't have any handcuffs."}
            })
        end
    else
        --print("Failed to fetch inventory.")
        TriggerClientEvent('chat:addMessage', {
            args = {"DEBUG", "Failed to fetch inventory."}
        })
    end
end)

-- Modify the existing uncuff event to return handcuffs after uncuffing
RegisterNetEvent('ak47_crime:cuff:uncuff')
AddEventHandler('ak47_crime:cuff:uncuff', function(target)
    local playerId = source
    print("Server event ak47_crime:cuff:uncuff triggered by player:", playerId, "for target:", target)

    -- Uncuff the target player
    TriggerClientEvent('ak47_crime:cuff:uncuff', target)

    -- Give back handcuffs to the player who performed the uncuff
    exports.ox_inventory:AddItem(playerId, 'handcuffs', 1)
    print("Handcuffs returned to player:", playerId)
end)

RegisterNetEvent('returnHandcuffs', function()
    local xPlayer = ESX.GetPlayerFromId(source)  -- Get the player object using ESX
    local hasCuffs = exports.ox_inventory:Search(source, 'count', 'handcuffs') > 0  -- Check if player already has handcuffs

    if not hasCuffs then
        -- Add handcuffs back to the player's inventory
        exports.ox_inventory:AddItem(source, 'handcuffs', 1)
        -- Notify the player that the handcuffs were returned
        TriggerClientEvent('ox_lib:notify', source, {type = 'success', text = 'Handcuffs returned to your inventory!'})
    else
        -- Notify if player already has handcuffs
        TriggerClientEvent('ox_lib:notify', source, {type = 'info', text = 'You already have handcuffs!'})
    end
end)
