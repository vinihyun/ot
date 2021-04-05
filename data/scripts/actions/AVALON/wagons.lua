local nodes = {
	[30000] = {x = 718, y = 377, z = 11}, -- Depo
	[30001] = {x = 450, y = 428, z = 11}, --karmia under
	[30002] = {x = 777, y = 385, z = 8}, --vaar entrance
	[30003] = {x = 777, y = 430, z = 10}, --ticketer
	[30004] = {x = 798, y = 359, z = 12}, --temple vaar
	[30005] = {x = 669, y = 356, z = 12}, --dwarfs and golems
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 1131) > os.time()) then
		if(getPlayerStorageValue(cid, 1132) < 100) then
			setPlayerStorageValue(cid, 1132, math.max(0, getPlayerStorageValue(cid, 1132)) + 1)
		end
		doTeleportThing(cid, nodes[item.actionid])
		doSendMagicEffect(nodes[item.actionid], CONST_ME_TELEPORT)
	else
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "To travel by ore wagons you must purchase a wagon ticket from Lukor.")
	end
	return true
end