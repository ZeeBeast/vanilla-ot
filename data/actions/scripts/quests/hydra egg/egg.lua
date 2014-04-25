local config = {
	storage = 5030,
	keyType = 4850
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The nest is empty."
	if(getCreatureStorage(cid, config.storage) ~= 1)then
		local key = doCreateItemEx(config.keyType, 1)
		if(doPlayerAddItemEx(cid, key, false) == RETURNVALUE_NOERROR)then
			str = "You have found a hydra egg."
			doCreatureSetStorage(cid, config.storage, 1)
		else
			str = (getPlayerFreeCap(cid) < getItemWeight(key)) and "You have found a hydra egg. Weighing " .. getItemWeight(key) .. " oz it is too heavy." or "You have found a hydra egg, but you have no room to take it."
		end
	end
	return doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, str)
end
