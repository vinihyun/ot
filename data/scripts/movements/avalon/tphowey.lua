local TpHowey = MoveEvent()	
		function TpHowey.onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)	

 

                local config = {	

	                               storage = 858520, --coloca o valor da storage que você quiser	

	                               posSemStorage = {x = 544, y = 1497, z =10}, -- posição sem storage	

	                               posComStorage = {x = 1161, y = 874, z = 7} -- posição com storage	

	                }	



                if getPlayerStorageValue(cid, config.storage) >= 1 then	

                               doTeleportThing(cid, config.posComStorage, false)	

                               doSendMagicEffect(config.posComStorage, CONST_ME_TELEPORT)	

                               doPlayerSendTextMessage(cid, 22, "Welcolme To Howey")	

	                else 	

	                               doTeleportThing(cid, config.posSemStorage, false)	

	                               doPlayerSendTextMessage(cid, 22, "You have no acess to Howey City")	

	                               doSendMagicEffect(config.posSemStorage, CONST_ME_TELEPORT)	

	                end	

	                	

	                return true	

	end	

TpHowey:aid(15555)
TpHowey:register()