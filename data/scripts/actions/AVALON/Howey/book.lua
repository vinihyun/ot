local BookHowey = Action()

function BookHowey.onUse(cid, item, fromPosition, itemEx, toPosition)

	local player = Player(cid)
	if item.uid == 44877 then
		if player:getStorageValue(Storage.Howey.Questline, 5) ~= 1 then
					player:setStorageValue(Storage.Howey.Questline, 5)
			player:addItem(1978, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a brazilian book receipt.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
		end
			end
	return true
end

BookHowey:uid(44877)
BookHowey:register()