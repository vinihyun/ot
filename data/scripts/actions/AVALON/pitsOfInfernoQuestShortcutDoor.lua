local ShortPoi = Action()
function ShortPoi.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.PitsOfInferno.ShortcutHubDoor) == 1 then
		if item.itemid == 1223 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end

ShortPoi:aid(9954)
ShortPoi:register()