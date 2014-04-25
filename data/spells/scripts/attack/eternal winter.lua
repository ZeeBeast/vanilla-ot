local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 5.5, 11, 25, 50)

function onGetFormulaValues(cid, level, maglevel)
	local min = level * 1.6 + maglevel * 5.5 + 50
	local max = level * 1.6 + maglevel * 11 + 75
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
local area = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end