local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

function onGetPlayerMinMaxValues(cid, level, skill, attack, factor)
	local min = skill * attack / (100/6) + level * 1.75 + 25
	local max = skill * attack / (100/13)  + level * 1.75 + 50
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetPlayerMinMaxValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
