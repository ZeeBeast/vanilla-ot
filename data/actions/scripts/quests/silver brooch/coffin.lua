local reward = {
	storage = 5033,
	container = 1987,
	prizes = {
		[2134] = 1, 
		[2147] = 2, 
		[2145] = 3
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The wooden coffin is empty."
	if(getCreatureStorage(cid, reward.storage) ~= 1)then
		local item = doCreateItemEx(reward.container, 1)
		for k, v in pairs(reward.prizes) do
			doAddContainerItem(item, k, v)
		end
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