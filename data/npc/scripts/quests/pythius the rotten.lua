local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end
-- OTServ event handling functions end

local function removePortal(pos, item)
	return doRemoveItem(getTileItemById(pos, item).uid)
end
function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if (not npcHandler:isFocused(cid)) then
        return false
    end
	if msgcontains(msg, "golden mug") then
		npcHandler:say('DO YOU HAVE A GOLDEN MUG FOR ME?', cid)
		talk_state = 1
	elseif msgcontains(msg, 'yes') and talk_state == 1 then
		if(doPlayerTakeItem(cid, 2033, 1))then
			npcHandler:say('I GRANT YOU ACCESS TO THE DUNGEON IN THE NORTH. YOU\'LL FIND SOME OF MY LIVING BROTHERS THERE', cid)
			local createPos = {x=32598,y=31402,z=15}
			doCreateTeleport(1387,{x=32599,y=31396,z=14}, createPos)
			addEvent(removePortal, 120000, createPos, 1387) --remove tele in 2 minutes
			talk_state = 0
		end
	elseif msgcontains(msg, 'no') and (talk_state == 1) then
		npcHandler:say('DO NOT WASTE MY TIME!', cid)
		talk_state = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())