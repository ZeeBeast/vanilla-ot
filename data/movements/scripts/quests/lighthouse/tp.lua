function onStepIn(cid, item, pos)
local back = {x=32232, y=32276, z=9}
	doTeleportThing(cid,back)
    doSendMagicEffect(getCreaturePosition(cid),14)
end  