local reward = {
	storage = 5045,
	prize = 7736
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The dead tree is empty."
	if(getCreatureStorage(cid, reward.storage) ~= 1)then
		local item = doCreateItemEx(reward.prize, 1)
		local ret = getItemDescriptions(item)
		str = "You have found " .. ret.article .. " " .. ret.name
		if(doPlayerAddItemEx(cid, item, false) == RETURNVALUE_NOERROR)then
			str = str .. "."
			doCreatureSetStorage(cid, reward.storage, 1)
		else
			str = (getPlayerFreeCap(cid) < getItemWeight(item)) and str .. ". Weighing " .. getItemWeight(item) .. " oz it is too heavy." or str .. ", but you have no room to take it."
		end
	end
	return doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, str)
end