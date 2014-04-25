local coffinPos = {x = 33273, y = 32458, z = 8, stackpos = 1} -- stairs on hole position (coffin)
local statue_pos = {{x = 33281, y = 32442, z = 8, stackpos = 1}, -- statue1
{x = 33278, y = 32450, z = 8, stackpos = 1}, -- statue2
{x = 33284, y = 32450, z = 8, stackpos = 1}, -- statue3
{x = 33276, y = 32444, z = 8, stackpos = 1}, -- statue4
{x = 33286, y = 32444, z = 8, stackpos = 1}} -- statue5
 
function onUse(cid, item, frompos, item2, topos)
 
	local getcoffin = getThingfromPos(coffinPos) -- coffin
	local statue1 = getThingfromPos(statue_pos[1]) -- statue1
	local statue2 = getThingfromPos(statue_pos[2]) -- statue2
	local statue3 = getThingfromPos(statue_pos[3]) -- statue3
	local statue4 = getThingfromPos(statue_pos[4]) -- statue4
	local statue5 = getThingfromPos(statue_pos[5]) -- statue5	
 
	if getcoffin.itemid == 7520 and statue1.itemid == 3698 and statue2.itemid == 3697 and statue3.itemid == 3697 and statue4.itemid == 3697 and statue5.itemid == 3698 then
		doRemoveItem(getcoffin.uid, 1)
		doCreateItem(7525, 1, coffinPos) 
			doCreatureSay(cid, 'Click!', TALKTYPE_MONSTER_YELL, false, 0, {x=33273, y=32458, z=8})
	else 
		doCreatureSay(cid, 'Nothing happens...', TALKTYPE_MONSTER, false, 0, {x=33281, y=32447, z=8})
	end
return 1 
end