local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

local area = createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6)
setCombatArea(combat, area)

function onGetPlayerMinMaxValues(cid, level, skill, attack, factor)
	local min = skill * attack / 25 + level * 1.25 + 40
	local max = skill * attack / (100/8)  + level * 1.25 + 60
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetPlayerMinMaxValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
