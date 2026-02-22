Config = {}

Config.Target = 'ox'
Config.Inventory = 'ox'
Config.Notify = 'ox'
Config.Progressbar = 'ox'
Config.MiniGames = 'ox'

Config.TamperingActions = {
    wheelLocked = {
    difficulty = 'easy',
    add = {
        target = {
            label = 'Car Steering',
            icon = 'fa-solid fa-hand',
            distance = 2.0,
        },
        item = {
            label = 'wheellock',
            remove = true,
        },
        func = function(entityId)
            local entity = getFromNetId(entityId)
            if not entity then return end
            LockWheel(entity)
        end,
    },
    remove = {
        enabled = true, --To disable the removal/fixing
        target = {
            label = 'Fix Steering',
            icon = 'fa-solid fa-hand',
            distance = 2.0,
        },
        item = {
            label = 'wheellock',
            remove = true,
        },
        func = function(entityId)
            local entity = getFromNetId(entityId)
            if not entity then return end
            UnlockWheel(entity)
        end,
    },
},

tyre = {
    difficulty = 'easy',
    add = {
        target = {
            label = 'Car Tyre',
            icon = 'fa-solid fa-ring',
            distance = 2.0,
        },
        item = {
            label = 'impact',
            remove = true,
        },
        func = function(entityId)
            local entity = getFromNetId(entityId)
            if not entity then return end
            burstRandomTyre(entity)
        end,
    },
    remove = {
        enabled = true, --To disable the removal/fixing
        target = {
            label = 'Fix Tyre',
            icon = 'fa-solid fa-ring',
            distance = 2.0,
        },
        item = {
            label = 'repairkit',
            remove = true,
        },
        func = function(entityId)
            local entity = getFromNetId(entityId)
            if not entity then return end
            -- implement your tyre fix here if you have one
            -- e.g. FixRandomTyre(entity)
        end,
    },
},

removewheel = {
    difficulty = 'easy',
    add = {
        target = {
            label = 'Car Wheel',
            icon = 'fa-solid fa-drum-steelpan',
            distance = 2.0,
        },
        item = {
            label = 'impact',
            remove = true,
        },
        func = function(entityId)
            local entity = getFromNetId(entityId)
            if not entity then return end
            removeRandomWheel(entity)
        end,
        animation = {
            dict = 'missmechanic',
            clip = 'work2_base',
        },
    },
    remove = {
        enabled = false, --To disable the removal/fixing
        target = {
            label = 'Fix Wheel',
            icon = 'fa-solid fa-drum-steelpan',
            distance = 2.0,
        },
        item = {
            label = 'phone',
            remove = true,
        },
        func = function(entityId)
            local entity = getFromNetId(entityId)
            if not entity then return end
            
        end,
        animation = {
            dict = 'missmechanic',
            clip = 'work2_base',
        },
    },
},

    cutBreaks = {
        difficulty = 'easy',
        add = {
            target = {
                label = 'Cut Breaks',
                icon = 'fa-solid fa-car-burst',
                distance = 2.0,
            },
            item = {
                label = 'impact',
                remove = true,
            },
            func = function(entityId)
                local entity = getFromNetId(entityId)
                CutBreaks(entity)
            end,
            
        },
        remove = {
            enabled = true, --To disable the removal/fixing
            target = {
                label = 'Fix Breaks',
                icon = 'fa-solid fa-car-burst',
                distance = 2.0,
            },
            item = {
                label = 'repairkit',
                remove = true,
            },
            func = function(entityId)
                local entity = getFromNetId(entityId)
                FixBreaks(entity)
            end
        }
        
    },

    fuelLeak = {
        difficulty = 'easy',
        add = {
            target = {
                label = 'Fuel Leak',
                icon = 'fa-solid fa-gas-pump',
                distance = 2.0,
            },
            item = {
                label = 'impact',
                remove = true,
            },
            func = function(entityId)
                local entity = getFromNetId(entityId)
                StartFuelLeak(entity)
            end,
            
        },
        remove = {
            enabled = true, --To disable the removal/fixing
            target = {
                label = 'Fix Fuel Leak',
                icon = 'fa-solid fa-gas-pump',
                distance = 2.0,
            },
            item = {
                label = 'repairkit',
                remove = true,
            },
            func = function(entityId)
                local entity = getFromNetId(entityId)
                FixFuelLeak(entity)
            end
        }
        
    },
}
