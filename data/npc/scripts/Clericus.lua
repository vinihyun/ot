local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

if(msgcontains(msg, 'howey')) then
selfSay('Meh, once again. By the way, I am hungry. Bring me about 20 {hams} and we can talk.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'hams') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 2671) >= 20) and getPlayerStorageValue(cid, 858520) < 1 then -- Y = ID ITEM LUMP OF DITY, QUANTIDADE NECESSARIA
doPlayerRemoveItem(cid, 2671, 20)  -- Y = ID ITEM LUMP OF DIRTY, QUANTIDADE REMOVIDA
setPlayerStorageValue(cid,858520,1) -- X = Storage que ganha
selfSay('Okay. Now we can {talk}. What do you wanna know?', cid)
else
selfSay('We have discussed it before...', cid)
end
talkState[talkUser] = 0
end


if getPlayerStorageValue(cid, 858520) >= 1 then
selfSay("What are you talking about?")
talkState[talkUser] = 0
elseif (msgcontains(msg, 'talk')) then
selfSay("Ok, Howey is my {hometown}.") 
talkState[talkUser] = 1
setPlayerStorageValue(cid,858520,2)
elseif(msgcontains(msg, 'hometown') and talkState[talkUser] == 1) then
selfSay("It is a city like this one. I came here with my aunt Melissa a long time ago for work. I heard that place got bigger and richer, when I left that was pure XXXX.") 
talkState[talkUser] = 1
else
selfSay('We have discussed it before...', cid)
end
talkState[talkUser] = 0
end


  
npcHandler:setMessage(MESSAGE_GREET, "Greetings! |PLAYERNAME|! How can I help you? Did someone tell you anything?!?!")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you soon, |PLAYERNAME|!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())