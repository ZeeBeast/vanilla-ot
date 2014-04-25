local config = {
	storage = 3980,
	keyType = 2091,
	keyID = 3980
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The hole is empty."
	if(getCreatureStorage(cid, config.storage) ~= 1)then
		local key = doCreateItemEx(config.keyType, 1)
		doItemSetAttribute(key, "aid", config.keyID)
		if(doPlayerAddItemEx(cid, key, false) == RETURNVALUE_NOERROR)then
			str = "You have found a golden key."
			doCreatureSetStorage(cid, config.storage, 1)
		else
			str = (getPlayerFreeCap(cid) < getItemWeight(key)) and "You have found a golden key. Weighing " .. getItemWeight(key) .. " oz it is too heavy." or "You have found a golden key, but you have no room to take it."
		end
	end
	return doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, str)
end
