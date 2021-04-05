local rewards = {
	[4598] = 2645,
	[4599] = 2493,
	[4600] = 2520,
}

local DHRewards = Action()
function DHRewards.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.DemonHelmet) < 1 then
		player:addItem(rewards[item.uid], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found " .. ItemType(rewards[item.uid]):getName() .. ".")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end

for value = 4598, 4600 do
	DHRewards:uid(value)
end
DHRewards:register()