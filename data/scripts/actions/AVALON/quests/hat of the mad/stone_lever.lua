local hatofthemadlever = Action()
function hatofthemadlever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		local stonePosition = Position(713,448,11)
		local stoneItem = Tile(stonePosition):getItemById(1304)
		if stoneItem then
			stoneItem:remove()
			stonePosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
			item:transform(1946)
		end
	end
	return true
end

hatofthemadlever:uid(44705)
hatofthemadlever:register()