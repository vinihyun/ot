local vocationDoors = {
	-- Sorcerer
	[22001] = {
		vocation = VOCATION.ID.SORCERER,
		destination = {x = 424, y = 501, z = 8}
	},
	-- Druid
	[22002] = {
		vocation = VOCATION.ID.DRUID,
		destination = {x = 428, y = 501, z = 8}
	},
	-- Paladin
	[22003] = {
		vocation = VOCATION.ID.PALADIN,
		destination = {x = 424, y = 506, z = 8}
	},
	-- Knight
	[22004] = {
		vocation = VOCATION.ID.KNIGHT,
		destination = {x = 428, y = 506, z = 8}
	},
}

local vocationDoor = Action()

function vocationDoor.onUse(player, item, target, position, fromPosition)
	local door = vocationDoors[item.uid]
	--Check Oressa storage before choose vocation
	if player:getStorageValue(Storage.Dawnport.DoorVocation) == door.vocation then
		-- Remove Mainland smuggling items
		removeMainlandSmugglingItems(player)
		player:teleportTo(door.destination)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"Open the chest and take your gear, young " .. player:getVocation():getName():lower() .. "!"
		)
	elseif player:getStorageValue(Storage.Dawnport.DoorVocation) ~= door.vocation then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end

for index, value in pairs(vocationDoors) do
	vocationDoor:uid(index)
end

vocationDoor:register()
