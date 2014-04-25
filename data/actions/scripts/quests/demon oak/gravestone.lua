function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getCreatureStorage(cid, 35712) == 1 then
		return doTeleportThing(cid, {x = 32713, y = 32399, z = 8})
	end
	return false
end