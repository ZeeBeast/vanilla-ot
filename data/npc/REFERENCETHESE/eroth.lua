local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}

-- OTServ event handling functions start
function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'mission') then
		local missionState =  getPlayerStorageValue(cid, "Q_207")
		if missionState < 1 then
			selfSay('Have you ever heard of Elvenbane? It is the castle west of Ab\'Dendriel which is inhabited by villains from all over the continent. Any support in this war is welcome. Are you willing to help?', cid)
			Topic[cid] = 1
		elseif missionState == 2 then
			selfSay("I heard the blow! The reflection must have caused a overcharge of magical energy leading to the contraction and the implosion. Just like I hoped! Please take this as a reward. Thank you very much.", cid)
			setPlayerStorageValue(cid, "Q_207", 3)
			doPlayerAddItem(cid, 2198)
			doPlayerAddItem(cid, 2152, 10)
		end
	elseif Topic[cid] == 1 and msgcontains(msg, 'yes') then
		selfSay({
			'Recently we found out that they are in the possession of a scrying crystal ball. They can hear all our discussions about tactics and upcoming attacks. ...',
			'No wonder that they always have been so well prepared. Now you come into play, destroy the scrying crystal ball in Elvenbane. It should be on the top floor. ...',
			'We don\'t really know how to destroy it but we suppose it may work if you reflect the invisible power of the ball. The beam should be adjusted to Ab\'Dendriel. Take this mirror and give it a try. Good luck.'
		}, cid)
		setPlayerStorageValue(cid, "Q_207", 1)
		doPlayerAddItem(cid, 2560)
		Topic[cid] = 0
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())