local wave = {"Rift Worm","Rift Brood","Rift Scythe","War Golem"}
local clicks = 0
local exhaust = os.time()

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(clicks > 3 or exhaust > os.time())then return doSendMagicEffect(fromPosition, CONST_ME_POFF) end
	clicks = clicks + 1
	exhaust = os.time() + 32

	local azerusPos = choose({x=32777, y=31166, z=10}, {x=32783, y=31159, z=10}, {x=32789, y=31166, z=10})
	-- Setting the quest up
	if(clicks == 1)then
		local teleporter = getTileItemByType({x=32783,y=31175,z=10}, ITEM_TYPE_TELEPORT)
		if(teleporter.uid > 0)then
			doTransformItem(teleporter.uid, 2180, 1)
		end
		
		local azerus = doCreateMonster("Azerus", azerusPos, true)
		setCreatureMaxHealth(azerus, 999999999)
		doCreatureAddHealth(azerus, 999999999, CONST_ME_TELEPORT, COLOR_NONE)
	-- Updating the quest
	else
		local spectators = getSpectators(fromPosition, 8, 10)
		for _, sid in ipairs(spectators) do
			if(getCreatureName(sid) == "Azerus")then
				doTeleportThing(sid, azerusPos)
				if(clicks == 4)then
					setCreatureMaxHealth(sid, 7500)
					doCreatureAddHealth(sid, -(getCreatureHealth(sid) - 7500), CONST_ME_NONE, COLOR_NONE)
				end
			end
		end
	end
	doSendMagicEffect(azerusPos, CONST_ME_TELEPORT)
	
	-- Spawning the monsters
	local area, amount = getArea(fromPosition, 6, 7), math.random(6, 8)
	local function spawn(name, pos)
		doCreateMonster(name, pos, true)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end
	for i = 1, amount do
		addEvent(spawn, math.random(1000,30000), wave[clicks], area[math.random(1, #area)])
	end
	return true
end