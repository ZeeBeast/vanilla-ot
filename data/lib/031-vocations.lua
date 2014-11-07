function isSorcerer(cid)
	return isInArray({1, 7, 13, 19}, getPlayerVocation(cid))
end

function isDruid(cid)
	return isInArray({2, 8, 14, 20}, getPlayerVocation(cid))
end

function isPaladin(cid)
	return isInArray({3, 9, 15, 21}, getPlayerVocation(cid))
end

function isKnight(cid)
	return isInArray({4, 10, 16, 22}, getPlayerVocation(cid))
end

function isNinja(cid)
	return isInArray({5, 11, 17, 23}, getPlayerVocation(cid))
end

function isFighter(cid)
	return isInArray({6, 12, 18, 24}, getPlayerVocation(cid))
end

function isRookie(cid)
	return isInArray({0}, getPlayerVocation(cid))
end
