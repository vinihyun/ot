local NecroRoomReward = Action()
function NecroRoomReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if item.uid == 55987 then
		if player:getStorageValue(558877) < 1 then
			local container = player:addItem(2003)
			container:addItem(2536, 1)
			container:addItem(2436, 1)
			container:addItem(2656, 1)
			player:setStorageValue(558877, 1)
			player:addAchievement("Necromancer Apprendice")
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found an energetic backpack.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end

	return true
end

NecroRoomReward:uid(55987)
NecroRoomReward:register()