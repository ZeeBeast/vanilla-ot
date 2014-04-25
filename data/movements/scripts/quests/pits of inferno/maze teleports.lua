function onStepIn(cid, item, position, fromPosition)
	local position = {
		[8005] = {x=32827,y=32314,z=9},
		[8006] = {x=32841,y=32323,z=9},
		[8007] = {x=32861,y=32301,z=9},
		[8008] = {x=32847,y=32287,z=9},
		[8009] = {x=32839,y=32320,z=9},
		[8010] = {x=32855,y=32296,z=9},
		[8011] = {x=32840,y=32317,z=9},
		[8012] = {x=32827,y=32308,z=9},
		[8013] = {x=32854,y=32323,z=9},
		[8014] = {x=32858,y=32296,z=9},
		[8015] = {x=32856,y=32289,z=9}
	}
	local destination = position[item.uid]
	if(item.actionid == 8005)then
		destination = {x=32854,y=32321,z=9}
	end
	return doTeleportThing(cid, destination)
end