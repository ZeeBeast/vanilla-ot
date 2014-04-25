function onAddItem(moveitem, tileitem, position, cid)
	local destination = {x=32791,y=32334,z=9}
	local player = getTopCreature(destination)
	if (player.uid) and (moveitem.itemid == 2016) then --pool of blood lands on the gravestone
		destination.z = destination.z + 1
		doTeleportThing(player.uid, destination)
	end
	return true
end
