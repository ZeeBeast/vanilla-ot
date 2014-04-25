function onStepIn(cid, item, position, fromPosition)
	local portal = {
		[8038] = { {x=33168,y=31712,z=14}, "The Snapper"},
		[8039] = { {x=33168,y=31712,z=14}, "Hide"},
		[8040] = { {x=33168,y=31712,z=14}, "The Bloodtusk"},
		[8041] = { {x=33168,y=31712,z=14}, "Shardhead"},
		[8042] = { {x=33168,y=31712,z=14}, "Thul"},
		[8043] = { {x=33168,y=31712,z=14}, "Esmeralda"},
		[8044] = { {x=33168,y=31712,z=14}, "The Old Widow"},
		[8045] = { {x=33168,y=31712,z=14}, "The Many"},
		[8046] = { {x=33168,y=31712,z=14}, "Leviathan"},
		[8047] = { {x=33168,y=31712,z=14}, "Stonecracker"},
		[8048] = { {x=33168,y=31712,z=14}, "The Noxious Spawn"},
		[8049] = { {x=31984,y=32897,z=0}, choose("Brutus Bloodbeard", "Deadeye Devious", "Lethal Lissy", "Ron the Ripper")},
		[8050] = { {x=33168,y=31712,z=14}, "The Horned Fox"},
		[8051] = { {x=33168,y=31712,z=14}, "Necropharus"},
		[8052] = { {x=32854,y=32659,z=8}, "Tiquandas Revenge"},
		[8053] = { {x=33168,y=31712,z=14}, "Demodras"}
	}
	
	local str = ""
	if(getCreatureStorage(cid, item.uid ~= 1) and (getCreatureStorage(cid, "task" == 1)))then
		doCreateMonster(name, portal[item.actionid][1])
		doCreatureSetStorage(cid, item.uid, 1)
		str = "This is your only chance you have to kill this boss, make it count!"
	elseif(getCreatureStorage(cid, item.uid == 1))then
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
		str = "You already had a chance to kill " .. portal[item.actionid][2] .. "!"
	else
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
		str = "You are not ready for this boss!"
	end
return doCreatureSay(cid, str, TALKTYPE_MONSTER_SAY, false, cid)
end