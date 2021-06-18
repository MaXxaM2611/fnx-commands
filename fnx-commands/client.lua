

RegisterCommand("kit",function (src,arg)
   local Ped = GetPlayerPed(-1)
    if IsPedArmed(Ped, 4) then 
       local WeaponHash = GetSelectedPedWeapon(Ped)
        if WeaponHash~=nil then
            if arg[1] == nil then
                if Config.Component[WeaponHash] ~= nil then
                    for a, b in pairs(Config.Component[WeaponHash]) do
                        GiveWeaponComponentToPed(Ped, WeaponHash, b)
                        Notifica("~g~Hai Aggiunto tutti gli accessori disponibili per la tua arma~w~")
                    end
                end
            else
                if Config.Component[WeaponHash][arg[1]] ~= nil then
                    GiveWeaponComponentToPed(Ped, WeaponHash, Config.Component[WeaponHash][arg[1]])
                    Notifica("~g~Hai Aggiunto un accessorio dalla tua arma~w~")
                end
            end
        end
    else
        Notifica("~r~Non hai un arma in mano~w~")
    end
end)


RegisterCommand("removekit",function (src,arg)
    local Ped = GetPlayerPed(-1)
    if IsPedArmed(Ped, 4) then 
        local WeaponHash = GetSelectedPedWeapon(Ped)
        if WeaponHash~=nil then
            if arg[1] == nil then
                if Config.Component[WeaponHash] ~= nil then
                    for a, b in pairs(Config.Component[WeaponHash]) do
                        RemoveWeaponComponentFromPed(Ped, WeaponHash, b)
                        Notifica("~g~Hai Rimosso tutti gli accessori dalla tua arma~w~")
                    end
                end
            else
                if Config.Component[WeaponHash][arg[1]] ~= nil then
                    RemoveWeaponComponentFromPed(Ped, WeaponHash, Config.Component[WeaponHash][arg[1]])
                    Notifica("~g~Hai Rimosso un accessorio dalla tua arma~w~")
                end
            end
        end
    else
        Notifica("~r~Non hai un arma in mano~w~")
    end
end)



RegisterCommand("colorazione",function (src,arg)
    local Ped = GetPlayerPed(-1)
    if IsPedArmed(Ped, 4) then 
        local WeaponHash = GetSelectedPedWeapon(Ped)
        if WeaponHash ~= nil then
            if tonumber(arg[1]) ~= nil then
                if tonumber(arg[1]) <= GetWeaponTintCount(WeaponHash) then
                    SetPedWeaponTintIndex(Ped, WeaponHash, tonumber(arg[1]))
                    Notifica("~g~Hai aggiunto la skin "..tonumber(arg[1]).." alla tua arma~w~")
                else
                    Notifica("~r~Skin non esistente per quest' arma~w~")
                end
            else
                Notifica("~r~Inserisci un valore valido~w~")
            end
        end   
    else
        Notifica("~r~Non hai un arma in mano~w~")
    end
end)



RegisterCommand("ammo",function (src,arg)
    local Ped = GetPlayerPed(-1)
    if IsPedArmed(Ped, 4) then 
        local WeaponHash = GetSelectedPedWeapon(Ped)
        if WeaponHash ~= nil then
            AddAmmoToPed(Ped, WeaponHash,Config.MaxAmmoGive)
            Notifica("~g~Hai Caricato "..Config.MaxAmmoGive.." munizioni alla tua arma~w~")
        end   
    else
        Notifica("~r~Non hai un arma in mano~w~")
    end
end)



Notifica = function (msg)
    AddTextEntry('Notification', msg)
    SetNotificationTextEntry('Notification')
    DrawNotification(false, true)
end