function onUse(cid, item, fromPosition, itemEx, toPosition)
	remov = {
        { item = 1026, pos = { x = 32593 , y = 32103 , z = 14 , stackpos = 1 } },
		{ item = 1026, pos = { x = 32594 , y = 32103 , z = 14 , stackpos = 1 } },
		{ item = 1026, pos = { x = 32595 , y = 32103 , z = 14 , stackpos = 1 } },
		{ item = 1026, pos = { x = 32596 , y = 32103 , z = 14 , stackpos = 1 } },
		{ item = 1026, pos = { x = 32597 , y = 32103 , z = 14 , stackpos = 1 } },
		{ item = 1026, pos = { x = 32598 , y = 32103 , z = 14 , stackpos = 1 } },
		{ item = 1026, pos = { x = 32599 , y = 32103 , z = 14 , stackpos = 1 } },
		{ item = 1026, pos = { x = 32600 , y = 32103 , z = 14 , stackpos = 1 } },
		{ item = 1026, pos = { x = 32601 , y = 32103 , z = 14 , stackpos = 1 } }
    }
	
    create = {
        { item = 1025, pos = { x = 32592 , y = 32104 , z = 14 , stackpos = 1 } },
		{ item = 1025, pos = { x = 32592 , y = 32105 , z = 14 , stackpos = 1 } },
		{ item = 1025, pos = { x = 32592 , y = 32106 , z = 14 , stackpos = 1 } }
    }	
    
    if item.actionid == 100 then
        for i = 1, #remov do
            remov[i].pos.stackpos = 1
            doRemoveItem(getThingfromPos(remov[i].pos).uid, 1)
		end	
        for i = 1, #create do
            doCreateItem(create[i].item, 1, create[i].pos)
        end
        doTransformItem(item.uid, item.itemid + 1)
		doItemSetAttribute(item.uid, "aid", 0)
    end
    return TRUE
end