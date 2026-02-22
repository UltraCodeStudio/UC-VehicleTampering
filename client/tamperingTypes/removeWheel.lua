local WHEEL_BONES = {
    'wheel_lf', 'wheel_rf', 'wheel_lr', 'wheel_rr',
    'wheel_lm1', 'wheel_rm1',
    'wheel_lm2', 'wheel_rm2',
    'wheel_lm3', 'wheel_rm3',
}

local function boneToWheelIndex(boneName)
    local map = {
        wheel_lf = 0, -- front left
        wheel_rf = 1, -- front right
        wheel_lr = 2, -- rear left
        wheel_rr = 3, -- rear right

        -- extra axles (commonly used by trucks)
        wheel_lm1 = 4,
        wheel_rm1 = 5,
        wheel_lm2 = 6,
        wheel_rm2 = 7,
        wheel_lm3 = 8,
        wheel_rm3 = 9,
    }
    return map[boneName]
end

local function getClosestWheel(vehicle, ped)
    if vehicle == 0 or not DoesEntityExist(vehicle) then return nil end
    if ped == 0 or not DoesEntityExist(ped) then return nil end

    local pedCoords = GetEntityCoords(ped)
    local best ---@type ClosestWheelResult?

    for i = 1, #WHEEL_BONES do
        local boneName = WHEEL_BONES[i]
        local boneIndex = GetEntityBoneIndexByName(vehicle, boneName)

        -- GetEntityBoneIndexByName returns -1 if the bone doesn't exist on this model
        if boneIndex and boneIndex ~= -1 then
            local boneCoords = GetWorldPositionOfEntityBone(vehicle, boneIndex)
            local dist = #(pedCoords - boneCoords)

            if not best or dist < best.distance then
                best = {
                    boneName = boneName,
                    boneIndex = boneIndex,
                    coords = boneCoords,
                    distance = dist,
                }
            end
        end
    end

    return best
end

function removeRandomWheel(veh)
    local wheels = GetVehicleNumberOfWheels(veh)
    if not wheels or wheels <= 0 then return -1 end

    local wheel = getClosestWheel(veh, cache.ped)
    local wheelIndex = boneToWheelIndex(wheel.boneName)
    print(wheelIndex)
    BreakOffVehicleWheel(veh, wheelIndex, false)
end