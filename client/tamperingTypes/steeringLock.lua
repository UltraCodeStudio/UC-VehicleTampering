

function hasWheelLock(entity)
    return Entity(entity).state.wheelLocked ~= nil
end

local function triggerNotification(entity)
    if hasWheelLock(entity) then
        Notify('error', 'Steering Is Locked!')
    end
end

lib.onCache('vehicle', function(value, oldValue)
    if value then
        triggerNotification(value)
    end
end)

function LockWheel(entity)
     local normalSteering = GetVehicleHandlingFloat(entity, "CHandlingData", "fSteeringLock")
    SetVehicleHandlingFloat(entity, "CHandlingData", "fSteeringLock", normalSteering  * 0.1)
    Entity(entity).state:set("fSteeringLock", normalSteering)
end

function UnlockWheel(entity)
    local normalSteering = Entity(entity).state.fSteeringLock
    if not normalSteering then return end
    SetVehicleHandlingFloat(entity, "CHandlingData", "fSteeringLock", normalSteering)
end