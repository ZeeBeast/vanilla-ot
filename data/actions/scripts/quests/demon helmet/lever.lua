local function removePortal(pos, item)
	return doRemoveItem(getTileItemById(pos, item).uid)
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		local stonePos = {x=33314, y=31592, z=15}
		local stone = getTileItemById(stonePos, 1355)
		if(stone.uid > 0)then   
			doRemoveItem(stone.uid)
			addEvent(doCreateItem, 120000, 1355, stonePos)
		end
		local createPos = {x=33316, y=31591,z=15}
		local teleport = doCreateTeleport(1387, {x=33328,y=31592,z=14}, createPos)
		addEvent(removePortal, 120000, createPos, 1387)
		doTransformItem(item.uid, item.itemid + 1)		
	elseif(item.itemid == 1946) then
		doTransformItem(item.uid, item.itemid - 1)
	end
	return true
end