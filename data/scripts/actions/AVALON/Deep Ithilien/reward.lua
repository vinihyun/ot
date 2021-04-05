local dptreward = Action()

function dptreward.onUse(cid, item, fromPosition, itemEx, toPosition)

	local player = Player(cid)
	if item.uid == 3269 then
		if player:getStorageValue(7787) ~= 1 then
					player:setStorageValue(7787, 1)
			player:addItem(2434, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a thunder hammer.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The box is empty.")
		end
			end
	return true
end

dptreward:uid(3269)
dptreward:register()