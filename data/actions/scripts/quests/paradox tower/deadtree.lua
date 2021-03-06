local config = {
	storage = 3899,
	keyType = 2089,
	keyID = 3899
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The dead tree is empty."
	if(getCreatureStorage(cid, config.storage) ~= 1)then
		local key = doCreateItemEx(config.keyType, 1)
		doItemSetAttribute(key, "aid", config.keyID)
		if(doPlayerAddItemEx(cid, key, false) == RETURNVALUE_NOERROR)then
			str = "You have found a copper key."
			doCreatureSetStorage(cid, config.storage, 1)
		else
			str = (getPlayerFreeCap(cid) < getItemWeight(key)) and "You have found a copper key. Weighing " .. getItemWeight(key) .. " oz it is too heavy." or "You have found a copper key, but you have no room to take it."
		end
	end
	return doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, str)
end
