function onUse(cid, item, fromPosition, itemEx, toPosition)
    local wall = {
		{x=33151,y=32866,z=8, stackpos=1}
    }
	if(item.aid == 100)then
		for i = 1, #wall do
			doRemoveItem(getThingfromPos(wall[i]).uid)
		end
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		doItemSetAttribute(item.uid, "aid", 0)
	else
		doSendMagicEffect(toPosition, CONST_ME_POFF)	
	end
return true
end