function onStepIn(cid, item, pos)
	if (item.actionid == 14429) then
		doTeleportThing(cid, {x=31914, y=32713, z=12})
		doSendMagicEffect(getCreaturePosition(cid), 53)
	elseif (item.actionid == 14437) then
		doTeleportThing(cid, {x=32968, y=32626, z=5})
	end
    return true
end  