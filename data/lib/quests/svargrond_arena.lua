--[[
	TODO
		- Include PITS and ARENA table in SvargrondArena -> SvargrondArena.arenas / SvargrondArena.pits
		- Restructure PITS and ARENA table (reward.storage does not seem to be used)
]]

SvargrondArena = {
	-- action ids have to be equal to action id of reward doors
	actionGreenhorn = 26100,
	actionScrapper = 27100,
	actionWarlord = 28100,

	-- kick time in seconds (10 minutes)
	kickTime = 600,
	kickPosition = Position(364, 125, 6),
	rewardPosition = Position(366, 114, 6),

	-- used to store event ids
	kickEvents = {},
	timerEvents = {},

	-- item ids used by the script
	itemTimer = 10288,
	itemPillar = 1354,
	itemTeleport = 5023,
	itemsNotErasable = {10288, 1354, 1543, 1544, 1545},
}

-- Script automatically derives other pit positions from this one
local firstPit = {
	fromPos = {x = 349, y = 128, z = 7}, 
	toPos = {x = 358, y = 137, z = 7},
	center = {x = 354, y = 132, z = 7},
	pillar = {x = 348, y = 132, z = 7},
	tp = {x = 348, y = 132, z = 7},
	summon = {x = 354, y = 134, z = 7}
}

PITS = {
	[1] = {
		fromPos = firstPit.fromPos,
		toPos = firstPit.toPos,
		center = firstPit.center,
		pillar = firstPit.pillar,
		tp = firstPit.tp,
		summon = firstPit.summon
	},
	[2] = {
		fromPos = {x = firstPit.fromPos.x - 14, y = firstPit.fromPos.y, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 14, y = firstPit.toPos.y, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 14, y = firstPit.center.y, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 14, y = firstPit.pillar.y, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 14, y = firstPit.tp.y, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 14, y = firstPit.summon.y, z = firstPit.summon.z}
	},
	[3] = {
		fromPos = {x = firstPit.fromPos.x - 28, y = firstPit.fromPos.y, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 28, y = firstPit.toPos.y, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 28, y = firstPit.center.y, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 28, y = firstPit.pillar.y, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 28, y = firstPit.tp.y, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 28, y = firstPit.summon.y, z = firstPit.summon.z}
	},
	[4] = {
		fromPos = {x = firstPit.fromPos.x - 42, y = firstPit.fromPos.y, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 42, y = firstPit.toPos.y, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 42, y = firstPit.center.y, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 42, y = firstPit.pillar.y, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 42, y = firstPit.tp.y, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 42, y = firstPit.summon.y, z = firstPit.summon.z}
	},
	[5] = {
		fromPos = {x = firstPit.fromPos.x - 35, y = firstPit.fromPos.y - 14, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 35, y = firstPit.toPos.y - 14, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 35, y = firstPit.center.y - 14, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 35, y = firstPit.pillar.y - 14, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 35, y = firstPit.tp.y - 14, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 35, y = firstPit.summon.y - 14, z = firstPit.summon.z}
	},
	[6] = {
		fromPos = {x = firstPit.fromPos.x - 21, y = firstPit.fromPos.y - 14, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 21, y = firstPit.toPos.y - 14, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 21, y = firstPit.center.y - 14, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 21, y = firstPit.pillar.y - 14, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 21, y = firstPit.tp.y - 14, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 21, y = firstPit.summon.y - 14, z = firstPit.summon.z}
	},
	[7] = {
		fromPos = {x = firstPit.fromPos.x - 7, y = firstPit.fromPos.y - 14, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 7, y = firstPit.toPos.y - 14, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 7, y = firstPit.center.y - 14, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 7, y = firstPit.pillar.y - 14, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 7, y = firstPit.tp.y - 14, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 7, y = firstPit.summon.y - 14, z = firstPit.summon.z}
	},
	[8] = {
		fromPos = {x = firstPit.fromPos.x - 14, y = firstPit.fromPos.y - 28, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 14, y = firstPit.toPos.y - 28, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 14, y = firstPit.center.y - 28, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 14, y = firstPit.pillar.y - 28, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 14, y = firstPit.tp.y - 28, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 14, y = firstPit.summon.y - 28, z = firstPit.summon.z}
	},
	[9] = {
		fromPos = {x = firstPit.fromPos.x - 28, y = firstPit.fromPos.y - 28, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 28, y = firstPit.toPos.y - 28, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 28, y = firstPit.center.y - 28, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 28, y = firstPit.pillar.y - 28, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 28, y = firstPit.tp.y - 28, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 28, y = firstPit.summon.y - 28, z = firstPit.summon.z}
	},
	[10] = {
		fromPos = {x = firstPit.fromPos.x - 21, y = firstPit.fromPos.y - 42, z = firstPit.fromPos.z},
		toPos = {x = firstPit.toPos.x - 21, y = firstPit.toPos.y - 42, z = firstPit.toPos.z},
		center = {x = firstPit.center.x - 21, y = firstPit.center.y - 41, z = firstPit.center.z},
		pillar = {x = firstPit.pillar.x - 21, y = firstPit.pillar.y - 41, z = firstPit.pillar.z},
		tp = {x = firstPit.tp.x - 21, y = firstPit.tp.y - 41, z = firstPit.tp.z},
		summon = {x = firstPit.summon.x - 21, y = firstPit.summon.y - 41, z = firstPit.summon.z}
	}
}

ARENA = {
	[1] = {
		name = 'Greenhorn',
		price = 1000,
		creatures = {
			[1] = 'frostfur',
			[2] = 'bloodpaw',
			[3] = 'bovinus',
			[4] = 'achad',
			[5] = 'colerian the barbarian',
			[6] = 'the hairy one',
			[7] = 'axeitus headbanger',
			[8] = 'rocky',
			[9] = 'cursed gladiator',
			[10] = 'orcus the cruel'
		},
		reward = {
			storage = 1102,
			trophy = 5807,
			trophyStorage = 1103,
			desc = 'A brave warrior that finished the Greenhorn mode. Awarded to %s.',
			[26300] = {
				container = true,
				id = 1990,
				inside = {
					{2114, 1},
					{9570, 1},
					{6574, 1},
					{2688, 10},
					{7372, 1}
				}
			},
			[26400] = {
				container = true,
				id = 7342,
				inside = {
					{7364, 100},
					{7365, 100}
				},
			},
			[26500] = {
				id = {7406, 1}
			},
			[26600] = {
				id = {7380, 1}
			},
			[26700] = {
				id = {7392, 1}
			}
		}
	},
	[2] = {
		name = 'Scrapper',
		price = 5000,
		creatures = {
			[1] = 'avalanche',
			[2] = 'kreebosh the exile',
			[3] = 'the dark dancer',
			[4] = 'the hag',
			[5] = 'slim',
			[6] = 'grimgor guteater',
			[7] = 'drasilla',
			[8] = 'spirit of earth',
			[9] = 'spirit of water',
			[10] = 'spirit of fire'
		},
		reward = {
			storage = 1104,
			trophy = 5806,
			trophyStorage = 1105,
			desc = 'A brave warrior that finished the Scrapper mode. Awarded to %s.',
			[27300] = {
				container = true,
				id = 1990,
				inside = {
					{7183, 1},
					{6574, 1},
					{7373, 1},
					{2688, 10}
				}
			},
			[27400] = {
				container = true,
				id = 7342,
				inside = {
					{2304, 50},
					{2311, 50},
					{2547, 200},
					{7365, 100}
				},
			},
			[27500] = {
				id = {7384, 1}
			},
			[27600] = {
				id = {7389, 1}
			},
			[27700] = {
				id = {7415, 1}
			}
		}
	},
	[3] = {
		name = 'Warlord',
		price = 10000,
		creatures = {
			[1] = 'webster',
			[2] = 'darakan the executioner',
			[3] = 'norgle glacierbeard',
			[4] = 'the pit lord',
			[5] = 'svoren the mad',
			[6] = 'the masked marauder',
			[7] = 'gnorre chyllson',
			[8] = 'fallen mooh\'tah master ghar',
			[9] = 'deathbringer',
			[10] = 'the obliverator'
		},
		reward = {
			storage = 1006,
			trophy = 5805,
			trophyStorage = 1007,
			desc = 'A brave warrior that finished the Warlord mode. Awarded to %s.',
			[28300] = {
				container = true,
				id = 1990,
				inside = {
					{6568, 1},
					{6574, 1},
					{7374, 1},
					{2688, 10}
				}
			},
			[28400] = {
				container = true,
				id = 7342,
				inside = {
					{6529, 100},
					{7440, 1},
					{7443, 1},
					{2268, 50},
					{2273, 50}
				},
			},
			[28500] = {
				id = {7390, 1}
			},
			[28600] = {
				id = {7434, 1}
			},
			[28700] = {
				id = {7429, 1}
			}
		}
	}
}

function SvargrondArena.getActionIdByArena(arenaId)
	if arenaId == 1 then
		return SvargrondArena.actionGreenhorn
	elseif arenaId == 2 then
		return SvargrondArena.actionScrapper
	elseif arenaId == 3 then
		return SvargrondArena.actionWarlord
	else
		print('SvargronArena::getActionIdByArena invalid arenaId')
	end
end

function SvargrondArena.getPitCreatures(pitId)
	if not PITS[pitId] then
		return {}
	end

	local ret = {}
	for x = PITS[pitId].fromPos.x, PITS[pitId].toPos.x do
		for y = PITS[pitId].fromPos.y, PITS[pitId].toPos.y do
			for z = PITS[pitId].fromPos.z, PITS[pitId].toPos.z do
				local tile = Tile({x=x, y=y, z=z})
				if tile then
					local creature = tile:getTopCreature()
					if creature then
						table.insert(ret, creature)
					end
				end
			end
		end
	end

	return ret
end

function SvargrondArena.resetPit(pitId)
	if not PITS[pitId] then
		return
	end

	for x = PITS[pitId].fromPos.x, PITS[pitId].toPos.x do
		for y = PITS[pitId].fromPos.y, PITS[pitId].toPos.y do
			for z = PITS[pitId].fromPos.z, PITS[pitId].toPos.z do
				local tile = Tile({x=x, y=y, z=z})
				if tile then
					local moveableItem = tile:getThing(STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE)
					if moveableItem and moveableItem:isItem() then
						local itemType = ItemType(moveableItem:getId())
						if itemType and itemType:isMovable() and not isInArray(SvargrondArena.itemsNotErasable, moveableItem:getId()) then
							moveableItem:remove()
						end
					end

					local creature = tile:getTopCreature()
					if creature and creature:isMonster() then
						creature:remove()
					end
				end
			end
		end
	end

	local pillarTile = Tile(PITS[pitId].pillar)
	if pillarTile then
		local teleportItem = pillarTile:getItemById(SvargrondArena.itemTeleport)
		if teleportItem then
			teleportItem:remove()
		end

		local pillarItem = pillarTile:getItemById(SvargrondArena.itemPillar)
		if not pillarItem then
			Game.createItem(SvargrondArena.itemPillar, 1, PITS[pitId].pillar)
		end
	end
end

function SvargrondArena.getPitOccupant(pitId, ignorePlayer)
	local creatures = SvargrondArena.getPitCreatures(pitId)
	for i = 1, #creatures do
		if creatures[i]:isPlayer() and creatures[i]:getId() ~= ignorePlayer:getId() then
			return creatures[i]
		end
	end

	if not occupant then
		local tile = Tile(PITS[pitId].pillar)
		if tile then
			local creature = tile:getTopCreature()
			if creature and creature:isPlayer() then
				return creature
			end
		end
	end

	return nil
end

function SvargrondArena.kickPlayer(cid, hideMessage)
	SvargrondArena.cancelEvents(cid)
	local player = Player(cid)
	if not player then
		return
	end

	if player:getStorageValue(Storage.SvargrondArena.Pit) > 0 then
		player:teleportTo(SvargrondArena.kickPosition)
		SvargrondArena.kickPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(Storage.SvargrondArena.Pit, 0)
		if not hideMessage then
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Your time ran out!')
		end
	end
end

function SvargrondArena.cancelEvents(cid)
	local kickEvent = SvargrondArena.kickEvents[cid]
	if kickEvent then
		SvargrondArena.removeTimer(kickEvent.pitId)
		stopEvent(kickEvent.eventId)
	end
	SvargrondArena.kickEvents[cid] = nil
end

function SvargrondArena.scheduleKickPlayer(cid, pitId)
	SvargrondArena.cancelEvents(cid)
	SvargrondArena.startTimer(pitId)
	local eventId = addEvent(SvargrondArena.kickPlayer, SvargrondArena.kickTime * 1000, cid)
	SvargrondArena.kickEvents[cid] = {eventId = eventId, pitId = pitId}
end

function SvargrondArena.startTimer(pitId)
	local tile = Tile(PITS[pitId].fromPos)
	if not tile then
		return
	end

	local timerItem = tile:getItemById(SvargrondArena.itemTimer)
	if timerItem then
		timerItem:remove()
	end

	timerItem = Game.createItem(SvargrondArena.itemTimer, 1, PITS[pitId].fromPos)
	if timerItem then
		timerItem:decay()
	end

	if SvargrondArena.timerEvents[pitId] then
		stopEvent(SvargrondArena.timerEvents[pitId])
	end
	SvargrondArena.timerEvents[pitId] = addEvent(SvargrondArena.removeTimer, SvargrondArena.kickTime * 1000, pitId)
end

function SvargrondArena.removeTimer(pitId)
	local tile = Tile(PITS[pitId].fromPos)
	if not tile then
		return
	end

	local timerItem = tile:getItemById(SvargrondArena.itemTimer)
	if timerItem then
		timerItem:remove()
	end
	SvargrondArena.timerEvents[pitId] = nil
end

