local islaripper = MoveEvent()	
		function islaripper.onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)	

 

                local config = {	

	                               storage = 22985, --coloca o valor da storage que você quiser	

	                               posSemStorage = {x = 1034, y = 871, z = 8}, -- posição sem storage	

	                               posComStorage = {x = 1161, y = 874, z = 7} -- posição com storage	

	                }	

                	

                if getPlayerStorageValue(cid, config.storage) >= 1 then	

                               doTeleportThing(cid, config.posComStorage, false)	

                               doSendMagicEffect(config.posComStorage, CONST_ME_TELEPORT)	

                               doPlayerSendTextMessage(cid, 22, "Kill the monsters for Isla! She is crazy about it")	

	                else 	

	                               doTeleportThing(cid, config.posSemStorage, false)	

	                               doPlayerSendTextMessage(cid, 22, "Are you crazy about enthering?")	

	                               doSendMagicEffect(config.posSemStorage, CONST_ME_TELEPORT)	

	                end	

	                	

	                return true	

	end	

islaripper:aid(22490)
islaripper:register()