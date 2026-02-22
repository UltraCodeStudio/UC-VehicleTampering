if Config.Notify ~= 'ox' then return end

function Notify(type, description)
    exports.ox_lib:notify({ type = type, description = description })
end