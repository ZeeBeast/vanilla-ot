function onUse(cid, item, fromPosition, itemEx, toPosition)
	local data = {
		[5011] = {pos = {x = 33055, y = 31087, z = 15}, name = "Fury of the Emperor",  storage = 15001},
		[5012] = {pos = {x = 33086, y = 31085, z = 15}, name = "Wrath of the Emperor", storage = 15002},
		[5013] = {pos = {x = 33104, y = 31113, z = 15}, name = "Scorn of the Emperor", storage = 15003},
		[5014] = {pos = {x = 33054, y = 31119, z = 15}, name = "Spite of the Emperor", storage = 15004}
	}		

	local spawn = data[item.uid]
	
		local boss1 = getCreatureStorage(cid, 15001)
		local boss2 = getCreatureStorage(cid, 15002)
		local boss3 = getCreatureStorage(cid, 15003)
		local boss4 = getCreatureStorage(cid, 15004)
		local finalboss = {x = 33067, y = 31149, z = 15}
		local tploc = {x =33074, y =31108, z = 14}	
		
	if(spawn)then
		if(not getCreatureByName(spawn.name)) then
			doCreatureSay(cid, string.format("%s has been spawned!", spawn.name), TALKTYPE_MONSTER_SAY, false)
			doCreateMonster(spawn.name, spawn.pos, true)
			doCreatureSetStorage(cid, spawn.storage, 1)
				if(boss1 == 1 and boss2 == 1 and boss3 == 1 and boss4 == 1) then
					doCreateTeleport(1387, finalboss, tploc)
					doCreatureSay(cid, "A portal has been spawned in the middle of the room above you. Hurry before this portal closes!", TALKTYPE_MONSTER_SAY)
				end				
		else		    
			doCreatureSay(cid, string.format("%s is still alive, he must be killed before spawning another one!", spawn.name), TALKTYPE_MONSTER_SAY, false)
		end
	end
	
	return true
end