function onStatsChange(cid, attacker, type, combat, value)
	if(type == STATSCHANGE_HEALTHLOSS)then
		if(getCreatureHealth(cid) <= value)then -- Pythius is going to die
			if isPlayer(attacker) then
				local destination = {x=32577, y=31402, z=15}
				doCreatureSay(cid, "NICE FIGHTING LITTLE WORM, YOUR VICTORY SHALL BE REWARDED!", TALKTYPE_MONSTER_YELL)
				doTeleportThing(attacker, destination)
				doSendMagicEffect(destination, CONST_ME_TELEPORT)
			end
			-- You have to use addEvent to effect stats (mana/hp) in onStatsChange or you get a buffer overflow
			addEvent(doCreatureAddHealth, 500, cid, getCreatureMaxHealth(cid))
			return false
		end
	end
	return true
end