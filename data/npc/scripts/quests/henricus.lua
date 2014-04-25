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
	if msgcontains(msg, 'mission') then
		if (getCreatureStorage(cid, "INQ_Mission") ~= 1)then
			selfSay("You need to destroy The Shadow Nexus and come back to me. Use this vial of holy water to destroy the Shadow Nexus.", cid)
			doPlayerAddItem(cid, 7494, 1)
			doCreatureSetStorage(cid, "INQ_Mission", 1)
		else
			selfSay("Your current mission is to destroy the Shadow Nexus. Are you done with that mission?", cid)
			talkState[talkUser] = 1
		end
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 then
		if getCreatureStorage(cid, 14916) == 1 then
			selfSay("Incredible! You're a true defender of faith! Also, don't forget to ask me about your demon hunter {outfit}.", cid)
		else
			selfSay("Your current mission is to destroy the Shadow Nexus. Come back when you have.", cid)
		end
	elseif msgcontains(msg, 'outfit') and getCreatureStorage(cid, 14916) == 1 then
		if not canPlayerWearOutfitId(cid, 20, 3) then
			selfSay("Here is your full demon hunter outfit. Congratulations!", cid)
			doPlayerAddOutfitId(cid, 20, 2)
		else
			selfSay("You already have the full demon hunter outfit!", cid)
		end
	elseif msgcontains(msg, 'no') and talkState[talkUser] == 1 then
		selfSay("Your current mission is to destroy the Shadow Nexus. Come back when you have.", cid)
		talkState[talkUser] = 0
	end
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())