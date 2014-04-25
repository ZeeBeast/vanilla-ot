function onStepIn(cid, item, position, fromPosition)
	if(getCreatureStorage(cid, 35712) == 1)then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already completed this quest.")
		return doTeleportThing(cid, fromPosition)
	end
	local centerPos = {x=32716,y=32351,z=7}
	local spectators = getSpectators(centerPos, 9, 6)
	if(spectators)then
		for _, sid in ipairs(spectators) do
			if(isPlayer(sid))then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is someone else is near the demon oak.")
				return doTeleportThing(cid, fromPosition)
			end
		end
	end
	doTeleportThing(cid, getPositionByDirection(position, SOUTH, 2))
	doCreatureSay(cid, "I AWAITED YOU! COME HERE AND GET YOUR REWARD!", TALKTYPE_MONSTER_YELL, false, cid, centerPos)
	doItemSetActionId(doCreateTeleport(1387, {x=32713, y=32339, z=7}, {x=32714, y=32345, z=7}), 8007)
	return true
end
 
function onStepOut(cid, item, position, fromPosition)
	for _, id in ipairs({8288, 8289, 8290, 8291}) do
		doCreatureSetStorage(cid, "OAK_"..id, -1)
	end
	doRemoveItem(item.uid)
	return true
end