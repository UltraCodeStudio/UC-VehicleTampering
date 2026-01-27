



local function applyTampering(vehicle, type)
    if not DoesEntityExist(vehicle) then return end
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    TriggerServerEvent('uc-vehicletampering:applytampering', netId, type)
end

local function removeTampering(vehicle, type)
    if not DoesEntityExist(vehicle) then return end
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    TriggerServerEvent('uc-vehicletampering:removetampering', netId, type)
end

lib.onCache('vehicle', function(value, oldValue)
    applyTampering(value, 'wheelLocked')
    removeTampering(oldValue, 'wheelLocked')
end)

