if Config.Inventory ~= 'ox' then return end

function HasItem(item, amount)
    amount = amount or 1
    local count = exports.ox_inventory:Search('count', item)
    
    return (count or 0) >= amount
end