function onStepIn(cid, item, position, fromPosition)
	position.z = position.z + 1
	doTeleportThing(cid, position)
	return true
end
