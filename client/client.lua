local banlength = nil
local showCoords = false
local vehicleDevMode = false
local banreason = 'Unknown'
local kickreason = 'Unknown'
local menuLocation = 'topright' -- e.g. topright (default), topleft, bottomright, bottomleft

local menu = MenuV:CreateMenu(false, 'Menú de Administración', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test')
local menu2 = MenuV:CreateMenu(false, 'Opciones de Administrador', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test1')
local menu4 = MenuV:CreateMenu(false, 'Jugadores en Linea', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test3')
local menu5 = MenuV:CreateMenu(false, 'Gestionar Servidor', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test4')
local menu6 = MenuV:CreateMenu(false, 'Opciones de Clima Disponibles', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test5')
local menu7 = MenuV:CreateMenu(false, 'Lista de Dealers', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test6')
local menu8 = MenuV:CreateMenu(false, 'Banear', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test7')
local menu9 = MenuV:CreateMenu(false, 'Kickear', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test8')
local menu10 = MenuV:CreateMenu(false, 'Permisos', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test9')
local menu11 = MenuV:CreateMenu(false, 'Opciones de Desarrollador', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test10')
local menu12 = MenuV:CreateMenu(false, 'Opciones de Vehículos', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test11')
local menu13 = MenuV:CreateMenu(false, 'Categorías de Vehículos', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test12')
local menu14 = MenuV:CreateMenu(false, 'Modelos de Vehículo', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test13')

RegisterNetEvent('qz-admin:client:openMenu', function()
    MenuV:OpenMenu(menu)
end)

local menu_button = menu:AddButton({
    icon = '😃',
    label = 'Opciones de Administrador',
    value = menu2,
    description = 'Opciones de administrador miscelaneas'
})
local menu_button2 = menu:AddButton({
    icon = '🙍‍♂️',
    label = 'Opciones de Jugadores',
    value = menu4,
    description = 'Ver las opciones de los jugadores de manera individual'
})
local menu_button3 = menu:AddButton({
    icon = '🎮',
    label = 'Opciones del servidor',
    value = menu5,
    description = 'Opciones del servidor miscelaneas'
})
local menu_button21 = menu:AddButton({
    icon = '🚗',
    label = 'Opciones de los vehículos',
    value = menu12,
    description = 'Opciones de vehículos'
})
-- local menu_button4 = menu:AddButton({
--     icon = '💊',
--     label = 'Dealer List',
--     value = menu7,
--     description = 'List of Existing Dealers'
-- })
local menu_button5 = menu2:AddCheckbox({
    icon = '🎥',
    label = 'NoClip',
    value = menu2,
    description = 'Habilitar/Deshabilitar el NoClip'
})
local menu_button6 = menu2:AddButton({
    icon = '🏥',
    label = 'Revive',
    value = 'revive',
    description = 'Revivete a ti mismo'
})
local menu_button7 = menu2:AddCheckbox({
    icon = '👻',
    label = 'Invisible',
    value = menu2,
    description = 'Habilitar/Deshabilitar en modo invisible'
})
local menu_button8 = menu2:AddCheckbox({
    icon = '⚡',
    label = 'GodMode',
    value = menu2,
    description = 'Habilitar/Deshabilitar el GodMode'
})
local names_button = menu2:AddCheckbox({
    icon = '📋',
    label = 'Names',
    value = menu2,
    description = 'Habilitar/Deshabilitar nombres en la cabeza [Puede estar bug con OneSync Infinity]'
})
local blips_button = menu2:AddCheckbox({
    icon = '📍',
    label = 'Blips',
    value = menu2,
    description = 'Habilitar/Deshabilitar blips de los jugadores en el mapa [Puede estar bug con OneSync Infinity]'
})
local menu_button11 = menu5:AddButton({
    icon = '🌡️',
    label = 'Opciones del clima',
    value = menu6,
    description = 'Cambiar el clima del servidor'
})
local menu_button13 = menu5:AddSlider({
    icon = '⏲️',
    label = 'Tiempo del servidor',
    value = GetClockHours(),
    values = {{
        label = '00',
        value = '00',
        description = 'tiempo'
    }, {
        label = '01',
        value = '01',
        description = 'tiempo'
    }, {
        label = '02',
        value = '02',
        description = 'tiempo'
    }, {
        label = '03',
        value = '03',
        description = 'tiempo'
    }, {
        label = '04',
        value = '04',
        description = 'tiempo'
    }, {
        label = '05',
        value = '05',
        description = 'tiempo'
    }, {
        label = '06',
        value = '06',
        description = 'tiempo'
    }, {
        label = '07',
        value = '07',
        description = 'tiempo'
    }, {
        label = '08',
        value = '08',
        description = 'tiempo'
    }, {
        label = '09',
        value = '09',
        description = 'tiempo'
    }, {
        label = '10',
        value = '10',
        description = 'tiempo'
    }, {
        label = '11',
        value = '11',
        description = 'tiempo'
    }, {
        label = '12',
        value = '12',
        description = 'tiempo'
    }, {
        label = '13',
        value = '13',
        description = 'tiempo'
    }, {
        label = '14',
        value = '14',
        description = 'tiempo'
    }, {
        label = '15',
        value = '15',
        description = 'tiempo'
    }, {
        label = '16',
        value = '16',
        description = 'tiempo'
    }, {
        label = '17',
        value = '17',
        description = 'tiempo'
    }, {
        label = '18',
        value = '18',
        description = 'tiempo'
    }, {
        label = '19',
        value = '19',
        description = 'tiempo'
    }, {
        label = '20',
        value = '20',
        description = 'tiempo'
    }, {
        label = '21',
        value = '21',
        description = 'tiempo'
    }, {
        label = '22',
        value = '22',
        description = 'tiempo'
    }, {
        label = '23',
        value = '23',
        description = 'tiempo'
    }}
})

menu_button11:On("select",function()
    menu6:ClearItems()
    local elements = {
        [1] = {
            icon = '☀️',
            label = 'Extra Soleado',
            value = "EXTRASUNNY",
            description = 'Muucho solecito'
        },
        [2] = {
            icon = '☀️',
            label = 'Despejado',
            value = "CLEAR",
            description = 'Un dia perfecto'
        },
        [3] = {
            icon = '☀️',
            label = 'Neutral',
            value = "NEUTRAL",
            description = 'Un día más'
        },
        [4] = {
            icon = '🌁',
            label = 'Niebla',
            value = "SMOG",
            description = '¡Alguien ha encendido la máquina de humo!'
        },
        [5] = {
            icon = '🌫️',
            label = 'Mucha niebla',
            value = "FOGGY",
            description = '¡Alguien ha encendido muchas máquinas de humo!'
        },
        [6] = {
            icon = '⛅',
            label = 'Ligeramente nublado',
            value = "OVERCAST",
            description = 'No hace demasiado sol...'
        },
        [7] = {
            icon = '☁️',
            label = 'Nubes',
            value = "CLOUDS",
            description = '¿Dónde está el sol?'
        },
        [8] = {
            icon = '🌤️',
            label = 'Despejando',
            value = "CLEARING",
            description = '¡Parece que el sol empieza a verse!'
        },
        [9] = {
            icon = '☂️',
            label = 'Lluvia',
            value = "RAIN",
            description = '¡Lluvia!'
        },

        [10] = {
            icon = '⛈️',
            label = 'Tormenta',
            value = "THUNDER",
            description = '¡Rayos y lluvia!'
        },
        [11] = {
            icon = '❄️',
            label = 'Nieve ligera 1',
            value = "SNOW",
            description = '¿Hace un poco de frio?'
        },
        [12] = {
            icon = '🌨️',
            label = 'Granizo',
            value = "BLIZZARD",
            description = 'Granizadoooo ¿no?'
        },
        [13] = {
            icon = '❄️',
            label = 'Nieve ligera 2',
            value = "SNOWLIGHT",
            description = 'Parece que empiezan las navidades...'
        },
        [14] = {
            icon = '🌨️',
            label = 'Clima navideño',
            value = "XMAS",
            description = 'Nieve en todos lados'
        },
        [15] = {
            icon = '🎃',
            label = 'Halloween',
            value = "HALLOWEEN",
            description = 'No uses este perro. Es molesto'
        }
    }
    for k,v in ipairs(elements) do
        local menu_button14 = menu6:AddButton({icon = v.icon,label = v.label,value = v,description = v.description,select = function(btn)
            local selection = btn.Value
            TriggerServerEvent('qz-weathersync:server:setWeather', selection.value)
            ESX.ShowNotification('El tiempo ha sido modificado a: '..selection.label)
        end})
    end
end)

local menu_button69 = menu:AddButton({
    icon = '🔧',
    label = 'Opciones de desarrollador',
    value = menu11,
    description = 'Opciones de desarrollador'
})
local coords3_button = menu11:AddButton({
    icon = '📋',
    label = 'Copiar vector3',
    value = 'coords',
    description = 'Copiar el vector3 al portapapeles'
})
local coords4_button = menu11:AddButton({
    icon = '📋',
    label = 'Copiar el vector4',
    value = 'coords',
    description = 'Copiar el vector4 al portapapeles'
})

-- local coordsarray1_button = menu11:AddButton({
--     icon = '📋',
--     label = 'Copy array 1',
--     value = 'coords',
--     description = 'table = {x = 0, y = 0, z = 0, h = 0},'
-- })

-- local coordsarray2_button = menu11:AddButton({
--     icon = '📋',
--     label = 'Copy array 2',
--     value = 'coords',
--     description = 'table = { [\'x\'] = 0, [\'y\'] = 0, [\'z\'] = 0, [\'h\'] = 0 },'
-- })
local togglecoords_button = menu11:AddCheckbox({
    icon = '📍',
    label = 'Mostrar coordenadas',
    value = nil,
    description = 'Mostrar las coordenadas en pantalla'
})

local heading_button = menu11:AddButton({
    icon = '📋',
    label = 'Copiar "heading"',
    value = 'heading',
    description = 'Copiar el heading al portapapeles'
})

local vehicledev_button = menu11:AddButton({
    icon = '🚘',
    label = 'Modo desarrollador en vehículos',
    value = nil,
    description = 'Mostrar la información del vehículo para desarrolladores'
})
local deletelazer_button = menu11:AddCheckbox({
    icon = '🔫',
    label = 'Laser de eliminación',
    value = menu11,
    description = 'Laser para eliminar entidades de manera LOCAL'
})
-- local noclip_button = menu11:AddCheckbox({
--     icon = '🎥',
--     label = 'NoClip',
--     value = menu11,
--     description = 'Enable/Disable NoClip'
-- })

-- local noclip2_button = menu11:AddCheckbox({
--     icon = '🎥',
--     label = 'NoClip2',
--     value = menu11,
--     description = 'Enable/Disable NoClip with no alpha'
-- })

local menu12_button2 = menu12:AddButton({
    icon = '🔧',
    label = 'Reparar',
    value = 'fix',
    description = 'Reparar el vehículo en el que te encuentras'
})
-- local menu12_button3 = menu12:AddButton({
--     icon = '💲',
--     label = 'Comprar',
--     value = 'buy',
--     description = 'Comprar el vehículo en el que te encuentras'
-- })
local menu12_button4 = menu12:AddButton({
    icon = '☠',
    label = 'Eliminar vehículo',
    value = 'remove',
    description = 'Eliminar el vehículo en el que te encuentras'
})

local deleteLazer = false
deletelazer_button:On('change', function(item, newValue, oldValue)
    deleteLazer = not deleteLazer
end)

local function round(input, decimalPlaces)
    return tonumber(string.format("%." .. (decimalPlaces or 0) .. "f", input))
end

local function CopyToClipboard(dataType)
    local ped = PlayerPedId()
    if dataType == 'coords3' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        SendNUIMessage({
            string = string.format('vector3(%s, %s, %s)', x, y, z)
        })
        ESX.ShowNotification("¡Copiado!", "success")
    elseif dataType == 'coords4' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s)', x, y, z, h)
        })
        ESX.ShowNotification("¡Copiado!", "success")
    elseif dataType == 'array1' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = string.format('table = {x = %s, y = %s, z = %s, h = %s},', x, y, z, h)
        })
        ESX.ShowNotification("¡Copiado!", "success")
    elseif dataType == 'array2' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = string.format('table = { [\'x\'] = %s, [\'y\'] = %s, [\'z\'] = %s, [\'h\'] = %s },', x, y, z, h)
        })
        ESX.ShowNotification("¡Copiado!", "success")
    elseif dataType == 'heading' then
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = h
        })
        ESX.ShowNotification("¡Copiado!", "success")
    end
end

local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

local function ToggleShowCoordinates()
    local x = 0.4
    local y = 0.025
    showCoords = not showCoords
    CreateThread(function()
        while showCoords do
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            local c = {}
            c.x = round(coords.x, 2)
            c.y = round(coords.y, 2)
            c.z = round(coords.z, 2)
            heading = round(heading, 2)
            Wait(0)
            Draw2DText(string.format('~w~Coordenadas:~b~ vector4(~w~%s~b~, ~w~%s~b~, ~w~%s~b~, ~w~%s~b~)', c.x, c.y, c.z, heading), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
        end
    end)
end

RegisterNetEvent('qz-admin:client:ToggleCoords', function()
    ToggleShowCoordinates()
end)

local function ToggleVehicleDeveloperMode()
    local x = 0.4
    local y = 0.888
    vehicleDevMode = not vehicleDevMode
    CreateThread(function()
        while vehicleDevMode do
            local ped = PlayerPedId()
            Wait(0)
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local netID = VehToNet(vehicle)
                local hash = GetEntityModel(vehicle)
                local modelName = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                local eHealth = GetVehicleEngineHealth(vehicle)
                local bHealth = GetVehicleBodyHealth(vehicle)
                Draw2DText('Datos del vehículo:', 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
                Draw2DText(string.format('ID de la entidad: ~b~%s~s~ | ID: ~b~%s~s~', vehicle, netID), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.025)
                Draw2DText(string.format('Modelo: ~b~%s~s~ | Hash: ~b~%s~s~', modelName, hash), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.050)
                Draw2DText(string.format('Daño: ~b~%s~s~ | Daño estético: ~b~%s~s~', round(eHealth, 2), round(bHealth, 2)), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.075)
            end
        end
    end)
end

coords3_button:On("select", function()
    CopyToClipboard('coords3')
end)

coords4_button:On("select", function()
    CopyToClipboard('coords4')
end)

-- coordsarray1_button:On("select", function()
--     CopyToClipboard('array1')
-- end)

-- coordsarray2_button:On("select", function()
--     CopyToClipboard('array2')
-- end)

heading_button:On("select", function()
    CopyToClipboard('heading')
end)

vehicledev_button:On('select', function()
    ToggleVehicleDeveloperMode()
end)

-- noclip_button:On('change', function(item, newValue, oldValue)
--     ToggleNoClipMode()
-- end)

-- noclip2_button:On('change', function(item, newValue, oldValue)
--     ToggleNoClipMode(51)
-- end)

togglecoords_button:On('change', function()
    ToggleShowCoordinates()
end)

local vehicles = {}

local function OpenCarModelsMenu(category)
    menu14:ClearItems()
    MenuV:OpenMenu(menu14)
    for k, v in pairs(category) do
        local menu_button10 = menu14:AddButton({
             label = v["name"],
             value = k,
             description = 'Spawnear ' .. v["name"],
             select = function(btn)
                 TriggerServerEvent('Framework:CallCommand', "car", { k })
             end
        })
    end
end

-- menu12_button1:On('Select', function(item)
--     menu13:ClearItems()
--     for k, v in pairs(vehicles) do
--         local menu_button10 = menu13:AddButton({
--             label = k,
--             value = v,
--             description = 'Category Name',
--             select = function(btn)
--                 local select = btn.Value
--                 OpenCarModelsMenu(select)
--             end
--         })
--     end
-- end)

menu12_button2:On('Select', function(item)
    local ped = PlayerPedId()
    vehicle = GetVehiclePedIsIn(ped, false)
    SetVehicleFixed(vehicle)
end)

-- menu12_button3:On('Select', function(item)
--     TriggerServerEvent('Framework:CallCommand', "admincar", {})
-- end)

menu12_button4:On('Select', function(item)
    ExecuteCommand('dv')
end)

names_button:On('change', function()
    TriggerEvent('qz-admin:client:toggleNames')
end)
blips_button:On('change', function()
    TriggerEvent('qz-admin:client:toggleBlips')
end)

-- Dealer List

local function OpenDealerMenu(dealer)
    local EditDealer = MenuV:CreateMenu(false, 'Edit Dealer ' .. dealer["name"], menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv')
    EditDealer:ClearItems()
    MenuV:OpenMenu(EditDealer)
    local elements = {
        [1] = {
            icon = '➡️',
            label = "Go to " .. dealer["name"],
            value = "goto",
            description = "Goto dealer " .. dealer["name"]
        },
        [2] = {
            icon = "☠",
            label = "Remove " .. dealer["name"],
            value = "remove",
            description = "Remove dealer " .. dealer["name"]
        }
    }
    for k, v in ipairs(elements) do
        local menu_button10 = EditDealer:AddButton({
            icon = v.icon,
            label = ' ' .. v.label,
            value = v.value,
            description = v.description,
            select = function(btn)
                local values = btn.Value
                if values == "goto" then
                    TriggerServerEvent('Framework:CallCommand', "dealergoto", { dealer["name"] })
                elseif values == "remove" then
                    TriggerServerEvent('Framework:CallCommand', "deletedealer", { dealer["name"] })
                    EditDealer:Close()
                    menu7:Close()
                end
            end
        })
    end
end

-- menu_button4:On('Select', function(item)
--     menu7:ClearItems()
--     ESX.TriggerServerCallback('test:getdealers', function(dealers)
--         for k, v in pairs(dealers) do
--             local menu_button10 = menu7:AddButton({
--                 label = v["name"],
--                 value = v,
--                 description = 'Dealer Name',
--                 select = function(btn)
--                     local select = btn.Value
--                     OpenDealerMenu(select)
--                 end
--             })
--         end
--     end)
-- end)

-- Player List

local function OpenPermsMenu(permsply)
    ESX.TriggerServerCallback('qz-admin:server:getrank', function(rank)
        if rank then
            local selectedgroup = 'Unknown'
            MenuV:OpenMenu(menu10)
            menu10:ClearItems()
            local menu_button20 = menu10:AddSlider({
                icon = '',
                label = 'Group',
                value = 'user',
                values = {{
                    label = 'User',
                    value = 'user',
                    description = 'Group'
                }, {
                    label = 'Admin',
                    value = 'admin',
                    description = 'Group'
                }, {
                    label = 'God',
                    value = 'god',
                    description = 'Group'
                }},
                change = function(item, newValue, oldValue)
                    local vcal = newValue
                    if vcal == 1 then
                        selectedgroup = {}
                        selectedgroup[#selectedgroup+1] = {rank = "user", label = "User"}
                    elseif vcal == 2 then
                        selectedgroup = {}
                        selectedgroup[#selectedgroup+1] = {rank = "admin", label = "Admin"}
                    elseif vcal == 3 then
                        selectedgroup = {}
                        selectedgroup[#selectedgroup+1] = {rank = "god", label = "God"}
                    end
                end
            })

            local menu_button21 = menu10:AddButton({
                icon = '',
                label = 'Confirm',
                value = "giveperms",
                description = 'Give the permission group',
                select = function(btn)
                    if selectedgroup ~= 'Unknown' then
                        TriggerServerEvent('qz-admin:server:setPermissions', permsply.id, selectedgroup)
			            ESX.ShowNotification('Authority group changed!', 'success')
                        selectedgroup = 'Unknown'
                    else
                        ESX.ShowNotification('¡Selecciona un grupo!', 'error')
                    end
                end
            })
        else
            MenuV:CloseMenu(menu)
        end
    end)
end

local function LocalInput(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
  DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
  while (UpdateOnscreenKeyboard() == 0) do
    DisableAllControlActions(0)
    Wait(0)
  end

  if (GetOnscreenKeyboardResult()) then
    local result = GetOnscreenKeyboardResult()
      return result
  end
end

local function LocalInputInt(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
    while (UpdateOnscreenKeyboard() == 0) do
      DisableAllControlActions(0)
      Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
      local result = GetOnscreenKeyboardResult()
      return tonumber(result)
    end
end

local function OpenKickMenu(kickplayer)
    MenuV:OpenMenu(menu9)
    menu9:ClearItems()
    local menu_button19 = menu9:AddButton({
        icon = '',
        label = 'Motivo',
        value = "reason",
        description = 'Motivo del kick',
        select = function(btn)
            kickreason = LocalInput('Motivo', 255)
        end
    })

    local menu_button18 = menu9:AddButton({
        icon = '',
        label = 'Confirmar',
        value = "kick",
        description = 'Confirmar el Kick',
        select = function(btn)
            if kickreason ~= 'Unknown' then
                TriggerServerEvent('qz-admin:server:kick', kickplayer, kickreason)
                kickreason = 'Unknown'
            else
                ESX.ShowNotification('¡Tienes que especificar una razón!', 'error')
            end
        end
    })
end

local function OpenBanMenu(banplayer)
    MenuV:OpenMenu(menu8)
    menu8:ClearItems()
    local menu_button15 = menu8:AddButton({
        icon = '',
        label = 'Reason',
        value = "reason",
        description = 'Ban reason',
        select = function(btn)
            banreason = LocalInput('Motivo', 255)
        end
    })

    local menu_button16 = menu8:AddSlider({
        icon = '⏲️',
        label = 'Duración',
        value = '3600',
        values = {{
            label = '1 hora',
            value = '3600',
            description = 'Duración del baneo'
        }, {
            label = '6 horas',
            value ='21600',
            description = 'Duración del baneo'
        }, {
            label = '12 horas',
            value = '43200',
            description = 'Duración del baneo'
        }, {
            label = '1 dia',
            value = '86400',
            description = 'Duración del baneo'
        }, {
            label = '3 dia',
            value = '259200',
            description = 'Duración del baneo'
        }, {
            label = '1 semaan',
            value = '604800',
            description = 'Duración del baneo'
        }, {
            label = '1 mes',
            value = '2678400',
            description = 'Duración del baneo'
        }, {
            label = '3 meses',
            value = '8035200',
            description = 'Duración del baneo'
        }, {
            label = '6 meses',
            value = '16070400',
            description = 'Duración del baneo'
        }, {
            label = '1 año',
            value = '32140800',
            description = 'Duración del baneo'
        }, {
            label = 'Permanente',
            value = '99999999999',
            description = 'Duración del baneo'
        }, {
            label = 'Personalizado',
            value = "self",
            description = 'Duración del baneo'
        }},
        select = function(btn, newValue, oldValue)
            if newValue == "self" then
                banlength = LocalInputInt('Duración del baneo', 11)
            else
                banlength = newValue
            end
        end
    })

    local menu_button17 = menu8:AddButton({
        icon = '',
        label = 'Confirmar',
        value = "ban",
        description = 'Confirmar el baneo',
        select = function(btn)
            if banreason ~= 'Unknown' and banlength ~= nil then
                TriggerServerEvent('qz-admin:server:ban', banplayer, banlength, banreason)
                banreason = 'Unknown'
                banlength = nil
            else
                ESX.ShowNotification('nil', 'error')
            end
        end
    })
end

local function OpenPlayerMenus(player)
    local Players = MenuV:CreateMenu(false, player.cid .. ' Opciones', menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv') -- Players Sub Menu
    Players:ClearItems()
    MenuV:OpenMenu(Players)
    local elements = {
        [1] = {
            icon = '💀',
            label = "Matar",
            value = "kill",
            description = "Matar al jugador: " .. player.cid
        },
        [2] = {
            icon = '🏥',
            label = "Revivir",
            value = "revive",
            description = "Revivir al jugador: " .. player.cid
        },
        [3] = {
            icon = '🥶',
            label = "Freezear",
            value = "freeze",
            description = "Freezear al jugador: " .. player.cid
        },
        [4] = {
            icon = '👀',
            label = "Espectear",
            value = "spectate",
            description = "Espectear al jugador: " .. player.cid
        },
        [5] = {
            icon = '➡️',
            label = "Teletransportar",
            value = "goto",
            description = "Teletransportarte al jugador: " .. player.cid .. ""
        },
        [6] = {
            icon = '⬅️',
            label = "Traer",
            value = "bring",
            description = "Traer a " .. player.cid .. " a tu posición actual"
        },
        [7] = {
            icon = '🚗',
            label = "Sentar en el vehículo",
            value = "intovehicle",
            description = "Sentar en el vehículo (" .. player.cid .. ")"
        },
        [8] = {
            icon = '👕',
            label = "Ceder menú de ropa",
            value = "cloth",
            description = "Ceder el menú de ropa a " .. player.cid
        },
        [9] = {
            icon = '🥾',
            label = "Kick",
            value = "kick",
            description = "Kickear al usuario " .. player.cid .. ""
        }
    }
    for k, v in ipairs(elements) do
        local menu_button10 = Players:AddButton({
            icon = v.icon,
            label = ' ' .. v.label,
            value = v.value,
            description = v.description,
            select = function(btn)
                local values = btn.Value
                if values ~= "ban" and values ~= "kick" and values ~= "perms" then
                    TriggerServerEvent('qz-admin:server:'..values, player)
                elseif values == "ban" then
                    OpenBanMenu(player)
                elseif values == "kick" then
                    OpenKickMenu(player)
                elseif values == "perms" then
                    OpenPermsMenu(player)
                end
            end
        })
    end
end

menu_button2:On('select', function(item)
    menu4:ClearItems()
    ESX.TriggerServerCallback('test:getplayers', function(players)
        for k, v in pairs(players) do
            local menu_button10 = menu4:AddButton({
                label = 'ID:' .. v["id"] .. ' | ' .. v["name"],
                value = v,
                description = 'Nombre del usuario',
                select = function(btn)
                    local select = btn.Value -- get all the values from v!
                    OpenPlayerMenus(select) -- only pass what i select nothing else
                end
            }) -- WORKS
        end
    end)
end)

menu_button13:On("select", function(item, value)
    TriggerServerEvent("qz-weathersync:server:setTime", value, value)
    ESX.ShowNotification("El tiempo ha sido modificado a " .. value .. " hs 00 min")

end)

-- Toggle NoClip

menu_button5:On('change', function(item, newValue, oldValue)
    ToggleNoClipMode()
end)

-- Revive Self

menu_button6:On('select', function(item)
    TriggerEvent('esx_ambulancejob:revive', PlayerPedId())
end)

-- Invisible

local invisible = false
menu_button7:On('change', function(item, newValue, oldValue)
    if not invisible then
        invisible = true
        SetEntityVisible(PlayerPedId(), false, 0)
    else
        invisible = false
        SetEntityVisible(PlayerPedId(), true, 0)
    end
end)

-- Godmode

local godmode = false
menu_button8:On('change', function(item, newValue, oldValue)
    godmode = not godmode

    if godmode then
        while godmode do
            Wait(0)
            SetPlayerInvincible(PlayerId(), true)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end)

local function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

local function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

local function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim =
	{
		x = 0.5*(max.x - min.x),
		y = 0.5*(max.y - min.y),
		z = 0.5*(max.z - min.z)
	}

    local FUR =
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x,
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y,
		z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL =
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 =
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 =
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 =
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 =
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 =
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 =
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

CreateThread(function()	-- While loop needed for delete lazer
	while true do
		sleep = 1000
		if deleteLazer then
		    sleep = 7
		    local color = {r = 255, g = 255, b = 255, a = 200}
		    local position = GetEntityCoords(PlayerPedId())
		    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
		    -- If entity is found then verifie entity
		    if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
			local entityCoord = GetEntityCoords(entity)
			local minimum, maximum = GetModelDimensions(GetEntityModel(entity))
			DrawEntityBoundingBox(entity, color)
			DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
			Draw2DText('Objeto: ~b~' .. entity .. '~w~ Modelo: ~b~' .. GetEntityModel(entity), 4, {255, 255, 255}, 0.4, 0.55, 0.888)
			Draw2DText('Si quieres eliminar el objeto presiona ~g~E', 4, {255, 255, 255}, 0.4, 0.55, 0.888 + 0.025)
			-- When E pressed then remove targeted entity
			if IsControlJustReleased(0, 38) then
			    -- Set as missionEntity so the object can be remove (Even map objects)
			    SetEntityAsMissionEntity(entity, true, true)
			    --SetEntityAsNoLongerNeeded(entity)
			    --RequestNetworkControl(entity)
			    DeleteEntity(entity)
			end
		    -- Only draw of not center of map
		    elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
			-- Draws line to targeted position
			DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
			DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
		    end
		end
		Wait(sleep)
	end
end)
