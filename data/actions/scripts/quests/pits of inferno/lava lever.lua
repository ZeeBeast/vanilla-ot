function onUse(cid, item, fromPosition, itemEx, toPosition)
	local tile = {
		{x=32911,y=32209,z=15},
		{x=32912,y=32209,z=15},
		{x=32911,y=32210,z=15},
		{x=32912,y=32210,z=15}
	}
	if(item.itemid == 1945)then
		for i = 1, #tile do
			doCreateItem(407, tile[i])
		end
		doTransformItem(item.uid, item.itemid + 1)
	else
		for i = 1, #tile do
			doCreateItem(598, tile[i])
		end
		doTransformItem(item.uid, item.itemid - 1)
	end
return true
end