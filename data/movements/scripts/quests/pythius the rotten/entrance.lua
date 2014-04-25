function onStepIn(cid, item, position, fromPosition)
	if(getCreatureStorage(cid, 20116) > 0)then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already completed this quest.")
		return doTeleportThing(cid, fromPosition)
	end
	for _, sid in ipairs(getSpectators({x=32566,y=31405,z=15}, 6, 7)) do
		if(isPlayer(sid))then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is someone else in the quest room.")
			return doTeleportThing(cid, fromPosition)
		end
	end

	local destination = {x=32560,y=31404,z=15}
	local tiles = {{x=32550,y=31373,z=15}, {x=32550,y=31374,z=15}, {x=32550,y=31375,z=15}, {x=32550,y=31376,z=15}, {x=32550,y=31377,z=15}, {x=32550,y=31378,z=15}, {x=32550,y=31379,z=15}, {x=32551,y=31373,z=15}, {x=32551,y=31374,z=15}, {x=32551,y=31375,z=15}, {x=32551,y=31376,z=15}, {x=32551,y=31377,z=15}, {x=32551,y=31378,z=15}, {x=32551,y=31379,z=15}}
	doRemoveItem(item.uid)
	doTeleportThing(cid, destination)
	doSendMagicEffect(destination, CONST_ME_TELEPORT)
	destination.x = destination.x + 9
	doCreatureSay(cid, "WHO IS SNEAKING AROUND BEHIND MY TREASURE?", TALKTYPE_MONSTER_YELL, false, cid, destination)
	for i = 1, #tiles do
		if i > 8 and i < 15 then
			doRelocate(tiles[i], {x=tiles[i].x+1, y=i == 14 and tiles[i].y-1 or tiles[i].y, z=tiles[i].z})
		end
		doCreateItem(i == 14 and 1509 or 598, 1, tiles[i])
	end
	doCreateItem(1304, 1, {x=32551,y=31379,z=15})
	doCreateItem(9341, 1, {x=32551,y=31379,z=15})
	return true
end

function onAddItem(moveitem, tileitem, pos)
	doSendMagicEffect(pos, CONST_ME_TELEPORT)
	doRelocate(pos, {x=32560, y=31404,z=15})
	doSendMagicEffect({x=32560, y=31404,z=15}, CONST_ME_TELEPORT)
	return TRUE
end