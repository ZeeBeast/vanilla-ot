function onSay(cid, words, param, channel)
	return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Gold: " .. tostring(getPlayerMoney(cid)))
end
