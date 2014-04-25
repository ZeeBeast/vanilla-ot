local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 1.8, 3, 11, 19)

function onGetFormulaValues(cid, level, maglevel)
	local min = level / 2 + maglevel * 1.8 + 20
	local max = level / 2 + maglevel * 3 + 30
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
local area = createCombatArea(AREA_BEAM4, AREADIAGONAL_BEAM4)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end