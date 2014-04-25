function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(doRemoveItem(item.uid))then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have redeemed 30 days of premium!\nLogout for the changes to take effect.")
		return doPlayerAddPremiumDays(cid, 30)
	end
	return false
end