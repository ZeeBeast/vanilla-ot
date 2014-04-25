function onUse(cid, item, fromPosition, itemEx, toPosition)
    local stones = {
		{x=33295,y=31677,z=15, stackpos=1},
		{x=33296,y=31677,z=15, stackpos=1},
		{x=33297,y=31677,z=15, stackpos=1},
		{x=33298,y=31677,z=15, stackpos=1},
		{x=33299,y=31677,z=15, stackpos=1}
    }
	if(item.itemid == 1945)then
		for i = 1, #stones do
			doRemoveItem(getThingfromPos(stones[i]).uid)
		end
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doTransformItem(item.uid, item.itemid + 1)
	end
return true
end