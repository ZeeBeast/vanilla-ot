function onStepIn(cid, item, pos)
	local positions = {
		['EnterDemons'] = {x=32861, y=31061, z=9},
		['ExitDemons'] = {x=32856, y=31055, z=9},
		['EnterDemons2'] = {x=32889, y=31044, z=9},
		['ExitDemons2'] = {x=32894, y=31046, z=9}
	}
	if item.actionid == 1392 then
		doTeleportThing(cid, positions.EnterDemons)
		doSendMagicEffect(getCreaturePosition(cid), 10)	
	elseif item.actionid == 1391 then
		doTeleportThing(cid, positions.ExitDemons)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	elseif item.actionid == 1393 then
		doTeleportThing(cid, positions.EnterDemons2)
		doSendMagicEffect(getCreaturePosition(cid), 10)	
	elseif item.actionid == 1394 then
		doTeleportThing(cid, positions.ExitDemons2)
		doSendMagicEffect(getCreaturePosition(cid), 10)
	end
	return true
end