-- Uncomment any print signs for debugging

-- client.lua
RegisterNetEvent('ox_inventory:usedItem')
AddEventHandler('ox_inventory:usedItem', function(name, slot, metadata)
    --print("Item Used Event Triggered:")
    --print("Name:", name)
    --print("Slot:", slot)
    --print("Metadata:", json.encode(metadata))
    
    if name == 'handcuffs' then
        --print("Triggering server event: ak47_crime:useHandcuffs")
        TriggerServerEvent('ak47_crime:useHandcuffs')
    end
end)


-- client.lua
RegisterNetEvent('ak47_crime:uncuffTarget')
AddEventHandler('ak47_crime:uncuffTarget', function(target)
    -- Optional feedback or notification after uncuffing
    print("You have uncuffed the player.")
end)

-- Listen for the uncuff event from the ak47_crime script
RegisterNetEvent('ak47_crime:cuff:uncuff')
AddEventHandler('ak47_crime:cuff:uncuff', function(entity)
    -- Once uncuff event is triggered, fire server event to return handcuffs
    TriggerServerEvent('returnHandcuffs')
end)


