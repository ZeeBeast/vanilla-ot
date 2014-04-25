function onUse(cid, item, fromPosition, itemEx, toPosition)
	local gates = {
		-- Arena and Zoo Quarter
		[3001] = {{x = 32729, y = 31201, z = 5},"Entering the Arena and Zoo Quarter!"},
		[3002] = {{x = 32734, y = 31201, z = 5},"Entering Yalahar Inner City!"},
		-- Alchemist Quarter
		[3003] = {{x = 32745, y = 31161, z = 5},"Entering the Alchemist Quarter!"},
		[3004] = {{x = 32745, y = 31164, z = 5},"Entering Yalahar Inner City!"},
		-- Cemetery Quarter
		[3005] = {{x = 32777, y = 31141, z = 5},"Entering the Cemetery Quarter!"},
		[3006] = {{x = 32777, y = 31145, z = 5},"Entering Yalahar Inner City!"},
		-- Sunken Quarter
		[3007] = {{x = 32874, y = 31201, z = 5},"Entering the Sunken Quarter!"},
		[3008] = {{x = 32869, y = 31201, z = 5},"Entering Yalahar Inner City!"},
		-- Factory Quarter
		[3009] = {{x = 32855, y = 31251, z = 5},"Entering the Factory Quarter!"},
		[3010] = {{x = 32855, y = 31248, z = 5},"Entering Yalahar Inner City!"},
		-- Trade Quarter
		[3011] = {{x = 32834, y = 31269, z = 5},"Entering the Trade Quarter!"},
		[3012] = {{x = 32834, y = 31266, z = 5},"Entering Yalahar Inner City!"}
	}
return doTeleportThing(cid, gates[item.uid][1]) and doSendMagicEffect(gates[item.uid][1], CONST_ME_TELEPORT) and doCreatureSay(cid, gates[item.uid][2], TALKTYPE_MONSTER_SAY, false, cid)
end
