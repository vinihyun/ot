local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local npcOrder = 1 -- edite a ordem do npc

local t = {
[1] = {keyword = "kazordoon", text = "Bela cidade construída pelos seres mais fortes, os dwarfs."}, -- palavra-chave, texto
[2] = {keyword = "mushroom", text = "Comida típica dos dwarfs. A propósito, você não teria algum para mim?"}
}

function creatureSayCallback(cid, type, msg)
local talkUser, msg = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid, string.lower(msg)
    if(not npcHandler:isFocused(cid)) then
        if isInArray({"hi", "hello"}, msg) then
            if (getPlayerStorageValue(cid, 96772) == -1 and npcOrder == 1) or getPlayerStorageValue(cid, 96772) == npcOrder then
                npcHandler:addFocus(cid)
                npcHandler:say("Olá, "..getPlayerName(cid).."! Você tem algo a me dizer?", cid)
                talkState[talkUser] = 1
            else
                npcHandler:addFocus(cid)
                npcHandler:say("Olá, "..getPlayerName(cid).."! Talvez possamos conversar outra hora...", cid)
                talkState[talkUser] = 0
                npcHandler:releaseFocus(cid)
            end
        else
            return false
        end    
    elseif t[talkState[talkUser]] and msgcontains(msg, t[talkState[talkUser]].keyword) then
            npcHandler:say(t[talkState[talkUser]].text, cid)
            if talkState[talkUser] == #t then
                setPlayerStorageValue(cid, 96772, npcOrder + 1)
                talkState[talkUser] = 0
            else
                talkState[talkUser] = talkState[talkUser] + 1
            end
    elseif msgcontains(msg, "bye") then
        npcHandler:say("Bye.", cid)
        talkState[talkUser] = 0
        npcHandler:releaseFocus(cid)
    else
        npcHandler:say("WHAT?", cid)
        talkState[talkUser] = 0
    end
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
 

 

Como arquivo.xml base você pode utilizar esse, faça as mudanças que desejar.

 

<?xml version="1.0" encoding="UTF-8"?>
<npc name="Dwarfer" script="NOMEDOSEUARQUIVO.lua" walkinterval="2000" floorchange="0">
	<health now="100" max="100"/>
	<look type="66"/>
</npc>
