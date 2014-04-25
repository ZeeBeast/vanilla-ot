local function timer(cid, pos, level)
	local flamePos, stonePos = {x=pos.x-4, y=pos.y-4, z=7, stackpos=STACKPOS_TOP_MOVABLE_ITEM_OR_CREATURE}, {x=pos.x-5, y=pos.y, z=7}
	local flame, stone = getThingFromPos(flamePos), getTileItemById(stonePos, 1354)
	local creatures = getSpectators(pos, 5, 5) or {}
	local spectatorCount = 0
	local cidAlive = false
	if(creatures)then
		-- adjusted creature count
		spectatorCount = #creatures
		if(isPlayer(cid))then
			local _summons = getCreatureSummons(cid)
			if(_summons)then
				spectatorCount = spectatorCount - # _summons
			end
		end
		-- checking if player is alive
		for _, sid in ipairs(creatures)do
			if(sid == cid)then
				cidAlive = true
				break
			end
		end
	end
	
	-- player is alive and only one in pit (besides his possible summons)
	if(spectatorCount == 1 and cidAlive)then
		-- they shall pass
		if(stone.uid > 0)then
			doRemoveItem(stone.uid)
			doItemSetActionId(doCreateItem(1387, stonePos), level+1)
		end
		
	-- noone is using the pit or player died, we need to clean up
	elseif(not creatures or not cidAlive)then

		-- if there are others in pit, remove
		if(creatures)then
			for _, sid in ipairs(creatures)do
				doRemoveCreature(sid)
			end
		end
		-- if the flame is still there we need to remove it
		if(flame.uid > 0)then
			doRemoveItem(flame.uid)
		end	
		-- if the stone is still there we need to remove it
		if(stone.uid > 0)then
			doRemoveItem(stone.uid)
		end
		-- incase the portal spawned we need to remove it
		local portal = getTileItemById(stonePos, 1387)
		if(portal.uid > 0)then
			doRemoveItem(portal.uid)
		end
		
		-- the timer is no longer needed since noones in the pit
		return true
	
	end
	
	-- player is still in the pit and boss is alive or dead
	-- flame isn't there at all that means they ran out of time :)
	if(flame.itemid ~= 7359 and flame.itemid ~= 7360) then
		doTeleportThing(cid, {x=pos.x, y=pos.y+6, z=7})
		doCreatureSay(cid, "You ran out of time!", TALKTYPE_MONSTER_SAY, false, cid)
		
		--WE WON'T STOP THE TIMER BECAUSE IT NEEDS TO LOOP AGAIN TO CLEAN THE PIT
	end
	
return addEvent(timer, 1000, cid, pos, level)
end

function onStepIn(cid, item, position, fromPosition)
	if(item.actionid == 8008)then
		return doCreatureSetStorage(cid, 10000, -1)
	end
	local pit, str = {
		[8009] = {x=32209,y=31098,z=7}, {[1]="Frostfur",[2]="Avalanche",[3]="Webster" --[[,[4]="TBA"}]] },
		[8010] = {x=32195,y=31098,z=7}, {[1]="Bloodpaw",[2]="Kreebosh the Exile",[3]="Darakan the Executioner" --[[,[4]="TBA"}]] },
		[8011] = {x=32181,y=31098,z=7}, {[1]="Bovinus",[2]="The Dark Dancer",[3]="Norgle Glacierbeard" --[[,[4]="TBA"}]] },
		[8012] = {x=32167,y=31098,z=7}, {[1]="Achad",[2]="The Hag",[3]="The Pit Lord" --[[,[4]="TBA"}]] },
		[8013] = {x=32202,y=31084,z=7}, {[1]="Colerian the Barbarian",[2]="Slim",[3]="Svoren the Mad" --[[,[4]="TBA"}]] },
		[8014] = {x=32188,y=31084,z=7}, {[1]="The Hairy One",[2]="Grimgor Guteater",[3]="The Masked Marauder" --[[,[4]="TBA"}]] },
		[8015] = {x=32174,y=31084,z=7}, {[1]="Axeitus Headbanger",[2]="Drasilla",[3]="Gnorre Chyllson" --[[,[4]="TBA"}]] },
		[8016] = {x=32195,y=31070,z=7}, {[1]="Rocky",[2]="Spirit of Earth",[3]="Fallen Mooh'Tah Master Ghar" --[[,[4]="TBA"}]] },
		[8017] = {x=32181,y=31070,z=7}, {[1]="Cursed Gladiator",[2]="Spirit of Water",[3]="Deathbringer" --[[,[4]="TBA"}]] },
		[8018] = {x=32188,y=31056,z=7}, {[1]="Orcus the Cruel",[2]="Spirit of Fire",[3]="The Obliverator" --[[,[4]="TBA"}]] },
		-- Winning platform
		[8019] = { {x=32222,y=31080,z=6} }
	}, ""

	local destination = pit[item.actionid][1]
	local level = getCreatureStorage(cid, 10000)
	if(item.actionid == 8019)then
		str = "Congratulations brave warrior!"
		doRemoveItem(item.uid)
		addEvent(doCreatureSetStorage, 2500, cid, tonumber(getCreatureStorage(cid, "ARENA_FAILSAFE")), 1)
		addEvent(doCreatureSetStorage, 1500, cid, 10000, -1) -- so they can't do it again
	elseif(getSpectators(destination, 5, 5) == nil)then
		doCreateMonster(pit[item.actionid][2][level], {x=destination.x+3,y=destination.y-3,z=7})
		doCreateItem(1354, {x=destination.x-5,y=destination.y,z=7})
		local flamePos = {x=destination.x-4,y=destination.y-4,z=7}
		doDecayItem(doCreateItem(7359, flamePos))
		doCreatureSay(cid, "You have 10 minutes!", TALKTYPE_MONSTER_SAY, false, cid, flamePos)
		addEvent(timer, 1900, cid, destination, item.actionid)
		if(item.actionid > 8009) then
			doRemoveItem(item.uid)
		end
		if(item.actionid == 8018)then --failsafe and messy fix
			doCreatureSetStorage(cid, "ARENA_FAILSAFE", 10000 + level)
		end
		str = "Fight!"
	else
		destination = fromPosition
		str = "There is still someone in the next pit!"
	end
	doTeleportThing(cid, destination)
	doSendMagicEffect(destination, CONST_ME_TELEPORT)
	doCreatureSay(cid, str, TALKTYPE_MONSTER_SAY, false, cid, destination)
	return true
end