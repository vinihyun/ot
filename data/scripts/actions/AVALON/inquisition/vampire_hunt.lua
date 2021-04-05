local altars = {
	{x = 592, y = 542, z = 10},
	{x = 589, y = 548, z = 10},
	{x = 596, y = 548, z = 10}
}

local inquisitionVampire = Action()
function inquisitionVampire.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.TheInquisition.Questline) == 8 then
		player:setStorageValue(Storage.TheInquisition.Questline, 9)
		player:setStorageValue(Storage.TheInquisition.Mission03, 4) -- The Inquisition Questlog- "Mission 3: Vampire Hunt"
		local k = {}
		for i = 1, #altars do
			local tmp = Tile(altars[i]):getItemById(2199)
			if not tmp then
				Game.createMonster("The Count", toPosition)
				return true
			else
				k[#k + 1] = tmp
			end
		end
		for i = 1, #k do
			k[i]:remove()
		end
		Game.createMonster("The Weakened Count", toPosition)
		return true
	end
end

inquisitionVampire:aid(2002)
inquisitionVampire:register()