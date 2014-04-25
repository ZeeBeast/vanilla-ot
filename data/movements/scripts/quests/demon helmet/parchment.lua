local config = {
	spot = {x=33063,y=31624,z=15},
	minutes = 240,
	storage = 107,
}

function onRemoveItem(item, tile, pos)
	if getGlobalStorageValue(config.storage) < 1 and (doComparePositions(pos, config.spot))then
		local demons = {
			{x=33060,y=31623,z=15},
			{x=33060,y=31627,z=15},
			{x=33066,y=31623,z=15},
			{x=33066,y=31627,z=15}
		}
		for _, i in ipairs(demons) do
			doCreateMonster("Demon", i, true)
		end
		setGlobalStorageValue(config.storage, 1)
		addEvent(setGlobalStorageValue, config.minutes * 60000, 107, -1)
	end
	return true
end