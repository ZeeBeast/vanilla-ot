local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	local min = level * 2 + maglevel * 4.6 + 150
	local max = level * 2 + maglevel * 9.6 + 200
	return min, max
end

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var) 
    if isPlayer(cid) == TRUE then 
        if exhaustion.check(cid, 30030) then 
            return FALSE 
        else 
            return doRemoveCondition(cid, CONDITION_PARALYZE), doCombat(cid, combat, var) 
        end 
    else 
        return doRemoveCondition(cid, CONDITION_PARALYZE), doCombat(cid, combat, var) 
    end 
end  