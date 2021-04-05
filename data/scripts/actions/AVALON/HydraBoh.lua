local hydraboh = Action()

function hydraboh.onUse(cid, item, fromPosition, itemEx, toPosition)

	local player = Player(cid)
	if item.uid == 3270 then
		if player:getStorageValue(7788) ~= 1 then
					player:setStorageValue(7788, 1)
			player:addItem(2195, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have boots of haste.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The box is empty.")
		end
			end
	return true
end

hydraboh:uid(3270)
hydraboh:register()