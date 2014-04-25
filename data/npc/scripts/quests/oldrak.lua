local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
 
	if(not npcHandler:isFocused(cid)) then
		return false
	end
 
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, 'axe') or msgcontains(msg, 'demon') then
		selfSay("So you need a hallowed axe to defeat the demon oak.. Do you have 1000 gold for me?", cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 then
		if doPlayerRemoveMoney(cid, 1000) then
			doPlayerAddItem(cid, 8293)
			selfSay("Here you go, be careful.", cid)
		else
			selfSay("I need 1000 gold.", cid)
		end
	end
	return true
end




npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())