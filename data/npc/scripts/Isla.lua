local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

--------------------------- Configuração Inicial ------------------------------------
local strg = 22985 -- Valor da Storage

--------------------------- Configuração das Falas  -----------------------------------
if (msgcontains(msg, 'house')) then
        if getPlayerStorageValue(cid, strg) < 1 then
        selfSay('No?', cid)
        talkState[talkUser] = 1
    else
        selfSay('Yes?.', cid)
        talkState[talkUser] = 0
    end

--------------------------- Falas de Entrada  -----------------------------------

elseif(msgcontains(msg, 'no') or msgcontains(msg, 'nao') and talkState[talkUser] == 1) then
        if getPlayerStorageValue(cid, strg) < 1 then
            setPlayerStorageValue(cid, strg, 1)
            selfSay('I will tell you! There is are big giant monters in my backyard and I cannot take them out! I gave you access and you can you kill them for me', cid)
            talkState[talkUser] = 0
        else
            selfSay('I already told you about the monsters!', cid)
        return false
        end

--------------------------- Falas de Rejeição  -----------------------------------
elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'sim') and isInArray({1}, talkState[talkUser])) then
        talkState[talkUser] = 0
        selfSay('Oh, that is bad.', cid)

--------------------------- FIM do SCRIPT ---------------------------------------
    end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())