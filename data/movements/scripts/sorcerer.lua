function onStepIn(cid, item, pos)
    if(not isSorcerer(cid))then
		doTeleportThing(cid, {x=32308, y=32267, z=7})
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
	end
	return true
end