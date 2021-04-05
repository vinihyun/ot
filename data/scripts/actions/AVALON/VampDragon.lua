local vpdg = Action()

function vpdg.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if item.uid == 3121 then
		if player:getStorageValue(492) ~= 1 then
			player:setStorageValue(492, 1)
			player:addItem(2414, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a gift.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
		end
	elseif item.uid == 3122 then
		if player:getStorageValue(493) ~= 1 then
			player:setStorageValue(493, 1)
			player:addItem(2534, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found another gift.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
		end
	end
	return true
end

vpdg:uid(3121,3122)
vpdg:register()