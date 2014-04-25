function onStepIn(cid, item, pos)
	local positions = {
		[8055] = {x=33077, y=31219, z=8},
		[8056] = {x=33212, y=31067, z=9},
		[8057] = {x=33075, y=31119, z=7},
		[8058] = {x=33084, y=31214, z=8},
		[8059] = {x=33137, y=31249, z=6},
		[8060] = {x=33216, y=31068, z=9},
		[8061] = {x=33093, y=31122, z=12}
	}
	local portal = positions[item.actionid]	
	if(portal)then
		return doTeleportThing(cid, portal) and doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)
	end
	return true
end