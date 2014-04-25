function onStepIn(cid, item, position, fromPosition)
	local arena = {
		[8034] = {item=5807, level="greenhorn"},
		[8035] = {item=5806, level="scrapper"},
		[8036] = {item=5805, level="warlord"}
		--[8037] = {item=5785, level="TBA"}
	}
	if(getCreatureStorage(cid, item.uid) ~= 1)then
		local trophy = doCreateItemEx(arena[item.uid].item)
		doItemSetAttribute(trophy, "description", string.format("It is given to the courageous victor of the barbarian arena %s difficulty.\nAwarded to %s.", arena[item.uid].level, getCreatureName(cid))) 
		if(doTileAddItemEx(getCreatureLookPosition(cid), trophy))then
			doCreatureSetStorage(cid, item.uid, 1)
		end
	end
	doTransformItem(item.uid, item.itemid - 1) 
	return true
end 

function onStepOut(cid, item, pos) 
	doTransformItem(item.uid, item.itemid + 1) 
	return true 
end