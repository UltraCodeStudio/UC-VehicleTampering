function StartFuelLeak(vehicle)
    SetVehicleCanLeakPetrol(vehicle, true)
    SetVehiclePetrolTankHealth(vehicle, 150)
end

function FixFuelLeak(vehicle)
    SetVehicleCanLeakPetrol(vehicle, false)
    SetVehiclePetrolTankHealth(vehicle, 1000)
end