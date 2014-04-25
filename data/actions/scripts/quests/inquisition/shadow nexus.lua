function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 8753)then -- undamaged state
		doCreatureSay(cid, getCreatureName(cid) .. " damaged the shadow nexus! You can't damage it while it's burning!", TALKTYPE_MONSTER_SAY, false, 0, toPosition)
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
		doDecayItem(itemEx.uid)
	elseif(itemEx.itemid == 8755)then -- small fire
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
		doDecayItem(itemEx.uid)
	elseif(itemEx.itemid == 8757)then -- medium fire
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
		doDecayItem(itemEx.uid)
	elseif(itemEx.itemid == 8759)then -- large fire
		doCreatureSetStorage(cid, 14916, 1)
		doTransformItem(item.uid, 2006)
		doCreatureSay(cid, getCreatureName(cid) .. " destroyed the shadow nexus! In 20 seconds it will return to its original state.", TALKTYPE_MONSTER_SAY, false, 0, toPosition)	
		doDecayItem(itemEx.uid)
	end
return true
end
