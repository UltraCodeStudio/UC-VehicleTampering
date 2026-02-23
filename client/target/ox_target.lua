if Config.Target ~= 'ox' then return end

local options = {}

    for actionKey, action in pairs(Config.TamperingActions) do
        local stateKey = action.stateKey or actionKey
        local icon = action.icon or 'fa-solid fa-car'
        local distance = action.distance or 2.0

        
        

        -- Add option
        options[#options + 1] = {
            name = ('vehicle_tamper_%s_add'):format(actionKey),
            label = action.add.target.label or 'MISSING LABEL',
            icon = action.add.target.icon or 'fa-solid fa-car',
            distance = action.add.target.distance or 2.0,
            onSelect = function(data)
                
                if not itemCheck(action.add.item.label) then Notify('error', 'You dont have the item to do this') return end
                local skillCheck = RunSkillCheck(action.difficulty)
                if not skillCheck then Notify('error', 'You failed the skillcheck') return end
                TaskTurnPedToFaceEntity(cache.ped, data.entity, 1000)
                local ok = RunProgressBar({
                    duration = 2000,
                    label = 'Tampering '.. action.add.target.label .. '...',
                    canCancel = true,
                    disable = { car = true },
                    anim = { dict = action?.add?.animation?.dict or 'missmechanic', clip = action?.add?.animation?.clip or 'work2_base' },
                })
                if not ok then return end
                if action.add.item.action and action.add.item.action.remove then RemoveItem(action.add.item.label) end
                applyTampering(data.entity, actionKey)
            end,
            canInteract = function(entity)
                local applied = isApplied(entity, stateKey)
                return not applied
            end,
        }

        -- Remove option
        if action.remove and action.remove.enabled then
            print("Adding remove option for action:", actionKey)
            options[#options + 1] = {
                name = ('vehicle_tamper_%s_remove'):format(actionKey),
                label = action.remove.target.label or 'MISSING LABEL',
                icon = action.remove.target.icon or 'fa-solid fa-car',
                distance = action.remove.target.distance or 2.0,
                onSelect = function(data)
                    
                    if action.remove.item and not itemCheck(action.remove.item.label or "") then Notify('error', 'You dont have the item to do this') return end
                    
                    local skillCheck = RunSkillCheck(action.difficulty)
                    if not skillCheck then Notify('error', 'You failed the skillcheck') return end
                    TaskTurnPedToFaceEntity(cache.ped, data.entity, 1000)
                    local ok = RunProgressBar({
                        duration = 2000,
                        label = 'Fixing '.. action.remove.target.label .. '...',
                        canCancel = true,
                        disable = { car = true },
                        anim = { dict = action?.remove?.animation?.dict or 'missmechanic', clip = action?.remove?.animation?.clip or 'work2_base' },
                    })
                    if not ok then return end
                    if action.remove.item.action and action.remove.item.action.remove then RemoveItem(action.remove.item.label) end
                    removeTampering(data.entity, actionKey)
                end,
                canInteract = function(entity)
                    
                    if action.remove.item and not itemCheck(action.remove.item.label) then return false end
                    
                    local applied = isApplied(entity, stateKey)
                    return applied
                end,
            }
        end
    end

    exports.ox_target:addGlobalVehicle(options)