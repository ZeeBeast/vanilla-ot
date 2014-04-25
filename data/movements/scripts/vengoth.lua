function onStepIn(cid, item, pos)
	if (item.actionid == 49331) then
		doTeleportThing(cid,{x=32943, y=31553, z=1})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49332) then
		doTeleportThing(cid,{x=32951, y=31553, z=3})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49333) then
		doTeleportThing(cid,{x=32938, y=31573, z=0})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49334) then
		doTeleportThing(cid,{x=32940, y=31557, z=1})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49335) then
		doTeleportThing(cid,{x=32950, y=31575, z=1})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49336) then
		doTeleportThing(cid,{x=32940, y=31577, z=0})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49337) then
		doTeleportThing(cid,{x=32961, y=31559, z=1})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49338) then
		doTeleportThing(cid,{x=32951, y=31568, z=1})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49339) then
		doTeleportThing(cid,{x=32959, y=31540, z=4})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49340) then
		doTeleportThing(cid,{x=32961, y=31552, z=1})
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif (item.actionid == 49341) then
		doTeleportThing(cid, {x=32953, y=31483, z=6})
		doSendMagicEffect(getCreaturePosition(cid),11)
	elseif (item.actionid == 49342) then
		doTeleportThing(cid,{x=32953, y=31488, z=6})
		doSendMagicEffect(getCreaturePosition(cid),11)
	end
	return true
end 

