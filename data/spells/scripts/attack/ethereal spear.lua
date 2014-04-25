local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)


function onGetPlayerMinMaxValues(cid, level, skill, attack, factor)
	skill = getPlayerSkill(cid, SKILL_DISTANCE)
	local min = skill * 0.7 + level / 2 + 10
	local max = skill * 1.0  + level / 2 + 20
	return -min, -max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetPlayerMinMaxValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end