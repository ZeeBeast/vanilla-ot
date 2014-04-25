function onStepIn(cid, item, pos)
	return doTeleportThing(cid, (isDruid(cid)) and {x=32851, y=32339, z=6} or {x=32836, y=32294, z=7})
end