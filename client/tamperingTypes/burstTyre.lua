function burstRandomTyre(veh)
    local wheels = GetVehicleNumberOfWheels(veh)
    if not wheels or wheels <= 0 then return -1 end

    SetVehicleTyreBurst(veh, math.random(0, wheels - 1), true, 1000.0)
end