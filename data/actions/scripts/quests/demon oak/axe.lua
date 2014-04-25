local summons = {
	[1] = {"Demon", "Grim Reaper", "Elder Bonelord", "Demon Skeleton"},
	[2] = {"Dark Torturer", "Banshee", "Betrayed Wraith", "Blightwalker"},
	[3] = {"Bonebeast", "Braindeath", "Diabolic Imp", "Giant Spider"},
	[4] = {"Hand Of Cursed Fate", "Lich", "Undead Dragon", "Vampire"},
	[5] = {"Braindeath", "Demon", "Bonebeast", "Diabolic Imp"},
	[6] = {"Demon Skeleton", "Banshee", "Elder Bonelord", "Bonebeast"},
	[7] = {"Dark Torturer", "Undead Dragon", "Demon", "Demon"},
	[8] = {"Elder Bonelord", "Betrayed Wraith", "Demon Skeleton", "Giant Spider"},
	[9] = {"Demon", "Banshee", "Blightwalker", "Demon Skeleton"},
	[10] = {"Grim Reaper", "Demon", "Diabolic Imp", "Braindeath"},
	[11] = {"Banshee", "Grim Reaper", "Hand Of Cursed Fate", "Demon"}
}
local sounds = {
	"MY ROOTS ARE SHARP AS A SCYTHE! FEEL IT?!?",
	"CURSE YOU!",
	"RISE, MINIONS, RISE FROM THE DEAD!!!!",
	"AHHHH! YOUR BLOOD MAKES ME STRONG!",
	"GET THE BONES, HELLHOUND! GET THEM!!",
	"GET THERE WHERE I CAN REACH YOU!!!",
	"ETERNAL PAIN AWAITS YOU! NICE REWARD, HUH?!?!",
	"YOU ARE GOING TO PAY FOR EACH HIT WITH DECADES OF TORTURE!!",
	"ARGG! TORTURE IT!! KILL IT SLOWLY MY MINION!!"
} 
local summonPos = {
	{x = 32712, y = 32348, z = 7},
	{x = 32712, y = 32354, z = 7},
	{x = 32721, y = 32354, z = 7},
	{x = 32721, y = 32348, z = 7},
	{x = 32713, y = 32355, z = 7},
	{x = 32724, y = 32351, z = 7},
	{x = 32719, y = 32355, z = 7},
	{x = 32711, y = 32350, z = 7}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local demonoak = {8288, 8289, 8290, 8291}
	if isInArray(demonoak, itemEx.itemid) then
		local cuts = getCreatureStorage(cid, "OAK_"..itemEx.itemid)
		if cuts < 0 then cuts = 0 end
		-- maximum cuts
		if(cuts >= 11)then
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		-- they hurt the tree
		elseif(math.random(1, 2) == 1)then
			-- add to successfull cuts
			doCreatureSetStorage(cid, "OAK_"..itemEx.itemid, cuts + 1)
			
			--check to see if that was the last needed hit
			local total = 0
			for _, id in ipairs(demonoak) do
				local storage = getCreatureStorage(cid, "OAK_"..id)
				if(storage >= 11)then
					total = total + 1
				end
			end
			if(total == #demonoak)then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Go to the gravestone south of here to gain the Demon Oak's treasure.")
				doCreatureSetStorage(cid, 35712, 1)
			end
			
			--send fancy shit
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			doCreatureSay(cid, "-krakk-", TALKTYPE_MONSTER_SAY, false, 0, toPosition)
			if(math.random(1, 10) > 1) and cuts > 0 then
				doCreatureSay(cid, sounds[math.random(1, #sounds)], TALKTYPE_MONSTER_YELL, false, 0, {x=32716, y=32349, z=7})
				for _, pos in ipairs(summonPos) do
					doCreateMonster(summons[cuts][math.random(1, #summons[cuts])], pos, true)
				end			
			end
		-- tree blocked their hit
		else
			doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if(math.random(1, 12) == 1) and cuts > 0 then
				doCreatureSay(cid, sounds[math.random(1, #sounds)], TALKTYPE_MONSTER_YELL, false, 0, {x=32716, y=32349, z=7})
				for _, pos in ipairs(summonPos) do
					doCreateMonster(summons[cuts][math.random(1, #summons[cuts])], pos, true)
				end			
			end
		end
		return true
	end
	return false
end