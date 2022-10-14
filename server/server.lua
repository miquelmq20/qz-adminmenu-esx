-- Variables
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local frozen = false
local permissions = {
    ['kill'] = 'god',
    ['ban'] = 'admin',
    ['noclip'] = 'admin',
    ['kickall'] = 'admin',
    ['kick'] = 'admin'
}

-- Get Dealers
-- ESX.RegisterServerCallback('test:getdealers', function(source, cb)
--     cb({})
-- end)

-- Get Players
ESX.RegisterServerCallback('test:getplayers', function(source, cb) -- WORKS
    local players = {}
    for k, v in pairs(ESX.GetPlayers()) do
        local targetped = GetPlayerPed(v)
        local ped = ESX.GetPlayerFromId(v)
        players[#players+1] = {
            name = ped.get('firstName') .. ' ' .. ped.get('lastName') .. ' | (' .. GetPlayerName(v) .. ')',
            -- name = '(' .. GetPlayerName(v) .. ')',
            id = v,
            coords = GetEntityCoords(targetped),
            cid = ped.get('firstName') .. ' ' .. ped.get('lastName'),
            -- citizenid = ped.PlayerData.citizenid,
            sources = GetPlayerPed(ped.source),
            sourceplayer= ped.source

        }
    end
        -- Sort players list by source ID (1,2,3,4,5, etc) --
        table.sort(players, function(a, b)
            return a.id < b.id
        end)
        ------
    cb(players)
end)

ESX.RegisterServerCallback('qz-admin:server:getrank', function(source, cb)
    local src = source
    if IsPlayerAceAllowed(src, 'command') then
        cb(true)
    else
        cb(false)
    end
end)

-- Functions

local function tablelength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

-- Events

RegisterNetEvent('qz-admin:server:GetPlayersForBlips', function()
    local src = source
    local players = {}
    for k, v in pairs(ESX.GetPlayers()) do
        local targetped = GetPlayerPed(v)
        local ped = ESX.GetPlayerFromId(v)
        players[#players+1] = {
            name = ped.get('firstName') .. ' ' .. ped.get('lastName') .. ' | ' .. GetPlayerName(v),
            -- name = GetPlayerName(v),
            id = v,
            coords = GetEntityCoords(targetped),
            cid = ped.get('firstName') .. ' ' .. ped.get('lastName'),
            -- citizenid = ped.PlayerData.citizenid,
            sources = GetPlayerPed(ped.source),
            sourceplayer= ped.source
        }
    end
    TriggerClientEvent('qz-admin:client:Show', src, players)
end)

RegisterNetEvent('qz-admin:server:kill', function(player)
    TriggerClientEvent('esx:killPlayer', player.id)
end)

RegisterNetEvent('qz-admin:server:revive', function(player)
    TriggerClientEvent('esx_ambulancejob:revive', player.id)
end)

RegisterNetEvent('qz-admin:server:kick', function(player, reason)
    local src = source
    if IsPlayerAceAllowed(src, 'command')  then
        DropPlayer(player.id, '[qz-permissions] Has sido kickeado del servidor:\n' .. reason .. '')
    end
end)

-- RegisterNetEvent('qz-admin:server:ban', function(player, time, reason)
--     local src = source
--     if IsPlayerAceAllowed(src, 'command') then
--         local time = tonumber(time)
--         local banTime = tonumber(os.time() + time)
--         if banTime > 2147483647 then
--             banTime = 2147483647
--         end
--         local timeTable = os.date('*t', banTime)


--         DropPlayer(player.id, '[qz-permissions] Has sido baneado del servidor:\n' .. reason .. '')
--     end
-- end)

RegisterNetEvent('qz-admin:server:spectate')
AddEventHandler('qz-admin:server:spectate', function(player)
    local src = source
    local targetped = GetPlayerPed(player.id)
    local coords = GetEntityCoords(targetped)
    TriggerClientEvent('qz-admin:client:spectate', src, player.id, coords)
end)

RegisterNetEvent('qz-admin:server:freeze')
AddEventHandler('qz-admin:server:freeze', function(player)
    local target = GetPlayerPed(player.id)
    if not frozen then
        frozen = true
        FreezeEntityPosition(target, true)
    else
        frozen = false
        FreezeEntityPosition(target, false)
    end
end)

RegisterNetEvent('qz-admin:server:goto', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(GetPlayerPed(player.id))
    SetEntityCoords(admin, coords)
end)

RegisterNetEvent('qz-admin:server:intovehicle', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    -- local coords = GetEntityCoords(GetPlayerPed(player.id))
    local targetPed = GetPlayerPed(player.id)
    local vehicle = GetVehiclePedIsIn(targetPed,false)
    local seat = -1
    if vehicle ~= 0 then
        for i=0,8,1 do
            if GetPedInVehicleSeat(vehicle,i) == 0 then
                seat = i
                break
            end
        end
        if seat ~= -1 then
            SetPedIntoVehicle(admin,vehicle,seat)
            --TriggerClientEvent('ESX:Notify', src, '', 'success', 5000)
        else
            --TriggerClientEvent('ESX:Notify', src, '', 'danger', 5000)
        end
    else
        --TriggerClientEvent('ESX:Notify', src, '', 'danger', 5000)
    end
end)


RegisterNetEvent('qz-admin:server:bring', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(admin)
    local target = GetPlayerPed(player.id)
    SetEntityCoords(target, coords)
end)

RegisterNetEvent('qz-admin:server:inventory', function(player)
    local src = source
    TriggerClientEvent('qz-admin:client:inventory', src, player.id)
end)

RegisterNetEvent('qz-admin:server:cloth', function(player)
    TriggerClientEvent('fivem-appearance:skinCommand', player.id)
end)

RegisterCommand('customization', function()
    local config = {
      ped = true,
      headBlend = true,
      faceFeatures = true,
      headOverlays = true,
      components = true,
      props = true,
      allowExit = true,
      tattoos = true
    }
  
    exports['fivem-appearance']:startPlayerCustomization(function (appearance)
      if (appearance) then
        print('Guardado')
      else
        print('Cancelado')
      end
    end, config)
  end, false)

RegisterNetEvent('qz-admin:server:setPermissions', function(targetId, group)
    local src = source
    -- if IsPlayerAceAllowed(src, 'command') then
    --     ESX.Functions.AddPermission(targetId, group[1].rank)
    --     TriggerClientEvent('ESX:Notify', targetId, 'Quyền hạn của bạn hiện tại là '..group[1].label)
    -- end
end)

RegisterNetEvent('qz-admin:server:SendReport', function(name, targetSrc, msg)
    local src = source
    if IsPlayerAceAllowed(src, 'command') then
        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 0, 0},
            multiline = true,
            args = {'Reporte - '..name..' ('..targetSrc..')', msg}
        })
    end
end)

RegisterNetEvent('qz-admin:server:Staffchat:addMessage', function(name, msg)
    local src = source
    if IsPlayerAceAllowed(src, 'command') then
        TriggerClientEvent('chat:addMessage', src, 'Chat de administración - '..name, 'error', msg)
    end
end)

-- RegisterNetEvent('qz-admin:server:SaveCar', function(mods, vehicle, hash, plate)
--     local src = source
--     local Player = ESX.GetPlayerFromId(src)
--     TriggerClientEvent('ESX:Notify', src, '', 'success', 5000)

--     -- local result = exports.oxmysql:executeSync('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
--     -- if result[1] == nil then
--     --     exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
--     --         Player.PlayerData.license,
--     --         Player.PlayerData.citizenid,
--     --         vehicle.model,
--     --         vehicle.hash,
--     --         json.encode(mods),
--     --         plate,
--     --         0
--     --     })
--     --     TriggerClientEvent('ESX:Notify', src, 'Đã lưu xe!', 'success', 5000)
--     -- else
--     --     TriggerClientEvent('ESX:Notify', src, 'Đã lưu xe..', 'error', 3000)
--     -- end
-- end)

-- Commands

ESX.RegisterCommand('blips', "admin", function(xPlayer, args, showError)
	xPlayer.triggerEvent("qz-admin:client:toggleBlips")
end, true)

ESX.RegisterCommand('names', "admin", function(xPlayer, args, showError)
	xPlayer.triggerEvent("qz-admin:client:toggleNames")
end, true)

ESX.RegisterCommand('coords', "admin", function(xPlayer, args, showError)
	xPlayer.triggerEvent("qz-admin:client:ToggleCoords")
end, true)

ESX.RegisterCommand('noclip', "admin", function(xPlayer, args, showError)
	xPlayer.triggerEvent("qz-admin:client:ToggleNoClip")
end, true)

ESX.RegisterCommand('announce', "admin", function(xPlayer, args, showError)
    local msg = table.concat(args, ' ')
    if msg == '' then return end
    TriggerClientEvent('chat:addMessage', -1, {
        color = { 255, 0, 0},
        multiline = true,
        args = {"Anuncio de administrador:", msg}
    })
end, true)

ESX.RegisterCommand('admin', "admin", function(xPlayer, args, showError)
    xPlayer.triggerEvent("qz-admin:client:openMenu")
end, true)

ESX.RegisterCommand('staffchat', "admin", function(xPlayer, args, showError)
    local msg = table.concat(args, ' ')
    TriggerClientEvent('qz-admin:client:SendStaffChat', -1, GetPlayerName(source), msg)
end, true)

ESX.RegisterCommand('givenuifocus', "admin", function(xPlayer, args, showError)
    local playerid = tonumber(args[1])
    local focus = args[2]
    local mouse = args[3]
    TriggerClientEvent('qz-admin:client:GiveNuiFocus', playerid, focus, mouse)
end, true)

ESX.RegisterCommand('setmodel', "admin", function(xPlayer, args, showError)
    local src = xPlayer.source
    local model = args[1]
    local target = tonumber(args[2])
    if model ~= nil or model ~= '' then
        if target == nil then
            TriggerClientEvent('qz-admin:client:SetModel', src, tostring(model))
        else
            local Trgt = ESX.GetPlayerFromId(target)
            if Trgt ~= nil then
                TriggerClientEvent('qz-admin:client:SetModel', target, tostring(model))
            else
                TriggerClientEvent('ESX:Notify', src, 'Este usuario no se encuentra conectado...', 'error')
            end
        end
    else
        TriggerClientEvent('ESX:Notify', source, 'Debes introducir el nombre del modelo...', 'error')
    end
end, true)

ESX.RegisterCommand('setspeed', "admin", function(xPlayer, args, showError)
    local speed = args[1]
    if speed ~= nil then
        TriggerClientEvent('qz-admin:client:SetSpeed', xPlayer.source, tostring(speed))
    else
        TriggerClientEvent('ESX:Notify', xPlayer.source, 'Especifica la velocidad a la que deseas cambiarte (`fast` = velocidad de administración, `normal` = reestablecer la velocidad por defecto)', 'error')
    end
end, true)

ESX.RegisterCommand('fakecops', "admin", function(xPlayer, args, showError)
    if ESX.FakeCops() then
        TriggerClientEvent('ESX:Notify', xPlayer.source, 'Los policías falsos han sido habilitados', 'error')
    else
        TriggerClientEvent('ESX:Notify', xPlayer.source, 'Los policías falsos han sido habilitados', 'error')
    end
end, true)