local cycReward = Action()
function cycReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if item.uid == 55988 then
		if player:getStorageValue(558878) < 1 then
			local container = player:addItem(2003)
			container:addItem(2515, 1)
			player:setStorageValue(558878, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a guardian shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end

	return true
end

cycReward:uid(55988)
cycReward:register()