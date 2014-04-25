function onUse(cid, item, fromPosition, itemEx, toPosition)
	local STONE_POSITION = {x=32852,y=32319,z=9}
	if(item.itemid == 1945)then
		local query = getTileItemById(STONE_POSITION, 1304, 1).uid
		if(query)then
			doRemoveItem(query)
		end
		doTransformItem(item.uid, item.itemid + 1)
	else
		doCreateItem(1304, 1, STONE_POSITION)
		doTransformItem(item.uid, item.itemid - 1)
	end
return true
end