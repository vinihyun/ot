local tpgazer = MoveEvent()	
		function tpgazer.onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)	

 	

                local config = {	

	                               storage = 22982, --coloca o valor da storage que você quiser	

	                               posSemStorage = {x = 255, y = 665, z = 8}, -- posição sem storage	

	                               posComStorage = {x = 294, y = 876, z = 8} -- posição com storage	

	                }	

                	

                if getPlayerStorageValue(cid, config.storage) >= 1 then	

                               doTeleportThing(cid, config.posComStorage, false)	

                               doSendMagicEffect(config.posComStorage, CONST_ME_TELEPORT)	

                               doPlayerSendTextMessage(cid, 22, "Find Diana's friend bag!")	

	                else 	

	                               doTeleportThing(cid, config.posSemStorage, false)	

	                               doPlayerSendTextMessage(cid, 22, "You did not ask the favor from Diana!")	

	                               doSendMagicEffect(config.posSemStorage, CONST_ME_TELEPORT)	

	                end	

	                	

	                return true	

	end	

tpgazer:aid(22487)
tpgazer:register()