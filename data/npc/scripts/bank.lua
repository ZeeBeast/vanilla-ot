local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

npcHandler:addModule(FocusModule:new())
local Topic = {}

local TRANSACTION_LIMIT = 500000000 -- 500 million

local function amount(msg)
	local a, z = string.find(msg, "%d+")
	if a and z then return tonumber(string.sub(msg, a, z)) end
	return false
end

function creatureSayCallback(cid, _type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	--CHECKING BALANCE
	if msgcontains(msg, 'balance') then
		selfSay("You have "..getPlayerBalance(cid).." gold in your bank account!", cid)
		
	--DEPOSITING
	elseif msgcontains(msg, 'deposit') then
	
		local count = amount(msg)
		if msgcontains(msg, 'all') then
			selfSay("You have "..getPlayerMoney(cid).." gold. Would you like to deposit all of it?", cid)
			Topic[cid] = {1}
		elseif (count) then
			selfSay("Would you like to deposit "..count.." gold?", cid)
			Topic[cid] = {2, count}
		else
			selfSay("How much gold would you like to deposit?", cid)
			Topic[cid] = {3}
		end
		
	--WITHDRAWING
	elseif msgcontains(msg, 'withdraw') then
	
		local count = amount(msg)
		if msgcontains(msg, 'all') then
			selfSay("You have "..getPlayerBalance(cid).." gold in your bank account. Would you like to withdraw all of it?", cid)
			Topic[cid] = {4}
		elseif (count) then
			selfSay("Would you like to withdraw "..count.." gold from you account?", cid)
			Topic[cid] = {5, count}
		else
			selfSay("How much gold would you like to withdraw?", cid)
			Topic[cid] = {6}
		end
		
	--TRANSFERRING
	elseif msgcontains(msg, 'transfer') then
		selfSay("I'm sorry our transfer servers are currently down, try the postal service.", cid)
		
	--CONFIRMING
	elseif msgcontains(msg, 'yes') then
		if Topic[cid][1] == 1 then --depositing all
			if (getPlayerMoney(cid) <= TRANSACTION_LIMIT) then
				doPlayerDepositAllMoney(cid)
			else
				doPlayerDepositMoney(cid, TRANSACTION_LIMIT)
				selfSay("I deposited " .. TRANSACTION_LIMIT .. " gold into your account, that is the maximum transaction amount.", cid)
			end
		elseif (Topic[cid][1] == 2 and Topic[cid][2] ~= nil) then --depositing some
			if getPlayerMoney(cid) >= Topic[cid][2] then
				if (Topic[cid][2] <= TRANSACTION_LIMIT) then
					doPlayerDepositMoney(cid, Topic[cid][2])
				else
					doPlayerDepositMoney(cid, TRANSACTION_LIMIT)
					selfSay("I deposited " .. TRANSACTION_LIMIT .. " gold into your account, that is the maximum transaction amount.", cid)
				end
			else
				selfSay("You don't have that much gold...", cid)
			end
			
		elseif Topic[cid][1] == 4 then --withdrawing all
			if (getPlayerBalance(cid) <= TRANSACTION_LIMIT) then
				doPlayerWithdrawAllMoney(cid)
			else
				doPlayerWithdrawMoney(cid, TRANSACTION_LIMIT)
				selfSay("I withdrew " .. TRANSACTION_LIMIT .. " gold from your account, that is the maximum transaction amount.", cid)
			end
		elseif (Topic[cid][1] == 5 and Topic[cid][2] ~= nil) then --withdrawing some
			if getPlayerBalance(cid) >= Topic[cid][2] then
				if (Topic[cid][2] <= TRANSACTION_LIMIT) then
					doPlayerWithdrawMoney(cid, Topic[cid][2])
				else
					doPlayerWithdrawMoney(cid, TRANSACTION_LIMIT)
					selfSay("I withdrew " .. TRANSACTION_LIMIT .. " gold from your account, that is the maximum transaction amount.", cid)
				end
			else
				selfSay("You don't have that much gold in your account...", cid)
			end
		end	
		selfSay("You have a balance of "..getPlayerBalance(cid).." gold.", cid)
		
	--CANCELLING
	elseif msgcontains(msg, 'no') then
		selfSay("Alright, what else can I do for you?", cid)
		Topic[cid] = nil
	
	--CLARIFYING
	elseif Topic[cid][1] == 3 then
		local count = amount(msg)
		if (count) then
			if (count <= TRANSACTION_LIMIT) then
				selfSay("Would you like to deposit "..count.." gold to your account?", cid)
				Topic[cid] = {2, count}
			else
				selfSay("Whew that's alot of money! The most I can handle is 500 million gold at a time. Please lower your transaction.", cid)
				Topic[cid] = nil
			end
		end
		
	elseif Topic[cid][1] == 6 then
		local count = amount(msg)
		if (count) then
			if (count <= TRANSACTION_LIMIT) then
				selfSay("Would you like to withdraw "..count.." gold from your account?", cid)
				Topic[cid] = {5, count}
			else
				selfSay("Whew that's alot of money! The most I can handle is 500 million at a time. Please lower your transaction.", cid)
				Topic[cid] = nil
			end
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, 'Happy hunting!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Time is money. I understand!')
npcHandler:setMessage(MESSAGE_GREET, 'Hello, I am the banker! Would you like to {withdraw} your money, {deposit} some, or check your {balance}?')
npcHandler:addModule(FocusModule:new())