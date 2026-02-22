
local function getEntityFromNetId(netId)
    if not netId then return false end
    local handle = NetworkGetEntityFromNetworkId(netId)
    if handle == 0 or not DoesEntityExist(handle) then return nil end
    return handle
end

RegisterNetEvent('uc-vehicletampering:applytampering', function(netId, type)
    local src = source
    local entity = getEntityFromNetId(netId)
    if not entity then return end
    Entity(entity).state:set(type, src, true) -- store who locked it
end)

RegisterNetEvent('uc-vehicletampering:removetampering', function(netId, type)
    local entity = getEntityFromNetId(netId)
    if not entity then return end
    Entity(entity).state:set(type, nil, true) 
end)

AddStateBagChangeHandler(nil, nil, function(bagName, key, value)
    if not Config.TamperingActions[key] then return end
    local entity = GetEntityFromStateBagName(bagName)
    local entityId = NetworkGetNetworkIdFromEntity(entity)
    if value then
        TriggerClientEvent("runAddAction", -1, key, entityId)
    else
        TriggerClientEvent("runRemoveAction", -1, key, entityId)
    end
    
end)