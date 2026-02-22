function burstRandomTyre(veh)
    local wheels = GetVehicleNumberOfWheels(veh)
    if not wheels or wheels <= 0 then return -1 end

    BreakOffVehicleWheel(veh, math.random(0, wheels - 1), false)
end