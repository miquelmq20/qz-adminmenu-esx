
onlinePlayers = {}

RegisterServerEvent('miquel-showid:add-id')
AddEventHandler('miquel-showid:add-id', function()
    TriggerClientEvent("miquel-showid:client:add-id", source, onlinePlayers)
    local topText = "undefined " .. "steam"
    local identifiers = GetPlayerIdentifiers(source)
    topText = GetPlayerName(source)
    onlinePlayers[tostring(source)] = topText
    TriggerClientEvent("miquel-showid:client:add-id", -1, topText, tostring(source))
end)

AddEventHandler('playerDropped', function(reason)
    onlinePlayers[tostring(source)] = nil
end)