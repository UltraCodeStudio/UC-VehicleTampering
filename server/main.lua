RegisterNetEvent('uc-vehicletampering:applytampering', function(netId, type)
    local src = source
    local entity = NetworkGetEntityFromNetworkId(netId)

    
    Entity(entity).state:set('wheelLocked', src, true) -- store who locked it
end)

RegisterNetEvent('uc-vehicletampering:removetampering', function(netId, type)
    local entity = NetworkGetEntityFromNetworkId(netId)

    
    Entity(entity).state:set('wheelLocked', nil, true)
end)