local tasks = {
	['demon'] = {storage = 14006, amount = 6666},
	['crocodile'] = {storage = 14007, amount = 300},
	['tarantula'] = {storage = 14008, amount = 300},
	['carniphila'] = {storage = 14009, amount = 150},
	['stone golem'] = {storage = 14010, amount = 200},
	['mammoth'] = {storage = 14011, amount = 300},
	['ice golem'] = {storage = 14012, amount = 300},
	['quara constrictor scout'] = {storage = 14013, amount = 300},
	['quara hydromancer scout'] = {storage = 14013, amount = 300},
	['quara mantassin scout'] = {storage = 14013, amount = 300},
	['quara pincher scout'] = {storage = 14013, amount = 300},
	['quara predator scout'] = {storage = 14013, amount = 300},
	['quara constrictor'] = {storage = 14014, amount = 300},
	['quara hydromancer'] = {storage = 14014, amount = 300},
	['quara mantassin'] = {storage = 14014, amount = 300},
	['quara pincher'] = {storage = 14014, amount = 300},
	['quara predator'] = {storage = 14014, amount = 300},
	['water elemental'] = {storage = 14015, amount = 70},
	['massive water elemental'] = {storage = 14015, amount = 70},
	['earth elemental'] = {storage = 14016, amount = 70},
	['massive earth elemental'] = {storage = 14016, amount = 70},
	['energy elemental'] = {storage = 14017, amount = 70},
	['massive energy elemental'] = {storage = 14017, amount = 70},
	['fire elemental'] = {storage = 14018, amount = 70},
	['massive fire elemental'] = {storage = 14018, amount = 70},
	['mutated rat'] = {storage = 14019, amount = 200},
	['giant spider'] = {storage = 14020, amount = 500},
	['hydra'] = {storage = 14021, amount = 2000},
	['sea serpent'] = {storage = 14001, amount = 2000},
	['behemoth'] = {storage = 14022, amount = 2000},
	['serpent spawn'] = {storage = 14002, amount = 1500},
	
	['pirate buccaneer'] = {storage = 14005, amount = 3000},
	['pirate corsair'] = {storage = 14005, amount = 3000},
	['pirate cutthroat'] = {storage = 14005, amount = 3000},
	['pirate ghost'] = {storage = 14005, amount = 3000},
	['pirate marauder'] = {storage = 14005, amount = 3000},
	['pirate skeleton'] = {storage = 14005, amount = 3000},

	['minotaur'] = {storage = 14004, amount = 5000},
	['minotaur archer'] = {storage = 14004, amount = 5000},
	['minotaur guard'] = {storage = 14004, amount = 5000},
	['minotaur mage'] = {storage = 14004, amount = 5000},

	['necromancer'] = {storage = 14003, amount = 4000},
	['priestess'] = {storage = 14003, amount = 4000}
}

function onKill(cid, target, damage, flags)
	if(not isMonster(target) or isSummon(target))then
		local monster = tasks[getCreatureName(target):lower()]
		if(monster)then
			if(getCreatureStorage(cid, 14500) == monster.storage)then
				local kills = math.max(tonumber(getCreatureStorage(cid, monster.storage)), 0) + 1
				if(kills <= monster.amount)then
					doCreatureSetStorage(cid, monster.storage, kills)
				end
			end
		end
	end
	return true
end

