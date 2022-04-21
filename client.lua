ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


local automobil = "sanchez"
local cooldown = 5*60 -- 5 minuta 
local cooldown = false 
--- Automobil

RegisterCommand("pvozilo", function()
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank) -- esx_marker:fetchUserRank -- -- OVDJE STAVLJATE SVOJ CALLBACK
  --ESX.TriggerServerCallback("esx:proveriRank", function(playerRank)
        if playerRank == "promoter" then
            if not cooldown then            
            ESX.ShowNotification('PMenu: Vozilo spawnovano!')
            TriggerEvent('esx:spawnVehicle', automobil)
            cooldown = true 
            print('Professr - ' .. math.random(1,1000))
        else 
            ESX.ShowNotification('PMenu: COOLDOWN 5 MINUTA!')
            Citizen.Wait(cooldown)
            cooldown = false 
            print('Professr2 - ' .. math.random(1,1000))
            end
        else
            ESX.ShowNotification("Nemas permisije!")
        end
    end)
end)

-- Popravka 
RegisterCommand("ppopravi", function()
    local igrac = PlayerPedId()
    local vozilo = GetVehiclePedIsIn(igrac)
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank) -- esx_marker:fetchUserRank -- -- OVDJE STAVLJATE SVOJ CALLBACK
        --ESX.TriggerServerCallback("esx:proveriRank", function(playerRank)
        if playerRank == "promoter" then
            if not cooldown then 
            ESX.ShowNotification('PMenu: Vozilo popravljeno!')
            SetVehicleFixed(vozilo)
            SetVehicleDeformationFixed(vozilo)
            cooldown = true 
            print('Professr - ' .. math.random(1,1000))
        else 
            ESX.ShowNotification('PMenu: COOLDOWN 5 MINUTA!')
            Citizen.Wait(cooldown)
            cooldown = false 
            print('Professr2 - ' .. math.random(1,1000))
            end
        else
            ESX.ShowNotification("Nemas permisije!")
        end
    end)
end)

-- Ne diraj ovo dole
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    print('^1----------------------------------')
    print('^2Promoter Sistem^9 - ^1je uspjesno pokrenut!')
    print('^2Sistem^9 - ^1napravljen od strane Professr!')
    print('^2Verzija^9 - ^1v1.0.0!')
    print('^1---------------------------------------')
end)

if GetCurrentResourceName() ~= "professr_promotermenu" then
    print("^1                                             #")
    print("^1                                             ###")
    print("^1###### ###### ###### ###### ######  ##############")
    print("^1#      #    # #    # #    # #    #  ################    Promjeni ime skripte  '" .. GetCurrentResourceName() .. "' nazad u 'professr_promotermenu!'")
    print("^1###    ###### ###### #    # ######  ##################  Professr#9134")
    print("^1#      # ##   # ##   #    # # ##    ################    Professr#9134")
    print("^1###### #   ## #   ## ###### #   ##  ##############")
    print("^1                                             ###")
    print("^1                                             #")
   StopResource(GetCurrentResourceName())
end
