local places = {
	[3028] = {to={x=33271,y=31797,z=8}, from={x=33271,y=31797,z=6}},
	[3029] = {to={x=33271,y=31797,z=6}, from={x=33271,y=31797,z=11}}
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