local places = {
	[3023] = {to={x=32991,y=31539,z=4}, from={x=32991,y=31539,z=1}},
	[3022] = {to={x=32991,y=31539,z=1}, from={x=32991,y=31539,z=4}},
	[3021] = {to={x=33061,y=31527,z=10}, from={x=32993,y=31547,z=4}},
	[3020] = {to={x=32993,y=31547,z=4}, from={x=33061,y=31527,z=10}}
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