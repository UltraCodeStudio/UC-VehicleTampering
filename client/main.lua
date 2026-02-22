



function getNetId(vehicle)
    if not DoesEntityExist(vehicle) then return nil end
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    return netId
end

function getFromNetId(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return nil end
    return entity
end
function isApplied(entity, stateKey)
    return Entity(entity).state[stateKey] ~= nil
end
function applyTampering(vehicle, type)
    if isApplied(vehicle, type) then
        Notify('error', 'Already Applied')
        return
    end
    local netId = getNetId(vehicle)
    TriggerServerEvent('uc-vehicletampering:applytampering', netId, type)
end

function removeTampering(vehicle, type)
    local netId = getNetId(vehicle)
    TriggerServerEvent('uc-vehicletampering:removetampering', netId, type)
end

function itemCheck(item)
    if item == nil or item == '' then return true end
    return HasItem(item)
end

function PlayAnim(ped, dict, anim, opts)
    if not ped or ped == 0 or not DoesEntityExist(ped) then return false end

    opts = opts or {}
    local flag = opts.flag or 49
    local blendIn = opts.blendIn or 2.0
    local blendOut = opts.blendOut or 2.0
    local duration = opts.duration or -1
    local rate = opts.rate or 1.0
    local lockX = opts.lockX or false
    local lockY = opts.lockY or false
    local lockZ = opts.lockZ or false
    local waitFor = opts.wait or false
    local clearAfter = opts.clearAfter or false
    local timeout = opts.timeout or 5000

    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        local start = GetGameTimer()
        while not HasAnimDictLoaded(dict) do
            if (GetGameTimer() - start) > timeout then
                return false
            end
            Wait(0)
        end
    end

    TaskPlayAnim(ped, dict, anim, blendIn, blendOut, duration, flag, rate, lockX, lockY, lockZ)

    if waitFor and duration and duration > 0 then
        Wait(duration)
        if clearAfter then
            ClearPedTasks(ped)
        end
    end

    return true
end


-- Used to bridge between the server and client
RegisterNetEvent("runAddAction", function (key, entity)
    Config.TamperingActions[key].add.func(entity)
end)

RegisterNetEvent("runRemoveAction", function (key, entity)
    Config.TamperingActions[key].remove.func(entity)
end)






