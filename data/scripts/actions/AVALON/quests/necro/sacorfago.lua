local Necrox = Action()
function Necrox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.AchiSarco) == 1 then
		return false
	end

	player:addHealth(player:getMaxHealth())
	player:addMana(player:getMaxMana())
	player:addAchievement('Sarcophagus')
	player:setStorageValue(Storage.AchiSarco, 1)
	player:say('You feel very refreshed by the blood.', TALKTYPE_MONSTER_SAY)
	return true
end

Necrox:aid(20578)
Necrox:register()