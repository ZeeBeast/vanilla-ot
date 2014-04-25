local function punish(cid)
	local damage, base = getCreatureStorage(cid, "POI_VOC"), 400
	if(damage < base)then
		doCreatureSetStorage(cid, "POI_VOC", base)
		damage = base
	end
	if(damage >= getCreatureMaxHealth(cid))then
		doCreatureSetStorage(cid, "POI_VOC", -1)
	else
		doCreatureSetStorage(cid, "POI_VOC", damage * 2)
	end
	doCreatureSay(cid, "You have chosen the wrong path! Turn back!", TALKTYPE_MONSTER_SAY, false, cid)
	doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -damage, -damage, CONST_ME_NONE)
end

function onStepIn(cid, item, position, fromPosition)
	if(item.actionid == 8001) and (not isSorcerer(cid))then
		punish(cid)
	elseif(item.actionid == 8002) and (not isDruid(cid))then
		punish(cid)
	elseif(item.actionid == 8003) and (not isPaladin(cid))then
		punish(cid)
	elseif(item.actionid == 8004) and (not isKnight(cid))then
		punish(cid)
	end
	return true
end


