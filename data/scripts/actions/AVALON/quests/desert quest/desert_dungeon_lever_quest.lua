local config = {
	{
		fromPosition = Position(334, 430, 8),
		toPosition = Position(315, 424, 8),
		sacrificePosition = Position(336, 430, 8),
		sacrificeId = 2175,
		vocationId = VOCATION.CLIENT_ID.SORCERER
	},
	{
		fromPosition = Position(328, 430, 8),
		toPosition = Position(316, 424, 8),
		sacrificePosition = Position(326, 430, 8),
		sacrificeId = 2674,
		vocationId = VOCATION.CLIENT_ID.DRUID
	},
	{
		fromPosition = Position(331, 427, 8),
		toPosition = Position(315, 425, 8),
		sacrificePosition = Position(331, 425, 8),
		sacrificeId = 2455,
		vocationId = VOCATION.CLIENT_ID.PALADIN
	},
	{
		fromPosition = Position(331, 433, 8),
		toPosition = Position(316, 425, 8),
		sacrificePosition = Position(331, 434, 8),
		sacrificeId = 2376,
		vocationId = VOCATION.CLIENT_ID.KNIGHT
	}
}

local othersDesert = Action()
function othersDesert.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(item.itemid == 1945 and 1946 or 1945)

	if item.itemid ~= 1945 then
		return true
	end

	local position = player:getPosition()

	local players = {}
	for i = 1, #config do
		local creature = Tile(config[i].fromPosition):getTopCreature()
		if not creature or not creature:isPlayer() then
			player:sendCancelMessage('You need one player of each vocation for this quest.')
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end

		local vocationId = creature:getVocation():getClientId()
		if vocationId ~= config[i].vocationId then
			player:sendCancelMessage('You need one player of each vocation for this quest.')
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end

		local sacrificeItem = Tile(config[i].sacrificePosition):getItemById(config[i].sacrificeId)
		if not sacrificeItem then
			player:sendCancelMessage(creature:getName() .. ' is missing ' .. (creature:getSex() == PLAYERSEX_FEMALE and 'her' or 'his') .. ' sacrifice on the altar.')
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end

		players[#players + 1] = creature
	end

	for i = 1, #players do
		local sacrificeItem = Tile(config[i].sacrificePosition):getItemById(config[i].sacrificeId)
		if sacrificeItem then
			sacrificeItem:remove()
		end

		players[i]:getPosition():sendMagicEffect(CONST_ME_POFF)
		players[i]:teleportTo(config[i].toPosition)
		config[i].toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

othersDesert:uid(1912)
othersDesert:register()