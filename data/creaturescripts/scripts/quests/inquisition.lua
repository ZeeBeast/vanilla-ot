local boss = {
	["Ushuriel"] = { {x=33157,y=31728,z=11}, 8027 },
	["Zugurosh"] = { {x=33123,y=31692,z=11}, 8030 },
	["Madareth"] = { {x=33197,y=31768,z=11}, 8033 },
	["Latrivan"] = { {x=33232,y=31734,z=11}, 8036 },
	["Golgordan"] = { {x=33232,y=31734,z=11}, 8036 },
	["Annihilon"] = { {x=33197,y=31704,z=11}, 8039 },
	["Hellgorak"] = { {x=33104,y=31735,z=11}, 8041 }
}

function reset(pos, action)
	return doItemSetActionId(getTileItemById(pos, 1387).uid, action)
end

function onDeath(cid, corpse)
	local name = getCreatureName(cid)
	local portal = getTileItemById(boss[name][1], 1387)
	if(portal.uid > 0)then
		addEvent(reset, 3 * 60 * 1000, boss[name][1], portal.actionid)
		if(name == "Latrivan" or name == "Golgordan")then
			for _, fid in ipairs(getSpectators(getThingPosition(cid), 9, 9)) do
				local friendName = getCreatureName(fid)
				if (fid ~= cid) and (friendName == "Latrivan" or friendName == "Golgordan") then
					return true
				end
			end
		end
		doItemSetActionId(portal.uid, boss[name][2])
		doCreatureSay(cid, "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next only during this time.", TALKTYPE_MONSTER_SAY)
	end
	return true
end