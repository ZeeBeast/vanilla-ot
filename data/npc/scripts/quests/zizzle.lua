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

	if msgcontains(msg, "mission") then
		selfSay({
		"You freed ze dragon! And you pozzezz ze key to enter ze inner realmz of ze emperor, well done. ...", 
		"Now you are ready to reach ze inner zanctum of ze emperor. Zalamon'z revelationz showed him zat zere are four cryztalz channelling ze will of ze emperor into ze land. ...", 
		"Wiz ze relic you gained from Zalamon we were able to create powerful replicaz of ze zeptre. Take ziz wiz you. ...",
		"You will have to realign ze cryztalz one after ze ozer. Ztart wiz ze one in ze norz-wezt and work your way clockwize zrough ze room. ...",
		"Uzing ze zeptre will forze a part of ze emperor'z willpower out of ze cryztal. You will have to kill zoze manifeztationz. ...",
		"Zen uze your zeptre on ze remainz to deztroy ze emperor'z influenze over ze cryztal. ..",
		"I recommend not to go alone becauze it will be very dangerouz - but ALL of you will have to uze zeir zeptre replicaz on ze emperor'z remainz to prozeed! ...",
		"Good luck. You will need it"
		}, cid)

	end
	
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())