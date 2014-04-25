local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end



function creatureSayCallback(cid, type, msg)

	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local c = getPlayerStorageValue(cid, 64419)
	
	local var = {
		start = 64416,
		cup = 64417,
		finish = 64415
	}
		
	if msgcontains(msg, 'mission') then	
		if (getPlayerStorageValue(cid, var.start) == 1) then
			npcHandler:say('Yessss! Now I only need to build my own small brewery, figure out the secret recipe, duplicate the dwarvish brew and BANG I\'ll be back in business! Here take this as a reward.',cid)
			setPlayerStorageValue(cid, var.finish, 1)
			doPlayerAddItem(cid, 5710, 1)
			doPlayerAddItem(cid, 2152, 10)	
			doCreatureSay(cid,"You have received a light shovel and 10 platinum coins for completing this mission!",TALKTYPE_ORANGE_1)
		else	
			npcHandler:say('Shush!! I don\'t want everybody to know what I am up to. Listen, things are not going too well, I need a new attraction. Do you want to {help me} '.. getCreatureName(cid).. '?', cid)
			talkState[talkUser] = 1	
		end				
	elseif msgcontains(msg, 'yes') then
		if(talkState[talkUser] == 1) then
			npcHandler:say('Good! Listen closely. Take this bottle and go to {Kazordoon}. I need a sample of their very special brown ale. You may find a cask in their brewery. Come back as soon as you got it.', cid)
			doPlayerAddItem(cid, 2013, 1)
			setPlayerStorageValue(cid, var.start, 1)
		else 	
			npcHandler:say("You do not have what I asked for.", cid)
		end
	end
end




local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
shopModule:addBuyableItem({'bread'}, 2689, 4, 1,'bread') 
shopModule:addBuyableItem({'cheese'}, 2696, 6, 1,'cheese') 
shopModule:addBuyableItem({'cookie'}, 2687, 5, 1,'cookie')
shopModule:addBuyableItem({'ham'}, 2671, 8, 1,'ham')
shopModule:addBuyableItem({'Ice Cream Cone'}, 7372, 10, 1,'Ice Cream Cone')
shopModule:addBuyableItem({'meat'}, 2666, 5, 1,'meat')
npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())