function onUse(cid, item, fromPosition, itemEx, toPosition)
	local lever = {
		[5004] = {x=32831,y=32333,z=11},
		[5005] = {x=32833,y=32333,z=11},
		[5006] = {x=32835,y=32333,z=11},
		[5007] = {x=32837,y=32333,z=11}
	}
	if(item.itemid == 1945)then
		local query = getTileItemById(lever[item.uid], 6289, 1).uid
		doRemoveItem(query)
		doTransformItem(item.uid, item.itemid + 1)
	else
		doTransformItem(item.uid, item.itemid - 1)
	end
return true
end