local tpburster = MoveEvent()	
		function tpburster.onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)	

 

                local config = {	

	                               storage = 22983, --coloca o valor da storage que você quiser	

	                               posSemStorage = {x = 163, y = 197, z = 5}, -- posição sem storage	

	                               posComStorage = {x = 158, y = 557, z = 6} -- posição com storage	

	                }	

                	

                if getPlayerStorageValue(cid, config.storage) >= 1 then	

                               doTeleportThing(cid, config.posComStorage, false)	

                               doSendMagicEffect(config.posComStorage, CONST_ME_TELEPORT)	

                               doPlayerSendTextMessage(cid, 22, "Welcome to Oslens - Bouderland Ice House!")	

	                else 	

	                               doTeleportThing(cid, config.posSemStorage, false)	

	                               doPlayerSendTextMessage(cid, 22, "Oslen have not invited you to his house!")	

	                               doSendMagicEffect(config.posSemStorage, CONST_ME_TELEPORT)	

	                end	

	                	

	                return true	

	end	

tpburster:aid(22489)
tpburster:register()