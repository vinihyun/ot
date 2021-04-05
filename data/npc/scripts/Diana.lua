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
local strg = 22982 -- Valor da Storage

--------------------------- Configuração das Falas  -----------------------------------
if (msgcontains(msg, 'bag')) then
        if getPlayerStorageValue(cid, strg) < 1 then
        selfSay('Do you wanna find my bag?', cid)
        talkState[talkUser] = 1
    else
        selfSay('Please, help me. I have given you.', cid)
        talkState[talkUser] = 0
    end

--------------------------- Falas de Entrada  -----------------------------------

elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
        if getPlayerStorageValue(cid, strg) < 1 then
            setPlayerStorageValue(cid, strg, 1)
            selfSay('Please return as soon as possible! I will trust ya.', cid)
            talkState[talkUser] = 0
        else
            selfSay('I have given you what you asked before..', cid)
        return false
        end

--------------------------- Falas de Rejeição  -----------------------------------
elseif(msgcontains(msg, 'no') or msgcontains(msg, 'nao') and isInArray({1}, talkState[talkUser])) then
        talkState[talkUser] = 0
        selfSay('Okay then. Someone else will will be, I bet.', cid)

--------------------------- FIM do SCRIPT ---------------------------------------
    end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())