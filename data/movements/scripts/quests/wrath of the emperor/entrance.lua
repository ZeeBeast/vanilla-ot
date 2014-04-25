local center = {x = 33243, y = 31211, z = 10}
local dest = {x = 33059, y = 31122, z = 14}

function onStepIn(cid, item, position, fromPosition)
	if(item.actionid == 8042) then		
		for _, tilePos in ipairs(getArea(center, 13, 1))do
			local tile = getThingFromPos(tilePos, false)
			if(tile.uid > 0) then
				doSetItemActionId(tile.uid, 8043)
			end			
		end
	end
	
	if(item.actionid == 8043) then
		doTeleportThing(cid, dest)
	end
end