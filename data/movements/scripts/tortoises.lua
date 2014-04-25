function onStepIn(cid, item, pos)
	local pos = {
		[51191] = {x=32359, y=32901, z=7},
		[51192] = {x=32340, y=32538, z=7},
		[51193] = {x=32472, y=32869, z=7},
		[51194] = {x=32415, y=32916, z=7},
		[51195] = {x=32490, y=32979, z=7},
		[51196] = {x=32440, y=32971, z=7},
		[51197] = {x=32523, y=32923, z=7},
		[51198] = {x=32527, y=32951, z=7}
	}
	return doTeleportThing(cid, pos[item.actionid]) and doSendMagicEffect(pos[item.actionid], CONST_ME_TELEPORT)
end