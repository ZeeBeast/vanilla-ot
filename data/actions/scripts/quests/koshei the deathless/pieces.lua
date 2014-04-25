function onUse(cid, item, fromPosition, itemEx, toPosition)
	local data = {
		[5020] = {item = 8262, storage = 15005},
		[5021] = {item = 8263, storage = 15006},
		[5022] = {item = 8264, storage = 15007},
		[5023] = {item = 8265, storage = 15008}
	}
	local pieces = data[item.uid]
	if(pieces) then
		if (getCreatureStorage(cid, pieces.storage) == -1) then
			doPlayerAddItem(cid, pieces.item, 1)
			doCreatureSetStorage(cid, pieces.storage, 1)
			doCreatureSay(cid, "You have found a piece of a broken amulet!", TALKTYPE_MONSTER_SAY)
		end
	end
end