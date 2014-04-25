function onStepIn(cid, item, position, fromPosition)
	local thrones = {
		[8016] = {{x=32840,y=32327,z=15}, "Verminor", 20},
		[8017] = {{x=32759,y=32243,z=15}, "Tafariel", 2},
		[8018] = {{x=32909,y=32210,z=15}, "Infernatil", 15},
		[8019] = {{x=32875,y=32267,z=15}, "Apocalypse", 4},
		[8020] = {{x=32785,y=32278,z=15}, "Pumin", 7},
		[8021] = {{x=32745,y=32385,z=15}, "Bazir", 11},
		[8022] = {{x=32839,y=32308,z=15}, "Ashfalor", 17}
	}
	local storage = getCreatureStorage(cid, item.uid)
	if(storage >= 0)then
		if(storage == 0)then
			doCreatureSetStorage(cid, item.uid, storage + 1)
		end
		return doTeleportThing(cid, thrones[item.uid][1]) and doCreatureSay(cid, "Begone!", TALKTYPE_MONSTER_SAY, false, cid) and doSendMagicEffect(getCreaturePosition(cid), 17)
	end
	doCreatureSetStorage(cid, item.uid, storage + 1)
	doSendMagicEffect(getCreaturePosition(cid), thrones[item.uid][3])
	doCreatureSay(cid, string.format("You have touched %s's throne and absorbed some of his spirit.", thrones[item.uid][2]), TALKTYPE_MONSTER_SAY, false, cid)
	return true
end