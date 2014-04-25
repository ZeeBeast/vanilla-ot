local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

npcHandler:addModule(FocusModule:new())
local Topic = {}

function creatureSayCallback(cid, _type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if (math.random(1, 15) == 1) then
		selfSay("*shudders and trembles*... wait.. what did you say? I'm trying to focus on our insigni.. no, I mean, interesting conversation, but I feel slightly sick... I'm sorry.", cid)		
	elseif msgcontains(msg, 'job') then
		selfSay("I don't have a profane 'job' - it is my destiny to devour evil and bring a new dawn.", cid)
	elseif msgcontains(msg, 'help') or msgcontains(msg, 'mission') or msgcontains(msg, 'quest') then
		selfSay("You sound like you wish to help me. Yet I must walk this path alone - but thank you.", cid)
	elseif msgcontains(msg, 'tibia') or msgcontains(msg, 'world') then
		selfSay("I see how corrupt this world has become and it makes me want to cry.", cid)
	elseif msgcontains(msg, 'name') then
		selfSay("My name would be unspeakable for your tongue. You may call me Devovorga - which comes rather close.", cid)
	elseif msgcontains(msg, 'corrupt') then
		selfSay("What you call 'corruption' could be salvation - and what you consider 'good' is rotten to its pitch black close.", cid)
	elseif msgcontains(msg, 'human') then
		selfSay("You're welcome to join me in the pain you also helped causing.", cid)
	elseif msgcontains(msg, 'creators') then
		selfSay("Yes, I was created. And I'm not a mere being like humans, devils, demons or even gods. I'm a weapon. I'm devouring. I'm hungry. I want revenge.", cid)
	elseif msgcontains(msg, 'devovorga') then
		selfSay("How cute and shallow that sounds from your limited vocal chords and lips. You should have heard my enslavers pronounce it - accompanied by thunder in their voices that shook earth and sky.", cid)
	elseif msgcontains(msg, 'trapped') then
		selfSay("I'm trapped in this useless body. But I can feel it begin to change... finally...", cid)
		local tempPos = getNpcPos()
		doSendMagicEffect(tempPos, CONST_ME_BIGPLANTS)
		doRemoveCreature(getNpcId())
		doCreateMonster("Devovorga2", tempPos)
	elseif msgcontains(msg, 'vengoth') then
		selfSay("I've been waiting here for a long time. Even before this continent started turning dark.", cid)
	elseif msgcontains(msg, 'revenge') then
		selfSay("Can you imagine thousands of years trapped down here? I'm thirsting for life. I will face my creators and enslavers free this beautiful world from them and from anything else that keeps destroying it.", cid)
	elseif msgcontains(msg, 'enslavers') then
		selfSay("My enslavers and creators formed and summoned my soul and then, seeing I was too powerful for them, trapping me deep down here. How foolish of them.", cid)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "Maybe you are not so lost.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "A lost soul wondering in the abyss...")
npcHandler:setMessage(MESSAGE_GREET, "So you have come, |PLAYERNAME|. I hoped you would not...")
npcHandler:addModule(FocusModule:new())