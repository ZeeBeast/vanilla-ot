function onUse(cid, item, fromPosition, itemEx, toPosition)
	local function transformWall(pos, action)
		return (action == 1) and doRemoveItem(getTileItemsByType(pos, ITEM_TYPE_MAGICFIELD).uid) or doCreateItem(1498, 1, pos)
	end
    local mwalls = {
		{x=32568,y=32078,z=12, stackpos=1},
		{x=32569,y=32078,z=12, stackpos=1}
    }
	local action = (item.itemid == 1946) and -1 or 1
	for i = 1, #mwalls do
		transformWall(mwalls[i], action)
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doTransformItem(item.uid, item.itemid + action)
	end
	return true
end