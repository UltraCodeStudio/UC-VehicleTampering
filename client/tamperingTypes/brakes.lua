
function hasBreaks(entity)
    return Entity(entity).state.cutBreaks ~= nil
end

--Loops
local function triggerNotification(entity)
    
    if hasBreaks(entity) then
        Notify('error', 'Brakes Are Cut!')
    end
end

--Ran when players gets in and out of a car
lib.onCache('vehicle', function(value, oldValue)
    if value then
        triggerNotification(value)
    end
end)

function CutBreaks(entity)
     local normalBreaks = GetVehicleHandlingFloat(entity, "CHandlingData", "fBrakeForce")
    SetVehicleHandlingFloat(entity, "CHandlingData", "fBrakeForce", 0.0)
    Entity(entity).state:set("cutBreaks", true)
end

function FixBreaks(entity)
    local normalBreaks = Entity(entity).state.cutBreaks
    if not normalBreaks then return end
    SetVehicleHandlingFloat(entity, "CHandlingData", "fBrakeForce", normalBreaks)
end