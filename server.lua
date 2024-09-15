-- Uncomment any print signs for debugging


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
           -- print("Handcuffs assumed to be present. Triggering cuff event.")
            TriggerClientEvent('ak47_crime:cuff:hard', playerId)
           -- print("Handcuffs used. Triggered cuff event for player:", playerId)
        else
           -- print("Player does not have handcuffs.")
            TriggerClientEvent('chat:addMessage', {
                args = {"DEBUG", "You don't have any handcuffs."}
            })
        end
    else
       -- print("Failed to fetch inventory.")
        TriggerClientEvent('chat:addMessage', {
            args = {"DEBUG", "Failed to fetch inventory."}
        })
    end
end)
