     
    local keywordHandler = KeywordHandler:new()
    local npcHandler = NpcHandler:new(keywordHandler)
    NpcSystem.parseParameters(npcHandler)
     
    function onCreatureAppear(cid)	npcHandler:onCreatureAppear(cid) end
    function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
    function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
    function onThink()	npcHandler:onThink() end
     
    local function delayMoneyRemoval(item, pos)
    doRemoveItem(getTileItemById(pos, item).uid)
    return true
    end
     
    local function placeMoney(amount, table_middle_pos)
    local remain = amount
    local crystal_coins = 0
    local platinum_coins = 0
     
    if (math.floor(amount / 10000) >= 1) then
    crystal_coins = math.floor(amount / 10000)
    remain = remain - crystal_coins * 10000
    end
    if ((remain / 100) >= 1) then
    platinum_coins = remain / 100
    end
    addEvent(doCreateItem, 550, 2152, platinum_coins, table_middle_pos)
    addEvent(doCreateItem, 600, 2160, crystal_coins, table_middle_pos)
    end
     
    local function rollDice(roll, cc_count, pc_count, table_left_pos, table_middle_pos, npc)
    local dice_ids = {5792, 5793, 5794, 5795, 5796, 5797}
    local random_rollval = math.random(1,6)
    local total_g = (10000 * cc_count) + (100 * pc_count)
    local prize_percent = 0.8 -- 80%
    local prize_percentl = 3.0 -- 300%
     
    if ((total_g) <= 300000 and (total_g) >= 1000) then
    doSendMagicEffect(table_left_pos, CONST_ME_CRAPS)
     
    for _, itemId in pairs(dice_ids) do
    if(getTileItemById(table_left_pos, itemId).uid > 0) then
    doTransformItem(getTileItemById(table_left_pos, itemId).uid, dice_ids[random_rollval])
    end
    end
     
    if (roll == 1 and random_rollval <= 3) then
    placeMoney(total_g + (total_g * prize_percent), table_middle_pos)
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doCreatureSay, 500, npc, "You win!", TALKTYPE_SAY, false, 0)
    elseif (roll == 2 and random_rollval >= 4) then
    placeMoney(total_g + (total_g * prize_percent), table_middle_pos)
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doCreatureSay, 500, npc, "You win!", TALKTYPE_SAY, false, 0)
    elseif (roll == 3 and random_rollval == 1) then
    placeMoney(total_g + (total_g * prize_percentl), table_middle_pos)
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doCreatureSay, 500, npc, "You win!", TALKTYPE_SAY, false, 0)
    elseif (roll == 4 and random_rollval == 2) then
    placeMoney(total_g + (total_g * prize_percentl), table_middle_pos)
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doCreatureSay, 500, npc, "You win!", TALKTYPE_SAY, false, 0)
    elseif (roll == 5 and random_rollval == 3) then
    placeMoney(total_g + (total_g * prize_percentl), table_middle_pos)
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doCreatureSay, 500, npc, "You win!", TALKTYPE_SAY, false, 0)
    elseif (roll == 6 and random_rollval == 4) then
    placeMoney(total_g + (total_g * prize_percentl), table_middle_pos)
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doCreatureSay, 500, npc, "You win!", TALKTYPE_SAY, false, 0)
    elseif (roll == 7 and random_rollval == 5) then
    placeMoney(total_g + (total_g * prize_percentl), table_middle_pos)
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doCreatureSay, 500, npc, "You win!", TALKTYPE_SAY, false, 0)
    elseif (roll == 8 and random_rollval == 6) then
    placeMoney(total_g + (total_g * prize_percentl), table_middle_pos)
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
    addEvent(doCreatureSay, 500, npc, "You win!", TALKTYPE_SAY, false, 0)
    else
    addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_BLOCKHIT)
    addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_BLOCKHIT)
    addEvent(doCreatureSay, 500, npc, "Better luck next time.", TALKTYPE_SAY, false, 0)
     
    end
     
    doCreatureSay(npc, string.format("%s rolled a %d.", getCreatureName(npc), random_rollval), TALKTYPE_ORANGE_1, false, 0, table_left_pos)
    else
    addEvent(doCreateItem, 100, 2160, cc_count, table_middle_pos)
    addEvent(doCreateItem, 150, 2152, pc_count, table_middle_pos)
    doCreatureSay(npc, "The minimum wager is 1K and the maximum wager is 300K.", TALKTYPE_SAY, false, 0)
    end
    return true
    end
     
    function creatureSayCallback(cid, type, msg)
    -- NPC userdata instance
    local npc = getNpcCid()
     
    -- Participating player userdata instance
    local position = {x = getNpcPos().x+2, y = getNpcPos().y, z = getNpcPos().z}
    position.stackpos = STACKPOS_TOP_CREATURE
    local player_uid = getThingfromPos(position).uid
     
    -- Game table position userdata instances
    local table_left_pos = {x = 465, y = 496, z = 9}
    local table_middle_pos = {x = 466, y = 496, z = 9}
     
    -- Search for coins on the left and middle tables and create item userdata instances
    local table_middle_cc = getTileItemById(table_middle_pos, 2160)
    local table_middle_pc = getTileItemById(table_middle_pos, 2152)
     
    -- Other variables
    local cc_count = 0
    local pc_count = 0
    local ROLL, LOW, HIGH, ROL1, ROL2, ROL3, ROL4, ROL5, ROL6 = 0, 1, 2, 3, 4, 5, 6, 7, 8
     
     
    if (player_uid ~= 0) then
    if ((msgcontains(string.lower(msg), 'high') or msgcontains(string.lower(msg), 'h')) or msgcontains(string.lower(msg), '456') and (isPlayer(player_uid) and player_uid == cid)) then
    ROLL = HIGH
    elseif ((msgcontains(string.lower(msg), 'low') or msgcontains(string.lower(msg), 'l')) or msgcontains(string.lower(msg), '123') and (isPlayer(player_uid) and player_uid == cid)) then
    ROLL = LOW
    elseif ((msgcontains(string.lower(msg), '1')and (isPlayer(player_uid) and player_uid == cid))) then
    ROLL = ROL1
    elseif ((msgcontains(string.lower(msg), '2')and (isPlayer(player_uid) and player_uid == cid))) then
    ROLL = ROL2
    elseif ((msgcontains(string.lower(msg), '3')and (isPlayer(player_uid) and player_uid == cid))) then
    ROLL = ROL3
    elseif ((msgcontains(string.lower(msg), '4')and (isPlayer(player_uid) and player_uid == cid))) then
    ROLL = ROL4
    elseif ((msgcontains(string.lower(msg), '5')and (isPlayer(player_uid) and player_uid == cid))) then
    ROLL = ROL5
    elseif ((msgcontains(string.lower(msg), '6')and (isPlayer(player_uid) and player_uid == cid))) then
    ROLL = ROL6
    else
    return false
    end
     
    if (table_middle_cc.uid ~= 0) then
    cc_count = table_middle_cc.type
    doTeleportThing(table_middle_cc.uid, table_left_pos)
    addEvent(delayMoneyRemoval, 300, 2160, table_left_pos)
    end
    if (table_middle_pc.uid ~= 0) then
    pc_count = table_middle_pc.type
    doTeleportThing(table_middle_pc.uid, table_left_pos)
    addEvent(delayMoneyRemoval, 300, 2152, table_left_pos)
    end
    addEvent(rollDice, 500, ROLL, cc_count, pc_count, table_left_pos, table_middle_pos, npc)
    else
    return false
    end
    return true
    end
     
     
    npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)