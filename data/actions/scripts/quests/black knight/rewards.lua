local rewards = {
	[5017] = {
		storage = 5017,
		prize = 2487
	},
	[5018] = {
		storage = 5018,
		prize = 2519
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = "The dead tree is empty."
	local reward = rewards[item.uid]
	if(reward)then
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
	end
	return doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, str)
end