local config = {
	[9017] = {
		wallPositions = {
			Position(1030, 267, 14),
			Position(1031, 267, 14),
			Position(1032, 267, 14),
			Position(1033, 267, 14),
			Position(1034, 267, 14),
			Position(1035, 267, 14),
			Position(1036, 267, 14),
			Position(1037, 267, 14),
			Position(1038, 267, 14),
			Position(1039, 267, 14),
			Position(1040, 267, 14),
			Position(1041, 267, 14),
			Position(1042, 267, 14)
		},
		wallDown = 1524,
		wallUp = 1050
	},
	[9018] = {
		wallPositions = {
			Position(1027, 270, 14),
			Position(1027, 271, 14),
			Position(1027, 272, 14),
			Position(1027, 273, 14),
			Position(1027, 274, 14),
			Position(1027, 275, 14),
			Position(1027, 276, 14)
		},
		wallDown = 1526,
		wallUp = 1049
	},
	[9019] = {
		wallPositions = {
			Position(1030, 279, 14),
			Position(1031, 279, 14),
			Position(1032, 279, 14),
			Position(1033, 279, 14),
			Position(1034, 279, 14),
			Position(1035, 279, 14),
			Position(1036, 279, 14),
			Position(1037, 279, 14),
			Position(1038, 279, 14),
			Position(1039, 279, 14),
			Position(1040, 279, 14),
			Position(1041, 279, 14),
			Position(1042, 279, 14)
		},
		wallDown = 1524,
		wallUp = 1050
	},
	[9020] = {
		wallPositions = {
			Position(1045, 270, 14),
			Position(1045, 271, 14),
			Position(1045, 272, 14),
			Position(1045, 273, 14),
			Position(1045, 274, 14),
			Position(1045, 275, 14),
			Position(1045, 276, 14)
		},
		wallDown = 1526,
		wallUp = 1049
	}
}

local inquisitionBrother = Action()
function inquisitionBrother.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetLever = config[item.uid]
	if not targetLever then
		return true
	end

	local tile, thing
	for i = 1, #targetLever.wallPositions do
		tile = Tile(targetLever.wallPositions[i])
		if tile then
			thing = tile:getItemById(item.itemid == 1945 and targetLever.wallDown or targetLever.wallUp)
			if thing then
				thing:transform(item.itemid == 1945 and targetLever.wallUp or targetLever.wallDown)
			end
		end
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end

inquisitionBrother:uid(9017,9018,9019,9020)
inquisitionBrother:register()