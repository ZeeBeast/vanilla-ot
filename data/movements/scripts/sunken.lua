function onStepIn(cid, item, pos)
    if (item.actionid == 32560) then
		doTeleportThing(cid, {x=32949, y=31181, z=9})
		doSendMagicEffect(getCreaturePosition(cid), 30)
    end
    return true
end  