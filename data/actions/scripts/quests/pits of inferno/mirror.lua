function onUse(cid, item, fromPosition, itemEx, toPosition)	
	local destination = {x=32740,y=32392,z=13}
	
	if(item.itemid == 6434)then -- moving the curtain
		fromPosition.y = fromPosition.y + 1
		if(doRemoveItem(item.uid))then
			doCreateItem(6434, fromPosition)
		end
	else -- using the mirror
		fromPosition.y = fromPosition.y + 1
		local curtain = getTileItemById(fromPosition, 6434, 1)
		fromPosition.y = fromPosition.y - 1
		if(doRemoveItem(curtain.uid))then
			doItemSetActionId(doCreateItem(6434, fromPosition), 5001)
		end
		doTeleportThing(cid, destination)
		doSendMagicEffect(destination, CONST_ME_TELEPORT)
		doCreatureSay(cid, "Beauty has to be rewarded! Muahahaha!", TALKTYPE_MONSTER_SAY, false, cid)
	end
	return true
end