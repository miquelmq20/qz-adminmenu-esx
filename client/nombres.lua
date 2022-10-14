
local onlinePlayers, forceDraw = {}, false
local playerGamerTags = {}

local gamerTagCompsEnum = {
    GamerName = 0,
    CrewTag = 1,
    HealthArmour = 2,
    BigText = 3,
    AudioIcon = 4,
    UsingMenu = 5,
    PassiveMode = 6,
    WantedStars = 7,
    Driver = 8,
    CoDriver = 9,
    Tagged = 12,
    GamerNameNearby = 13,
    Arrow = 14,
    Packages = 15,
    InvIfPedIsFollowing = 16,
    RankText = 17,
    Typing = 18
}

local function cleanUpGamerTags()
    --print('Limpiando la tabla de GamerTags')
    for _, v in pairs(playerGamerTags) do
        if IsMpGamerTagActive(v.gamerTag) then
            RemoveMpGamerTag(v.gamerTag)
        end
    end
    playerGamerTags = {}
end

Citizen.CreateThread(function()
    TriggerServerEvent("miquel-showid:add-id")
    local curCoords = GetEntityCoords(PlayerPedId())
    local allActivePlayers = GetActivePlayers()

    while true do
        for _, i in ipairs(allActivePlayers) do

            if not playerGamerTags[i] or not IsMpGamerTagActive(playerGamerTags[i].gamerTag) then
                playerGamerTags[i] = {
                    gamerTag = CreateFakeMpGamerTag(targetPed, playerStr, false, false, 0),
                    ped = targetPed
                }
            end
    
            local targetTag = playerGamerTags[i].gamerTag

            Citizen.Wait(1)
            if IsControlPressed(0, 10) or forceDraw then
                for k, v in pairs(GetNeareastPlayers()) do
                    local x, y, z = table.unpack(v.coords)

                    Draw3DText(x, y, z + 1.0, '[ '..v.playerId..' ] ' ..v.topText)

                    SetMpGamerTagHealthBarColor(0, 129)
                    SetMpGamerTagAlpha(targetTag, gamerTagCompsEnum.HealthArmour, 255)
                    SetMpGamerTagVisibility(targetTag, gamerTagCompsEnum.HealthArmour, 1)
                end
            end

        end
    end
end)

RegisterNetEvent('miquel-showid:client:add-id')
AddEventHandler('miquel-showid:client:add-id', function(identifier, playerSource)
    if playerSource then
        onlinePlayers[playerSource] = identifier
    else
        onlinePlayers = identifier
    end
end)

RegisterCommand('sexo', function()
    if not forceDraw then
        forceDraw = true
    elseif forceDraw then
        forceDraw = false
        cleanUpGamerTags()
    end
end)

function Draw3DText(x, y, z, text, newScale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.40, 0.40)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        SetDrawOrigin(x,y,z, 0)
        DrawText(0.0, 0.0)

        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
    end
end

function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players_clean = {}
    local playerCoords = GetEntityCoords(playerPed)
    if IsPedInAnyVehicle(playerPed, false) then
        local playersId = tostring(GetPlayerServerId(PlayerId()))
        table.insert(players_clean, {topText = onlinePlayers[playersId], playerId = playersId, coords = playerCoords} )
    else
        local players, _ = GetPlayersInArea(playerCoords, 30)
        for i = 1, #players, 1 do
            local playerServerId = GetPlayerServerId(players[i])
            local player = GetPlayerFromServerId(playerServerId)
            local ped = GetPlayerPed(player)
            if IsEntityVisible(ped) then
                for x, identifier in pairs(onlinePlayers) do 
                    if x == tostring(playerServerId) then
                        table.insert(players_clean, {topText = identifier:upper(), playerId = playerServerId, coords = GetEntityCoords(ped)})
                    end
                end
            end
        end
    end
   
    return players_clean
end

function GetPlayersInArea(coords, area)
	local players, playersInArea = GetPlayers(), {}
	local coords = vector3(coords.x, coords.y, coords.z)
	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)

		if #(coords - targetCoords) <= area then
			table.insert(playersInArea, players[i])
		end
	end
	return playersInArea
end

function GetPlayers()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end
    return players
end