local STAIRS_POSITION = {x=32854,y=32321,z=11}

function onStepIn(cid, item, position, fromPosition)
	doCreateItem(1386, STAIRS_POSITION) -- creates ladder when pressed down
	return true
end

function onStepOut(cid, item, position, fromPosition)
	local ladder = getTileItemById(STAIRS_POSITION, 1386, 1).uid
	if(ladder)then
		doRemoveItem(ladder) -- removes ladder when unpressed
	end
	return true
end