local destinations = {
	[28810] = Position(1399, 873, 9),
	[28811] = Position(1413, 882, 9),
	[28812] = Position(1416, 866, 9),
	[28813] = Position(1427, 855, 9),
	[28814] = Position(1412, 876, 9),
	[28815] = Position(1426, 882, 9),
	[28816] = Position(1430, 855, 9),
	[28817] = Position(1428, 848, 9),
	[28818] = Position(1427, 877, 9)
}

local tileTeleport = MoveEvent()

function tileTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(destinations[item.actionid])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

tileTeleport:type("stepin")

for index, value in pairs(destinations) do
	tileTeleport:aid(index)
end

tileTeleport:register()
