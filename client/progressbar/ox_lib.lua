if Config.Progressbar ~= 'ox' then return end

function RunProgressBar(opts)
    if lib.progressActive and lib.progressActive() then
        return false
    end

    return lib.progressBar({
        duration = opts.duration,
        label = opts.label,
        useWhileDead = opts.useWhileDead,
        canCancel = opts.canCancel,
        disable = opts.disable,
        anim = opts.anim,
        prop = opts.prop,
    })
end
