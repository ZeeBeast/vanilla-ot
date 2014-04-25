function onStepIn(cid, item, pos)
	local dest = {x=33147, y=32864, z=7}
	if(item.uid == 8057)then
		local fire = getTileItemById({x=33145, y=32862, z=7}, 2562).uid
		dest = (fire > 0) and {x=33151, y=32864, z=7} or {x=33145, y=32863, z=7}
	end
	return doTeleportThing(cid, dest) and doSendMagicEffect(dest, CONST_ME_MAGIC_GREEN)
end  