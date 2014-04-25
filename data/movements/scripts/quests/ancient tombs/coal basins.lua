local config = {
	[8063] = {{x=33073, y=32589, z=13}, {x=33080,y=32588,z=13}},
	[8064] = {x=33133,y=32569,z=8},
	[8065] = {{x=33098,y=32816,z=13}, {x=33093,y=32824,z=13}},
	[8066] = {x=33029,y=32868,z=8},
	[8067] = {{x=33135,y=32682,z=12}, {x=33130,y=32683,z=12}},
	[8068] = {x=33133,y=32642,z=8},
	[8069] = {{x=33161,y=32831,z=10}, {x=33156,y=32832,z=10}},
	[8070] = {x=33157,y=32835,z=7},
	[8071] = {{x=33233,y=32692,z=13}, {x=33234,y=32687,z=13}},
	[8072] = {x=33231,y=32705,z=8},
	[8073] = {{x=33240,y=32855,z=13}, {x=33246,y=32850,z=13}},
	[8074] = {x=33255,y=32836,z=8},
	[8075] = {{x=33276,y=32552,z=14}, {x=33271,y=32553,z=14}},
	[8076] = {x=33206,y=32592,z=8},
	[8077] = {{x=33293,y=32741,z=13}, {x=33299,y=32742,z=13}},
	[8078] = {x=33280,y=32744,z=8}
}
function onStepIn(cid, item, pos, fromPosition)
	if(config[item.uid]) then
		if(type(config[item.uid]) == "table" and #config[item.uid] == 2) then
			local coin = getTileItemById(config[item.uid][1], 2159).uid
			if(coin > 0) then
				doRemoveItem(coin, 1)
				doSendMagicEffect(config[item.uid][1], CONST_ME_HITBYFIRE)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
				doTeleportThing(cid, config[item.uid][2], FALSE)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			end
		else
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, config[item.uid], FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	end
	return TRUE
end
