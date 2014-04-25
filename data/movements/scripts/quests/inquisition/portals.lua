function onStepIn(cid, item, position, fromPosition)
	local portal = {
		[8025] = { {x=33168,y=31712,z=14}, "Escaping back to the Retreat" },
		[8026] = { {x=33158,y=31728,z=11}, "Entering Ushuriel's Ward" },
		[8027] = { {x=33069,y=31782,z=13}, "Entering Crystal Caves" },
		[8028] = { {x=33169,y=31755,z=13}, "Entering Sunken Cave" },
		[8029] = { {x=33124,y=31692,z=11}, "Entering Zurugosh's Ward" },
		[8030] = { {x=33371,y=31614,z=14}, "Entering Blood Halls" },
		[8031] = { {x=33356,y=31589,z=11}, "Entering The Foundry" },
		[8032] = { {x=33197,y=31767,z=11}, "Entering Madareth's Ward" },
		[8033] = { {x=33153,y=31781,z=12}, "Entering the Vats" },
		[8034] = { {x=33250,y=31632,z=13}, "Entering the Battlefield" },
		[8035] = { {x=33231,y=31734,z=11}, "Entering Latrivan & Golgordan's Ward" },
		[8036] = { {x=33038,y=31753,z=15}, "Entering the Arcanum" },
		[8037] = { {x=33094,y=31575,z=11}, "Entering South Wells" },
		[8038] = { {x=33197,y=31703,z=11}, "Entering Annihilon's Ward" },
		[8039] = { {x=33200,y=31686,z=12}, "Entering the Hive" },
		[8040] = { {x=33105,y=31733,z=11}, "Entering Hellgoraks's Ward" },
		[8041] = { {x=33110,y=31682,z=12}, "Entering the Shadow Nexus. Abandon all Hope" },
		[18027] = { {x=33069,y=31782,z=13}, "Entering Crystal Caves" },
		[18030] = { {x=33371,y=31614,z=14}, "Entering Blood Halls" },
		[18033] = { {x=33153,y=31781,z=12}, "Entering the Vats" },
		[18036] = { {x=33038,y=31753,z=15}, "Entering the Arcanum" },
		[18039] = { {x=33200,y=31686,z=12}, "Entering the Hive" },		
	}

	local destination, text = portal[item.actionid][1], portal[item.actionid][2]
	if(isInArray({8027, 8030, 8033, 8036, 8039, 8041}, item.actionid))then
		if(getCreatureStorage(cid, item.actionid))then
			doCreatureSetStorage(cid, item.actionid + 10000, 1)
		end
	end
	if(isInArray({18027, 18030, 18033, 18036, 18039, 18041}, item.actionid)) and (getCreatureStorage(cid, item.actionid)) ~= 1 then
	doTeleportThing(cid, fromPosition)
	doSendMagicEffect(getCreaturePosition(cid),10)
	doCreatureSay(cid, 'You don\'t have enough energy to enter this portal', TALKTYPE_ORANGE_1)
	else
	doTeleportThing(cid, destination)
	doSendMagicEffect(destination, 10)
	doCreatureSay(cid, text, TALKTYPE_MONSTER_SAY, false, cid)
	return true
	end
end