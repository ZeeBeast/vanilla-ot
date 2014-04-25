local config = {
	storage = 5010,
	keyType = 2088,
	keyID = 5010
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The dead tree is empty."
	if(getCreatureStorage(cid, config.storage) ~= 1)then
		local key = doCreateItemEx(config.keyType, 1)
		doItemSetAttribute(key, "aid", config.keyID)
		if(doPlayerAddItemEx(cid, key, false) == RETURNVALUE_NOERROR)then
			str = "You have found a silver key."
			doCreatureSetStorage(cid, config.storage, 1)
		else
			str = (getPlayerFreeCap(cid) < getItemWeight(key)) and "You have found a silver key. Weighing " .. getItemWeight(key) .. " oz it is too heavy." or "You have found a silver key, but you have no room to take it."
		end
	end
	return doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, str)
end
