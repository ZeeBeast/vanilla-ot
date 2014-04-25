function onStepIn(cid, item, position, fromPosition)
	local destination = {
		-- UID, DESTINATION
		[8023] = {x=32754,y=32365,z=15}, -- 10k trapdoor
		[8024] = {x=32745,y=32392,z=14}, -- treasure teleport south
		[8025] = {x=32827,y=32241,z=12}, -- knight statue
		[8055] = {x=32745,y=32383,z=14}, -- treasure teleport north	
	}
	doTeleportThing(cid, destination[item.uid])	
	doSendMagicEffect(destination[item.uid], CONST_ME_TELEPORT)
	return true
end
