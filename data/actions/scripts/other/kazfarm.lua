local places = {
	[3026] = {to={x=32636,y=31881,z=2}, from={x=32636,y=31881,z=7}},
	[3027] = {to={x=32636,y=31881,z=7}, from={x=32636,y=31881,z=2}}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1946)then
		return doTransformItem(item.uid, item.itemid-1)
	end
	local dest = places[item.uid]
	if(dest)then
		doTeleportThing(getTopCreature(dest.from).uid, dest.to)
	end
	return doTransformItem(item.uid, item.itemid+1)
end