function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid))then
		if(item.uid == 8002)then -- player is going back
			doTeleportThing(cid, {x=32791,y=32331,z=10})
		elseif(getPlayerItemCount(cid, 1970) > 0)then -- player has the holy tible
			doTeleportThing(cid, {x=32791,y=32327,z=10})
		end
	end
	return true
end