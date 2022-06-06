local table = {}

function DrawNotify(id, text, color, icon)
	if id then
		if table[id] == nil then
			table[id] = text
			print("+")
			SendNUIMessage({display = true, text = text, color = color or "#26242f",icon=icon or 'fas fa-exclamation'})
		end
	end
	return id
end

function Clear(id)
	if table[id] ~= nil then
		table[id] = nil
		print("-")
		SendNUIMessage({display = false})
	end
end

RegisterCommand("deneme", function(source, args)
	DrawNotify("default", "[fizzfau-ui] message", nil)
end)

CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(465.5316, -234.332, 54.686))
		if distance <= 7.5 then
			DrawNotify("default", "[fizzfau-ui] message", nil)
		else
			Clear("default")
		end
	end
end)