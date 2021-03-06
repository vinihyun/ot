local pos = {
	[2025] = {x = 1403, y = 892, z = 11},
	[2026] = {x = 1405, y = 892, z = 11},
	[2027] = {x = 1407, y = 892, z = 11},
	[2028] = {x = 1409, y = 892, z = 11}
}


local function doRemoveFirewalls(fwPos)
	local tile = Position(fwPos):getTile()
	if tile then
		local thing = tile:getItemById(6289)
		if thing then
			thing:remove()
		end
	end
end

local pitsOfInfernoWalls = Action()
function pitsOfInfernoWalls.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.itemid == 1945) then
		doRemoveFirewalls(pos[item.uid])
		Position(pos[item.uid]):sendMagicEffect(CONST_ME_FIREAREA)
	else
		Game.createItem(6289, 1, pos[item.uid])
		Position(pos[item.uid]):sendMagicEffect(CONST_ME_FIREAREA)
	end
	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end

pitsOfInfernoWalls:uid(2025,2026,2027,2028)
pitsOfInfernoWalls:register()