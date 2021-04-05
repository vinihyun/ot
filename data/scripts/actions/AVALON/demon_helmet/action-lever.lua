local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local teleportPosition = {x = 448, y = 591, z = 14}
	local stonePosition = {x = 445, y = 593, z = 14}

	if item.itemid == 1945 then
		local teleport = Game.createItem(1387, 1, teleportPosition)
		if teleport then
			teleport:setDestination({x = 451, y = 612, z = 14})
			Position(teleportPosition):sendMagicEffect(CONST_ME_TELEPORT)
		end

		Tile(stonePosition):getItemById(1355):remove()
		item:transform(1946)
	elseif item.itemid == 1946 then
		Position(stonePosition):hasCreature({x = 446, y = 593, z = 14})
		Tile(teleportPosition):getItemById(1387):remove()
		Position(teleportPosition):sendMagicEffect(CONST_ME_POFF)
		Game.createItem(1355, 1, stonePosition)
		item:transform(1945)
	end
	return true
end

lever:uid(30007)
lever:register()
