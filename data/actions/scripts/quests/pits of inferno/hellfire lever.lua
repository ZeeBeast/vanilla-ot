function onUse(cid, item, fromPosition, itemEx, toPosition)
	local STONE_POSITION = {x=32849,y=32282,z=10}
	if(item.itemid == 1945)then
		local query = getTileItemById(STONE_POSITION, 1304, 1).uid
		doRemoveItem(query)
		addEvent(doCreateItem, 60 * 1000, 1304, 1, STONE_POSITION)
		doTransformItem(item.uid, item.itemid + 1)
	else
		doTransformItem(item.uid, item.itemid - 1)
	end
	return true
end