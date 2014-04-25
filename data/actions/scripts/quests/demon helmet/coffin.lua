local reward = {
	storage = 6010,
	container = 1987,
	prizes = {
		[2165] = 1, 
		[2151] = 2, 
		[2230] = 1,
		[2229] = 1,
		[1948] = 1,
		[2091] = {1, 6010}
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The wooden coffin is empty."
	if(getCreatureStorage(cid, reward.storage) ~= 1)then
		local item = doCreateItemEx(reward.container, 1)
		for k, v in pairs(reward.prizes) do
			if(type(v) == 'table')then
			local key = doAddContainerItem(item, k, v[1])			
				doItemSetAttribute(key, "aid", v[2])	
			else
				doAddContainerItem(item, k, v)
			end
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