local t = {
	[8081] = { -- Morguthis
		pos = {x=33182, y=32714, z=14},
		done = {x=33231, y=32705, z=8},
		item = 2350,
		storage = 82341
	},
	[8082] = { -- Thalas
		pos = {x=33349, y=32827, z=14},
		done = {x=33282, y=32744, z=8},
		item = 2351,
		storage = 82342
	},
	[8083] = { -- Mahrdis
		pos = {x=33174, y=32934, z=15},
		done = {x=33250, y=32832, z=8},
		item = 2353,
		storage = 82343
	},
	[8084] = { -- Omruc
		pos = {x=33186, y=33012, z=14},
		done = {x=33025, y=32868, z=8},
		item = 2352,
		storage = 82344
	},
	[8085] = { -- Rahemos
		pos = {x=33041, y=32774, z=14},
		done = {x=33133, y=32642, z=8},
		item = 2348,
		storage = 82345
	},
	[8086] = { -- Diptrah
		pos = {x=33126, y=32591, z=15},
		done = {x=33131, y=32566, z=8},
		item = 2354,
		storage = 82346
	},
	[8087] = { -- Vashresamun
		pos = {x=33145, y=32665, z=15},
		done = {x=33206, y=32592, z=8},
		item = 2349,
		storage = 82347
	}
}

function onStepIn(cid, item, position, fromPosition)
	local v = t[item.uid]
	doSendMagicEffect(position, CONST_ME_TELEPORT)
	if getPlayerStorageValue(cid, v.storage) == -1 and doPlayerRemoveItem(cid, v.item, 1) then
		doTeleportThing(cid, v.pos)
		doSendMagicEffect(v.pos, CONST_ME_TELEPORT)
		setPlayerStorageValue(cid, v.storage, 1)
	else
		doTeleportThing(cid, v.done)
		doSendMagicEffect(v.done, CONST_ME_TELEPORT)
	end
end