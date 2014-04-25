function onStepIn(cid, item, position, fromPosition)
	local storage = getCreatureStorage(cid, item.uid - 10)
	if(storage < 1)then
		doCreatureSay(cid, "You have not broken this seal!", TALKTYPE_MONSTER_SAY, false, cid)
		doTeleportThing(cid, fromPosition)
	end
	return true
end