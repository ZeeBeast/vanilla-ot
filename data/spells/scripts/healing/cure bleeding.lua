local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PHYSICAL)

function onCastSpell(cid, var) 
    if isPlayer(cid) == TRUE then 
        if exhaustion.check(cid, 30030) then 
            return FALSE 
        else 
            return doRemoveCondition(cid, CONDITION_PHYSICAL), doCombat(cid, combat, var) 
        end 
    else 
        return doRemoveCondition(cid, CONDITION_PHYSICAL), doCombat(cid, combat, var) 
    end 
end  
