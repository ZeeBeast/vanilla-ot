local reward = {
	storage = 12323,
	prize = 12323
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The dead keeper is empty."
	if(getCreatureStorage(cid, reward.storage) ~= 1)then
		local item = doCreateItemEx(reward.prize, 1)
		local ret = getItemDescriptions(item)
		str = "You have found " .. ret.article .. " " .. ret.name
		if(doPlayerAddItemEx(cid, item, false) == RETURNVALUE_NOERROR)then
			str = str .. "."
			doCreatureSetStorage(cid, reward.storage, 1)
		else
			str = str .. (getPlayerFreeCap(cid) < getItemWeight(item)) and ". Weighing " .. getItemWeight(key) .. " oz it is too heavy." or ", but you have no room to take it."
		end
	end
	return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str)
end