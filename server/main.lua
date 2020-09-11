local PlayersWorking = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function Work(source, item)

	SetTimeout(item[1].time, function()

		if PlayersWorking[source] == true then

			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer == nil then
				return
			end

			for i=1, #item, 1 do
				local itemQtty = 0
				if item[i].name ~= _U('delivery') then
					itemQtty = xPlayer.getInventoryItem(item[i].db_name).count
				end

				local requiredItemQtty = 0
				if item[1].requires ~= "nothing" then
					requiredItemQtty = xPlayer.getInventoryItem(item[1].requires).count
				end

				if item[i].name ~= _U('delivery') and itemQtty >= item[i].max then
					TriggerClientEvent('esx:showNotification', source, _U('max_limit', item[i].name))
					TriggerClientEvent('esx_jobs:stopAnimation', source)
				elseif item[i].requires ~= "nothing" and requiredItemQtty <= 0 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough', item[1].requires_name))
				else
					if item[i].name ~= _U('delivery') then
						-- Chances to drop the item
                        if item[i].drop == 100 then
                    
                        local dropanotheritemChance = math.random(1,100)
                        local itemstodrop = 'phone'
                        local randomItemFish = {"plastic", "screw"}
                        local randomItemIron = {"spring", "screw"}
                        local limitedItem = 0
                        
                        

                        local actualJob = item[i].db_name

                        if actualJob == 'wood' then
                            itemstodrop = 'poudre'
                        elseif actualJob == 'fish' then
                            itemstodrop = randomItemFish[math.random(#randomItemFish)]
                        elseif actualJob == 'iron' then
                            
                            itemstodrop = randomItemIron[math.random(#randomItemIron)]
                        end
                        local itemCount = xPlayer.getInventoryItem(itemstodrop).count
                        ---- limiting items 
                        if itemstodrop == 'screw' or itemstodrop == 'rubber' or itemstodrop == 'plastic' or itemstodrop == 'spring' then
                             limitedItem = 8
                        elseif itemstodrop == 'poudre' then
                             limitedItem = 1
                         end
                          ---- limiting items 
                        if dropanotheritemChance >= 95 and itemCount < limitedItem then
                            xPlayer.addInventoryItem(itemstodrop,1)
                            
                        
                            
                        end
                        xPlayer.addInventoryItem(item[i].db_name, item[i].add)
                        
						else
							local chanceToDrop = math.random(100)
							if chanceToDrop <= item[i].drop then
								xPlayer.addInventoryItem(item[i].db_name, item[i].add)
							end
						end
					else
						local itemToRemoveQtty = xPlayer.getInventoryItem(item[1].requires).count
						if itemToRemoveQtty == 100 then
							xPlayer.addMoney(item[i].price * 100)
						else
						xPlayer.addMoney(item[i].price)
						end
					end
				end
			end

			if item[1].requires ~= "nothing" then
				local itemToRemoveQtty = xPlayer.getInventoryItem(item[1].requires).count
				if (itemToRemoveQtty > 0) and (itemToRemoveQtty ~= 100) then
					xPlayer.removeInventoryItem(item[1].requires, item[1].remove)
				elseif itemToRemoveQtty == 100 then
					xPlayer.removeInventoryItem(item[1].requires, 100)
				end
			end

			Work(source, item)

		end
	end)
end

RegisterServerEvent('esx_jobs:startWork')
AddEventHandler('esx_jobs:startWork', function(item)
	if not PlayersWorking[source] then
		PlayersWorking[source] = true
		Work(source, item)
	else
		print(('esx_jobs: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

RegisterServerEvent('esx_jobs:stopWork')
AddEventHandler('esx_jobs:stopWork', function()
	PlayersWorking[source] = false
end)