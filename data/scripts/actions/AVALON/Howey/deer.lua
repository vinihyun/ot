local deerhowey = Action()

function deerhowey.onUse(cid, item, fromPosition, itemEx, toPosition)

	local player = Player(cid)
	if item.uid == 11457 then
		if player:getStorageValue(Storage.Howey.Questline) ~= 1 then
					player:setStorageValue(Storage.Howey.Mission02, 2)
					player:setStorageValue(Storage.Howey.Questline, 5)
			player:addItem(2671, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You got some ham.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You got this ham already.")
		end
			end
	return true
end

deerhowey:uid(11457)
deerhowey:register()