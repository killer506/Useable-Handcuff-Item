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


