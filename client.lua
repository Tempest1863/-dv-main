RegisterCommand('car', function(source, args)
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAvehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {"Vehicle not recognised: " .. vehicleName}
        })
        return
    end

    RequestModle(vehicleName)

    while not HasModeLoaded(vehicleName) do
        wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    local vehicle = CreateVheicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed, true, false)

    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicle)

    SetModelAsNoLongerNeeded(vehicleName)

    TriggerEvent('chat:addMessage', {
        args = {'You have spawned a ' .. vehicleName .. '.'}
    })
end, false)

RegisterCommand('dv', function()

    local playerPed = PlayerPedID()
    
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    DeleteEntity(vehicle)
end, false)