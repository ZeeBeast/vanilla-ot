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
	if(not talkState[talkUser])then
		talkState[talkUser] = {0,0}
	end

	if msgcontains(msg, "arena") or msgcontains(msg, "fight") or msgcontains(msg, "challenge") or msgcontains(msg, "pit") then
		selfSay("So you agree to the rules and want to participate in the challenge? Which difficulty do you choose, {greenhorn}, {scrapper}, {warlord}, or {champion}?", cid)
	elseif msgcontains(msg, "greenhorn") then
		selfSay("Alright the entry fee is 1000 gold. Is that okay?", cid)
		talkState[talkUser] = {1, 1000}
	elseif msgcontains(msg, "scrapper") then
		if(getCreatureStorage(cid, 10001) == 1)then
			selfSay("Alright the entry fee is 5000 gold. Is that okay?", cid)
			talkState[talkUser] = {2, 5000}
		else
			selfSay("I'm sorry but you have to do Greenhorn before you can do Scrapper.", cid)
		end
	elseif msgcontains(msg, "warlord") then
		if(getCreatureStorage(cid, 10002) == 1)then
			selfSay("Alright the entry fee is 10000 gold. Is that okay?", cid)
			talkState[talkUser] = {3, 10000}
		else
			selfSay("I'm sorry but you have to do Scrapper before you can do Warlord.", cid)
		end
	elseif msgcontains(msg, "champion") then
		if(getCreatureStorage(cid, 10003) == 1)then
			selfSay("HAHA WHAT!?! No I was just kidding. Oh wait you're serious... well I can get you a spot but it'll cost you 500,000 gold. Is that okay?", cid)
			talkState[talkUser] = {4, 500000}
		else
			selfSay("I'm sorry but you have to do Warlord before you can do the Champion difficulty.", cid)
		end
	elseif msgcontains(msg, "yes") and talkState[talkUser][1] > 0 then
		if(getCreatureStorage(cid, 10000 + talkState[talkUser][1]) == 1)then
			selfSay("Sorry you can't do the same difficulty twice.", cid)
			talkState[talkUser] = nil
		elseif(getCreatureStorage(cid, 10000) > 0)then
			selfSay("Says here that you've already paid your fee. Go on in.", cid)
			talkState[talkUser] = nil
		elseif doPlayerRemoveMoney(cid, talkState[talkUser][2]) then
			selfSay("Alright, go through the doors to the right and walk in any of the teleporters to begin. Goodluck.", cid)
			doCreatureSetStorage(cid, 10000, talkState[talkUser][1])
		else
			selfSay("You don't have enough money for the entry fee.", cid)
			talkState[talkUser] = nil
		end
	elseif msgcontains(msg, "no") and talkState[talkUser][1] > 0 then
		selfSay("Then not. Get away and don't waste my time!", cid)
		talkState[talkUser] = nil
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())