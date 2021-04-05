local vampirReward = Action()
function vampirReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if item.uid == 55989 then
		if player:getStorageValue(558879) < 1 then
			local container = player:addItem(2003)
			container:addItem(2534, 1)
			player:setStorageValue(558879, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a vampire shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end

	return true
end

vampirReward:uid(55989)
vampirReward:register()